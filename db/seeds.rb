# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Video.destroy_all

video = Video.new(name: 'AWESOME VIDEO, WOOOOWWW!',
                  url: 'https://content.jwplatform.com/manifests/yp34SRmf.m3u8',
                  user: User.first)
video.save!

VideoView.new(video: video).save!
