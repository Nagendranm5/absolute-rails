namespace :user_creation do
  task create: :environment do
    require 'uri'
    require 'net/http'
    uri = URI('https://random-data-api.com/api/v2/users?size=100')
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body).each do |data|
      User.create(name: data['username'], contact_number: data['phone_number'])
    end
    puts 'Users created successfully'
  end
end
