COMPOSER_INSTALL_COMMAND = composer install -n --prefer-dist >/dev/null 2>&1
TEST_COMMAND = vendor/bin/phpunit tests/ > /dev/null 2>&1

VERSION = v3.x

DIRS = $(shell ls docker/php/${VERSION})

define BUILD_IMAGE
	echo "Building http-test-case:${1}" \
		&& docker build -t http-test-case:${1} ./docker/php/${2}/${1} > /dev/null 2>&1 && { echo "Build succeeded"; :; } || { echo "Build failed"; }
endef

define RUN_TEST
	echo "Running http-test-case-${1}" \
		&& docker compose run --rm php${1} bash -c "git switch ${2} > /dev/null 2>&1 && ${COMPOSER_INSTALL_COMMAND} && ${TEST_COMMAND} && { echo \"Test succeeded\"; :; } || { echo \"Test failed\"; }"
endef

.PHONY: clone
clone:
	@git clone https://github.com/sayuprc/http-test-case.git ./src

.PHONY: image
image:
	@$(foreach php, ${DIRS}, $(call BUILD_IMAGE,${php},${VERSION}) &&) true

.PHONY: test
test:
	@$(foreach php, ${DIRS}, $(call RUN_TEST,${php},${VERSION}) &&) true
