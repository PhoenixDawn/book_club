# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.destroy_all

horror = Genre.create(name: "Horror")
thriller = Genre.create(name: "Thriller")
fantasy = Genre.create(name: "Fantasy")
scifi = Genre.create(name: "Sci-fi")

authors = [
  {
    first_name: "Stephen",
    last_name: "King",
    books: [
      Book.new(title: "IT", genres: [horror, thriller]),
      Book.new(title: "The Shining", genres: [horror]),
      Book.new(title: "Carrie", genres: [thriller]),
    ],
  },
  {
    first_name: "Isaac",
    last_name: "Asimov",
    books: [
      Book.new(title: "Foundation", genres: [scifi, thriller]),
      Book.new(title: "Robots and Empire", genres: [scifi, fantasy]),
    ],
  },
]

Author.destroy_all
Author.create(authors)

# sk = Author.create(first_name: "Stephen", last_name: "King")
# ia = Author.create(first_name: "Isaac", last_name: "Asimov")

# sk.books.create(title: "IT", genre: "Horror")
# sk.books.create(title: "The Shining", genre: "Horror")
# sk.books.create(title: "Carrie", genre: "Horror")

# ia.books.create(title: "Foundation", genre: "Sci-Fi")
# ia.books.create(title: "Robots and Empire", genre: "Sci-Fi")
