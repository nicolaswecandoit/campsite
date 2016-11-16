class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
 
  end
  
    def create
      @camping = Camping.find(params[:camping_id])
      @comment = @camping.comments.create(comment_params)
      @comment.user_id = current_user.id #or whatever is you session name
      if @comment.save
        redirect_to @camping
        flash.now[:success] = "Votre commentaire est en attente de validation"
      else
        flash.now[:danger] = "error"
      end
    end

   private

   def comment_params
        params.require(:comment).permit(:user_id, :camping_id, :body, :title, :service, :communication, :qualiteprix, :situation, :proprete, :animation)
   end
   
    
end


