# create admin
admin = User.new(email: 'admin@mail.com', password: 'yfghbvthj')
admin.add_role :admin
admin.saveAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?