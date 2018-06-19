# ColorDuctTape

ColorDuctTape is an example project which uses asset catalog colors while maintaining support for macOS 10.11 and 10.12.

## Why?

macOS 10.14 Mojave adds Dark Mode. To support it, Apple recommends the use of asset catalog colors; unfortunately,
 `+[NSColor colorNamed:]`  doesn't exist on macOS 10.12 and earlier.
 
 I didn't want to specify colors in both the asset catalog and in code, so I wrote a quick script to generate a C file from the asset catalog.
 It's not beautiful or elegant, but it gets the job done.

## How It Works

1. During a build, the "Generate ColorCompatibilityData" script is ran. This compares `${DERIVED_FILE_DIR}/DerivedColorCompatibilityData.h` to every file in the asset catalog.
2. If any asset catalog file is newer, or if `DerivedColorCompatibilityData.h` doesn't exist,
`ColorCompatibilityGenerate.rb` is ran.
3. `ColorCompatibilityGenerate.rb` is a quickly-written script to parse the `Contents.json` of
`*.colorset` directories. The RGBA tuples are written out as a C file.
4. The data in this file is imported in `ColorCompatibility.m` and used in `GetCompatibilityColorNamed()`.
5. `GetColorNamed()` in `Utils.m` calls `GetCompatibilityColorNamed()` on 10.13 and previous systems.

In your own project, you can combine `ColorCompatibility.[hm]` and `Utils.[hm]` or merge  `GetCompatibilityColorNamed()` with `GetColorNamed()`. The complicated structure in this example is due to pulling code from my internal projects.

## License

Public Domain
