class RemoveEventFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event, :text
  end
end
