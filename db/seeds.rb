# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Nature', description: 'nature related arts and landscapes', purity: 'safe')
Category.create(name: 'Watercolor', description: 'watercolor related arts and landscapes', purity: 'safe')
Category.create(name: 'Models', description: 'models photograph', purity: 'sketchy')
Category.create(name: 'Cartoon', description: 'cartoons and comics', purity: 'safe')
Category.create(name: 'Modern art', description: ' arts and landscapes', purity: 'safe')
Category.create(name: 'Blonde', description: 'Blonde photograph', purity: 'nsfw')
Category.create(name: 'Sculpture', description: 'Sculptures', purity: 'safe')
Category.create(name: 'Graphics', description: 'computer graphics', purity: 'safe')
