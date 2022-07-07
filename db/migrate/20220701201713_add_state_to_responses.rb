class AddStateToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :aasm_state, :string, index: true
  end
end
