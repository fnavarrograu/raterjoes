class FavoritesController < ApplicationController
  def index
    matching_favorites = Favorite.includes(:product).all

    @list_of_favorites = matching_favorites.order({ :created_at => :desc })

    @total_price = @list_of_favorites.sum { |favorite| favorite.product.price }

    render({ :template => "favorites/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favorites = Favorite.where({ :id => the_id })

    @the_favorite = matching_favorites.at(0)

    render({ :template => "favorites/show.html.erb" })
  end

  def create
    the_favorite = Favorite.new
    the_favorite.user_id = session.fetch(:user_id)
    the_favorite.product_id = params.fetch("query_product_id")

    if the_favorite.valid?
      the_favorite.save
      redirect_to("/favorites", { :notice => "Favorite created successfully." })
    else
      redirect_to("/favorites", { :alert => the_favorite.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)

    the_favorite.user_id = params.fetch("query_user_id")
    the_favorite.product_id = params.fetch("query_product_id")

    if the_favorite.valid?
      the_favorite.save
      redirect_to("/favorites/#{the_favorite.id}", { :notice => "Favorite updated successfully."} )
    else
      redirect_to("/favorites/#{the_favorite.id}", { :alert => the_favorite.errors.full_messages.to_sentence })
    end
  end

  def destroy

    favorite = Favorite.find_by(id: params[:favorite_id])

    if favorite
      favorite.destroy
      redirect_to("/favorites", { :notice => "Favorite deleted successfully." })
    else
      redirect_to("/favorites", { :alert => "Favorite not found." })
    end

    #the_id = params.fetch("path_id")
    #the_favorite = Favorite.find_by(id: the_id)
    #the_favorite = Favorite.where({ :id => the_id }).at(0)

    #the_favorite.destroy

    #redirect_to("/favorites", { :notice => "Favorite deleted successfully."} )
  end
end
