class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :show]
  # before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:index, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if correct_user_or_admin
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    unless current_user.try(:admin?) || current_user.nil?
      redirect_to root_path
    else
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to current_user
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @user.send_admin_confirmation_email unless current_user.try(:admin)
        format.html { 
                      if current_user.try(:admin?)
                        @user.toggle!(:active)
                        UserMailer.confirm_active(@user).deliver
                        redirect_to users_path
                        flash[:success] = "User created successfully"
                      else
                        redirect_to confirmation_path
                      end
                    }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user
          flash[:success] = "User updated successfully" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url
        flash[:failure] = "User destroyed" }
      format.json { head :no_content }
    end
  end

  def toggle_active
    @user = User.find(params[:id])
    unless current_user?(@user)
      @user.toggle!(:active)
      @user.send_active_confirmation_email if @user.active?
    end
    redirect_to users_path
  end

  def toggle_admin
    @a = User.find(params[:id])
    unless current_user?(@a)
      @a.toggle!(:admin)
    end
    redirect_to users_path
  end

  private

    def correct_user_or_admin
      @user = User.find(params[:id])
      if current_user?(@user) || current_user.try(:admin)
        return true
      else
        redirect_to(root_path)
        return false
      end
    end

end
