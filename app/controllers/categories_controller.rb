class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :must_be_admin!, except: [:blog_news, :index, :show]
    def new
        @category = Category.new
        @categoryList = Category.all
    end
    def create
        @category = Category.new(categories_param)
    
        if @category.save
            redirect_to '/categories/new', flash: {message: "Category is added to the database"}
            
        else
            redirect_to '/categories/new', flash: {message: "There was an error"}
            puts "Error"
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    def update
    @news = Category.find(params[:id])
    if @news.update(categories_param)
        redirect_to '/categories/new', flash: {message: "Categories has been updated"}
        else
        redirect_to '/categories/new', flash: {message: "There is an error"}
        end
    end
    def destroy
        @category = Category.find(params[:id])
        News.where(category_id: params[:id]).update_all(category_id: nil)
        @category.destroy
        redirect_to '/categories/new'
    end
    private
    def categories_param 
        params.require(:category).permit(:category_name)
    end

    def must_be_admin!
        unless current_user.admin?
            redirect_to root_path
        end
    end
end

