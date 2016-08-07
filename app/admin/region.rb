ActiveAdmin.register Region do
  controller do
    def permitted_params
      params.permit region: [:descriptionregion, :nomderegion, :slug]
    end
  end
  end
