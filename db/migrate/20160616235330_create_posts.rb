class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :channel
      t.uuid :uuid
      t.json :options
      t.text :message
      t.text :title
      t.datetime :published_at
      t.json :meta
      t.string :aasm_state

      t.timestamps
    end
  end
end
