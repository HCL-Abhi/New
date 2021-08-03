import groovy.transform.Field


@Field String STEP_NAME = getClass().getName()
@Field String METADATA_FILE = 'metadata/gctsDeploy.yaml'

void call(Map parameters = [:]) {
        List credentials = [
        [type: 'usernamePassword', id: 'abapCredentialsId', env: ['', '']]
        ]
        piperExecuteBin(parameters, STEP_NAME, METADATA_FILE, credentials)
}
