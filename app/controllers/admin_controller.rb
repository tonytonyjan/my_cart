class AdminController < ApplicationController
  http_basic_authenticate_with name: "tony", password: "tony"
end
