class LinksController < ApplicationController
  def index
    @links = Link.all
    @hot_links = Link.hot
  end


  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link updated"
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages.join(", ")
      render "edit"
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
