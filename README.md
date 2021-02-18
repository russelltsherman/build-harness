# build-harness

## Usage

At the top of your Makefile add, the following...

```sh
-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/russelltsherman/build-harness/main/templates/Makefile.build-harness"; echo .build-harness)
```

This will download a Makefile called .build-harness and include it at run-time. We recommend adding the .build-harness file to your .gitignore.

This automatically exposes many new targets that you can leverage throughout your build & CI/CD process.
