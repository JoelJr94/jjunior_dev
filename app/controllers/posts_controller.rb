class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ index new create edit update ]

  def index
    category = Category.find_by_name(params[:category]) if params[:category].present?

    @highlights = Post.filter_by_category(category)
                      .filter_by_archives(params[:month_year])
                      .desc_order
                      .first(3)

    @posts = Post.filter_by_category(category)
                 .filter_by_archives(params[:month_year])
                 .without_highlights(highlight_ids)
                 .desc_order
                 .page(params[:page])

    @archives = Post.group_by_month(:created_at, format: "%B %Y").count
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end

    def highlight_ids
      @highlights.pluck(:id)
    end

    def set_categories
      @categories = Category.sorted
    end
end
