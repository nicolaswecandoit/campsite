ActiveAdmin.register Camping do
  controller do
    def permitted_params
      params.permit camping: [:name, :adresse, :code_postale, :commune, 
      :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, 
      :region_id, :departement_id, :latitude, :longitude, :etoile, :emplacement, :proprietaire_id, :proprietaire, 
      :adressecomplete, :piscine, :barbecue, :youtube_url, :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at]
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
      f.input :proprietaire_id
      f.input :proprietaire 
      f.input :adressecomplete
      f.input :youtube_url
      f.input :image, :as => :file, :hint => f.template.image_tag(f.camping.image.url(:image))
      # Will preview the image when the object is edited
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
      row :proprietaire_id
      row :proprietaire 
      row :adressecomplete
      row :youtube_url
        row :image do
          image_tag(ad.image.url(:image))
        end
        # Will display the image on show object page
      end
    end
  
end
