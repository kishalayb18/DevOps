## File Sizing, Compression

Tp show the file size
```
du -sk testfile.md
du -sh testfile.md
ls -l testfile.md
```

Archiving files
```
tar -cf test.tar file.md file2.md file3.md
tar -zcf test.tar file.md file2.md file3.md
```

To view the contents of the tar file
```
tar -tf test.tar
```

    -c flag to create the tar file
    -f to name the tar file
    -z to compress the tar file
    -tf to view the contents of the tar file

Compress file with gzip command
```
gzip test.yaml
du -sh test.yaml.gz
```

Read compressed files
```
zcat test.yaml.gz
```

Unzip the compressed file
```
gunzip test.yaml.gz
```

```

```