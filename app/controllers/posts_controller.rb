class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    ####################################################################
    #           Doc string for get posts method
    ####################################################################
    #   Add pagination here to optimize the performance of query.
    # 
    #   Default Value:
    #     page will be 1
    #     per_page limit will be 5
    # 
    #   You can also customise the default limit, using the url.
    # 
    #   URL: http://localhost:3000/posts?page=2&per_page=10
    ####################################################################
    
    @posts = Post.page(page).per(per_page)

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    ####################################################################
    #           Doc string for creat post method
    ####################################################################
    #   This method will add post against a user.
    #   NOTE: It will get user id from the session_used_id that we set,
    #         at the time of login.
    # 
    #   URL: http://localhost:3000/posts
    #     
    #   Payload:{
    #     "title": "Post Number postman",
    #     "context": "This post is agains",
    #     "user_ip": "192.168.1.100"
    #   }
    #   
    #   Response:{
    #     "post": {
    #       "id": 6514,
    #       "title": "Post Number postman",
    #       "context": "This post is agains",
    #       "created_at": "2021-10-09T15:56:54.078Z",
    #       "rating": []
    #     }
    #   }
    ####################################################################

    
    @post = Post.new(post_params)
    @post.user_id = $session_user_id
    if !post_params[:title] || !post_params[:context]
      render json: {"message": "title and context both are required fields."}, status: :unprocessable_entity
    elsif @post.save
      render json: @post, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :context, :user_ip, :user_id)
    end
end
