variable "application" {
  description = "The application or function name to be named."
  # default     = "sql"
  validation {
    condition = contains(["aad","adc","alx","ams","ano","apd","app","ars","arw","asa","asp","asr","awd","bit","bkp","bwa","bzt","cap","cfm","chm","clc","clp","clr","crm","ctm","ctv","ctx","cxa","cxd","dbs","dbt","dhc","dir","dlk","ds2","dsp","dwr","eco","elk","env","epc","epe","erw","esx","esy","exs","fil","ftp","ftr","fus","gld","hyb","imo","inc","ing","ins","int","iox","ipc","ipw","irl","ise","kbc","key","kms","kvm","lbr","ldr","ldi","les","lhd","lhm","lic","lkd","map","mdm","mid","mtd","mwk","nmm","ods","oem","pac","pan","pck","pg7","pgn","pif","pii","pip","pki","poc","prt","prm","prx","psc","qls","qrd","rac","rad","raf","raq","ras","raw","rda","rkr","rmp","rms","rin","rpx","rtm","s4b","san","scd","scg","scj","sdv","sea","sec","sep","seq","sfl","sfs","sgs","shp","sia","skl","skm","slp","smi","sms","smt","sp3","spa","spc","spd","spe","spl","spm","spi","spo","spp","spr","sqa","sqe","sql","srm","sts","t4d","tax","tda","tdg","tfs","tkr","tmp","tos","tpc","tph","tsm","tpv","twl","udl","utl","vcn","vct","vms","vsm","wap","wdp","web","zcl"], var.application)
    error_message = "The value entered for application is not found."
  }
  
}

variable "env" {
  description = "Environment where the application or function is deployed."
  # default     = "tn"
  validation {
    condition = contains(["dn","qn","tn","sn","pr"], var.env)
    error_message = "The value entered for environment type is not found."
  }
}

variable "location" {
  description = "Region where apllication/finction is created."
  # default     = "wev"
  validation {
    condition = contains(["oac","par","rtp","dal","tul","bld","pac","wev","weo","wwo","wwc","ze2","zc1","ze1","ze3","znc","zsc","zw1","zw2","zw3","zwc","ge1","ge4","gc1","gw1","gw2","gw3","gw4"], var.location)
    error_message = "The value entered for location is not found."
  }
}

variable "infra_type" {
  description = "Type of infrastructure that is being created."
  # default     = "p"
  validation {
    condition = contains(["v","p","i"], var.infra_type)
    error_message = "The value entered for infrastructure type is not found."
  }
}

variable "sequence" {
  type = string
  description = "Application/server number"
  validation {
    condition = length(var.sequence) == 3 && var.sequence >= "001" && var.sequence <= "999"
    error_message = "Please provide a number between 001 to 999 and pattern must be three digits."
  }
}

variable "resource_type" {
  description = "Type of resource being created."
  # default     = "vm00"
  validation {
    condition = contains(["apim","id00","plcy","rg00","agw0","asg0","bas0","cdnp","cdne","con0","dnsz","pdnz","afw0","afwp","erc0","fd00","fdfp","lbi0","lbe0","rle","lgw0","ng00","nic0","nsg0","nsgr","nw00","pl00","pip0","ippf","rf00","rt00","se00","traf","udr0","vnet","peer","snet","vwan","vpng","vcn0","vst0","vgw0","waf0","wafg","ase0","plan","avas","arcs","arck","cld0","des0","func","gal0","osdk","disk","ntf0","nfns","snap","stap","vm00","vmss","stvm","app0","aks0","cr00","ci00","sf00","cosm","reds","sql0","sqld","syn0","synw","synd","syns","mysq","psql","sqlt","sqlm","st00","ssmp","srch","cog0","mlw0","as00","dbw0","asa0","dec0","dedb","adf0","dls0","dla0","ehns","evh0","evgd","evgs","evgt","hdop","hbas","kafk","spak","strm","mls0","iot0","pros","pcrt","pbi0","tsi0","vdpl","vdag","vdws","apcs","sigr","ia00","lgap","sb00","sbq0","sbt0","aa00","appi","ag00","puvw","bp00","bpa0","kv00","log0","migr","dms0","rsv0"], var.resource_type)
    error_message = "The value entered for resource type is not found."
  }
}

variable "ami" {
  description = "Amazon Machine Image (ami) id"
  # default     = "ami-026b57f3c383c2eec"
}

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "prefix" {
  type        = string
  description = "Prefix of the server name"
  # default = "mot"
  validation {
    condition     = length(var.prefix) == 3 && substr(var.prefix, 0, 3) == "mot"
    error_message = "The server name prefix value must be a valid value, starting with \"mot\"."
  }
}

variable "secret_key" {}
variable "access_key" {}