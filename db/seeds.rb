user = User.create
user.todos.create text: 'Taste JavaScript', complete: true
user.todos.create text: 'Buy a unicorn', complete: false
