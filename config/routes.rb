Rails.application.routes.draw do

  root to: "homes#top"

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#get 'lists/:id' => 'lists#show', as: 'list'  名前付きルートとは、文字通りルーティング自体に名前をつけておくことです、
#そして名前付きルートがあると、その名前をredirect_toやlink_toでも使用することができます。
