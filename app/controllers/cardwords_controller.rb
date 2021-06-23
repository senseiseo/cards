class CardwordsController < ApplicationController
  @@test_number = 0 # Счетчик
  @@max_level = 12 # Максимальный уровень в игре
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

  def start_viktorine               # методы обработки старта викторинры, нарушение всех принципов программировния )
    @cardwords = Cardword.where( group: @@test_number ).last
     if @cardwords.present? and @cardwords.time_to_next_appearance == 0  and @cardwords.hard_word == false
      render :start
     else
      @@test_number = @@test_number + 1
      if @@test_number < @@max_level
        start_viktorine()
      else
        flash[:notice] = "Доступных карточек нет"
        redirect_to root_path
        @@test_number = 0
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
