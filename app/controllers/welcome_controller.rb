require 'pry-byebug'

class WelcomeController < ApplicationController
  # def index
  #   @countries = Country.all
  #   @cities = City.where("country_id = ?", Country.first.id)
  # end

  # def show
  #   @city = City.find_by("id = ?", params[:trip][:city_id])
  # end

  # def update_cities
  #   @cities = City.where("country_id = ?", params[:country_id])
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def index
    @genres  = Genre.all
    @artists = Artist.all
    @songs   = Song.all
  end

  def update_artists
    # updates artists and songs based on genre selected
    # genre = Genre.find(params[:genre_id])
    genre = Genre.find(genre_params)

    # map to name and id for use in our options_for_select
    @artists = genre.artists.map{|a| [a.name, a.id]}.insert(0, "Select an Artist")
    @songs   = genre.songs.map{|s| [s.title, s.id]}.insert(0, "Select a Song")
  end

  def update_songs
    # updates songs based on artist selected
    # artist = Artist.find(params[:artist_id])
    artist = Artist.find(artist_params)

    @songs = artist.songs.map{|s| [s.title, s.id]}.insert(0, "Select a Song")
  end

private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def artist_params
    params.require(:artist).permit(:artist_id, :title, :artist)
  end

end

# Possibilité de render js directement dans le controlleur?
# https://stackoverflow.com/questions/13545148/rails-respond-to-format-js-api
