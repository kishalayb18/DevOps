1. Check logs:
Use ‘kubectl logs <pod_name>’

2. Analyze Pod Status:
Use ‘kubectl get pod <pod_name>’ and examine the status fields

3. Describe Pod:
Execute ‘kubectl describe pod <pod_name>’

4. Verify Pod Configuration:
Review the pod's YAML configuration using 'kubectl get pod <pod_name> -o yaml'

5. Check Events:
Run ‘kubectl get events’

6. Validate Container Images:
Check image availability and version in the pod’s YAML using "kubectl get pod <pod_name> -o=jsonpath='{.spec.containers[*].image}'."

7. Restart Pod:
Use ‘kubectl rollout restart deployment/<deployment_name>’

8. Review Service Dependencies:
Analyze dependencies in the YAML or documentation to ensure required services are available and running

9. Check Network Connectivity:
Get a shell in the running container:
‘kubectl exec -it <pod_name> -- sh’

Use ‘ping’ or ‘curl’ to test network connectivity:
‘ping <target_host>’
‘curl <target_url>’

10. Inspect Resource Usage:
Utilize ‘kubectl top pod <pod_name>’

11. Check Probes:
Execute ‘kubectl describe pod <pod_name>’

Look for the "LivenessProbe", "ReadinessProbe", and "StartupProbe" sections to see if the probes are passing or failing.

12. Compare Recent Deployment with Current Version:
Use the following commands:
‘kubectl rollout history deployment/<deployment_name> --revision=<old_revision_number>’
‘kubectl rollout history deployment/<deployment_name> --revision=<new_revision_number>’