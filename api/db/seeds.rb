require 'faker'

user = User.first || User.create(email: "admin@mail.com", password: "123456")

10.times do
  user.employees.create(
    name: Faker::Name.name,
    position: %w[Développeur Designer RH Marketing].sample,
    department: %w[Tech Produit RH Finance].sample
  )
end