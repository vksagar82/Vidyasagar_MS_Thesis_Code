proxy: 
  proxytype: napalm  
  driver: ios 
  host: 10.10.10.6 
  username: saltuser  
  password: admin123  
  optional_args:
    disk_file_system: 'flash:'
    global_delay_factor: 2  
    fast_cli: True
    read_timeout: 90

router_details:
  hostname: R6-65002
  banner: "This is a IBGP R6 Router in 65002"

loopback_configs:
  loopback0:
    - ip: 50.50.50.6  # This will be used as the router ID for BGP  
      mask: 255.255.255.255
      status: primary
  loopback1: 
    - ip: 55.55.55.6
      mask: 255.255.255.255

wan_config:  
  GigabitEthernet0/2:  
    ip: 10.10.10.6
    mask: 255.255.255.0  
    mtu: 1986
    description: WAN Star Interface  

network_services:  
  ssh: true  

bgp_config:  
  router_id: 50.50.50.6 
  local_as: 65002 
  rr_client: false
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type  
      peer_as: 65002
      peers:  
        50.50.50.11:  
          description: Peer with R11 - 65002  

ospf_config:  
  router_id: 50.50.50.6
  area: 0  
  networks:
    - network: 50.50.50.6
      mask: 0.0.0.0
    - network: 55.55.55.6 
      mask: 0.0.0.0
    - network: 10.10.10.0 
      mask: 0.0.0.255
  passive:
    - loopback 0
    - loopback 1
