class BlockedUsersController < ApplicationController
  before_action :set_blocked_user, only: [:show, :edit, :update, :destroy]

  # GET /blocked_users
  # GET /blocked_users.json
  def index
    @blocked_users = BlockedUser.all
    @user = current_user
  end

  # GET /blocked_users/1
  # GET /blocked_users/1.json
  def show
  end

  # GET /blocked_users/new
  def new
    @blocked_user = BlockedUser.new
  end

  # GET /blocked_users/1/edit
  def edit
  end

  # POST /blocked_users
  # POST /blocked_users.json
  def create
      @user = User.find(params[:blocked_id])
      @blocked_user = current_user.blocked_users.build( user_id: current_user.id, blocked_id: @user.id, blocked_username: @user.username)
      if @blocked_user.save
        flash[:success] = "#{@blocked_user.blocked_username} has been blocked."
        redirect_to :back
      else
        flash[:danger] = "Unable to block user."
        redirect_to :back
      end
  end
  # PATCH/PUT /blocked_users/1
  # PATCH/PUT /blocked_users/1.json
  #def update
  #  respond_to do |format|
  #    if @blocked_user.update(blocked_user_params)
  #      format.html { redirect_to @blocked_user, notice: 'Blocked user was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @blocked_user }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @blocked_user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /blocked_users/1
  # DELETE /blocked_users/1.json
  def destroy
    @blocked_user.destroy
    respond_to do |format|
      format.html { redirect_to blocked_users_url, success: "#{@blocked_user.blocked_username} has been unblocked." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked_user
      @blocked_user = BlockedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blocked_user_params
      params.require(:blocked_user).permit(:user_id, :blocked_id)
    end
end
