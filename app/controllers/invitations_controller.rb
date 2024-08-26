class InvitationsController < ApplicationController
  def create
    @invitation = current_user.invitations.new(invitation_params)

    if@invitation.save
      InvitationMailer.with(invitation: @invitation).notification_email.deliver_later

      respond_to do |format|
        format.turbo_stream
      end
    else
      @error = @invitation.errors.full_messages.first

      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private

  def invitation_params
      params.require(:invitation).permit(:receipient_email)
  end
end
