# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_title  (title) UNIQUE
#
class Article < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
