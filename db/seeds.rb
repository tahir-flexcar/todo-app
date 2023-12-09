section = Section.create(name: "Not started")
section.todos.create(title: "Create a new todo list")
section.todos.create(title: "Add a new todo item")

section = Section.create(name: "In progress")
section.todos.create(title: "Add a new section")
section.todos.create(title: "I am done with this todo list")

section = Section.create(name: "Done")
section.todos.create(title: "Ok I am done")
section.todos.create(title: "What's next?")