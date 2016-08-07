ActiveAdmin.register Departement do
  controller do
    def permitted_params
      params.permit departement: [:description, :nomdep, :departement_id, :slug, :region_id]
    end
  end
end
