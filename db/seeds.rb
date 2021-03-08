# create admin
admin = User.new(email: 'admin@mail.com', password: 'yfghbvthj')
admin.add_role :admin
admin.save