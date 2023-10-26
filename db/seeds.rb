# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Дизайнеры путешествуют. Как и все нормальные люди. Дизайнеры смотрят на мир не как нормальные люди. У дизайнеров  ̰п̰р̰Ofд̶е̰ф̰(ö̤)р̰мAц̰ия. Наш сервис помогает делиться интересными визуальными находками во время путешествий, создавая в процессе карту разных взглядов на мир — и мест, которые стоит посетить, чтобы взглянуть на них по-своему.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@categories_data = [
  {name: 'Идеи'},
  {name: 'Туториалы'},
  {name: 'Форум'}
]

@posts_data = [
  {
    title: 'Название поста 1',
    description: 'Описание Описание Описание ПОСТА 1111',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_01.jpg')),
    category_id: 1
  },
  {
    title: 'Название поста 2',
    description: 'Описание Описание Описание ПОСТА 2222',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_05.jpg')),
    category_id: 1
  },
  {
    title: 'Название поста-idea3',
    description: 'Описание Описание Описание ПОСТА 2222',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_10.jpg')),
    category_id: 1
  },
  {
    title: 'Название поста 3',
    description: 'Описание Описание Описание ПОСТА 3333',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_09.jpg')),
    category_id: 2
  },
  {
    title: 'post forum 1',
    description: 'Описание Описание Описание ПОСТА 2222',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_02.jpg')),
    category_id: 3
  },
  {
    title: 'post forum 1',
    description: 'Описание Описание Описание ПОСТА 2222',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_03.jpg')),
    category_id: 3
  }
]

def seed
  reset_db
  create_admin
  create_users
  create_categories(@categories_data)
  create_posts(@posts_data)
  create_comments(3..8)
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
    post = Post.create(category_id: posts_data[:category_id], title: posts_data[:title], description: posts_data[:description], post_image: posts_data[:post_image], user_id: user.id)
    puts "Post with id #{post.id} for categories with id #{post.category.id} just created"
  end
end

def create_comments(quantity)
  posts = Post.all

  Post.all.each do |post|
    quantity.to_a.sample.times do
      user = User.all.sample
      comment = Comment.create(post_id: post.id, body: create_sentence, user_id: user.id)
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

seed
