#!/usr/bin/env groovy
def DEVICE
pipeline {
    agent any
    parameters {
            string(defaultValue: 'iPhone 11 Pro Max', description: 'Device name', name: 'DevicesName', trim: true)
            string(defaultValue: 'bs://5a655452000a8ab33b25e14a3ed2c84f403846c7', description: 'URL Application', name: 'AppUrl', trim: true)
            string(defaultValue: '14.0', description: 'Operating System version', name: 'os_version', trim: true)
            string(defaultValue: 'Ios_en_marine_searsh_off_ligne', description: 'Test Execution', name: 'tags', trim: true)
    }
    stages {
        stage('pre requise install') {
            steps {
                sh 'python3.8 -m pip install -r requirements.txt'
                sh 'python3.8 -m pip freeze'
                script {
                    DEVICE = params.DevicesName.replaceAll(' ', '_')
                }
            }
        }
        stage('Connect to browserstack') {
            steps {
                browserstack('3aac3daa-8942-481b-9716-c75251d9aa7c') {
                }
            }
        }
        stage('Execute tests with robot') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  --outputdir report  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE} -v OS_VERSION:${params.os_version} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags}  ."
                }
            }
        }
        stage('Attache BrowserStack test results') {
            steps {
                browserStackReportPublisher 'app-automate'
            }
        }
        stage('Publish report Robot Framework') {
            steps {
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '', reportFiles: 'report\\report.html', reportName: 'HTML Report', reportTitles: ''])
            }
        }
    }
}
