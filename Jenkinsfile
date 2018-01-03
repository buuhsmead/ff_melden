podTemplate(
        inheritFrom: "maven",
        label: "myJenkins",
        cloud: "openshift",
        volumes: [
                persistentVolumeClaim(claimName: "m2repo", mountPath: "/home/jenkins/.m2/")
        ]) {

    node("myJenkins") {

        stage("Git Checkout") {
            echo "Checking out git repository"
            checkout scm
        } // stage Git checkout

        stage("configMap creation") {
            echo "Create the configMap"
            openshift.withCluster( ) {
                def configMapYml = openshift.create(readFile('ffmeldenbot-configmap.yml'))
                echo "Created objects from YML file: ${configMapYml.names()}"
            }
        }

        stage("secret creation") {
            echo "Create the secret"
            openshift.withCluster( ) {
                def secretYml = openshift.create(readFile('ffmeldenbot-secret.yml'))
                echo "Created objects from YML file: ${secretYml.names()}"
            }
        }

        stage('create s2i thingie') {
            openshift.withCluster( ) {
                def models = openshift.process("openshift//s2i-spring-boot-camel-config", "-p", "APP_NAME=ffmeldenbot", "-p", "GIT_REPO=https://github.com/buuhsmead/ffmeldenbot", "-p", "GIT_REF=master", "-p", "SECRET_NAME=ffmeldenbot-secret", "-p", "CONFIGMAP_NAME=ffmeldenbot-configmap")
                echo "Creating this template will instantiate ${models.size()} objects"
                def created = openshift.create(models)
                echo "The template instantiated: ${created}"
            }
        }

        stage("Build") {
            echo 'Building project'
            sh "mvn install"
        } // stage Build

    } // node myJenkins

}
