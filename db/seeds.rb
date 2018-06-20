# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "admin",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "steven",
             password: "12345steven",
             password_confirmation: "12345steven",
             admin: false)

Post.create!(title: "ruby on rails",
             content:"Ruby on Rails, or Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages. It encourages and facilitates the use of web standards such as JSON or XML for data transfer, and HTML, CSS and JavaScript for display and user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don't repeat yourself (DRY), and the active record pattern.[4]

Ruby on Rails' emergence in the 2000s greatly influenced web app development, through innovative features such as seamless database table creations, migrations, and scaffolding of views to enable rapid application development. Ruby on Rails' influence on other web frameworks remains apparent today, with many frameworks in other languages borrowing its ideas, including Django in Python, Laravel in PHP, Phoenix in Elixir, and Sails.js in Node.js.",
             user_id: 2,
             impressions_count: 123)

Post.create!(title: "ruby",
             content:"Ruby is a dynamic, interpreted, reflective, object-oriented, general-purpose programming language. It was designed and developed in the mid-1990s by Yukihiro Matz Matsumoto in Japan.

According to the creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp.[12] It supports multiple programming paradigms, including functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.",
              user_id: 2,
              impressions_count: 1432)