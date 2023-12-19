# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Кастомизация одежды — увлекательный способ сделать свои луки уникальнее. Кастом вещь может стать способом самовыражения, воплощением творческого потенциала, ценным подарком или элементом, объединяющим группу людей. ЛУЧОК поможет вам воплотить креативные идеи в жизнь. Делитесь своими кастм вещами на ЛУЧКЕ. Мне тут очень нравится.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@categories_data = [
  {name: 'Идеи'},
  {name: 'Туториалы'}
  # {name: 'Форум'}
]

@posts_data = [
  {
    title: 'Первый опыт кастома',
    description: 'Это было несколько лет назад, и вот где мы теперь...',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_01.jpg')),
    category_id: 1,
    type: 'IdeaPost'
  },
  {
    title: 'Кастом и апсайклинг',
    description: 'Модняво и травматично (Ася нам жаль)',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_02.jpg')),
    category_id: 1,
    type: 'IdeaPost'
  },
  {
    title: 'Многообразие кастома',
    description: 'кастомизировать можно что угодно. буквально.',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_03.jpg')),
    category_id: 1,
    type: 'IdeaPost'
  },
  {
    title: 'Как расписать джинcовку',
    description: 'Лучший вариант на осень, чтобы быть в тепле и на стиле',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_04.jpg')),
    category_id: 2,
    type: 'TutorialPost'
  },
  {
    title: 'Как расписать кожу',
    description: 'Это вообще возможно???? Да!!1!',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_05.jpg')),
    category_id: 2,
    type: 'TutorialPost'
  },
  {
    title: 'Грань между кастомом и созданием нового',
    description: 'Философский разговор в стиле Канта',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_06.jpg')),
    category_id: 1,
    type: 'IdeaPost'
  }
]

def seed
  reset_db
  create_admin
  create_users
  create_categories(@categories_data)
  create_posts(@posts_data)
  create_comments(3..8)
  create_comment_replies(100)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_admin
  user_data = {
    email: "admin@email.com",
    password: "testtest",
    admin: true
  }

  user = User.create!(user_data)
  puts "Admin created with id #{user.id}"
end

def create_users
  i = 0

  5.times do
    user_data = {
      email: "user_#{i}@email.com",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
  end
end

def create_categories(data)
  data.each do |categories_data|
    category = Category.create(name: categories_data[:name])
    puts "Category with id #{category.id} just created"
  end
end

def create_sentence
  sentence_words = []

  (7..12).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def create_posts(data)
  data.each do |posts_data|
    user = User.all.sample
    post = Post.create(type: posts_data[:type], category_id: posts_data[:category_id], title: posts_data[:title], description: posts_data[:description], post_image: posts_data[:post_image], user_id: user.id)
    puts "Post with id #{post.id} with type #{post.type} just created"
  end
end

def create_comments(quantity)
  posts = Post.all

  posts.each do |post|
    quantity.to_a.sample.times do
      user = User.all.sample
      comment = Comment.create(post_id: post.id, post_type: post.type, body: create_sentence, user_id: user.id)
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

def create_comment_replies(quantity)
  quantity.times do
    user = User.all.sample
    comment = Comment.all.sample
    reply = comment.replies.create(post_id: comment.post_id, body: create_sentence, user_id: user.id)
    puts "Reply with id #{reply.id} for comment with id #{comment.id} just created"
  end
end

seed
