ActiveAdmin.register Proprietaire do
  controller do
    def permitted_params
      params.permit proprietaire: [:email, :encrypted_password]
    end
  end
end
