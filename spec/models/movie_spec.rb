require 'rails_helper'

RSpec.describe Movie, type: :model do
  # Title doit être dans un état valide s'il existe un titre, une année de production, une heure de projection et une classification éthique.
  it "is valid with a title, production_year, running_time, rating" do
    movie = Movie.new(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    expect(movie).to be_valid
  end



  # S'il n'y a pas de Title
  it "is invalid without a title" do
    movie = Movie.new(title: nil)
      movie.valid?
    expect(movie.errors[:title]).to include("can't be blank")
  end


  # Title double ne sont pas valides
  it "is invalid with a duplicate title" do
    Movie.create(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    movie = Movie.new(
      title: 'DIC',
      production_year: 3000,
      running_time: 150,
      rating: 'PG12')
    movie.valid?
    expect(movie.errors[:title]).to include("has already been taken")
  end

  it "is invalid with title is 101 or more characters" do
    movie = Movie.new(title: 'a' * 101)
    movie.valid?
    expect(movie.errors[:title]).to include("is too long (maximum is 100 characters)")
  end

end
