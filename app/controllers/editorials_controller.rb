class EditorialsController < ApplicationController
  respond_to :html
  before_action :set_editorial, only: [:show, :edit, :update, :destroy]

  def index
    @editorials = Editorial.all
    respond_with(@editorials)
  end

  def show
    respond_with(@editorial)
  end

  def new
    @editorial = Editorial.new
    respond_with(@editorial)
  end

  def edit
  end

  def create
    @editorial = Editorial.new(editorial_params)
    @editorial.save
    respond_with(@editorial)
  end

  def update
    @editorial.update(editorial_params)
    respond_with(@editorial)
  end

  def destroy
    @editorial.destroy
    respond_with(@editorial)
  end

  private
    def set_editorial
      @editorial = Editorial.find(params[:id])
    end

    def editorial_params
      params.require(:editorial).permit(:name)
    end
end
