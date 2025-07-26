# DNS Record

### A Record: 
This record maps a domain name to an IP address. In my case, IP address of the ec2 server where the blog is hosted is added as A record. When a user enters the domain name in their web browser, the browser uses the DNS system to look up the corresponding IP address and then connects to the server at that address.

### CNAME 
Canonical Name Used to alias one domain name to another. It always points to another domain, not an IP address. In my case, I use CNAME for a subdomain "WwW" as well as an Amazon SES DKIM verification record. You always use a CNAME record to create subdomains for a domain name.

### MX (Mail Exchange) 
This record holds the mail server details for the domain. In my case, I use two mail servers. Zoho for mailbox to receive emails in custom email id ex: contact@devopscube[.]com. AwS SES mail server for signup autoresponder and email marketing services.

### TXT (Text) 
A type of DNS record that allows you to associate text information with a domain name. I use that record for domain verification with Zoho, SES, Google Search Console, etc. Also, have added dmarc, spf and DKIM information given by Zoho and AWS SES. These records are part of the TXT content and are very important for email deliverability.

### DKIM (DomainKeys ldentified Mail) 
A type of email authentication that allows the recipient of an email to check that it was actually sent by the domain it claims to be sent from and that it has not been modified in transit.

### DMARC (Domain-based Message Authentication, Reporting & Conformance) 
This record gives domain owners control over what happens when an email message fails authentication. This means that if the recipient mail server cannot verify the identity of the sender, the DMARC record specifies what action the recipient server should take.
