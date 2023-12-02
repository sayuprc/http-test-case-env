# Development environment for sayuprc/http-test-case

## Requirements

- Docker
- Docker Compose
- Make

## Installation

```bash
git clone https://github.com/sayuprc/http-test-case-env.git

cd http-test-case-env
```

## Usage

Get source code.

```bash
make clone
```

Create images for Docker containers.

```bash
make image VERSION=v3.x
```

Execution of test code.  

```bash
make test VERSION=v3.x
```

The VERSION variable can have the following values.

- v3.x (default)
- v2.x
- v1.x
