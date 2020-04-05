class RemoveNullConstraintToShortUrl < ActiveRecord::Migration[6.0]
  def change
    change_column_null :url_shorts, :short_url, true
  end
end
