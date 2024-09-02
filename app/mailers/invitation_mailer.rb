class InvitationMailer < ApplicationMailer
  def invite_email(invitation)
    @invitation = invitation
    @url = accept_invitations_url(@invitation.token) # Ensure this URL helper matches your route
    mail(to: @invitation.email, subject: 'You have been invited to join a family!')
  end
end
