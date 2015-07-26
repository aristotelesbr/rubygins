require 'coderay'

class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title

  def to_param
    "#{id}-#{title}"
  end
end
