region              = "us-central1"
zone                = "us-central1-f"
project             = "nextk8s"
credentials         = "credentials.json"

vpc-0_node_subnet    = "172.16.0.0/22"
vpc-0_pod_subnet     = "10.0.0.0/14"
vpc-0_svc1_subnet    = "192.168.0.0/24"
vpc-0_svc2_subnet    = "192.168.1.0/24"
vpc-0_svc3_subnet    = "192.168.2.0/24"
vpc-0_svc4_subnet    = "192.168.3.0/24"

vpc-1_node_subnet    = "172.16.0.0/21"
vpc-1_pod_subnet     = "10.0.0.0/13"
vpc-1_svc1_subnet    = "192.168.0.0/24"
vpc-1_svc2_subnet    = "192.168.1.0/24"
vpc-1_svc3_subnet    = "192.168.2.0/24"
vpc-1_svc4_subnet    = "192.168.3.0/24"

vpc-2_node_subnet    = "172.16.0.0/20"
vpc-2_pod_subnet     = "10.0.0.0/12"
vpc-2_svc1_subnet    = "192.168.0.0/24"
vpc-2_svc2_subnet    = "192.168.1.0/24"
vpc-2_svc3_subnet    = "192.168.2.0/24"
vpc-2_svc4_subnet    = "192.168.3.0/24"

cluster-0_master_ip  = "172.18.0.0/28"

cluster-1_master_ip  = "172.18.0.0/28"

cluster-2_master_ip  = "172.18.0.0/28"
