# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Team.destroy_all

User.create(
  name: 'Minion1',
  email: 'email1@minions.com',
  team_id: 1,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Minion2',
  email: 'email2@minions.com',
  team_id: 1,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Minion3',
  email: 'email3@minions.com',
  team_id: 1,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Droid1',
  email: 'email1@droids.com',
  team_id: 2,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Droid2',
  email: 'email2@droids.com',
  team_id: 2,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Droid3',
  email: 'email3@droids.com',
  team_id: 2,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Dalek1',
  email: 'email1@daleks.com',
  team_id: 3,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Dalek2',
  email: 'email2@daleks.com',
  team_id: 3,
  password: 'password',
  password_confirmation: 'password'
)

User.create(
  name: 'Dalek3',
  email: 'email3@daleks.com',
  team_id: 3,
  password: 'password',
  password_confirmation: 'password'
)

Team.create(
  name: 'Minions',
  id: 1,
  team_score: 30
)

Team.create(
  name: 'Droids',
  id: 2,
  team_score: 75
)

Team.create(
  name: 'Daleks',
  id: 3,
  team_scroe: 80
)