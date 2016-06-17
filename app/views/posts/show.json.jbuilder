json.uuid @post.uuid
json.title @post.title
json.message @post.message
json.published_at @post.published_at
json.channel @post.channel
json.meta (if @post.meta then @post.meta else {} end)
