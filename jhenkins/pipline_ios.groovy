#!/usr/bin/env groovy
def DEVICE
def DEVICE2
def DEVICE3
def DEVICE4
def DEVICE5
pipeline {
    agent any
    parameters {
            string(defaultValue: 'bs://167020785b0914f222af4be7b8f8181fde5f0f26', description: 'URL Application', name: 'AppUrl', trim: true)
            string(defaultValue: 'iPhone XS', description: 'Device name', name: 'DevicesName', trim: true)
            string(defaultValue: '14.0', description: 'Operating System version phone1', name: 'os_version_phone1', trim: true)
            string(defaultValue: 'iPhone 12 Pro Max', description: 'Device name2', name: 'DevicesName2', trim: true)
            string(defaultValue: '14.0', description: 'Operating System version phone2', name: 'os_version_phone2', trim: true)
            string(defaultValue: 'iPhone XS Max', description: 'Device name3', name: 'DevicesName3', trim: true)
            string(defaultValue: '13.0', description: 'Operating System version phone3', name: 'os_version_phone3', trim: true)
            string(defaultValue: 'iPhone X', description: 'Device name', name: 'DevicesName4', trim: true)
            string(defaultValue: '12.0', description: 'Operating System version phone2', name: 'os_version_phone4', trim: true)
            string(defaultValue: 'iPhone 8 Plus', description: 'Device name5', name: 'DevicesName5', trim: true)
            string(defaultValue: '11.0', description: 'Operating System version phone5', name: 'os_version_phone5', trim: true)
            string(defaultValue: 'Ios_en_callback_brand', description: 'Test tags', name: 'tags', trim: true)
    }
    stages {
        stage('pre requise install') {
            steps {
                sh 'python3.8 -m pip install -r requirements.txt'
                sh 'python3.8 -m pip freeze'
                script {
                    DEVICE = params.DevicesName.replaceAll(' ', '_')
                    DEVICE2 = params.DevicesName2.replaceAll(' ', '_')
                    DEVICE3 = params.DevicesName3.replaceAll(' ', '_')
                    DEVICE4 = params.DevicesName4.replaceAll(' ', '_')
                    DEVICE5 = params.DevicesName5.replaceAll(' ', '_')
                }
            }
        }
        stage('Connect to browserstack') {
            steps {
                browserstack('3aac3daa-8942-481b-9716-c75251d9aa7c') {
                }
            }
        }
        stage('Execute tests with robot with phone1') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE} -v OS_VERSION:${params.os_version_phone1} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Execute tests with robot with phone2') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE2} -v OS_VERSION:${params.os_version_phone2} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Execute tests with robot with phone3') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE3} -v OS_VERSION:${params.os_version_phone3} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Execute tests with robot with  phone4') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE4} -v OS_VERSION:${params.os_version_phone4} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Execute tests with robot with phone5') {
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh "python3.8 -m robot  -v BUILD:${env.BUILD_TAG} -v DEVICE:${DEVICE5} -v OS_VERSION:${params.os_version_phone5} -v REMOTE_BUILD:True  -v APP:${params.AppUrl}  -i ${params.tags} ."
                }
            }
        }
        stage('Publish Robot Framework HTML report') {
            steps {
                robot outputPath: '', passThreshold: 100.0, unstableThreshold: 100.0
            }
        }
        stage('Attache BrowserStack test results') {
            steps {
                browserStackReportPublisher 'app-automate'
            }
        }
    }
}

