class Admin::BaseController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'].to_str, password: ENV['ADMIN_PASSWORD'].to_str
end