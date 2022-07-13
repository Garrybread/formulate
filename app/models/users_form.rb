class UsersForm < ApplicationRecord
  belongs_to :user, inverse_of: :users_forms
  belongs_to :form, inverse_of: :users_forms
end
