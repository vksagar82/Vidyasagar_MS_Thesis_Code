proxy:  
  proxytype: napalm  
  driver: junos  
  host: 100.100.100.8 
  username: saltuser  
  password: admin123  

router_details:
  hostname: R8-65001
  banner: "This is a route reflector R8 in 65001"

loopback_configs:
  loopback0:
    - ip: 1.1.1.8  # This will be used as the router ID for BGP
      mask: 32
      status: primary
    - ip: 11.11.11.8
      mask: 32

wan_config:  
  em2:  
    ip: 100.100.100.8 
    mask: 24  
    mtu: 1986
    description: WAN Star Interface  
  em3:  
    ip: 60.60.60.88 
    mask: 24  
    description: EBGP WAN Interface  

network_services:  
  ssh: true  

bgp_config:  
  router_id: 1.1.1.8 
  local_as: 65001  
  rr_client: true
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type
      cluster: 1.1.1.8
      peer_as: 65001  
      peers:  
        1.1.1.3:  
          description: Peer with R3 - 65001 
        1.1.1.1:  
          description: Peer with R1 - 65001
        1.1.1.2:  
          description: Peer with R2 - 65001
        1.1.1.4:  
          description: Peer with R4 - 65001
        1.1.1.5:
          description: Peer with R5 - 65001
        1.1.1.6:
          description: Peer with R6 - 65001
        1.1.1.7:
          description: Peer with R7 - 65001
        1.1.1.9:
          description: Peer with R9 - 65001
        1.1.1.10:
          description: Peer with R10 - 65001
        1.1.1.11:
          description: Peer with R11 - 65001
    EBGP_65003:
      type: external
      peer_as: 65003
      next_hop: 60.60.60.89
      peers:
        80.80.80.8:
          description: Peer with R8 - 65003

ospf_config:  
  area: 0  
  interfaces:
    - lo0.0
    - em2.0
