class MapsController < ApplicationController
  respond_to :json, :html

  helper_method :users

  private

  def users
    Rails.logger.info User.all.inspect

    @users ||= [{ latitude: 0, longitude: 0}]
  end

end
