# File-sorting

A simple script which sort a directory by following a layout

## How do I use it

You just need to follow this pattern : 
``` bash tri.sh <target> ```

## How does it work

It takes your full unsorted directory and set them up this way : 
* Target
  * Package
    * out
      * file .class
      * subfolder
        * file .class
        * subfolder
          * ...
    * src
      * file .java
      * subfolder
        * file .java
        * subfolder
          * ...
  * resource
    * pdf
      * file .pdf
    * data
      * file .png
      * file .jpg
      * file .gif
    * bash
      * README
      * tri.sh
    * others
      * all remaining files
