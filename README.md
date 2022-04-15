# scalable-loki-with-s3-dynamodb

######

Part-1

######

1. Networking component with this TF Template
2. EKS Cluster (+ EKS Cluster Role)
3. Tweak for scheduling more pods on a node then the default behavior. https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
4. Node Groups (+ Role for nodes)
5. metrics server
6. Created an S3 bucket (scalable-loki-397795833797)

######

Part-2

######

I am creating a service account with IAM permissions for loki to access S3/DynamoDB (https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)

1. Created OIDC Provider using eksctl utility
2. Creating a Policy for Loki (Only gave limited permissions so it can work, not more than that. Got list of Permissions from here - https://grafana.com/docs/loki/latest/operations/storage/)
   `aws iam create-policy --policy-name scalable-loki-policy --policy-document file://loki-s3-dynamodb-permissions.json`
3. Creating K8s Service Account and binding with IAM role

```
eksctl create iamserviceaccount \
    --name loki-service-account \
    --namespace monitoring \
    --cluster scalable-loki \
    --role-name RoleForScalableLoki \
    --attach-policy-arn arn:aws:iam::397795833797:policy/scalable-loki-policy \
    --approve \
    --override-existing-serviceaccounts
```

4. Tested the access with a test pod. Successful!
5. Cloned the Helm Chart for Loki. Tweaked values.yml (https://grafana.com/docs/loki/latest/configuration/examples/#aws-basic-configyaml)
6. Installed the above helm chart for Loki. (It will add some data in S3 & also it will create the table in DynamoDB)
   `helm upgrade --install loki --namespace=monitoring loki-helm-chart`
7. Installed promtail helm chart
   `helm upgrade --install promtail grafana/promtail --set "config.lokiAddress=http://loki:3100/loki/api/v1/push" -n monitoring`
8. Installed Grafana chart
   `helm install loki-grafana grafana/grafana`
9. To open grafana in browser
   `kubectl port-forward services/loki-grafana 8001:80`
10. Added loki data source in Grafana, faced issue - "failed to flush user" err="ResourceNotFoundException: Requested resource not found"
11. Resolved it by adding `extraArgs` in Loki values.yml file (https://github.com/grafana/loki/issues/5021#issuecomment-1016123138)
