ActiveAdmin.register Ville do
  controller do
    def permitted_params
      params.permit ville: [:nomcommune, :description, :nomdep, :departement_id, :code_postale, :region, :region_id, :slug]
    end
  end
end
