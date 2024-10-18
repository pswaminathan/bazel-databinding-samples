workspace(name = "databinding-samples")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")

http_archive(
    name = "rules_license",
    sha256 = "6157e1e68378532d0241ecd15d3c45f6e5cfd98fc10846045509fb2a7cc9e381",
    urls = [
        "https://github.com/bazelbuild/rules_license/releases/download/0.0.4/rules_license-0.0.4.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/rules_license/releases/download/0.0.4/rules_license-0.0.4.tar.gz",
    ],
)

http_archive(
    name = "rules_java",
    sha256 = "16bc94b1a3c64f2c36ceecddc9e09a643e80937076b97e934b96a8f715ed1eaa",
    urls = [
        "https://github.com/bazelbuild/rules_java/releases/download/6.5.2/rules_java-6.5.2.tar.gz",
    ],
)

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

rules_java_dependencies()

rules_java_toolchains()

http_archive(
    name = "rules_kotlin",
    sha256 = "3b772976fec7bdcda1d84b9d39b176589424c047eb2175bed09aac630e50af43",
    url = "https://github.com/bazelbuild/rules_kotlin/releases/download/v1.9.6/rules_kotlin-v1.9.6.tar.gz",
)

load("@rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories", "kotlinc_version", "ksp_version")

kotlin_repositories(
    compiler_release = kotlinc_version(
        release = "1.9.21",
        sha256 = "cf17e0272bc065d49e64a86953b73af06065370629f090d5b7c2fe353ccf9c1a",
    ),
    ksp_compiler_release = ksp_version(
        release = "1.9.21-1.0.15",
        sha256 = "0a66c452bea0648d808b3c440212639dd277323a035b7265058ebbaab5505a18",
    ),
)

register_toolchains("//:kotlin_toolchain")

load("//tools/android_repositories:defs.bzl", "android_repositories")

android_repositories(
    name = "local_config_android",
    build_tools_version = "34.0.0",
    ndk_api_level = 30,
    sdk_api_level = 34,
)

load("@local_config_android//:android_repositories.bzl", "android_workspace")

android_workspace()

RULES_JVM_EXTERNAL_TAG = "6.1"

http_archive(
    name = "rules_jvm_external",
    sha256 = "08ea921df02ffe9924123b0686dc04fd0ff875710bfadb7ad42badb931b0fd50",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/releases/download/%s/rules_jvm_external-%s.tar.gz" % (RULES_JVM_EXTERNAL_TAG, RULES_JVM_EXTERNAL_TAG),
)

load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

rules_jvm_external_deps()

load("@rules_jvm_external//:setup.bzl", "rules_jvm_external_setup")

rules_jvm_external_setup()

git_repository(
    name = "tools_android",
    commit = "a71caa11b0ac1e83ff1e644b1b852eace8bf8f47",
    remote = "https://github.com/pswaminathan/tools_android.git",
    shallow_since = "1709848092 -0500",
)

load("@tools_android//tools/googleservices:defs.bzl", "google_services_workspace_dependencies")

google_services_workspace_dependencies()

http_archive(
    name = "grab_bazel_common",
    sha256 = "d451282ac8f7779c91165320e34d7eabf20081c4f2b4a8b3771f3a9ee371b1e5",
    strip_prefix = "grab-bazel-common-1a25b70e2dcb65a56cd8be2f5e626c198f532993",
    url = "https://github.com/pswaminathan/grab-bazel-common/archive/1a25b70e2dcb65a56cd8be2f5e626c198f532993.zip",
)

load("@grab_bazel_common//rules:repositories.bzl", grab_bazel_common_dependencies = "bazel_common_dependencies")

grab_bazel_common_dependencies()

load("@grab_bazel_common//rules:setup.bzl", grab_bazel_common_setup = "bazel_common_setup")

grab_bazel_common_setup(
    patched_android_tools = True,
)

load("@grab_bazel_common//rules:maven.bzl", pin_grab_bazel_common_dependencies = "pin_bazel_common_dependencies")

pin_grab_bazel_common_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("//:maven_deps.bzl", "maven_deps")

maven_install(
	artifacts = maven_deps(),
	fetch_sources = False,
	generate_compat_repositories = False,
    maven_install_json = "@//:maven_install.json",
	override_targets = {
        "org.jetbrains.kotlin:kotlin-reflect": "@rules_kotlin//kotlin/compiler:kotlin-reflect",
        "org.jetbrains.kotlin:kotlin-stdlib": "@rules_kotlin//kotlin/compiler:kotlin-stdlib",
        "org.jetbrains.kotlin:kotlin-stdlib-jdk7": "@rules_kotlin//kotlin/compiler:kotlin-stdlib-jdk7",
        "org.jetbrains.kotlin:kotlin-stdlib-jdk8": "@rules_kotlin//kotlin/compiler:kotlin-stdlib-jdk8",
	},
    repositories = [
        "https://repo.maven.apache.org/maven2/",
        "https://dl.google.com/dl/android/maven2/",
        "https://plugins.gradle.org/m2/",
        "https://maven.pkg.jetbrains.space/public/p/compose/dev",
    ],
    resolve_timeout = 900,
    version_conflict_policy = "pinned",
)

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()

