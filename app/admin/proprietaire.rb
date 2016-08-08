ActiveAdmin.register Proprietaire do
  controller do
    def permitted_params
      params.permit proprietaire: [:email, :encrypted_password, :name, :gender, :adresse, :ville, :cp, :surname, :telephone, :birthday, :description, :fonction, :verified]
    end
  end
end
