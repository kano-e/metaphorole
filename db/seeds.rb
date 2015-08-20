# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skill_attributes = YAML.load_file(Rails.root.join('db/seeds/skills.yml'))
skill_attributes.each do |attrs|
  skill = Skill.find_or_initialize_by(label: attrs['label'])
  skill.attributes = attrs
  skill.save
end
