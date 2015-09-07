# == Schema Information
#
# Table name: robots
#
#  id                   :uuid             not null, primary key
#  name_first           :string
#  name_last            :string
#  creation_date        :date
#  job_id               :uuid
#  robot_model_id       :uuid
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

FactoryGirl.define do
  factory :robot do
    name_first {Faker::Name.first_name}
    name_last  {Faker::Name.last_name}
    creation_date {Faker::Date.between 2214124.days.since, 2252391.days.since}
    job {Job.all.sample}
    robot_model {RobotModel.all.sample}

    after(:create) {|entity| FactoryGirl.create :location, entity: entity}
  end
end
