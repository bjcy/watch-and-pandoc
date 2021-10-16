# watch-and-pandoc
Watch directories for markdown changes and compile using pandoc.

## Draft

1. Use [filewatcher (Ruby)](https://github.com/filewatcher/filewatcher/) to watch a given <INPUT> directory
2. When a file is changed/added
    1. Split it into a [pandoc default file (YAML)](https://pandoc.org/MANUAL.html#default-files) and an input document (Markdown)
        - N.B. See [discussion for details](https://github.com/jgm/pandoc/issues/5870)
    2. Compile using the input and options
3. Add the output file(s) to a given <OUTPUT> directory
