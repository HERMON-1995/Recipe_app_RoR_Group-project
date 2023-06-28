# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

grace = User.create(name: "Grace Htet", email: "grace@htet.com", password: "password",confirmation_token: '23moe234f', confirmed_at: Time.now, confirmation_sent_at: Time.now)

htet = User.create(name: "Htet Htet", email: "htet@htet.com", password: "password",confirmation_token: '263w7fvw', confirmed_at: Time.now, confirmation_sent_at: Time.now)

recipe_one = Recipe.create(name: "Recipe One", description: "Recipe One Description", user_id: grace.id)
recipe_one = Recipe.create(name: "Recipe One", description: "Recipe One Description", user_id: htet.id, public: true)
recipe_two = Recipe.create(name: "Recipe two", description: "Recipe two Description", user_id: grace.id, public: true)
recipe_three = Recipe.create(name: "Recipe three", description: "Recipe three Description", user_id: grace.id)
chocolate_truffle = Recipe.create(name: "Chocolate Truffle", description: "Warm Cream: Pour warm cream over chopped chocolate.\n
    Do Nothing: Before stirring, let the warm cream and chocolate sit in the bowl for a few minutes. Don’t touch it!\n
    Stir: Stir until the chocolate is melted.\n
    Refrigerate: Refrigerate until the mixture is set, about 1-2 hours.\n
    Scoop: Scoop into balls with a cookie scoop or spoon.\n
    Roll: Roll into balls and coat in toppings like sprinkles, cocoa powder, or crushed nuts. You can also dip the truffles in melted or tempered chocolate.", user_id: grace.id)
