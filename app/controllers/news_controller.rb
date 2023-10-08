class NewsController < ApplicationController
  before_action :authenticate_user!
    before_action :must_be_admin!, except: [:blog_news, :index, :show]
  
    def blog_news
      #create hash 
      hash_news = {}
      news_array = []
      @category_id = Category.pluck(:id)

      @category_id.each do |id|
      @news = News.joins(:category)
           .where("news.category_id = ?", id)
           .select("categories.category_name, news.news_title, news.news_body")
           array_title = []
           array_body = []
           category_news = ""
         @news.each do |news|
          category_news = news.category_name
           array_title.push(news.news_title)
           array_body.push(news.news_body)
        end
        news_array.push(hash_news.merge({"category" => category_news,"title" =>array_title, "body" => array_body}))
      end
      @news_data = news_array
    end
    def show
    @news_item = News.find(params[:id])
    if @news_item.category_id
      @category = Category.find(@news_item.category_id)
      @category_name = @category.category_name
    else
      @category_name = "Uncategory"
    end
    
    @time = @news_item.created_at
    @time = @time.strftime("%d/%m/%Y")  
  end
  def news_management
    @listOfNews = News.all
  end
 
  def new
    @news = News.new
  end
  def create
    @news = News.new(news_param)
    if @news.save
      redirect_to '/news/new', flash: {message: "News has been saved to database successufully"}
    else
      redirect_to '/news/new', flash: {message: "There is an error"}
    end
  end
  def edit 
    @news = News.find(params[:id])
  end
  def update
    @news = News.find(params[:id])
    if @news.update(news_param)
      redirect_to '/news/news_management', flash: {message: "News has been updated"}
    else
      redirect_to '/news/new', flash: {message: "There is an error"}
    end
  end
  def updateHide
    @news = News.find(params[:id])
    @news.update_column(:isHide, !@news.isHide)
  end
  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to '/news/news_management'
  end
  private
  def news_param 
    params.require(:news).permit(:news_title, :news_body, :category_id, :isHide).merge(user_id: current_user.id)
  end
   def must_be_admin!
        unless current_user.admin?
            redirect_to root_path
        end
    end
end

