# Volatility Docker image

[Volatility](https://github.com/volatilityfoundation/volatility) is a famous DFIR memory analysis framework.

This Docker image aims to make its installation and use very smooth, on any system.

## Usage

It is best to declare a shell function inside your favorite shell (`.bashrc` or `.zshrc`) to make it easy to use:

```
function volatility() {
  docker run --rm --user=$(id -u):$(id -g) -v "$(pwd)":/dumps:ro,Z -ti phocean/volatility $@
}
```

Then, you can simply use it as follows:

```
➤  volatility -f /dumps/dump.vmem imageinfo
```

## Building

You can build the image locally with:

```
docker build -t phocean/volatility .
```

