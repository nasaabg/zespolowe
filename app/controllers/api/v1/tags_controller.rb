class Api::V1::TagsController < ApplicationController 

  api!
  description <<-EOS
  === Success response:
    {
      "tags": [
        {
          "id": 1,
          "name": "awesome",
          "taggings_count": 1
        },
        {
          "id": 2,
          "name": "iphone",
          "taggings_count": 6
        },
        {
          "id": 3,
          "name": "ruby",
          "taggings_count": 1
        },
        {
          "id": 4,
          "name": "programming",
          "taggings_count": 1
        }
      ]
    }
  EOS
  example <<-EOS
  GET api/tags
  EOS
  def index
    tags = ActsAsTaggableOn::Tag.all
    respond_with tags
  end

  api!
  description <<-EOS
   === Success response:  
    {
      "tags": [
        {
          "id": 2,
          "name": "iphone",
          "taggings_count": 6
        },
        {
          "id": 3,
          "name": "ruby",
          "taggings_count": 2
        },
        {
          "id": 5,
          "name": "skills",
          "taggings_count": 1
        }
      ]
    }
  EOS
  example <<-EOS
  GET api/most-used
  EOS
  def most_used
    most_used = ActsAsTaggableOn::Tag.most_used(10)
    respond_with most_used
  end

  api!
  description <<-EOS
   === Success response:  
    {
      "tags": [
        {
          "id": 1,
          "name": "awesome",
          "taggings_count": 1
        },
        {
          "id": 9,
          "name": "c++",
          "taggings_count": 1
        }
      ]
    }
  EOS
  example <<-EOS
  GET api/least-used
  EOS
  def least_used 
    least_used = ActsAsTaggableOn::Tag.least_used(10)
    respond_with least_used
  end
end