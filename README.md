# RPVM

R Package Version Manager helps you to keep the same versions of your R packages across all your project.
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You need python3

`sudo apt install python3`

You also have to install `devtools` and `withr` R packages:

`Rscript "install.packages(c('devtools', 'withr'), dependencies=T)"`

### Installing

Clone this repository anywhere in your computer. To be able to run `rpvm`, modify your `PATH` by adding this line at the end of `~/.bashrc`

```
# Add RPVM to path
export PATH="$PATH:/path/to/repository/RPVM/bin"
```

Run `source ~/.bashrc` to apply your new configuration.

Finally, try running `rpvm -v`. If everything was correct, you should be prompted with a message similar to this:
`RPVM v0.0.1`

## Contributing

Feel free to create any pull request or open an issue! Any help is appreciated!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
