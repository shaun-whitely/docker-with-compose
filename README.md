# Docker in Docker with Batteries Included

[GitHub Repository](https://github.com/shaun-whitely/docker-with-compose)

This is a Docker image appropriate for use in CI environments where it may be desirable to run Docker in Docker.

A lot of CI services allow you to specify a Docker image in which to run your CI scripts. But what if your CI scripts use `docker` or `docker-compose`? A reason for this may be to keep your local development environment as close to your CI environment as possible. Or maybe you also want to build a Docker image as a CI step.

For example, consider the following script, `auto/test` that runs the tests for your application.

```bash
#!/bin/bash

set -euo pipefail

docker-compose run --rm dev sh -c 'bundle check > /dev/null || bundle install'
docker-compose run --rm dev bundle exec rspec
```

You can use this image with GitLab CI by specifying the following in your `.gitlab-ci.yml`.

```yaml
image: shaunwhitely/docker-with-compose
services:
- docker:dind

Test:
  stage: test
  script: auto/test
```

This way you can run `auto/test` both locally and in your CI environment. Additionally, you can significantly reduce code duplication and differences between your two environments.