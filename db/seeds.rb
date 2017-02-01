# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all
User.destroy_all

categories_lists = ["Carriers, Slings & Backpacks", "Accessories", "Antiquarian & Collectible", "Audiobooks", "Catalogs", "Agriculture & Forestry", "Automation, Motors & Drives", "Construction", "Electrical & Test Equipment", "Fuel & Energy", "Healthcare, Lab & Life Science", "Heavy Equipment", "Cell Phone & Smartphone Parts", "Cell Phone Accessories", "Cell Phones & Smartphones", "Baby & Toddler Clothing", "Costumes, Reenactment, Theater", "Cultural & Ethnic Clothing", "Dancewear", "Kids' Clothing, Shoes & Accs", "Men's Accessories", "3D Printers & Supplies", "Computer Cables & Connectors", "Computer Components & Parts", "Desktops & All-In-Ones", "Drives, Storage & Blank Media", "Enterprise Networking, Servers", "Home Networking & Connectivity",]
categories_lists.each do |thing|
  Category.create!(title: thing, description: "best category of #{thing}")

  p "Successful Created #{thing} category ."
end

#normal user
["one", "two", "three"].each do |i|
  User.create!(
      email: "user#{i}@gmail.com",
      password: "user#{i}",
      password_confirmation: "user#{i}",
      reset_password_token: nil,
      reset_password_sent_at: nil,
      remember_created_at: nil,
      sign_in_count: 1,
      current_sign_in_at: "2017-02-06 14:02:10",
      last_sign_in_at: "2017-02-06 14:02:10",
      current_sign_in_ip: "127.0.0.1",
      last_sign_in_ip: "127.0.0.1",
      admin: nil
     )

  p "Add normal user_#{i} :)"
end

#admin user

["one", "two", "three"].each do |i|
  User.create!(
      email: "admin_#{i}@gmail.com",
      password: "admin#{i}",
      password_confirmation: "admin#{i}",
      reset_password_token: nil,
      reset_password_sent_at: nil,
      remember_created_at: nil,
      sign_in_count: 1,
      current_sign_in_at: "2017-02-06 14:02:10",
      last_sign_in_at: "2017-02-06 14:02:10",
      current_sign_in_ip: "127.0.0.1",
      last_sign_in_ip: "127.0.0.1",
      admin: true
  )
  p "Add admin admin_#{i} :)"
end

# add product for admin_one@gmail.com
@user_product = User.where(email: "admin_one@gmail.com")
@category_product = Category.find_by(title: "Accessories")

product_base = ["linux", "muslo", "booba", "fouiny", "mhd", "kaaris", "tchoin", "zongo", "kiwi"]

product_base.each do |product|
  Product.create!(
             title: "product #{product}",
             description: "this product will get you free from #{product}",
             price: "200",
             location: "Paris",
             created_at: "2017-02-06 14:02:10",
             updated_at: "2017-02-06 14:02:10",
             category_id: @category_product[:id],
             user_id: @user_product[0][:id]
  )
end