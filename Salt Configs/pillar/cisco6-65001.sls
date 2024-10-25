proxy: 
  proxytype: napalm  
  driver: ios 
  host: 100.100.100.6 
  username: saltuser  
  password: admin123  
  timeout: 600
  optional_args:
    disk_file_system: 'flash:'
    global_delay_factor: 2
    fast_cli: True
    read_timeout: 90

router_details:
  hostname: R6-65001
  banner: "This is a IBGP R6 Router in 65001"

loopback_configs:
  loopback0:
    - ip: 1.1.1.6  # This will be used as the router ID for BGP  
      mask: 255.255.255.255
      status: primary
  loopback1: 
    - ip: 11.11.11.6
      mask: 255.255.255.255

wan_config:  
  GigabitEthernet0/2:  
    ip: 100.100.100.6 
    mask: 255.255.255.0  
    mtu: 1986
    description: WAN Star Interface  

network_services:  
  ssh: true  

bgp_config:  
  router_id: 1.1.1.6 
  local_as: 65001  
  rr_client: false
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type  
      peer_as: 65001
      peers:  
        1.1.1.8:  
          description: Peer with R8 - 65001  

ospf_config:  
  router_id: 1.1.1.6
  area: 0  
  networks:
    - network: 1.1.1.6 
      mask: 0.0.0.0
    - network: 11.11.11.6 
      mask: 0.0.0.0
    - network: 100.100.100.0 
      mask: 0.0.0.255 
  passive:
    - loopback 0
    - loopback 1
