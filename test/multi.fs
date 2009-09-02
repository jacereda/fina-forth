16 16 16 task: t1
16 16 16 task: t2
16 16 16 task: t3
16 16 16 task: t4
16 16 16 task: t5

t1 build 
t2 build 
t3 build 
t4 build
t5 build
hex
:noname t1 activate 4 0 do i . pause loop stop ; execute
:noname t2 activate 4 0 do i . pause loop stop ; execute
:noname t3 activate 4 0 do i . pause loop stop ; execute
:noname t4 activate 4 0 do i . pause loop stop ; execute
:noname t5 activate stop begin pause again ; execute
.tasks 
:noname pause ; execute
t3 sleep
t4 kill
.tasks
:noname 5 0 do .tasks pause loop cr ; execute

