class HomeController < ApplicationController
  def index
      if params[:q].nil?
        @campings = []
      else
        @campings = Camping.__elasticsearch__.search params[:q]
      end
  end

  def result
      if params[:q].nil?
        @campings = []
      else
        @campings = Camping.__elasticsearch__.search(params[:q]).page(params[:page]).per(14)
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
