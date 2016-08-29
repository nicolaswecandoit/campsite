class HomeController < ApplicationController
  def index
      @camping = Departement.all
      if params[:q].blank? || params[:nomdep].blank?
      @campings = Camping.__elasticsearch__.search params[:nomdep]
      else
      @campings = Camping.__elasticsearch__.search params[:q]

    end
  end



  def result

    querystring = params.slice(:nomdep, :other_param, :any_params_except_q_because_we_will_process_q_separately)
    .select{|k,v| v.present?}
    .map {|key, value| "#{key}:\"#{value.gsub(/([#{Regexp.escape('\\+-&|!(){}[]^~*?:/')}])/, '\\\\\1') }\""}
    .join(" AND ")

    freetext = params[:q]
    freetext.gsub!(/([#{Regexp.escape('\\+-&|!(){}[]^~*?:/')}])/, '\\\\\1')

    querystring = ["*#{freetext}*",querystring].select{|v| v.present?}.join(" AND ") if params[:q].present?

    if querystring.blank?
    flash[:notice] = "Aucune mots clefs"
    redirect_to action: :index and return
    else
    @campings = Camping.__elasticsearch__.search(
    query: { query_string: {
    query: querystring
    }}).page(params[:page]).per(14).results
    end


        @hash = Gmaps4rails.build_markers(@campings) do |camping, marker|
          marker.lat camping.latitude
          marker.lng camping.longitude
          marker.infowindow render_to_string(:partial => "/campings/infowindow", :locals => { :camping => camping})
          marker.picture ({
            "url" => "http://avantjetaisriche.com/map-pin.png",
            "width" =>  29,
            "height" => 32})
        end
end
end
