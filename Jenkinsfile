

    node("maven") {

        stage("Git Checkout") {
            echo "Checking out git repository"
            checkout scm
        } // stage Git checkout

        stage("Build") {
            echo 'Building project'
            sh "mvn install"
        } // stage Build

    } // node myJenkins


//podTemplate(
//        inheritFrom: "maven",
//        label: "myJenkins",
//        cloud: "openshift",
//        volumes: [
//                persistentVolumeClaim(claimName: "m2repo", mountPath: "/home/jenkins/.m2/")
//        ]) {
//
//    node("myJenkins") {
//
//        stage("Git Checkout") {
//            echo "Checking out git repository"
//            checkout scm
//        } // stage Git checkout
//
//        stage("Build") {
//            echo 'Building project'
//            sh "mvn install"
//        } // stage Build
//
//    } // node myJenkins
//
//}