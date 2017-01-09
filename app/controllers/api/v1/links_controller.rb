class Api::V1::LinksController < ApplicationController
  skip_before_action :require_login

  def show
    @link = Link.find(params[:id])
    render json: @link, status: 200
  end

  def create
    @link = Link.new link_params
    if @link.save
      render json: @link, status: 201
    else
      flash.now[:error] = @link.errors.full_messages.join(", ")
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      render json: @link, status: 200
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
