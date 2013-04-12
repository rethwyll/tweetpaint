class ApplicationController < ActionController::Base
  protect_from_forgery
  @handles = Handle.all
  @handle = Handle.find(params[:id])  
end
