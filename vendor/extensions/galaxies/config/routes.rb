Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :galaxies do
    resources :galaxies, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :galaxies, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :galaxies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
