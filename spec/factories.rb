Factory.define :user do |user|
  user.username "Stormagedon"
  user.age "2"
  user.sex "1"
  user.email "example@example.com"
  user.password "password"
  user.api_key "fake_key"
end
Factory.define :user_app_interactions, :class => User do |user|
  user.username "Interactions"
  user.age "0"
  user.sex "1"
  user.email "antypdet@gmail.com"
  user.password "password"
  user.api_key "interactions_key"
  user.user_type "interactions"
end
Factory.define :location do |location|
  location.latitude 2.0921
  location.longitude 1.2931
  location.user_id "1"
end
Factory.define :valid_interaction, :class => Interaction do |interaction|
  interaction.Loclatitude 2.0921
  interaction.loclongitude 1.2931
  interaction.PersonA "1"
  interaction.PersonB "3"
  interaction.Timestamp "2010-01-01T10:00:00Z"
  interaction.deltime "2010-01-01T11:00:00Z"
end
Factory.define :location_set_1, :class => Location do |location|
  location.latitude 5
  location.longitude 5
  location.user_id 1
  location.timestamp "2010-01-01T10:00:00Z"
end
Factory.define :location_set_2, :class => Location do |location|
  location.latitude 4
  location.longitude 5
  location.user_id 2
  location.timestamp "2010-01-01T11:00:00Z"
end
Factory.define :location_set_3, :class => Location do |location|
  location.latitude 3
  location.longitude 1
  location.user_id 1
  location.timestamp "2010-01-01T12:00:00Z"
end
Factory.define :location_set_4, :class => Location do |location|
  location.latitude 6
  location.longitude 7
  location.user_id 2
  location.timestamp "2010-01-01T13:00:00Z"
end
Factory.define :location_set_5, :class => Location do |location|
  location.latitude 20
  location.longitude 30
  location.user_id 1
  location.timestamp "2010-01-01T14:00:00Z"
end
Factory.define :location_set_6, :class => Location do |location|
  location.latitude 23
  location.longitude 53
  location.user_id 1
  location.timestamp "2010-01-01T15:00:00Z"
end