# Setup

To be able to run this, you are going to have docker installed.
To install docker, pls refer to the official website:

Go here to <a href=https://docs.docker.com/get-docker/>Download Docker</a>

## How to check out the project

### Building

To build the project run:

```docker
docker build . --file development.Dockerfile --tag `build-name`
```

### Running

```docker
docker run -it --rm `build-name`
```

### Linting

Linter is integrated in the project meaming everytime we run or build the package and there is a lint error the compiler will open a file with the errors
