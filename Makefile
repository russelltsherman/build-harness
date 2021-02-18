
export SELF ?= $(MAKE)

BUILD_HARNESS_PATH ?= .

EDITOR ?= vim
SHELL = /bin/bash


include $(BUILD_HARNESS_PATH)/Makefile.*
include $(BUILD_HARNESS_PATH)/targets/*/Makefile*
