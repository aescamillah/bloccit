class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id]) # => here, how con it access :topic_id
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params) # => difference between this and next line?
    # @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    # authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
