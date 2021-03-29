class RemoveCreatorFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :creator, :string
  end
end
