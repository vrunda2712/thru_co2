class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_show_url
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new
    end
  end

  def show
    unless current_user
      # flash[:alert] = "You must be logged in first!"
      redirect_to root_path

      return
    end
    @user = User.find(session[:user_id])

    @user_average = user_ave
    render :json
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Team Joined!"
      redirect_to @user
    else
      redirect_back_or_to @user
    end
    # @user = User.find_by[:email]
    # @user = User.find(params[:user_id])
    # @score = @user.scores.find(params[:id])
    # byebug
    # if @score.save(add_trip)
    #   flash[:notice] = "Score Added!"
    # distanceInKilometers
    # score
    # add data to strong params, pass user_id from view with AJAX (render on page or pass w params from JS)
    # @user = User.find(session[:user_id])
    # @score = add_trip
    # if request.xhr?
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    #   render json @score
    # else
    #   redirect_back_or_to @score
    #   redirect_to root_path
    # else
    #   redirect_back_or_to @score
    # end
  end

  def index

  end

  def user_ave
      sum = 0
      @user.scores.all.each do |score|
        sum += score[:score]
      end
      ave = (@user.scores.all.length == 0) ? 0 : sum / @user.scores.all.length
  end

  def self.addToTeam
    @user = current_user
    @team = Team.find(params[:id])
    @user.update_attributes(team_id: params[:team_id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :team_id)
  end

  # def score_params
  #   params.require(:score).permit(:distanceSet, :emissionsSet, :scoreSet)
  # end
  #
  # def add_trip
  #   distance_in_kilometers = params[:distanceInKilometers]
  #   score_num = params[:scoreNum]
  #   user_id = params[:user_id]
  # end
end
