class RatingsController < ApplicationController
  def index
    matching_ratings = Rating.all

    @list_of_ratings = matching_ratings.order({ :created_at => :desc })

    render({ :template => "ratings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ratings = Rating.where({ :id => the_id })

    @the_rating = matching_ratings.at(0)

    render({ :template => "ratings/show.html.erb" })
  end

  def create
    the_rating = Rating.new
    the_rating.user_id = session.fetch(:user_id)
    the_rating.product_id = params.fetch("input_rating_id")
    the_rating.rating = params.fetch(:rating)

    if the_rating.valid?
      the_rating.save
      redirect_to("/products/#{the_rating.product_id}", { :notice => "Rating created successfully." })
    else
      redirect_to("/products/#{the_rating.product_id}", { :alert => the_rating.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.user_id = session.fetch(:user_id)
    the_rating.product_id = params.fetch("input_rating_id")
    the_rating.rating = params.fetch(:rating)

    if the_rating.valid?
      the_rating.save
      redirect_to("/products/#{the_rating.product_id}", { :notice => "Rating updated successfully."} )
    else
      redirect_to("/products/#{the_rating.product_id}", { :alert => the_rating.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_rating = Rating.where({ :id => the_id }).at(0)

    the_rating.destroy

    redirect_to("/ratings", { :notice => "Rating deleted successfully."} )
  end
end
