class Schedule < ApplicationRecord
  belongs_to :user, class_name: "::User", foreign_key: "user_id"

 #  Schedule DetailedList
end
