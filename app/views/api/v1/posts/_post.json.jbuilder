json.extract! post, :title, :type, :description, :user, :created_at
# json.post_image request.base_url + post.post_image.url - что то не так с картинками
json.url api_v1_post_url(post, format: :json)

