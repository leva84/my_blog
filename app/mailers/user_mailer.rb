class UserMailer < ApplicationMailer
  def temporary_password_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your Temporary Password') do |format|
      format.html { render 'temporary_password_email' }
    end
  end
end
