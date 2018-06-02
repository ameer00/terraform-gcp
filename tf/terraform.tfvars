region              = "us-central1"
zone                = "us-central1-f"
project             = "nextk8s"
credentials         = "credentials.json"

vpc_0_node_subnet    = "172.16.0.0/22"
vpc_0_pod_subnet     = "10.0.0.0/14"
vpc_0_svc1_subnet    = "192.168.0.0/24"
vpc_0_svc2_subnet    = "192.168.1.0/24"
vpc_0_svc3_subnet    = "192.168.2.0/24"
vpc_0_svc4_subnet    = "192.168.3.0/24"

vpc_1_node_subnet    = "172.16.0.0/21"
vpc_1_pod_subnet     = "10.0.0.0/13"
vpc_1_svc1_subnet    = "192.168.0.0/24"
vpc_1_svc2_subnet    = "192.168.1.0/24"
vpc_1_svc3_subnet    = "192.168.2.0/24"
vpc_1_svc4_subnet    = "192.168.3.0/24"

vpc_2_node_subnet    = "172.16.0.0/20"
vpc_2_pod_subnet     = "10.0.0.0/12"
vpc_2_svc1_subnet    = "192.168.0.0/24"
vpc_2_svc2_subnet    = "192.168.1.0/24"
vpc_2_svc3_subnet    = "192.168.2.0/24"
vpc_2_svc4_subnet    = "192.168.3.0/24"

cluster_0_master_ip  = "172.18.0.0/28"

cluster_1_master_ip  = "172.18.0.0/28"

cluster_2_master_ip  = "172.18.0.0/28"
