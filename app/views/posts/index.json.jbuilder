json.array! @posts do |post|
  json.uuid post.uuid
  json.title post.title
  json.message post.message
end