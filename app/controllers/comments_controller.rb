class CommentsController < ApplicationController

  def create
    @comment = Photo.find(params[:photo_id]).comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment added successfully"

      redirect_to photo_url(params[:photo_id])
    else
      flash[:errors] = @comment.errors.full_messages

      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user_can_delete?(@comment)
      @comment.destroy
      flash[:notice] = "Comment removed"
    end

    redirect_to photo_url(params[:photo_id])
  end

end
