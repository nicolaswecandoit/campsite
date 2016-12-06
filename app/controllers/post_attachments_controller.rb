class PostAttachmentsController < InheritedResources::Base

  private

    def post_attachment_params
      params.require(:post_attachment).permit(:camping_id, :gallerie)
    end
end

