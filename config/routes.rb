# frozen_string_literal: true

Rails.application.routes.draw do
  get 'articles/favorite_sort' => 'articles#index_favorite'
  get 'articles/comment_sort' => 'articles#index_comment'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  root to: 'homes#top'
  get '/search' => 'searches#search'
  resources :articles do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    resource :reports, only: %i[create destroy]
  end
  get 'reports' => 'reports#index'
  resources :flowcharts
  resources :user_images, only: [:new, :create, :index, :show, :destroy]
end