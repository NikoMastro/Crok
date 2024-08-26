class InvitationMailer < ApplicationController

  def notification_email
    @invitation = params[:invitation]
    mail(to: @invitation.receipient_email, subject: 'You have been invited to join our platform')
  end
end
