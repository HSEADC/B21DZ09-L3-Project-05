# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Кастомизация одежды — увлекательный способ сделать свои луки уникальнее. Кастом вещь может стать способом самовыражения, воплощением творческого потенциала, ценным подарком или элементом, объединяющим группу людей. ЛУЧОК поможет вам воплотить креативные идеи в жизнь. Делитесь своими кастм вещами на ЛУЧКЕ. Мне тут очень нравится.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

@posts_data = [
  {
    title: 'Роспись сумки',
    description: 'Работать по гладкой коже всегда приятно) Опробовала новые краски))',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_19.jpg')),
    type: 'IdeaPost',
    tag_list: ['аксессуары', 'роспись', 'кожа']
  },
  {
    title: 'Первый опыт кастома',
    description: 'Это было несколько лет назад, и вот где мы теперь...',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_8.jpg')),
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'Обновлённая косуха',
    description: 'немного красок + много труда = бесконечность стиля',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_9.jpg')),
    type: 'IdeaPost',
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'Пару слов о швах',
    description: 'Разбираемся, как не заколоться насмерть, если вы никогда не держали иголку в руках. Полное и наглядное руководство для начинающих кастомеров и кощеев бессмертных',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_6.jpg')),
    type: 'TutorialPost',
    tag_list: ['шитьё']
  },
  {
    title: 'Особенности костюмной ткани: кастом',
    description: 'Костюмы (пиджаки, брюки, жилетки и прочие предметы одежды, которые носят взросылые люди) делают из особой ткани, и надо знать её особенности, чтобы удачно кастомизировать шмоточки костюма',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_2.jpg')),
    type: 'TutorialPost',
    tag_list: ['роспись']
  },
  {
    title: 'Как наклеить что угодно куда угодно',
    description: 'И оно не оторвётся. Дело не только в клее момент! Тут нужно мастерство',
    post_image: File.open(Rails.root.join('public', 'image_post', 'image_14.jpg')),
    type: 'TutorialPost',
    tag_list: ['аксессуары']
  }
]

@ideas_data = [
  {
    title: 'Первый опыт кастома',
    description: 'Это было несколько лет назад, и вот где мы теперь...',
    image: File.open(Rails.root.join('public', 'image_post', 'image_8.jpg')),
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'Обновлённая косуха',
    description: 'немного красок + много труда = бесконечность стиля',
    image: File.open(Rails.root.join('public', 'image_post', 'image_9.jpg')),
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'Кастом и апсайклинг',
    description: 'Модняво и травматично (Ася нам жаль)',
    image: File.open(Rails.root.join('public', 'image_post', 'image_1.jpg')),
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'смотрят множеством глаз',
    description: 'использовать фотографии в кастоме — всегда сильный приём',
    image: File.open(Rails.root.join('public', 'image_post', 'image_3.jpg')),
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'Расписал новые кросы',
    description: 'Люблю комиксы и люблю кроссовки. А ещё занимаюсь кастомом!',
    image: File.open(Rails.root.join('public', 'image_post', 'image_12.jpg')),
    tag_list: ['обувь', 'роспись', 'кожа']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    image: File.open(Rails.root.join('public', 'image_post', 'image_5.jpg')),
    tag_list: ['одежда', 'шитье', 'апсайклинг']
  },
  {
    title: 'Мам прости теперь я панк рок мальчик',
    description: 'Лайк на кастом, если не любишь расстраивать маму',
    image: File.open(Rails.root.join('public', 'image_post', 'image_17.jpg')),
    tag_list: ['одежда', 'роспись', 'кожа']
  },
  {
    title: 'покажи мне свой чехол телефона, и я скажу тебе, кто ты',
    description: 'важный элемент образа',
    image: File.open(Rails.root.join('public', 'image_post', 'image_14.jpg')),
    tag_list: ['аксессуары']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    image: File.open(Rails.root.join('public', 'image_post', 'image_6.jpg')),
    tag_list: ['одежда', 'шитье', 'апсайклинг']
  },
  {
    title: 'Морской свитерок',
    description: 'для зимы очень нужно',
    image: File.open(Rails.root.join('public', 'image_post', 'image_11.jpg')),
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'Кастом + собачки',
    description: 'Ну что может быть лучше <3',
    image: File.open(Rails.root.join('public', 'image_post', 'image_16.jpg')),
    tag_list: ['другое', 'шитье', 'апсайклинг']
  },
  {
    title: 'джинсы-не-с-помойки',
    description: 'сеттинг съёмки имеет значение!! а вообще: зацените новые штанишки',
    image: File.open(Rails.root.join('public', 'image_post', 'image_10.jpg')),
    tag_list: ['одежда', 'шитье', 'апсайклинг']
  },
  {
    title: 'главное, чтобы костюмчик сидел',
    description: 'главное, чтобы костюмчик сидел. главное, чтобы костюмчик сидел!',
    image: File.open(Rails.root.join('public', 'image_post', 'image_2.jpg')),
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'магически красиво',
    description: 'дуальность природы и урбанизации',
    image: File.open(Rails.root.join('public', 'image_post', 'image_4.jpg')),
    tag_list: ['одежда', 'шитье', 'апсайклинг']
  },
  {
    title: 'мам да это кастом а не дырки',
    description: 'да правда мам(((',
    image: File.open(Rails.root.join('public', 'image_post', 'image_7.jpg')),
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'Обновка с Дэдпулом',
    description: 'Люблю комиксы и люблю кроссовки. А ещё занимаюсь кастомом!',
    image: File.open(Rails.root.join('public', 'image_post', 'image_13.jpg')),
    tag_list: ['обувь', 'роспись', 'кожа']
  },
  {
    title: 'Обновлённая куртка №2',
    description: 'немного красок + много труда = бесконечность стиля',
    image: File.open(Rails.root.join('public', 'image_post', 'image_20.jpg')),
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'Лайк э рокстар',
    description: 'Ставь лайк на мой кастом, если пропел. Если не пропел — иди и просвещайся',
    image: File.open(Rails.root.join('public', 'image_post', 'image_15.jpg')),
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'Графити-пиджак получается',
    description: 'Получается так',
    image: File.open(Rails.root.join('public', 'image_post', 'image_18.jpg')),
    tag_list: ['одежда', 'роспись']
  }
]

