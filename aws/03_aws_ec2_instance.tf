# Create SSH key pair - this key to access the server using ssh-keygen command
resource "aws_key_pair" "my-ec2-key" {
  key_name   = "terra-aws-ec2"                                                                           # What AWS will call this key
  public_key = file("/Users/patdel/Downloads/Ankita-personal/Terraform/simple-project/terra-aws-ec2-key.pub") # Path to your public key file
}

# Use default VPC 
resource "aws_default_vpc" "default" { 
}

# Security group - defines firewall rules

resource "aws_security_group" "my-sg" {
   name = "my-sg"                                # Name of security group
   description =  "dev-sg"                       # What this security group is for
   vpc_id = aws_default_vpc.default.id           # Connect it to our network :interpolation - a way you can inherit by extract the values from a terrform block) 
   tags = {
    Name = "dev-sg"                              # Display name in AWS console
   }
   
  # INBOUND RULES - What traffic can come INTO your server
  # Allow SSH (remote login) from anywhere
  ingress {
    from_port = 22                               # SSH port number
    to_port = 22                                 # Same port (just one port)
    protocol = "tcp"                             # Type of connection
    cidr_blocks = ["0.0.0.0/0"]                 # Allow from any IP address (anywhere on internet)
    description =  "Allow SSH access"
  }
  
  # Allow traffic (HTTP) from anywhere
  ingress {
    from_port = 80                               # Web traffic port
    to_port =  80                                # Same port
    cidr_blocks = ["0.0.0.0/0"]                 # Allow from any IP address
    protocol = "tcp"                             # Type of connection
    description = "Allow web traffic"
  }
  
  # OUTBOUND RULES - What traffic can go OUT from your server
  # Allow all outbound traffic (server can access anything on internet)
  egress {
    from_port = 0                                # 0 means all ports
    to_port = 0                                  # 0 means all ports  
    protocol = "-1"                              # -1 means all protocols (TCP, UDP, etc.)
    cidr_blocks = [ "0.0.0.0/0" ]               # Can go to any destination on internet
    description = "Allow all outbound traffic"
  }
}

# Create the (EC2 instance)
resource "aws_instance" "my-ec2"  {
    key_name = aws_key_pair.my-ec2-key.key_name        # Which SSH key to use (gets from key pair above)
    security_groups =  [aws_security_group.my-sg.name] # Which security rules to apply (gets from security group above)
    instance_type =  "t2.micro"                        # Size of server (small, free tier eligible)
    ami = "ami-0360c520857e3138f"                       # Which operating system image (Ubuntu Linux)
    
    # Configure the hard disk
    root_block_device {
      volume_size = 20                                  # Disk size in GB
      volume_type =  "gp3"                              # Type of disk (SSD)
    }
    
    # Tags for organization
    tags = {
        Name = "aws_ec2-instance"                       # Name that shows up in AWS console
    }
}