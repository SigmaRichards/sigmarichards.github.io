# Multi-App Elm and Deploy to Github Pages

This is a test project, so different webapps can be written in elm and deployed to Github Pages.

Most of the information is thanks to this repo: <https://github.com/isaacvando/elm-to-gh-pages>

The process is simple, the page sources are compiled separately into a build directory, then that build directory is deployed to pages.

In the `apps` directory, a subdirectory labelled `root` is taken as the root for the pages website.

There are additional steps I wish to take but this works for now.

## Usage

If you have a default skeleton for compiling elm apps to, place that in `defaults`. Each directory in `root` is treated as a separate target, except `root` which is treated as the root for the website.

If a page does not need to be compiled, all necessary assets can be placed in a subdirectory `apps/appname/build`. If you would like to use a custom skeleton html, this can be placed in the app's subdirectory as `index.html`, and the default one will be ignored. If neither a default, nor custom html is available, the script will use the elm-generated html.

If you have additional assets which need to be included in the build target, these should be placed in the `assets` subdirectory.
