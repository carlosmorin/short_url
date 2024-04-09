class LinksController < ApplicationController
  before_action :set_link, only: %i[ show update destroy ]

  def index
    @links = Link.all

    render json: @links
  end

  def show
    render json: @link
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      save_cache
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
  end

  private

    def save_cache
      Rails.cache.write(@link.code, {short_url: @link.short_url, orignial: @link.original_url})
    end

    def fecth_cache(code)
      Rails.cache.fetch(code)
    end

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:original_url, :short_url, :code)
    end
end
