ActiveAdmin.register Caracteristiquetest do
  controller do
    def permitted_params
      params.permit caracteristiquetest: [:piscine, :barbecue, :camping_id, :handicap, :animaux, :television]
    end
  end
end
