class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  def confirm
    @topic = Topic.new(topics_params)
    render :new if @topic.invalid?
  end

  private
  def topics_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
