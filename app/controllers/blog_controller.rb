class BlogController < ApplicationController
  def index
     
    @recent_news = News.order(created_at: :desc).limit(4)
  
  end
end
