class AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "privet123"
  layout "admin"
end