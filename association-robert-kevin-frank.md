
Setup

    Create a new rails application and database

    $rails new banking_app -d postgresql -T
    $cd banking_app
    $rails db:create
    $rails g model Owner name:string, address: string
    $rails db:migrate
    $rails c
    
    name:string, address: string

    Create a model for owner

    $rails c
    $

    An owner has a name and address, and can have multiple credit cards
    Create a model for credit card
    banking_app % rails g model CreditCard number:integer expiration_date:string owner_id:integer
    A credit card has a number, an expiration date, and an owner

Challenges

    Create three owners and save them in the database

[#<Owner:0x00007fb116acf868
  id: 1,
  name: "Robert",
  address: "San Diego",
  created_at: Tue, 18 Jan 2022 19:09:19.279851000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:09:19.279851000 UTC +00:00>,
 #<Owner:0x00007fb116acf570
  id: 2,
  name: "Kevin",
  address: "Buffalo",
  created_at: Tue, 18 Jan 2022 19:09:40.705333000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:09:40.705333000 UTC +00:00>,
 #<Owner:0x00007fb116acf390
  id: 3,
  name: "Frank",
  address: "Alpine",
  created_at: Tue, 18 Jan 2022 19:09:57.266347000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:09:57.266347000 UTC +00:00>]

    Create a credit card in the database for each owner
    Add two more credit cards to one of the owners

Stretch Challenge

    Add a credit limit to each card

    frank_three = CreditCard.find 5
    frank_three.update_attribute(:credit_limit, 10000011)

    [#<CreditCard:0x00007fb117576bb8
  id: 1,
  number: 12318927,
  expiration_date: "11/2033",
  owner_id: 1,
  created_at: Tue, 18 Jan 2022 19:12:57.416953000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:12:57.416953000 UTC +00:00,
  credit_limit: nil>,
 #<CreditCard:0x00007fb11accb140
  id: 2,
  number: 12837184,
  expiration_date: "12/2034",
  owner_id: 2,
  created_at: Tue, 18 Jan 2022 19:14:17.476635000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:14:17.476635000 UTC +00:00,
  credit_limit: nil>,
 #<CreditCard:0x00007fb11accb078
  id: 3,
  number: 1298371,
  expiration_date: "13/2034",
  owner_id: 3,
  created_at: Tue, 18 Jan 2022 19:14:43.841222000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:30:38.026202000 UTC +00:00,
  credit_limit: 1000000>,
 #<CreditCard:0x00007fb11accafb0
  id: 4,
  number: 1,
  expiration_date: "13/2034",
  owner_id: 3,
  created_at: Tue, 18 Jan 2022 19:15:43.849609000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:32:43.879831000 UTC +00:00,
  credit_limit: 1000000>,
 #<CreditCard:0x00007fb11accaee8
  id: 5,
  number: 18,
  expiration_date: "13/2034",
  owner_id: 3,
  created_at: Tue, 18 Jan 2022 19:16:04.850432000 UTC +00:00,
  updated_at: Tue, 18 Jan 2022 19:33:19.215448000 UTC +00:00,
  credit_limit: 10000011>]

    learnacademy@LEARNs-MacBook-Air banking_app % rails g migration add_credit_limit
Running via Spring preloader in process 7517
      invoke  active_record
      create    db/migrate/20220118191854_add_credit_limit.rb
learnacademy@LEARNs-MacBook-Air banking_app % rails db:migrate
Running via Spring preloader in process 7716
== 20220118191854 AddCreditLimit: migrating ===================================
-- add_column(:credit_cards, :credit_limit, :integer)
   -> 0.2330s
== 20220118191854 AddCreditLimit: migrated (0.2339s) ==========================


    Find the total credit extended to the owner with multiple credit cards