@tutorials_data = [
  {
    title: 'Как расписать кеды',
    description: 'Если вы начинающий кастомер, обычные кеды идеально подойдут для экспериментов. Можно превратить пару скучных белых кед во что-нибудь действительно впечатляющее. Однако для раскраски тканевой обуви необходимо приложить усилия, ведь вам придется проработать дизайн, подготовить необходимые материалы и расчистить рабочую поверхность перед началом работы. Чтобы добавить в ваш гардероб ярких цветов, возьмите в руки кеды и раскройте свой творческий потенциал.',
    image: File.open(Rails.root.join('public', 'image_post', 'image_13.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['обувь', 'роспись', 'кожа']
  },
  {
    title: 'Кожаный пиджак как холст для граффити',
    description: 'Это вообще возможно???? Да!!1!',
    image: File.open(Rails.root.join('public', 'image_post', 'image_18.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['одежда', 'роспись']
  },
  {
    title: 'Введение в апсайклинг',
    description: 'Статья об этом всём сложном и непонятном',
    image: File.open(Rails.root.join('public', 'image_post', 'image_7.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['одежда', 'апсайклинг']
  },
  {
    title: 'Пару слов о швах',
    description: 'Разбираемся, как не заколоться насмерть, если вы никогда не держали иголку в руках. Полное и наглядное руководство для начинающих кастомеров и кощеев бессмертных',
    image: File.open(Rails.root.join('public', 'image_post', 'image_6.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['шитье']
  },
  {
    title: 'Особенности костюмной ткани: кастом',
    description: 'Костюмы (пиджаки, брюки, жилетки и прочие предметы одежды, которые носят взросылые люди) делают из особой ткани, и надо знать её особенности, чтобы удачно кастомизировать шмоточки костюма',
    image: File.open(Rails.root.join('public', 'image_post', 'image_2.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['одежда', 'шитье']
  },
  {
    title: 'Как наклеить что угодно куда угодно',
    description: 'И оно не оторвётся. Дело не только в клее момент! Тут нужно мастерство',
    image: File.open(Rails.root.join('public', 'image_post', 'image_14.jpg')),
    content: 'Рыбный контент-текст для конструктора',
    tag_list: ['другое']
  }
]

def seed
  reset_db
  clean_content_folders
  create_admin
  create_users
  create_posts(@posts_data)
  create_ideas(@ideas_data)
  create_tutorials(@tutorials_data)
  create_comments(5..10)
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
    name: "Админ LÒÒCHOK",
    admin: true
  }

  user = User.create!(user_data)
  puts "Admin created with id #{user.id}"
end

def create_users
  i = 1

  10.times do
    user_data = {
      email: "user_#{i}@email.com",
      name: "Кастомович #{i}",
      password: 'testtest'
    }

    user = User.create!(user_data)
    puts "User created with id #{user.id}"

    i += 1
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
    post = Post.create(type: posts_data[:type], tag_list: posts_data[:tag_list], title: posts_data[:title], description: posts_data[:description], post_image: posts_data[:post_image], user_id: user.id)
    puts "Post with id #{post.id} with type #{post.type} just created"
  end
end

def create_ideas(data)
  data.each do |ideas_data|
    user = User.all.sample
    idea = Idea.create(title: ideas_data[:title], description: ideas_data[:description], image: ideas_data[:image], user_id: user.id, tag_list: ideas_data[:tag_list])
    puts "Idea with id #{idea.id} just created"
  end
end

def create_tutorials(data)
  data.each do |tutorials_data|
    user = User.all.sample
    tutorial = Tutorial.create(title: tutorials_data[:title], description: tutorials_data[:description], image: tutorials_data[:image], content: tutorials_data[:content], user_id: user.id, tag_list: tutorials_data[:tag_list])
    puts "Tutorial with id #{tutorial.id} just created"
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
