namespace :dev do
  desc "Generate fake data"
  task fakeup: ['db:schema:load', :environment] do
    20.times do |i|
      Product.create(
        name: "product no.#{i}", description: "description no.#{i}",
        price: (rand(10) + 1) * 50, stock: rand(91) + 10
      )
    end
    cart = Cart.create
    Product.all.sample(5).each do |product|
      cart.line_items.create product: product, unit_price: product.price, quantity: rand(4) + 1
    end
  end
end