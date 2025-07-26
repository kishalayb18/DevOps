 #
 
 When Kubernetes networking breaks, identifying the root cause quickly is crucial. This guide highlights common troubleshooting scenarios—CNI issues, network policies, DNS/service discovery, and service-endpoint-pod connectivity. Follow the structured steps below to restore cluster networking


This guide helps you diagnose common Kubernetes networking issues using targeted commands and step-by-step checks.

| **Scenario**              | **Focus**                            | **Steps to Troubleshoot**                                                                 |
|---------------------------|---------------------------------------|------------------------------------------------------------------------------------------|
| **CNI**                   | Pod network agents & connectivity     | - Run `kubectl get pods -n kube-system` and look for restarts or `CrashLoop`. <br> - Inspect events: `kubectl describe pod <cni-pod> -n kube-system`. <br> - Review logs: `kubectl logs <cni-pod> -n kube-system`. <br> - Verify node health. <br> - Confirm kubelet and the container runtime (Docker, containerd) are running. <br> - For Cilium users, `cilium status` and `cilium node status` show kernel modules, BPF maps, and node health. |
| **Network Policies**      | Ingress/Egress filters                | - Locate policies: `kubectl get networkpolicies --all-namespaces`. <br> - If no policies exist, skip to other troubleshooting areas. <br> - Review selectors and intent: Ensure `podSelector` and `namespaceSelector` match the intended workload. <br> - Overly broad selectors may catch nothing; too narrow may block all traffic. <br> - Verify ingress/egress rules: An empty list blocks traffic by default. <br> - Confirm each rule explicitly allows the necessary ports and protocols. <br> - Test connectivity from various pods: <br> &nbsp;&nbsp;• `ping <pod-IP>` <br> &nbsp;&nbsp;• `nc -zv <pod-IP> <port>` <br> &nbsp;&nbsp;• `curl http://<service>` |
| **Service Discovery & DNS** | CoreDNS health & resolution          | - Check CoreDNS pods: `kubectl get pods -n kube-system -l k8s-app=kube-dns`. <br> - Ensure pods are Running, then inspect logs: `kubectl logs -n kube-system deploy/coredns`. <br> - Inspect ConfigMap: `kubectl get configmap coredns -n kube-system -o yaml`. <br> - Look for syntax errors or missing zones. <br> - Validate pod DNS settings: Check `/etc/resolv.conf` in a test pod. <br> - Test DNS resolution: <br> &nbsp;&nbsp;• `nslookup kubernetes.default` <br> &nbsp;&nbsp;• `dig @<coredns-ip> my-service.my-namespace.svc.cluster.local` |
| **Services & Endpoints**  | Service definitions & backends        | - Check pod health: Pods should be Running without restarts. <br> - Look for `CrashLoopBackOff` in `kubectl describe pod`. <br> - Validate services: <br> &nbsp;&nbsp;• Confirm service type (ClusterIP, NodePort, LoadBalancer) fits your use case. <br> &nbsp;&nbsp;• Check `spec.selector` labels match pod labels. <br> &nbsp;&nbsp;• Verify service ports map to container ports. <br> &nbsp;&nbsp;• Ensure the app listens on the advertised port. <br> - Each service should have a corresponding Endpoints object: <br> &nbsp;&nbsp;• `kubectl get endpoints <service-name>` <br> &nbsp;&nbsp;• Verify the IPs match the target pods to avoid silent failures. |

---

## References

- [Kubernetes Networking Concepts](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
- [Kubernetes Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [CoreDNS Official Guide](https://coredns.io/manual/toc/)