class UpdateIndexShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    remove_index :shortened_urls, :long_url
    add_index :shortened_urls, :long_url
  end
end
