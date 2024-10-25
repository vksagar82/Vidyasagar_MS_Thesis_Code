proxy: 
  proxytype: napalm  
  driver: ios 
  host: 20.20.20.8 
  username: saltuser  
  password: admin123  
  optional_args:
    disk_file_system: 'flash:'
    global_delay_factor: 2  
    fast_cli: True
    read_timeout: 90

router_details:
  hostname: R8-65003
  banner: "This is a IBGP R8 Router in 65003"

loopback_configs:
  loopback0:
    - ip: 80.80.80.8  # This will be used as the router ID for BGP  
      mask: 255.255.255.255
      status: primary
  loopback1: 
    - ip: 88.88.88.8
      mask: 255.255.255.255

wan_config:  
  GigabitEthernet0/2:  
    ip: 20.20.20.8
    mask: 255.255.255.0  
    mtu: 1986
    description: WAN Star Interface
  GigabitEthernet0/3:  
    ip: 60.60.60.89
    mask: 255.255.255.0  
    description: EBGP Interface

network_services:  
  ssh: true  

bgp_config:  
  router_id: 80.80.80.8 
  local_as: 65003
  rr_client: true
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type
      cluster: 80.80.80.8
      peer_as: 65003  
      peers:  
        80.80.80.1:  
          description: Peer with R1 - 65003 
        80.80.80.2:  
          description: Peer with R2 - 65003
        80.80.80.3:  
          description: Peer with R3 - 65003
        80.80.80.4:  
          description: Peer with R4 - 65003
        80.80.80.5:
          description: Peer with R5 - 65003
        80.80.80.6:
          description: Peer with R6 - 65003
        80.80.80.7:
          description: Peer with R7 - 65003
    EBGP_65001:
      type: external
      peer_as: 65001
      next_hop: 60.60.60.88
      peers:
        1.1.1.8:
          description: Peer with R8 - 65001

ospf_config:  
  router_id: 80.80.80.8
  area: 0  
  networks:
    - network: 80.80.80.8
      mask: 0.0.0.0
    - network: 88.88.88.8 
      mask: 0.0.0.0
    - network: 20.20.20.0 
      mask: 0.0.0.255
  passive:
    - loopback 0
    - loopback 1
