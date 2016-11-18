# This is a simple physics trainer
To add a task, create a trainer, and add task to it.
Any trainer have own theme (`:name`) and have tasks of this theme.
Each task must have template with variables like `%{var}`, json variables list like `{"var":[1,2,3],'var2':[3,6,7]}` and formula like `%{var}*%{var1}`
## Example of task
`{template:"You have %{a} apples. I gave you %{b} apples. How many apples you have now?",
variables:'{"a":[2,3,4]}', "b":[4,5,6]},
formula:'{%{a}+%{b}}'`}

This is my school project, I am not responsible for any bugs.
