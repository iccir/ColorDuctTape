# ColorDuctTape

ColorDuctTape is an example project which uses asset catalog colors while maintaining support for macOS 10.11 and 10.12.

## Why?

macOS 10.14 Mojave adds Dark Mode. To support it, Apple recommends the use of asset catalog colors; unfortunately,
 `+[NSColor colorNamed:]`  doesn't exist on macOS 10.12 and earlier.
 
 I didn't want to specify colors in both the asset catalog and in code, so I wrote a quick script to generate a `.m` file from the asset catalog.
 It's not beautiful or elegant, but it gets the job done.
 
## License

Public Domain
