class SearchController < ApplicationController
def search
  if params[:q].nil?
    @campings = []
  else
    @campings = Camping.__elasticsearch__.search params[:q]
  end
end
end
