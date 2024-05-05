load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _ncurses_impl(ctx):
    http_archive(
        name = "ncurses",
        urls = ["https://github.com/mirror/ncurses/archive/refs/tags/v6.2.tar.gz"],
        sha256 = "cda1aa51c32d923701d219b2a6d107deec6fe816e50bf80e169856f04c212297",
        build_file = Label("//ncurses:BUILD.ncurses.bazel"),
        strip_prefix = "ncurses-6.2"
    )    


ncurses_extensions = module_extension(
    implementation = _ncurses_impl
)