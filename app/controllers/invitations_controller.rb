class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @invitation = current_user.invitations.build(invitation_params)
    @invitation.family = current_user.family
    @invitation.token = SecureRandom.hex(10) # Generate a unique token

    if @invitation.save
      InvitationMailer.invite_email(@invitation).deliver_now
      redirect_to family_path(current_user.family), notice: 'Invitation sent!'
    else
      redirect_to family_path(current_user.family), alert: 'Failed to send invitation.'
    end
  end

  def accept
    @invitation = Invitation.find_by(token: params[:token])

    if @invitation && !@invitation.accepted_at
      user = User.find_by(email: @invitation.email)
      if user
        user.update(family: @invitation.family)
        @invitation.update(accepted_at: Time.now)
        redirect_to user_path(user), notice: 'You have joined the family!'
      else
        redirect_to root_path, alert: 'User not found.'
      end
    else
      redirect_to root_path, alert: 'Invalid or expired invitation.'
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
