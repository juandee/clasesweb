class UsersController < ApplicationController
  before_action :set_user , only: [:show, :edit, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.all_except(current_user).order(:surname).page params[:page]
    if params[:q].blank?
      @users = User.all_except(current_user).order(:surname).page params[:page]
    end
  end

  def students
    @q = User.ransack(params[:q])
    @u = @q.result.all_except(current_user).students
    @users = Kaminari.paginate_array(@u).page(params[:page]).per(5)
    if params[:q].blank?
      @u = User.all_except(current_user).students
      @users = Kaminari.paginate_array(@u).page(params[:page]).per(5)
    end
  end

  def teachers
    @q = User.ransack(params[:q])
    @u = @q.result.all_except(current_user).teachers
    @users = Kaminari.paginate_array(@u).page(params[:page]).per(5)
    if params[:q].blank?
      @u = User.all_except(current_user).teachers
      @users = Kaminari.paginate_array(@u).page(params[:page]).per(5)
    end
  end

  # GET /students
  # GET /students.json

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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :surname, :dni, :birthday, :email, :password, role_ids: [])
    end
end
