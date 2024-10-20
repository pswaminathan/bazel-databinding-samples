"""Repository rule for Android SDK and NDK autoconfiguration.

This rule is a no-op unless the required android environment variables are set.
"""

# Taken from https://github.com/envoyproxy/envoy-mobile/blob/4eeb0c6f0a08a9c5633fb81f790ec4aa3f9c02cc/bazel/android_configure.bzl
# Workaround for https://github.com/bazelbuild/bazel/issues/14260

_ANDROID_NDK_HOME = "ANDROID_NDK_HOME"
_ANDROID_SDK_HOME = "ANDROID_HOME"

def _android_autoconf_impl(repository_ctx):
    sdk_home = repository_ctx.os.environ.get(_ANDROID_SDK_HOME)
    ndk_home = repository_ctx.os.environ.get(_ANDROID_NDK_HOME)

    sdk_api_level = repository_ctx.attr.sdk_api_level
    ndk_api_level = repository_ctx.attr.ndk_api_level
    build_tools_version = repository_ctx.attr.build_tools_version

    sdk_rule = ""
    if sdk_home:
        sdk_rule = """
    native.android_sdk_repository(
        name="androidsdk",
        path="{}",
        api_level={},
        build_tools_version="{}",
    )
""".format(sdk_home, sdk_api_level, build_tools_version)

    ndk_rule = ""
    if ndk_home:
        ndk_rule = """
    native.android_ndk_repository(
        name="androidndk",
        path="{}",
        api_level={},
    )
    native.register_toolchains("@androidndk//:all")
""".format(ndk_home, ndk_api_level)

    if ndk_rule == "" and sdk_rule == "":
        sdk_rule = "pass"

    repository_ctx.file("BUILD.bazel", "")
    repository_ctx.file("android_repositories.bzl", """
def android_workspace():
    {}
    {}
    """.format(sdk_rule, ndk_rule))

android_repositories = repository_rule(
    implementation = _android_autoconf_impl,
    environ = [
        _ANDROID_NDK_HOME,
        _ANDROID_SDK_HOME,
    ],
    attrs = {
        "sdk_api_level": attr.int(mandatory = True),
        "ndk_api_level": attr.int(mandatory = True),
        "build_tools_version": attr.string(mandatory = True),
    },
)
