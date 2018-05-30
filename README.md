# docker-texlive-full

Docker image with full Tex Live installation.

## Build

```
sudo docker build -t sdavidhdez/texlive-full:latest ./
```

## Usage

### Run container

```sh
sudo docker run -v "/path/to/your/tex/project":'/home/texlive/doc' -it --rm sdavidhdez/texlive-full:latest sh -c "latexmk -xelatex" 
```

### Add method to simplify

In your ~/.bashrc or ~/.zshrc add the following function to compile with `latexmk` and `-xelatex`. 

```sh
function lmk {
    cd $1
    cur_path=$(pwd -P)
    shift
    command="latexmk $@"
    echo " - $cur_path"
    echo " - $command"
    sudo docker run -v "$cur_path":'/home/texlive/doc' -it --rm sdavidhdez/texlive-full:latest sh -c $command
}
```

Then you can execute with `lmk <path> [latexmk options]`.

```sh
lmk path/to/your/tex/project -xelatex main.tex
```

Change the command if needed.

### Highlight output

Sometimes is useful to highligth the output, add `ccze` to the command, for example.

```sh
function lmk {
    cd $1
    cur_path=$(pwd -P)
    shift
    command="latexmk $@ | ccze -A"
    echo " - $cur_path"
    echo " - $command"
    sudo docker run -v "$cur_path":'/home/texlive/doc' -it --rm sdavidhdez/texlive-full:latest sh -c $command
}
```

