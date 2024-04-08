class LinkSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :code, :short_url

end
