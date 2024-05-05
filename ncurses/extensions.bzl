load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _ncurses_impl(ctx):
    http_archive(
        name = "ncurses",
        urls = ["https://github.com/mirror/ncurses/archive/refs/tags/v5.9.tar.gz"],
        sha256 = "bce575418c0562610a7dc6400bc7e3bdf11b803f4d96e5b9ea5738e119cc7f37",
        build_file = Label("//ncurses:BUILD.ncurses.bazel"),
        strip_prefix = "ncurses-5.9"
    )    


ncurses_extensions = module_extension(
    implementation = _ncurses_impl
)