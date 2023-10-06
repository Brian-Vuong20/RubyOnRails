class NewsController < ApplicationController
  before_action :authenticate_user!
  def blog_news
    
  end
  def new
    @news = News.new
  end
  def create
    @user = News.new(news_param)
    if @user.save
      redirect_to '/news/new', flash: {message: "News has been saved to database successufully"}
    else
      redirect_to '/news/new', flash: {message: "There is an error"}
    end
  end
  private
  def news_param 
    params.require(:news).permit(:news_title, :news_body, :category_id).merge(user_id: current_user.id)
  end
end

