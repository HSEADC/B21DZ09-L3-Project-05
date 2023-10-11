# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@raw_text = 'Дизайнеры путешествуют. Как и все нормальные люди. Дизайнеры смотрят на мир не как нормальные люди. У дизайнеров  ̰п̰р̰Ofд̶е̰ф̰(ö̤)р̰мAц̰ия. Наш сервис помогает делиться интересными визуальными находками во время путешествий, создавая в процессе карту разных взглядов на мир — и мест, которые стоит посетить, чтобы взглянуть на них по-своему.'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def seed
  reset_db
  create_posts(10)
  create_comments(1..5)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_sentence
  sentence_words = []

  (7..12).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def upload_random_image
  uploader = PostImageUploader.new(Post.new, :post_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/posts', '*')).sample))
  uploader
end

def create_posts(quantity)
  quantity.times do
    post = Post.create(title: create_sentence, description: create_sentence, post_image: upload_random_image)
    puts "Post with id #{post.id} just created"
  end
end

def create_comments(quantity)
  Post.all.each do |post|
    quantity.to_a.sample.times do
      comment = Comment.create(post_id: post.id, body: create_sentence)
      puts "Comment with id #{comment.id} for post with id #{comment.post.id} just created"
    end
  end
end

seed
