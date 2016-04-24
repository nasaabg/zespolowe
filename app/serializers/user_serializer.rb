class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,
   :nickname, :email, :created_at, :phone_number,
  :address, :gender, :date_of_birth, :specialization
end
