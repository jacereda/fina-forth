64 64 64 task: mierda1
64 64 64 task: mierda2
64 64 64 task: mierda3
64 64 64 task: mierda4

mierda1 build 
mierda2 build 
mierda3 build 
mierda4 build
hex
:noname mierda1 activate 4 0 do i . pause loop stop ; execute
:noname mierda2 activate 4 0 do i . pause loop stop ; execute
:noname mierda3 activate 4 0 do i . pause loop stop ; execute
:noname mierda4 activate 4 0 do i . pause loop stop ; execute
.tasks 
:noname pause ; execute
mierda3 sleep
mierda4 kill
.tasks
:noname 5 0 do .tasks pause loop cr ; execute

