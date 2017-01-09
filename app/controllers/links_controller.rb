class LinksController < ApplicationController
  def index
    @links = Link.all
    @hot_links = Link.hot
  end
end
