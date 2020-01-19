require 'rails_helper'

describe 'widgets api index' do
  it 'gets all the public widgets' do
    bob = new_bob
    barb = new_barb
    Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)
    Widget.create(name: 'pow', description: 'heyyo', color: 'blue', picture: 'http://www.dog.com/pic', is_public: true, user: barb)
    Widget.create(name: 'meow', description: 'meowza', color: 'purple', picture: 'http://www.frog.com/pic', is_public: false, user: bob)
    Widget.create(name: 'woof', description: 'woofza', color: 'yellow', picture: 'http://www.fish.com/pic', is_public: true, user: barb)

    get '/api/v1/widgets'

    expect(response).to be_successful
    body = JSON.parse(response.body)

    expect(body).to be_a(Array)
    expect(body.length).to eq(3)

    body.each do |widget|
      expect(widget['name']).to_not eq('meow')
      expect(widget['color']).to_not eq('purple')
      if widget['name'] == 'wow'
        expect(widget['color']).to eq('red')
      end
      if widget['woof'] == 'wow'
        expect(widget['picture']).to eq('http://www.fish.com/pic')
      end
    end
  end

  describe 'widgets api show' do
    it 'gets one public widgets' do
      bob = new_bob
      widget1 = Widget.create(name: 'wow', description: 'yowza', color: 'red', picture: 'http://www.cat.com/pic', is_public: true, user: bob)
      widget2 = Widget.create(name: 'meow', description: 'meowza', color: 'purple', picture: 'http://www.frog.com/pic', is_public: false, user: bob)

      get "/api/v1/widgets/#{widget1.id}"

      expect(response).to be_successful
      body = JSON.parse(response.body)

      expect(body).to be_a(Hash)
      expect(body['name']).to eq('wow')

      get "/api/v1/widgets/#{widget2.id}"
      expect(response).to_not be_successful
    end
  end
end
