# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 관리자아이디 추가하였으나 rake db:seed 가 안됨. 
admin_user1 = User.create(name: '희은', nickname: '관리자1', email: 'eun95828@likelion.org', password: '123123', region: nil, instrument: nil)
user = User.find(1)
user.add_role :admin

admin_user2 = User.create(name: '은희', nickname: '관리자2', email: 'eun95828@naver.com', password: '123123', region: nil, instrument: nil)
user = User.find(2)
user.add_role :admin