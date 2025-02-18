
# Bolt.diy on Linode

A quick demo of Bolt.diy running On Akamai Connected Cloud. 
This code will a GPU based instance on Linode, install Ollama, bolt.diy and configure the firewall for you. 

## Deployment

To deploy this project run

```bash
  git clone https://github.com/aslepcev/linode-bolt.diy
  cd linode-bolt.diy
  terrafom init
  terraform plan
  terraform apply
```
You will need to fill in all the details in variables.tf file!!!
Check out this blog post - https://blog.slepcevic.net/your-own-coding-assistant-running-in-the-cloud/ for more details. 
