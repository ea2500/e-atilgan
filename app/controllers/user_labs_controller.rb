class UserLabsController < ApplicationController
  before_action :bounce_non_admin_user, only: :index
  before_action :bounce_over_limit, only: [:create]

  # GET /user_labs
  # GET /user_labs.json
  def index
    @user_labs = UserLab.all
  end

 

  # POST /user_labs
  # POST /user_labs.json
  def create
    lab = Lab.find_by(id: params[:lab_id])
    user_lab = current_user.user_labs.create(lab: lab)

    respond_to do |format|
      if user_lab.save
        format.html { redirect_to labs_url , notice: 'Successfully subscribed.' }
        format.json { render :show, status: :created, location: labs_url }
      else
        format.html { render :new }
        format.json { render json: user_lab.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /user_labs/1
  # DELETE /user_labs/1.json
  def destroy
    user_lab = current_user.user_labs.find_by(lab_id: params[:id])
    user_lab.destroy
    respond_to do |format|
      format.html { redirect_to labs_url, notice: 'unsubscribed.' }
      format.json { head :no_content }
    end
  end

  private
    def bounce_over_limit
      if current_user.user_labs.find_by(lab_id: params[:lab_id])
        redirect_to root_url, notice: "You subscribed this class/lab already"
      end
    end
  
end
