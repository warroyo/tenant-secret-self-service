function(request) {
  local secret = request.object,

  attachments: [
    {
      "apiVersion": "external-secrets.io/v1alpha1",
      "kind": "PushSecret",
      "metadata": {
        "name": secret.metadata.name +"-push",
        "namespace": secret.metadata.namespace
      },
      "spec": {
        "updatePolicy": "Replace",
        "deletionPolicy": "Delete",
        "refreshInterval": "10m",
        "secretStoreRefs": [
          {
            "name": secret.metadata.annotations['cluster-store'],
            "kind": "ClusterSecretStore"
          }
        ],
        "selector": {
          "secret": {
            "name": secret.metadata.name
          }
        },
        "data": [
          {
            "conversionStrategy": "None",
            "match": {
              "remoteRef": {
                "remoteKey": secret.metadata.name
              }
            }
          }
        ]
      }
    }
  ]
}