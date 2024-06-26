"""A simple module extension to use with MODULE.bazel. 

Code leveraged from examples in rules_foreign_cc https://github.com/bazelbuild/rules_foreign_cc/tree/main/examples/third_party/openssl."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def openssl_repositories():
    http_archive(
        name = "openssl",
        build_file = Label("//openssl:BUILD.openssl.bazel"),
        sha256 = "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f",
        strip_prefix = "openssl-1.1.1o",
        urls = [
            "https://mirror.bazel.build/www.openssl.org/source/openssl-1.1.1o.tar.gz",
            "https://www.openssl.org/source/openssl-1.1.1o.tar.gz",
            "https://github.com/openssl/openssl/archive/OpenSSL_1_1_1o.tar.gz",
        ],
    )

    http_archive(
        name = "nasm",
        build_file = Label("//openssl:BUILD.nasm.bazel"),
        sha256 = "f5c93c146f52b4f1664fa3ce6579f961a910e869ab0dae431bd871bdd2584ef2",
        strip_prefix = "nasm-2.15.05",
        urls = [
            "https://mirror.bazel.build/www.nasm.us/pub/nasm/releasebuilds/2.15.05/win64/nasm-2.15.05-win64.zip",
            "https://www.nasm.us/pub/nasm/releasebuilds/2.15.05/win64/nasm-2.15.05-win64.zip",
        ],
    )


def _openssl_extensions_impl(module_ctx):
    openssl_repositories()

openssl_extensions = module_extension(
    implementation = _openssl_extensions_impl,
)