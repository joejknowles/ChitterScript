class Cheep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :created_at, Time
  has 1, :user, through: Resource
  has n, :smiles
end
