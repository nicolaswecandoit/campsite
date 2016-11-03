class Ability
  include CanCan::Ability

  can [:edit, :update], Proprietaire do |camping|
    camping.proprietaire_id == proprietaire.id
  end
  
  end
  
  include CanCan::Ability
  can [:edit, :update], Proprietaire do |camping|
   camping.courriel == proprietaire.email
   
  end
  
  end
  
    include CanCan::Ability
  can [:edit, :update], User do |camping|
   user.proprio == true && camping.courriel == user.email
   
  end
  
  end
  
end
