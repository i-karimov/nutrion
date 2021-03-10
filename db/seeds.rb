# create admin
admin = User.new(email: 'admin@mail.com', password: 'yfghbvthj')
admin.add_role :admin
admin.save

if Rails.env.development?
  AdminUser.create!(
    email: 'admin@example.com', 
    password: 'password', 
    password_confirmation: 'password'
  ) 
end