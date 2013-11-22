class GoalsController < ApplicationController
  before_filter :user_logged_in?

  def new
  end

  def tracker
    @goals = Goal.find_all_by_user_id(current_user.id)

  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = "You have terrible goals"
      render :new
    end
  end

  def index
    @goals = Goal.find_all_by_is_private(false)
  end

  def user_logged_in?
    unless !!current_user
      redirect_to new_session_url
    end
  end

  def show
    @goal = Goal.find_by_id(params[:id])
  end

  def cheer
    @goal = Goal.find(params[:goal_id])
    cheer = Cheer.new(goal_id: @goal.id, user_id: current_user.id)
    if cheer.save
      redirect_to goals_url
    else
      flash[:errors] = cheer.errors.full_messages
      redirect_to goals_url
    end
  end
end
