FactoryGirl.define do
  factory :admin, class:User do
    email('admin@admin.admin')
    password('radmin')
    admin true
  end

  factory :user do
    email('devin@devin.devin')
    password('devinl')
  end
end
