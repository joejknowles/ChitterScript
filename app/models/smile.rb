class Smile
  include DataMapper::Resource
  property :id, Serial
  belongs_to :user
  belongs_to :cheep
  property :created_at, DateTime
end