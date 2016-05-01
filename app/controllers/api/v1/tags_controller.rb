class Api::V1::TagsController < ApplicationController 

  api!
  def index
    tags = ActsAsTaggableOn::Tag.all
    respond_with tags
  end

  api!
  def most_used
    most_used = ActsAsTaggableOn::Tag.most_used(10)
    respond_with most_used
  end

  api!
  def least_used 
    least_used = ActsAsTaggableOn::Tag.least_used(10)
    respond_with least_used
  end
end