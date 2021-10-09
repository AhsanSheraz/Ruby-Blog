class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :update, :destroy]

  # GET /ratings
  def index
    @ratings = Rating.all

    render json: @ratings
  end

  # GET /ratings/1
  def show
    render json: @rating
  end

  # POST /ratings
  def create
    ####################################################################
    #           Doc string for post rating method
    ####################################################################
    #   This method will add rating against a post.
    #   NOTE: you can add multiple rating against a post.
    # 
    #   URL: http://localhost:3000/ratings
    #     
    #   Payload:{
    #     "rate": 3,
    #     "post_id": 20
    #   }
    #   
    #   Response:{
    #     "average_rating": 3.3, 
    #     "post_id": 20
    #   }
    ####################################################################
    
    @rating = Rating.new(rating_params)

    if rating_params[:rate] < 1 || rating_params[:rate] > 5
      render json: {"message": "value of rate should be from 1 to 5"}, status: :bad_request
    elsif @rating.save

      # Code to create average rating out of 5
      @all_ratings = Rating.where("post_id=#{rating_params[:post_id]}")
      total_count = @all_ratings.count * 5
      sum_all_ratings = @all_ratings.pluck('SUM(rate)')
      avg_rating = sum_all_ratings[0] / total_count.to_f * 5

      render json: {"average_rating": avg_rating.round(1), "post_id": @rating.post_id}, status: :created, location: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      render json: @rating
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:rate, :post_id)
    end
end
