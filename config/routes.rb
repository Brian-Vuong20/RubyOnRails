Rails.application.routes.draw do
  get 'category/index'
  devise_for :users

  get 'news/blog_news'
  get 'news/news_page'
  get 'news/news_management'
  put "news/:id", to:"news#updateHide", as: "hide" 
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "blog#index"
   resources :news
   resources :categories
end
