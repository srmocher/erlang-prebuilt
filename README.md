# erlang-prebuilt

WORK IN PROGRESS: The repository is currently a work-in-progress, and no binaries are available as of yet.

This repository aims to build/publish pre-built statically linked binaries of https://github.com/erlang/otp with Bazel leveraging a [hermetic CC toolchain](https://github.com/uber/hermetic_cc_toolchain/) and [rules_foreign_cc](https://github.com/bazelbuild/rules_foreign_cc)
that can be consumed by downstream rules for other languages (Elixir) or write Erlang rules themselves.

Erlang has many required dependencies like libncurses, perl and optional dependencies like wxWidgets, OpenSSL, JDK, flex which make it highly non-trivial to build and expose hermetically as part of a toolchain. The goal of this repo is to expose Erlang binaries that can be consumed in other Bazel rules using toolchains without having to manage all these dependencies yourself.