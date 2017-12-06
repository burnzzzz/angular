
node('docker') {
    git poll: true, url: 'https://github.com/teoyaomiqui/angular-app'
    checkout scm
    try {
        sh "cat dockerfile.test"
        sh "docker build -t angular-tmp:${env.BUILD_ID} -f dockerfile.test ."
        sh "docker run angular-tmp:${env.BUILD_ID} ./pipelines/scripts/test.sh"
    }
    finally {
        sh "docker rmi --force angular-tmp:${env.BUILD_ID}"
    }
    try {
        def angularApp = docker.build("kkalynovskyi/angular-app:${env.BUILD_ID}")
        angularApp.push()
    }
    finally {
        sh "docker rmi --force kkalynovskyi/angular-app:${env.BUILD_ID}"
    }
}
