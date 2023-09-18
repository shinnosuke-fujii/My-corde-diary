class BlogsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)
    Blog.create(blog_params)
    blog.user_id = current_user.id
    

    if blog.save
      # 保存成功時の処理
      redirect_to blogs_path
    else
      # 保存失敗時の処理
      render 'new'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :start_time, :user_id)
  end
  

  
end



 
  