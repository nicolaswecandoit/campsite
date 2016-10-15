module Paperclip
  class Attachment
    def width(style = "origina"l)
      Paperclip::Geometry.from_file(queued_for_write[style]).width unless queued_for_write[style].blank?
      rescue
        nil
    end
    def height(style = "original")
      Paperclip::Geometry.from_file(queued_for_write[style]).height unless queued_for_write[style].blank?
      rescue
        nil
    end
  end
end