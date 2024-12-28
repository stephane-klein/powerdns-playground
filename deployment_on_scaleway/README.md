# Playground deployment on Scaleway virtual instance

## Prerequisites

All workspaces require [Mise](https://mise.jdx.dev/).  

*Mise* is a “tooling version management” system that allows you to install most of the tools needed for a development environment.
It enables you to “pin” the precise versions of these tools.

### On OSX: install Mise with Brew

Brew is a popular package manager on *macOS*.
However, it does not come pre-installed: follow the instructions from the Brew [Website](https://brew.sh/index_fr):

```sh
$ brew install git mise
```

### On Fedora: install Mise with dnf

Install with *dnf* ([see official Mise instructions](https://mise.jdx.dev/installing-mise.html#dnf))

```sh
$ dnf install -y dnf-plugins-core
$ dnf config-manager --add-repo https://mise.jdx.dev/rpm/mise.repo
$ dnf install -y mise
```

### Configure Mise

Next, activate *mise* ([you can see official documentation](https://mise.jdx.dev/getting-started.html))

If you use **Bash** shell execute:

```sh
$ $ echo 'eval "$(mise activate bash)"' >> ~/.bashrc
$ source ~/.bash_profile
```

If you use **Zsh** shell execute:

```sh
$ echo 'eval "$(mise activate zsh)"' >> "${ZDOTDIR-$HOME}/.zshrc"
$ source ~/.zshrc
```

## Getting started

```sh
$ mise trust
$ mise install -y
$ terraform init
$ terraform apply
$ ./scritps/install_basic_server_configuration.sh
```

## Teardown

```
$ terraform destroy
```
