# frozen_string_literal: true

class AddArticleIdFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :article_id, :integer
  end
end
