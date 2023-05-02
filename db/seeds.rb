# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin1 = Admin.create!(email: "josedeabreu@lewagon.com",
                       password: "123123",
                       first_name: "José",
                       last_name: "de Abreu",
                       phone_number: "+55 11 9-1234-1234",
                       credit_card_name: "MasterCard",
                       credit_card_number: "1234-1234-1234-1234",
                       credit_card_date: "10/2030",
                       credit_card_security: "123",
                       user_first_name: "Gilda",
                       user_last_name: "Abreu",
                       user_phone_number: "+55 11 9-1472-1472"
                      )

user1 = User.create!(phone_number: admin1.user_phone_number,
                     admin_id: admin1.id,
                     first_name: admin1.user_first_name,
                     last_name: admin1.user_last_name
                    )

driver1 = Driver.create!(email: "roberto.deniro@lewagon.com",
                         password: "123123",
                         first_name: "Roberto",
                         last_name: "De Niro",
                         phone_number: "+55 11 9-9876-9876",
                         wallet: 1275.00
                        )

ride1 = Ride.create!(start_address: "R. Com. Bichara Moherdauí, nº 338, Morumbi, São Paulo, SP",
                     end_address: "Aeroporto Congonhas, Av. Washington Luís, Vila Congonhas, São Paulo, SP",
                     price: 280.00,
                     user_id: user1.id,
                     user_phone_number: user1.phone_number,
                     driver_id: driver1.id
                    )

notify1 = Notify.create!(content: "#{user1.first_name} #{user1.last_name} is requesting a ride!",
                         user_id: user1.id,
                         ride_id: ride1.id
                        )

admin2 = Admin.create!(email: "fernandatorres@lewagon.com",
                       password: "123123",
                       first_name: "Fernanda",
                       last_name: "Torres",
                       phone_number: "+55 11 9-2583-2583",
                       credit_card_name: "MasterCard",
                       credit_card_number: "1234-1234-1234-1234",
                       credit_card_date: "10/2030",
                       credit_card_security: "123",
                       user_first_name: "Fernanda",
                       user_last_name: "Montenegro",
                       user_phone_number: "+55 11 9-3691-3691"
                      )

user2 = User.create!(phone_number: admin2.user_phone_number,
                    admin_id: admin2.id,
                    first_name: admin2.user_first_name,
                    last_name: admin2.user_last_name
                    )

driver2 = Driver.create!(email: "queen@lewagon.com",
                        password: "123123",
                        first_name: "Queen",
                        last_name: "Latifah",
                        phone_number: "+55 11 9-9876-9876",
                        wallet: 3775.00
                        )

# ride2 = Ride.create!(start_address: "R. Com. Bichara Moherdauí, nº 338, Morumbi, São Paulo, SP",
#                     end_address: "Aeroporto Congonhas, Av. Washington Luís, Vila Congonhas, São Paulo, SP",
#                     price: 280.00,
#                     user_id: user2.id,
#                     user_phone_number: user2.phone_number,
#                     driver_id: driver2.id
#                     )

# notify2 = Notify.create!(content: "#{user2.first_name} #{user2.last_name} is requesting a ride!",
#                         user_id: user2.id,
#                         ride_id: ride2.id
#                         )
