function(request) {
  // If the namespace is updated to no longer match our decorator selector,
  // or if the namespace is deleted, clean up any attachments we made.
  attachments: [],
  // Mark as finalized once we observe all Services are gone.
  finalized: std.length(request.attachments['PushSecret.external-secrets.io/v1alpha1']) == 0
}