# terraform-kube

# Pre-installation

Make sure that you have kubecli, minikube, and then terraform installed on your local.
Make sure that you have set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in your environment variables

# Questions and Answers

- What kinds of limitations do you face when moving applications from dedicated instances to Kubernetes?
Securing a Kubernetes installation can be a difficult prospect.
A common challenge is that Kubernetes containers are configured with a shared token that allows Kubernetes to modify the container while it’s running.
But for dedicated instances, we can only expost access instances across VPC and its bastion instance which is very safe.

- What are some ways to offset those limitations?
First we need to enable RBAC(Role Based Access Control)
Second is using namespaces efficiently
Third is hardening node security

There are also some other things we need to care.

- If there is a user in AWS that we want to remove, but aren't sure if doing so will break an application, what can we do?
We need to find all things related to that user using ACCESS_KEY or SECRET_ACCESS_KEY or IAM user id. And then need to check them if they will be broken or not

- We have an application that launches instances on demand in AWS and then registers a CNAME DNS record in Route 53, pointing at the public IP address that AWS assigns to it. The record is a random phrase, so the FQDN might be "bright-pearl.foo.com" We then supply that FQDN to our customers, who can then address those instances conveniently and directly. This allows us to change the underlying infrastructure as well, without customers having to record a new FQDN or IP address on their end. What are some risks to this approach? Are there other ways to provide a similar outcome?

I don't think that way has risk but we can also do it easily using ingress in kubernetes.
