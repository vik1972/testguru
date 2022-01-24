class Test < ApplicationRecord

  def self.sort_categories(category)
    category_id = Category.where("title=?", category).pluck(:id)
    self.where("category_id=?", category_id).order("title DESC").pluck(:title)
  end
end
