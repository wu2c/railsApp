# spec/factories/users.rb

FactoryGirl.define do
  factory :user do |f|
    f.email "lily1307@gmail.com"
    f.password "wellington"
	f.password_digest "for testing"
  end
  factory :user2, parent: :user do |f|
    f.email "lucy07@gmail.com"
    f.password "auckland"
  end
  factory :invalid_user, parent: :user do |f|
    f.email "lily1307@"
  end
end

