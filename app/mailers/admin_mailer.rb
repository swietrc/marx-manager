class AdminMailer < ApplicationMailer

    def new_user_awaiting_approval(user)
        @user = user
        admins = User.where("is_admin = true")
        admins.each do |admin|
            @admin = admin
            mail(to: @admin.email, subject: 'Demande d\'activation du compte', body: "coucou")
        end
    end
end
