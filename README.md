# todo

**A simple Windows batch file todo list.**

```diff
  C:\>do this
+ 0001 this

  C:\>do that
+ 0002 that
  0001 this

  C:\>todo
  0001 this
  0002 that

  C:\>did 0001
- 0001 this
  0002 that

  C:\>did that
- 0002 that

  C:\>do more
+ 0003 more
````
