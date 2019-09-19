class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:create, :verify]
  before_action :current_user, only: [:verify]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    channel = user_params['channel']
    @user = User.new(user_params.except('channel', 'displayed_phone_number'))

    respond_to do |format|
      if @user.save
        start_verification(@user.phone_number, channel)
        session[:user_id] = @user.id
        format.html { redirect_to verify_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def verify
    if request.post?
      is_verified = check_verification(@current_user.phone_number, params['verification_code'])
      if is_verified
        @current_user.verified = true
        @current_user.save
        respond_to do |format|
          format.html { redirect_to main_index_url, notice: 'User was successfully verified.' }
        end
      else
        respond_to do |format|
          format.html { redirect_to verify_url, notice: 'The code was invalid.' }
        end
      end
    else
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_client
      @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :phone_number)
    end

    def start_verification(to, channel='sms')
      channel = 'sms' unless ['sms', 'voice'].include? channel
      verification = @client.verify.services(ENV['VERIFICATION_SID'])
                                   .verifications
                                   .create(:to => to, :channel => channel)
      return verification.sid
    end

    def check_verification(phone, code)
      verification_check = @client.verify.services(ENV['VERIFICATION_SID'])
                                         .verification_checks
                                         .create(:to => phone, :code => code)
      return verification_check.status == 'approved'
    end
end
