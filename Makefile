export OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
export BUILD_HARNESS_PATH ?= $(shell 'pwd')
export BUILD_HARNESS_EXTENSIONS_PATH ?= $(BUILD_HARNESS_PATH)/../build-harness-extensions
export BUILD_HARNESS_OS ?= $(OS)
export BUILD_HARNESS_ARCH ?= $(shell uname -m | sed 's/x86_64/amd64/g')
export SELF ?= $(MAKE)
export PATH := $(BUILD_HARNESS_PATH)/vendor:$(PATH)
export DOCKER_BUILD_FLAGS ?=

# Debug should not be defaulted to a value because some cli consider any value as `true` (e.g. helm)
export DEBUG ?=

ifeq ($(CURDIR),$(realpath $(BUILD_HARNESS_PATH)))
# Only execute this section if we're actually in the `build-harness` project itself
# List of targets the `readme` target should call before generating the readme
export README_DEPS ?= docs/targets.md auto-label
export DEFAULT_HELP_TARGET = help/all

include $(BUILD_HARNESS_PATH)/Makefile.*
include $(BUILD_HARNESS_PATH)/targets/*/bootstrap.Makefile*
include $(BUILD_HARNESS_PATH)/targets/*/Makefile*

ifndef TRANSLATE_COLON_NOTATION
%:
	@$(SELF) -s $(subst :,/,$@) TRANSLATE_COLON_NOTATION=false
endif
