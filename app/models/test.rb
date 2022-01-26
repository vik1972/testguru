class Test < ApplicationRecord
  belongs_to :category
  def self.sort_categories(category)
    joins(:category)
      .where(categories: {title: category})
      .order('tests.title DESC')
      .pluck(:title)
  end
end
