def maven_deps():
    activityVersion = '1.7.1'
    constraintLayoutVersion = '2.1.4'
    espressoVersion = '3.5.1'
    junitVersion = '4.13.2'
    hamcrestVersion = '1.3'
    androidXTestRunnerVersion = '1.5.2'
    androidXTestExtVersion = '1.1.5'
    androidXTestRulesVersion = '1.5.0'
    appCompatVersion = '1.6.1'
    archLifecycleVersion = '2.7.0'

    return [
        "androidx.activity:activity-ktx:%s" % activityVersion,
        "androidx.appcompat:appcompat:%s" % appCompatVersion,
        "androidx.constraintlayout:constraintlayout:%s" % constraintLayoutVersion,
        "androidx.core:core-ktx:1.9.0",
        "androidx.databinding:databinding-adapters:7.1.2",
        "androidx.databinding:databinding-common:7.1.2",
        "androidx.databinding:databinding-compiler:7.1.2",
        "androidx.databinding:databinding-ktx:7.1.2",
        "androidx.databinding:databinding-runtime:7.1.2",
        "androidx.fragment:fragment-ktx:1.5.4",
        "androidx.lifecycle:lifecycle-common:%s" % archLifecycleVersion,
        "androidx.lifecycle:lifecycle-extensions:2.2.0",
        "androidx.lifecycle:lifecycle-livedata-ktx:%s" % archLifecycleVersion,
        "androidx.lifecycle:lifecycle-runtime:%s" % archLifecycleVersion,
        "androidx.lifecycle:lifecycle-runtime-ktx:%s" % archLifecycleVersion,
        "androidx.lifecycle:lifecycle-viewmodel-ktx:%s" % archLifecycleVersion,
        "androidx.lifecycle:lifecycle-viewmodel-savedstate:%s" % archLifecycleVersion,
        "androidx.startup:startup-runtime:1.1.1",


        # "junit:junit:%s" % junitVersion,
        # "org.hamcrest:hamcrest-all:%s" % hamcrestVersion,
        # "androidx.test:runner:%s" % androidXTestRunnerVersion,
        # "androidx.test.ext:junit:%s" % androidXTestExtVersion,
        # "androidx.test:rules:%s" % androidXTestRulesVersion,
        # "androidx.test.espresso:espresso-core:%s" % espressoVersion,
    ]
