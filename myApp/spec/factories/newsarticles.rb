# spec/factories/newsarticles.rb

FactoryGirl.define do
  factory :newsarticle do |f|
    f.name "lily1307@gmail.com"
    f.title "This is a newsarticle for testing"
	f.article nil
  end
  factory :invalid_newsarticle, parent: :newsarticle do |f|
    f.name nil
  end
   factory :newsarticle2, parent: :newsarticle do |f|
    f.name "lily1308@gmail.com"
    f.title "This is a newsarticle for testing2"
	f.article nil
  end
end

