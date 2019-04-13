# emacsConfig
Personal emacs config i decided to craft together beacause all the pre built configs are either really slow and bloated with unnecessary packages or too many packgages are missing. 

This emacs config is properly configured for:

- c/c++/objc 
- haskell
- markdown

## TODO:
- add keybindings description for all major and minor modes
- list all used modes and give brief description about them
- insert photos or gifs about this config in action
- usage of compilation datebase for irony


## Requirements
#### irony and irony-server<br/>
- Following packages need to be installed on your system:
	 * CMake >= 2.8.3
	 * libclang
- To install irony-server and just type this in emacs:<br/>
~~~el
M-x irony-install-server RET.		
~~~
</br/>

#### stack (for intero - haskell development envirement)
For many Un*x operating systems, all you need to do is run:

``` sh
curl -sSL https://get.haskellstack.org/ | sh
```
#### pandoc (Markdown renderer)

##### - macOS:
  The simpliest method to install an keeping pandoc up-to-date is using brew
  
  ```sh
   $ brew install pandoc
   $ brew install pandoc-citeproc
  ```
##### - Linux:
  Pandoc is in the Debian, Ubuntu, Slackware, Arch, Fedora, NiXOS, openSUSE, and gentoo repositories.
  
On Debian/Ubuntu: 
```sh
$ apt-get install pandoc pandoc-citeproc
```
On Fedora: 
```sh
$ dnf install pandoc pandoc-citeproc
```
	  
### Keybindings

- C-c C-c l to turn on markdown-live-preview-mode
- M-up move line/region up
- M-down move line/region down

