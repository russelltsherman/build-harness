<!-- markdownlint-disable -->
## Makefile Targets
```text

Available targets:

  aws/install                         Install aws cli bundle
  aws/shell                           Start a aws-vault shell with access to aws api
  bash/lint                           Lint all bash scripts
  brew                                install homebrew and execute Brewfile
  brew/install                        brew install $(PROJNAME)
  brew/remove                         brew remove $(PROJNAME)
  chamber/install                     Install chamber
  chamber/shell                       Start a chamber shell with secrets exported to the environment
  completion/install/bash             Install completion script for bash
  compose/build                       Build local dev environment
  compose/down                        Stop local dev environment
  compose/monitor                     Show containers resource usage
  compose/monitor/follow              Monitor in time containers resource usage
  compose/purge                       Purge local dev environment
  compose/rebuild                     Rebuild custom containers for local dev environment
  compose/restart                     Restart local dev environment
  compose/top                         Show top for containers
  compose/up                          Start local dev environment (daemonized)
  direnv                              initialize direnv
  direnv/vars                         initialize direnv vars from example
  docker/build                        Build docker image
  docker/clean                        Cleanup docker.                     WARNING!!! IT WILL DELETE ALL UNUSED RESOURCES
  docker/clean/containers             Cleanup docker containers.          WARNING!!! IT WILL DELETE ALL UNUSED CONTAINERS
  docker/clean/images                 Cleanup docker images.              WARNING!!! IT WILL DELETE ALL UNUSED IMAGES
  docker/clean/images/all             Cleanup docker images all.          WARNING!!! IT WILL DELETE ALL IMAGES
  docker/clean/networks               Cleanup docker networks.            WARNING!!! IT WILL DELETE ALL UNUSED NETWORKS
  docker/clean/volumes                Cleanup docker volumes.             WARNING!!! IT WILL DELETE ALL UNUSED VOLUMES
  docker/image/promote/local          Promote $SOURCE_DOCKER_REGISTRY/$IMAGE_NAME:$SOURCE_VERSION to $TARGET_DOCKER_REGISTRY/$IMAGE_NAME:$TARGET_VERSION
  docker/image/promote/remote         Pull $SOURCE_DOCKER_REGISTRY/$IMAGE_NAME:$SOURCE_VERSION and promote to $TARGET_DOCKER_REGISTRY/$IMAGE_NAME:$TARGET_VERSION
  docker/image/push                   Push $TARGET_DOCKER_REGISTRY/$IMAGE_NAME:$TARGET_VERSION
  docker/login                        Login into docker hub
  docs/targets.md                     Update `docs/targets.md` from `make help`
  docs/terraform.md                   Update `docs/terraform.md` from `terraform-docs`
  git/export                          Export git vars
  gitleaks/install                    Install gitleaks
  gitleaks/scan                       Scan current repository
  helm/chart/build                    Build chart $CHART_NAME from $SOURCE_CHART_TPL
  helm/chart/build/all                Build chart $CHART_NAME from $SOURCE_CHART_TPL for all available $SEMVERSIONS
  helm/chart/clean                    Clean chart packages
  helm/chart/create                   Create chart $CHART from starter scaffold
  helm/chart/promote/local            Promote $SOURCE_CHART_FILE to $TARGET_VERSION
  helm/chart/promote/remote           Promote $CHART_NAME from $SOURCE_VERSION to $TARGET_VERSION. ($SOURCE_CHART_REPO_ENDPOINT required)
  helm/chart/publish                  Alias for helm/chart/publish/all. WARNING: Eventually will became functional equal to helm/chart/publish/one
  helm/chart/publish/all              Publish chart $CHART_NAME to $TARGET_CHART_REPO_ENDPOINT
  helm/chart/publish/package          Publish chart $SOURCE_CHART_FILE to $REPO_GATEWAY_ENDPOINT
  helm/chart/starter/fetch            Fetch starter
  helm/chart/starter/remove           Remove starter
  helm/chart/starter/update           Update starter
  helm/delete/failed                  Delete all failed releases in a `NAMESPACE` subject to `FILTER`
  helm/delete/namespace               Delete all releases in a `NAMEPSACE` as well as the namespace
  helm/delete/namespace/empty         Delete `NAMESPACE` if there are no releases in it
  helm/install                        Install helm
  helm/repo/add                       Add $REPO_NAME from $REPO_ENDPOINT
  helm/repo/build                     Build repo
  helm/repo/clean                     Clean helm repo
  helm/repo/info                      Show repo info
  helm/repo/lint                      Lint charts
  helm/repo/update                    Update repo info
  helm/serve/index                    Build index for serve helm charts
  helm/toolbox/upsert                 Install or upgrade helm tiller 
  helmfile/install                    Install helmfile
  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  make/lint                           Lint all makefiles
  packages/delete                     Delete packages
  packages/install                    Install packages 
  packages/install/%                  Install package (e.g. helm, helmfile, kubectl)
  packages/reinstall                  Reinstall packages
  packages/reinstall/%                Reinstall package (e.g. helm, helmfile, kubectl)
  packages/uninstall/%                Uninstall package (e.g. helm, helmfile, kubectl)
  readme                              Alias for readme/build
  readme/build                        Create README.md by building it from README.yaml
  readme/init                         Create basic minimalistic .README.md template file
  readme/lint                         Verify the `README.md` is up to date
  semver/export                       Export semver vars
  slack/notify                        Send webhook notification to slack
  slack/notify/build                  Send notification to slack using "build" template
  slack/notify/deploy                 Send notification to slack using "deploy" template
  template/build                      Create $OUT file by building it from $IN template file
  template/deps                       Install dependencies

```
<!-- markdownlint-restore -->
