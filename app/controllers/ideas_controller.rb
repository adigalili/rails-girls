class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render 'index'
  end

  def show
    @idea = Idea.find(params[:id])
    render 'show'
  end

  def new
    @idea = Idea.new
    render 'new'
  end

  def edit
    @idea = Idea.find(params[:id])
    render 'edit'
  end

  def create
    @idea = Idea.new(params[:idea])

    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end

end
