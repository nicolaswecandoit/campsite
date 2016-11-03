ActiveAdmin.register User do
  controller do
    def permitted_params
      params.permit user: [:email, :encrypted_password, :nom, :genre, :adresse, :ville, :cp, :prenom, :telephone, :description, :metier, :proprio]
    end
  end
end
