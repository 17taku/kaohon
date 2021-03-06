class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create

    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
        flash.now[:notice] = 'コメントを投稿しました。'
      else
        format.html { render :new }
        flash.now[:notice] = @comment.errors.full_messages

      end
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to topic_path(@topic), notice: 'コメントを編集しました。'
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic), notice: 'コメントを削除しました。'}
      format.js {render :index}
      flash.now[:notice] = 'コメントを削除しました。'
    end
  end

private

  def comment_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
  end
end
