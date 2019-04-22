puts 'Creating articles'
article = Article.create(title: 'Article 1', body: 'Descripcion del articulo 1')
article.comments.create(username: 'Ricardo', body: 'asddsaadsasd')
article.comments.create(username: 'Paul', body: 'asddsaadsasd!!!')
Article.create(title: 'Article 2', body: 'Descripcion del articulo 2')
Article.create(title: 'Article 3', body: 'Descripcion del articulo 3')
Article.create(title: 'Article 4', body: 'Descripcion del articulo 4')
puts 'Seed data created'