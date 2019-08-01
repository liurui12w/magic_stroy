json.status 0
json.message 'ok'
json.data do
  json.record do
    json.array! @records do |record|
      json.id record.id
      json.image record.image
      json.name record.name

    end
  end
end
