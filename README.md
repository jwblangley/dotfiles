# dotfiles
A collection of all my dotfiles for my preferred setup and a script to install my setup.
This setup is only tested with Ubuntu. Whilst much of this environment should be compatible with other UNIX distributions, your mileage may vary.

## Installing
Clone this repository into `$HOME/.dotfiles`. The directory to clone to is important - without it, the install script will not run correctly. N.B: this particular command assumes SSH keys have already been set up for GitHub. This is the recommended practice.
```bash
git clone git@github.com:jwblangley/dotfiles.git $HOME/.dotfiles
```
Run the install script
```bash
cd $HOME/.dotfiles
./install.sh
```

N.B: You may need to restart the shell after running the install script.

## Updating
To update, simply pull the latest version of the repository and rerun the install script. N.B: Rerunning the install script is often not necessary, but for ease of use the script has been written to be idempotent. i.e running the script multiple times will not crash and will have the same effect as if the script was run (in it's current form) once.
```bash
cd $HOME/.dotfiles
git pull
./install.sh
```

## Developing
To make changes to the setup, simply modify the relevant file within the repository and commit the changes.
For more complicated changes, modifying the setup script may be required.
To promote development without risk of damaging your personal setup, a [`Dockerfile`](Dockerfile) is included for a sandbox environment.
This Dockerfile is designed to replicate the process of running the installation script for the first time.
For example, unlike many docker images, the default user is non-root and is password-protected.
Furthermore, the installation script is *not* **fully** automated since passwords and confirmations are required and the installation script's progress is not cached.
The Dockerfile replicates this experience.
The default user within the container is `d_user` and the default password is `password`. These can be changed with docker build args.

To build the docker image:
```bash
docker build [--build-arg USERNAME=<username>] [--build-arg PASSWORD=<password>] . -t dotfiles
```

To run the install script within the docker container and test the resulting setup:
```bash
docker run -it dotfiles
```
