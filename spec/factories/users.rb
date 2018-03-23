require 'faker'
=begin
FactoryGirl.define :user do |user|
    user.username {Faker::Name.name}
    user.email { Faker::Internet.email }
    user.UIN {Faker::Number.number(9)}
    user.phone {Faker::Number.number(10)}
    user.password "123456"
    user.password_confirmation "123456"
end
=end    

FactoryGirl.define do
    factory :user do 
        username {Faker::Name.name}
        email { Faker::Internet.email }
        UIN {Faker::Number.number(9)}
        phone {Faker::Number.number(10)}
        password 'secret'
        password_confirmation {password}
        
        factory :invalid_user do 
            username nil
        end
    end

end 