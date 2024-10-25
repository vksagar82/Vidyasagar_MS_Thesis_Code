proxy: 
  proxytype: napalm  
  driver: eos 
  host: 10.10.10.11 
  username: saltuser  
  password: admin123  
  optional_args:
    global_delay_factor: 2
    force_cfg_session_invalid: True 

router_details:
  hostname: R11-65002
  banner: "This is a IBGP R11 Router in 65002"

loopback_configs:
  loopback0:
    - ip: 50.50.50.11  # This will be used as the router ID for BGP  
      mask: 255.255.255.255
      status: primary
  loopback1: 
    - ip: 55.55.55.11
      mask: 255.255.255.255

wan_config:  
  Ethernet2:  
    ip: 10.10.10.11
    mask: 255.255.255.0  
    mtu: 1986
    description: WAN Star Interface  
  Ethernet3:  
    ip: 70.70.70.14
    mask: 255.255.255.0  
    mtu: 1500
    description: EBGP WAN Interface 

network_services:  
  ssh: true  

bgp_config:  
  router_id: 50.50.50.11 
  local_as: 65002 
  rr_client: true
  neighbors:  
    IBGP:  # Group name for internal BGP neighbors  
      type: internal  # Set the group type  
      peer_as: 65002
      peers:  
        50.50.50.1:  
          description: Peer with R1 - 65002  
        50.50.50.2:  
          description: Peer with R1 - 65002  
        50.50.50.3:  
          description: Peer with R1 - 65002  
        50.50.50.4:  
          description: Peer with R1 - 65002  
        50.50.50.5:  
          description: Peer with R1 - 65002  
        50.50.50.6:  
          description: Peer with R1 - 65002  
        50.50.50.7:  
          description: Peer with R1 - 65002  
        50.50.50.8:  
          description: Peer with R1 - 65002  
        50.50.50.9:  
          description: Peer with R1 - 65002  
        50.50.50.10:  
          description: Peer with R1 - 65002  
    EBGP_65001:
      type: external
      peer_as: 65001
      next_hop: 70.70.70.41
      peers:
        1.1.1.4:
          description: Peer with R4 - 65001

ospf_config:  
  router_id: 50.50.50.11
  area: 0  
  networks:
    - network: 50.50.50.11
      mask: 0.0.0.0
    - network: 55.55.55.11 
      mask: 0.0.0.0
    - network: 10.10.10.0 
      mask: 0.0.0.255
  passive:
    - loopback 0
    - loopback 1
