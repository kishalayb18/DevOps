## Searching Files, Patterns

Search a file with locate, find commands
```
locate test.yaml
```
```
find /home/test new.yaml
```

Search pattern with grep
```
grep mypt file.md
```

grep :  not case sensitive
```
grep -i mypt file.md
```

Search pattern in a folder
```
grep -r "mypt" /home/new/
```

Search the lines which does not match a pattern
```
grep -v mypt file.md
```

Search the pattern that matches the whole word
```
grep -w hello file.md
```


Print 2 lines after a match
```
grep -A2 mypt test.md
```

Print 2 lines before a match
```
grep -B2 mypt test.md
```