# todo

**A simple Windows batch file todo list.**

```diff
  C:\>do this
+ 0001 this

  C:\>do that
+ 0002 that
  0001 this

  C:\>todo
  0002 that
  0001 this

  C:\>did this
  0002 that
- 0001 this

  C:\>did 2
- 0002 that

  C:\>do more
+ 0003 more
````
