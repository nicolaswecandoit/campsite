json.array! @notifications do |notification|
    json.id notification.id
    #json.recipient notification.recipient
    json.actor notification.actor.prenom
    json.action notification.action
    json.notifiable do
        json.type "une #{notification.notifiable.class.to_s.underscore.humanize}"
    end
    json.url conversation_messages_path(notification.notifiable, anchor: (notification.notifiable))
end
