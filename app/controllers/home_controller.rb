class HomeController < ApplicationController
  before_action :authenticate_user!
  autocomplete :city, :name
  def index

  end
  def index_post
    city_name = params[:city]
    name = params[:name]
    city = City.find_by_name(city_name)
    unless city
      city = City.create name: city_name
    end

    Restaurant.create name: name, city_id: city.id
    redirect_to '/home/index'

  end
end
