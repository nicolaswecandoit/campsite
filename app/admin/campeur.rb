ActiveAdmin.register Campeur do
  controller do
    def permitted_params
      params.permit campeur: [:email, :encrypted_password]
    end
  end
end
