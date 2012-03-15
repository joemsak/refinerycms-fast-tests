Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :planets do
    resources :planets, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :planets, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :planets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
