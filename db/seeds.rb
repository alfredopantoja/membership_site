# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.where(name: role).first_or_create(name: role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.where(email: ENV['ADMIN_EMAIL'].dup).first_or_create(name: ENV['ADMIN_NAME'].dup, email: ENV['ADMIN_EMAIL'].dup, password: ENV['ADMIN_PASSWORD'].dup, password_confirmation: ENV['ADMIN_PASSWORD'].dup)
user.add_role :admin
user2 = User.where(email: 'silver@example.com').first_or_create(name: 'Silver User', email: 'silver@example.com', password: 'changeme', password_confirmation: 'changeme')
user2.add_role :silver
user3 = User.where(email: 'gold@example.com').first_or_create(name: 'Gold User', email: 'gold@example.com', password: 'changeme', password_confirmation: 'changeme')
user3.add_role :gold
user4 = User.where(email: 'platinum@example.com').first_or_create(name: 'Platinum User', email: 'platinum@example.com', password: 'changeme', password_confirmation: 'changeme')
user4.add_role :platinum
puts "users: #{user2.name}, #{user3.name}, #{user4.name}"
