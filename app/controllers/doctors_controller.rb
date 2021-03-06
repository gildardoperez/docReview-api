class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :update, :destroy]

  # GET /doctors
  def index
    @doctors = Doctor.all.order("created_at ASC").paginate(page: params[:page], per_page: 10)
    # get paginated current user doctors
    # @doctors = current_user.doctors.paginate(page: params[:page], per_page: 20)
    json_response(@doctors)
  end

  def recent
    @doctor = Doctor.recent.order("created_at ASC").paginate(page: params[:page], per_page: 10)
    json_response(@doctor.recent)
  end

  def active
    @doctor = Doctor.active.order("created_at ASC").paginate(page: params[:page], per_page: 10)
    json_response(@doctor.active)
  end

  def unanswered
    @doctor = Doctor.unanswered.order("created_at ASC").paginate(page: params[:page], per_page: 10)
    json_response(@doctor.unanswered)
  end

  # POST /doctors
  def create
    @doctor = Doctor.create!(doctor_params)
    json_response(@doctor, :created)
  end

  # GET /doctors/:id
  def show
    json_response(@doctor)
  end

  # PUT /doctors/:id
  def update
    @doctor.update(doctor_params)
    head :no_content
  end

  # DELETE /doctors/:id
  def destroy
    @doctor.destroy
    head :no_content
  end

  private

  def doctor_params
    # whitelist params
    params.permit(:doctor_id, :group_id, :name, :image, :address, :latitude, :longitude, :reviews_count)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end