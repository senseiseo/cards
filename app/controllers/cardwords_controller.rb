class CardwordsController < ApplicationController

  def destroy
    @cardword = Cardword.find_by id: params[:id]
    @cardword.destroy
    redirect_to cardwords_path
  end 
  
  

  def edit 
    @cardword = Cardword.find_by id: params[:id]
  end 

  def index
    @cardwords = Cardword.all
  end

  def new
    @cardword = Cardword.new
  end

  def create
    @cardword = Cardword.new cardword_params
    if @cardword.save
      redirect_to cardwords_path
    else
      render :new
    end
  end

  def update 
    @cardword = Cardword.find_by id: params[:id]
    if @cardword.update cardword_params
      redirect_to cardwords_path
    else
      render :edit
    end
  end 

  def show 
    @cardword = Cardword.find_by id: params[:id]
  end 

  def good_response
    @cardword = Cardword.find_by id: params[:id]
    @cardword.increment! :group
    @cardword.group = 1 
    redirect_to cardword_path(@cardword)
  end

  def bad_response
    @cardword = Cardword.find_by id: params[:id]
    @cardword.group = 1 
    @cardword.save
    redirect_to cardword_path(@cardword)

  end




  private

  def cardword_params
    params.require(:cardword).permit(:word, :description)
  end
end
