ActiveAdmin.register Camping do
  controller do
    def permitted_params
      params.permit camping: [:name, :adresse, :code_postale, :commune, :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, :region_id, :departement_id, :latitude, :longitude, :etoile, :image, :image_content_type, :image_file_name]
    end
  end
end
