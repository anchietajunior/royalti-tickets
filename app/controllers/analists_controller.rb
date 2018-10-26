class AnalistsController < ApplicationController
  include Devise::Controllers::Rememberable
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @analist_facade = AnalistFacade.new(params)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:analist_id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password_confirmation = @user.password

    respond_to do |format|
      if @user.save
        format.html { redirect_to analist_path(@user), notice: 'Usuário criado.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find_by(email: params[:user][:email])
    old_password = @user.password
    if params[:user][:password].present?
      @user.password_confirmation = params[:user][:password]
    end
    respond_to do |format|
      if @user.update(user_params)
        if @user.password != old_password
          sign_in(@user)
          remember_me(@user)
        end
        format.html { redirect_to analist_path(@user), notice: 'Usuário atualizado.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :password)
    end
end
