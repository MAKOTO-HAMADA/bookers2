Rails.application.routes.draw do
  
  root to: 'homes#top' # 初期ビューの設定
  devise_for :users    # devise_for：Deviseゲムのルーティング
  
  get 'home/about' => 'homes#about', as: 'about'
  
  resources :users, only:[:index, :show, :edit, :update]
  resources :books, only:[:new, :index, :show, :edit, :create, :update, :destroy]
  
  end
