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
    @cardword.reviewed_at = DateTime.now
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
    @cardword.reviewed_at = DateTime.now
    if @cardword.group == 11 
      @cardword.hard_word = true
    end 
    @cardword.save
     flash[:notice] = "Thanks for your comment!"
    start_viktorine
  end

  def bad_response 
    @cardword.group = 1
    @cardword.reviewed_at = DateTime.now 
    @cardword.increment! :bad_response
      if  @cardword.bad_response == 10 
        @cardword.hard_word = true
      end 
    @cardword.save
    start_viktorine
  end
    
  def start_viktorine
     @cardwords = Cardword.where(group: 0 ).last
     byebug
    if @cardwords.present?  and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else
       flash.now[:error] = "Could not save client"
       start_viktorine1
    end 
  end
  def start_viktorine1
     @cardwords = Cardword.where(group: 1 ).last
    if @cardwords.present?  and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else
       flash.now[:error] = "Could not save client"
       start_viktorine2
    end 
  end
  def start_viktorine2
     @cardwords = Cardword.where(group: 2 ).last
    if @cardwords.present?  and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else
       flash.now[:error] = "Could not save client"
     start_viktorine3
    end 
  end
  def start_viktorine3
     @cardwords = Cardword.where(group: 3 ).last
    if @cardwords.present?  and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else
       flash.now[:error] = "Could not save client"
       start_viktorine4
    end 
  end
  def start_viktorine4 
     @cardwords = Cardword.where(group: 4 ).last
    if @cardwords.present?  and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else
       flash.now[:error] = "Could not save client"
       start_viktorine5
    end 
  end
  def start_viktorine5
     @cardwords = Cardword.where(group: 5 ).last
    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
      render :start
    else 
      start_viktorine6
    end 
  end
  # def start_viktorine6
  #   @cardwords = Cardword.where(group: 6 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     start_viktorine7
  #   end 
  # end

  # def start_viktorine7
  #   @cardwords = Cardword.where(group: 7 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     start_viktorine8
  #   end 
  # end

  # def start_viktorine8
  #   @cardwords = Cardword.where(group: 8 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     start_viktorine9
  #   end 
  # end

  # def start_viktorine9
  #   @cardwords = Cardword.where(group: 9 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     start_viktorine10
  #   end 
  # end

  
  # def start_viktorine10
  #   @cardwords = Cardword.where(group: 10 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     start_viktorine11
  #   end 
  # end

  # def start_viktorine11
  #   @cardwords = Cardword.where(group: 11 ).last
  #    if @cardwords.present? and (@cardwords.time_to_next_appearance = 0 )
  #      render :start
  #    else 
  #     redirect_to :root_path
  #   end 
  # end
  
  private

  def find_card
    @cardword = Cardword.find_by id: params[:id]
  end 

  def cardword_params
    params.require(:cardword).permit(:word, :description)
  end
end
