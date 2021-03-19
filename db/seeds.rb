# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.destroy_all
Tweet.destroy_all
User.destroy_all 

images = ["ttps://live.staticflickr.com/65535/50992057781_d928278848_b.jpg", "https://live.staticflickr.com/65535/51045129662_5a421bc8b4_z.jpg", "https://live.staticflickr.com/65535/51045035601_5115ce562a.jpg", "https://live.staticflickr.com/65535/51046666471_50d0d48802.jpg", "https://live.staticflickr.com/65535/51046751917_9b3facd347.jpg", "https://live.staticflickr.com/65535/51046666446_a280f4c657.jpg", "https://live.staticflickr.com/65535/51046666426_0522582cf4.jpg", "https://live.staticflickr.com/65535/51046666411_27a1023cec_m.jpg", "https://live.staticflickr.com/65535/51046751862_2ef5df21bb_m.jpg", "https://live.staticflickr.com/65535/51045936993_262b34ecfc_m.jpg", "https://live.staticflickr.com/65535/51045936988_84d62a7c2a_m.jpg", "https://live.staticflickr.com/65535/51045936973_cc3e911519_m.jpg", "https://live.staticflickr.com/65535/51045936958_e965d5ceec_m.jpg", "https://live.staticflickr.com/65535/51046666346_375cd1a4aa_m.jpg", "https://live.staticflickr.com/65535/51046666331_5316df1f4d_m.jpg"]

for i in (1..images.length) do
        user = User.create(username: "@#{Faker::Name.first_name}#{[1, 15, 92, 87, 123, 2020].sample}", 
                profile_picture: images[i], 
                password: "123123", 
                email: Faker::Internet.email)
        puts "Se ha creado un usuario"                
end

115.times do
    tweet = Tweet.create(content: Faker::TvShows::BigBangTheory.quote, 
                user_id: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].sample)
        puts "Se ha creado un tweet"                
end

numb = rand(0..1)
    if numb == 1
        Like.create(tweet: t, user_id: t.user_id)
    end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?