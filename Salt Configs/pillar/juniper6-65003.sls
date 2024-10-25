proxy: 
  proxytype: napalm  
  driver: junos  
  host: 20.20.20.6 
  username: saltuser  
  password: admin123  

router_details:
  hostname: R6-65003
  banner: "This is a IBGP R6 Router in 65003"

loopback_configs:
  loopback0:
    - ip: 80.80.80.6  # This will be used as the router ID for BGP
      mask: 32
      status: primary
    - ip: 88.88.88.6
      mask: 32

wan_config:  
  em2:  
    ip: 20.20.20.6
    mask: 24  
    mtu: 1986
    description: WAN Star Interface  

network_services:  
  ssh: true  

bgp_config:  
  router_id: 80.80.80.6
  local_as: 65003
  rr_client: false
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type  
      peer_as: 65003
      peers:  
        80.80.80.8:  
          description: Peer with R8 - 65003  

ospf_config:  
  area: 0  
  interfaces:
    - lo0.0
    - em2.0
