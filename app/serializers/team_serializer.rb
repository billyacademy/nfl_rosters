class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :division_id, :logo
end
