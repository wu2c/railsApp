# spec/factories/comments.rb

FactoryGirl.define do
  factory :comment do |f|
    f.content "good news"
  end
  factory :comment2, parent: :comment do |f|
    f.content "i think so"
  end
end

