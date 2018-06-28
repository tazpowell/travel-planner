class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :active
  has_one :user
end
