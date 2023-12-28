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
    title: 'Как расписать кеды',
    description: 'Если вы начинающий кастомер, обычные кеды идеально подойдут для экспериментов. Можно превратить пару скучных белых кед во что-нибудь действительно впечатляющее. Однако для раскраски тканевой обуви необходимо приложить усилия, ведь вам придется проработать дизайн, подготовить необходимые материалы и расчистить рабочую поверхность перед началом работы. Чтобы добавить в ваш гардероб ярких цветов, возьмите в руки кеды и раскройте свой творческий потенциал.',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_13.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['обувь', 'роспись']
  },
  {
    title: 'Первый опыт кастома',
    description: 'Это было несколько лет назад, и вот где мы теперь...',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_8.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'Обновлённая косуха',
    description: 'немного красок + много труда = бесконечность стиля',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_9.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'Кастом и апсайклинг',
    description: 'Модняво и травматично (Ася нам жаль)',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_1.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'апсайклинг']
  },
  {
    title: 'смотрят множеством глаз',
    description: 'использовать фотографии в кастоме — всегда сильный приём',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_3.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'шитьё']
  },
  {
    title: 'Расписал новые кросы',
    description: 'Люблю комиксы и люблю кроссовки. А ещё занимаюсь кастомом!',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_12.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['обувь', 'роспись']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_5.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'апсайклинг', 'шитьё']
  },
  {
    title: 'Мам прости теперь я панк рок мальчик',
    description: 'Лайк на кастом, если не любишь расстраивать маму',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_17.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['обувь', 'роспись', 'кожа']
  },
  {
    title: 'покажи мне свой чехол телефона, и я скажу тебе, кто ты',
    description: 'важный элемент образа',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_14.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['аксессуары', 'роспись', 'краски']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_6.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['шитьё']
  },
  {
    title: 'Морской свитерок',
    description: 'для зимы очень нужно',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_11.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'вязание']
  },
  {
    title: 'Кастом + собачки',
    description: 'Ну что может быть лучше <3',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_16.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['аксессуары', 'шитьё']
  },
  {
    title: 'джинсы-не-с-помойки',
    description: 'сеттинг съёмки имеет значение!! а вообще: зацените новые штанишки',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_10.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'шитьё', 'апсайклинг']
  },
  {
    title: 'главное, чтобы костюмчик сидел',
    description: 'главное, чтобы костюмчик сидел. главное, чтобы костюмчик сидел!',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_2.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_4.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'апсайклинг', 'шитьё']
  },
  {
    title: 'мам да это кастом а не дырки',
    description: 'да правда мам(((',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_7.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'вязание', 'шитьё']
  },
  {
    title: 'Обновка с Дэдпулом',
    description: 'Люблю комиксы и люблю кроссовки. А ещё занимаюсь кастомом!',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_13.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['обувь', 'роспись']
  },
  {
    title: 'Обновлённая куртка №2',
    description: 'немного красок + много труда = бесконечность стиля',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_20.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'Лайк э рокстар',
    description: 'Ставь лайк на мой кастом, если пропел. Если не пропел — иди и просвещайся',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_15.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'шитьё']
  },
  {
    title: 'Графити-пиджак получается',
    description: 'Получается так',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_18.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'Роспись сумки',
    description: 'Работать по гладкой коже всегда приятно) Опробовала новые краски))',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_19.jpg')),
    category_id: 1,
    type: 'IdeaPost',
    tag_list: ['аксессуары', 'роспись', 'кожа']
  },
  {
    title: 'Кожаный пиджак как холст для граффити',
    description: 'Это вообще возможно???? Да!!1!',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_18.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['кожа', 'роспись']
  },
  {
    title: 'Введение в апсайклинг',
    description: 'Статья об этом всём сложном и непонятном',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_7.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['одежда', 'апсайклинг', 'шитьё']
  },
  {
    title: 'Пару слов о швах',
    description: 'Разбираемся, как не заколоться насмерть, если вы никогда не держали иголку в руках. Полное и наглядное руководство для начинающих кастомеров и кощеев бессмертных',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_6.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['шитьё']
  },
  {
    title: 'Особенности костюмной ткани: кастом',
    description: 'Костюмы (пиджаки, брюки, жилетки и прочие предметы одежды, которые носят взросылые люди) делают из особой ткани, и надо знать её особенности, чтобы удачно кастомизировать шмоточки костюма',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_2.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['роспись']
  },
  {
    title: 'Как наклеить что угодно куда угодно',
    description: 'И оно не оторвётся. Дело не только в клее момент! Тут нужно мастерство',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_14.jpg')),
    category_id: 2,
    type: 'TutorialPost',
    tag_list: ['аксессуары']
  }
]

def seed
  reset_db
  clean_content_folders
  create_admin
  create_users
  create_categories(@categories_data)
  create_posts(@posts_data)
  create_comments(3..8)
  create_comment_replies(30)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def clean_content_folders
  FileUtils.rm_rf('public/uploads')
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
    post = Post.create(type: posts_data[:type], tag_list: posts_data[:tag_list], category_id: posts_data[:category_id], title: posts_data[:title], description: posts_data[:description], post_image: posts_data[:post_image], user_id: user.id)
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
