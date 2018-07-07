class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :active, :address, :url, :hours, :duration, :cost, :tags, :notes
  has_one :user
end
