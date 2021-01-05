pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'python -m pip install -r requirements.txt'
                sh 'robot -i  Ios_en_callback_brand_off_ligne  .'
            }
        }
    }
}
