ActiveAdmin.register Camping do
  controller do
    def permitted_params 
      params.permit :utf8, :_method, :authenticity_token, :commit, :id,
      camping: [:id, :name, :adresse, :code_postale, :commune, 
      :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, 
      :region_id, :departement_id, :latitude, :longitude, :etoile, :emplacement, :proprietaire_id, :proprietaire, 
      :adressecomplete, :piscine, :barbecue, :youtube_url, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, ":image_updated_at(1i)", ":image_updated_at(2i)", ":image_updated_at(3i)", ":image_updated_at(4i)", ":image_updated_at(5i)", :dailymotion, :facebook_url, :updated_at, :created_at]
    end
  end
  
  form do |f|
    f.inputs "Camping Details" do
      f.input :name
      f.input :adresse
      f.input :code_postale
      f.input :commune 
      f.input :courriel 
      f.input :site_internet 
      f.input :tel
      f.input :description
      f.input :nomdep 
      f.input :nomregion 
      f.input :numdep
      f.input :slug
      f.input :ville_id 
      f.input :region_id
      f.input :departement_id
      f.input :latitude
      f.input :longitude
      f.input :etoile
      f.input :emplacement
      f.input :adressecomplete
      f.input :updated_at
      
      if :image.present?
      f.input :image, :as => :file, :label => "Image",:hint => f.template.image_tag(f.object.image.url(:original)).present?
      end
    end
    f.actions
  end
  
  
  

  show do |ad|
      attributes_table do
      row  :name
      row :adresse
      row :code_postale
    	row :courriel 
      row :site_internet 
      row :tel
      row :description
      row :nomdep 
      row :nomregion 
      row :numdep
      row :slug
      row :ville_id 
      row :region_id
      row :departement_id
      row :latitude
      row :longitude
      row :etoile
      row :emplacement
      row :adressecomplete
      row :updated_at
    
        
        # Will display the image on show object page
      end
    end
  
  
end
