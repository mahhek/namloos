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

def seed_extension
  Extension.delete_all
  Extension.create(:name => "2001")
  Extension.create(:name => "2002")
  Extension.create(:name => "2003")
  Extension.create(:name => "2004")
  Extension.create(:name => "2005")
  Extension.create(:name => "2006")
end

def seed_country
  Country.delete_all  
  Country.create(:name => "Mexico")
  Country.create(:name => "USA")
  Country.create(:name => "United Kingdom")
  Country.create(:name => "Canada")
  Country.create(:name => "Australia")
  Country.create(:name => "India")
  Country.create(:name => "Pakistan")
end

def seed_apply_to
  ApplyTo.delete_all
  ApplyTo.create(:name => "CustomerGroup")
  ApplyTo.create(:name => "Friends")
  ApplyTo.create(:name => "Business")
end

def seed_regions
  Region.delete_all
  Region.create(:name => "Europe")
  Region.create(:name => "Asia")
  Region.create(:name => "Australia")
end

def seed_prefixes
  Prefix.delete_all
  Prefix.create(:name => "0034")
  Prefix.create(:name => "0031")
  Prefix.create(:name => "06")
end

def seed_call_groups
  Callgroup.delete_all
  Callgroup.create(:name => "NL Mobile")
  Callgroup.create(:name => "NL Fixed")
  Callgroup.create(:name => "BE Fixed")
  Callgroup.create(:name => "NL Special")
end

def seed_call_definations
  CallDefination.delete_all
  CallDefination.create(:name => "Mobile")
  CallDefination.create(:name => "Fixed")
  CallDefination.create(:name => "Special Service")
end


seed_privileges
seed_groups
seed_users
seed_extension
seed_country
seed_apply_to
seed_call_definations
seed_call_groups
seed_prefixes
seed_regions
