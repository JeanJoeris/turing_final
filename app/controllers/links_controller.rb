class LinksController < ApplicationController
  def index
    @links = Link.all
    @hot_links = Link.hot
  end


  def edit
    @link = Link.find(params[:id])
  end

  def update
    
  end
end
