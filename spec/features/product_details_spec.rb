require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see an individual product details page" do
    # ACT
    visit '/'
    first('article.product').click_on 'Details'


    # DEBUG / VERIFY
    expect(page).to have_content '64.99'
    save_screenshot
  end
end