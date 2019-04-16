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
- usage of compilation database for irony


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
	  
## Keybindings
### Text Navigation
#### Avy
- M-s Input one char, jump to it with a tree
- C-' Input two chars, jump to it with a tree
#### Swiper/Counsel
- C-s Search in current buffer
- C-x C-f Find file
- M-x 
- C-c g Git
- C-c j Git grep
- C-c k Counsel 
- C-c C-r ivy resume
#### Projectile (Project interaction tool)
- S-d Find directory in project 
- S-f Find file in project
- S-g Grep in whole project
- S-p Switch project

### Markdown
- C-c C-c l to turn on markdown-live-preview-mode
- C-c C-c v to export and preview
- C-c C-c p to only preview
- C-c C-C e to only exportin

### Buffer 
- C-x C-k Delete file opened currently in buffer
- C-x b   Switch to buffer
- C-x C-b Open iBuffer
- C-x | Split window horizontally instead
- C- \_ Split window vertically instead
### Editing
- C-x u Undo Tree
- C-z Undo
- C-`Shift`-z
- M-`up` Move line or active region up
- M-`down` Move line or active region down
- C-x C-r Edit current file as root
- C-c w Show all whitespace characters

### Windows
- C-x o Switch window
- C-x 1 Focus on current window (Deletes other windows | Restore other windows)
- C-x 2 Split window vertically
- C-x 3 split window horizontally
- F7 split window
- `Shift`- `up/down/right/left` move to windows up/down/right/left 

### Small extra features"
- C-x g Google search
- C-c t Open a terminal buffer
- C-x c Show word count
