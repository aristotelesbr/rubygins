class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post,
        notice: 'Post criado com sucesso!'
    else
      render 'new'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post,
        notice: 'Post atualizado com sucesso!'
    else
      render edit_post_path
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path,
      alert: "Post deletado."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
