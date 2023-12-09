section = Section.create(name: "Not started")
section.todos.create(title: "Create a new todo list", position: 0)
section.todos.create(title: "Add a new todo item", position: 1)

section = Section.create(name: "In progress")
section.todos.create(title: "Add a new section", position: 1)
section.todos.create(title: "I am done with this todo list", position: 0)

section = Section.create(name: "Done")
section.todos.create(title: "Ok I am done", position: 0)
section.todos.create(title: "What's next?", position: 1)