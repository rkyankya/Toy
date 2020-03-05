# frozen_string_literal: true

class AddGravatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gravatar, :string
  end
end
