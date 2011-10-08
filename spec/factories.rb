Factory.define :user do |user|
  user.username "Stormagedon"
  user.age "2"
  user.sex "1"
  user.email "example@example.com"
  user.password "password"
  user.api_key "fake_key"
end
Factory.define :location do |location|
  location.latitude 2.0921
  location.longitude 1.2931
  location.user_id "1"
end
