# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def seed_groups
  groups = Group.all
  groups.each{ |group| group.destroy } unless groups.nil?

  group = Group.new
  group.name = "Administrator"
  group.save

  group = Group.new
  group.name = "AVclass"
  group.save

  group = Group.new
  group.name = "Enduser"
  group.save
end

def seed_privileges
  privileges = Privilege.all
  privileges.each{ |p| p.destroy } unless privileges.nil?

  privilege = Privilege.new
  privilege.name = "Voicemail"
  privilege.save

  privilege = Privilege.new
  privilege.name = "IVR"
  privilege.save

  privilege = Privilege.new
  privilege.name = "Callcosts"
  privilege.save
end


def seed_users
  users = User.all
  users.each{ |user| user.destroy } unless users.nil?

  user = User.new(
    :email => "admin@admin.com",
    :password => 'password',
    :password_confirmation => "password"
  )
  user.groups << Group.find_by_name("Administrator")
  if user.save!
    user.update_attribute("confirmed_at",Time.now)
  else
    user.errors.each { |e| puts "Database Error: ", e }
  end
end

seed_privileges()
seed_groups()
seed_users()