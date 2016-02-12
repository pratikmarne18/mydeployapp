class RegistrationsController < Devise::RegistrationsController
  
  #before_filter :authenticate_user!
  def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'For accessing your account you must have to confirm your account. Comfirmation link sent to your registered email address.'
      redirect_to new_user_session_path
    else
      flash[:danger] = 'User not registered successfully.'
      render action: :new
    end
  end
 
  private
  def user_params
    params.require(:user).permit(:name, :mobile, :address, :gender ,:email, :password, :password_confirmation)
  end
end