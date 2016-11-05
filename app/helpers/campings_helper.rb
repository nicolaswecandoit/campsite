module CampingsHelper
    def embed(youtube_url)
        #youtube_id = youtube_url.split("=").last
        youtube_id = youtube_url[/(?<=v=)[^&]+|(?<=https:\/\/youtu.be\/)[^&?]+/]
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    end
     
    def embedd(dailymotion)
        dailymotion_id = dailymotion.split("/video/").last
        content_tag(:iframe, nil, src: "//www.dailymotion.com/embed/video/#{dailymotion_id}")
    end
     
 
end
