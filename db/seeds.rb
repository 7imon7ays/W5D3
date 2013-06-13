require 'bcrypt'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([
  { name: 'simon', password: 'simon', token: SecureRandom.urlsafe_base64(16) },
  { name: 'zach', password: 'zach', token: SecureRandom.urlsafe_base64(16) },
  { name: 'dylan', password: 'dylan', token: SecureRandom.urlsafe_base64(16) },
  { name: 'aaron', password: 'aaron', token: SecureRandom.urlsafe_base64(16) },
  { name: 'ryan', password: 'ryan', token: SecureRandom.urlsafe_base64(16) }
])

subs = users.map do |user|
  Sub.create( name: "#{user.name}'s sub", moderator: user )
end


counter = -1
links = subs.map do |sub|
  counter += 1
  Link.create( title: "Link ##{counter}",
  url: "some url", body: "some body", uploader: users[4 - counter] )
end


counter = -1
comments = links.map do |link|
  counter += 1
  Comment.create( link: link,
  body: "This is comment ##{counter}", author_id: users[counter].id )
end