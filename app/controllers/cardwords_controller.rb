class CardwordsController < ApplicationController
  

  before_action :find_card , only:%i[ edit create update show good_response bad_response ]
  def destroy
    @cardword = Cardword.find_by id: params[:id]
    @cardword.destroy
    redirect_to cardwords_path
  end 
  
  

  def edit 
    
  end 

  def index
    @cardwords = Cardword.all
  end

  def new
    @cardword = Cardword.new
  end

  def create
    @cardword = Cardword.new  cardword_params
    if @cardword.save
      redirect_to cardwords_path
    else
      render :new
    end
  end

  def update 
    if @cardword.update cardword_params
      redirect_to cardwords_path
    else
      render :edit
    end
  end 

  def show 
    
  end 

  def good_response
    @cardword.increment! :group
    if @cardword.group == 5 
      @cardword.hard_word = true
    end 
    @cardword.save
     flash[:notice] = "Thanks for your comment!"
    start_viktorine
  end

  def bad_response 
    @cardword.group = 1 
    @cardword.increment! :bad_response
      if  @cardword.bad_response == 10 
        @cardword.hard_word = true
      end 
    @cardword.save
    start_viktorine
  end
    
  def start_viktorine
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 0 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       
       start_viktorine1
    end 
  end
  def start_viktorine1
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 1 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       
       start_viktorine2
    end 
  end
  def start_viktorine2
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 2 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       
       start_viktorine3
    end 
  end
  def start_viktorine3
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 3 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       
       start_viktorine4
    end 
  end
  def start_viktorine4
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 4 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       
       start_viktorine5
    end 
  end
  def start_viktorine5
    #  @cardwords = Cardword.all
    #  @cardwords.where("word = 'book'")
    #  render :start
    # @cardwords.where(group: 0)
     @cardwords = Cardword.where(group: 5 ).last
    if @cardwords.present?
      render :start
    else
       flash.now[:error] = "Could not save client"
       if  @cardwords.hard_word == true
        
       else
       start_viktorine6
       end
    end 
  end

  
  private

  def find_card
    @cardword = Cardword.find_by id: params[:id]
  end 

  def cardword_params
    params.require(:cardword).permit(:word, :description)
  end
end
