class ReviewsController < ApplicationController
  before_action :set_doctor
  before_action :set_doctor_review, only: [:show, :update, :destroy]

  # GET /doctors/:doctor_id/reviews
  def index
    json_response(@doctor.reviews)
  end

  # GET /doctors/:doctor_id/reviews/:id
  def show
    json_response(@review)
  end

  # POST /doctors/:doctor_id/reviews
  def create
    @doctor.reviews.create!(review_params)
    json_response(@doctor, :created)
  end

  # PUT /doctors/:doctor_id/reviews/:id
  def update
    @review.update(review_params)
    head :no_content
  end

  # DELETE /doctors/:doctor_id/reviews/:id
  def destroy
    @review.destroy
    head :no_content
  end

  private

  def review_params
    params.permit(:review_id, :rating, :comment)
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def set_doctor_review
    @review = @doctor.reviews.find_by!(id: params[:id]) if @doctor
  end
end