# TLS vs SSL

## What is the difference

SSL (Secure Sockets Layer) and TLS (Transport Layer Security) are cryptographic protocols designed to provide secure communication over a network. 

TLS is the successor to SSL and has addressed its vulnerabilities. SSL was used for a long time but is now deprecated due to its security flaws.

## Workflow of how data is sent using these protocols:

# 1. Initiating communication

SSL & TLS: Before data can be sent, a connection must first be established. Both protocols work very similarly at this stage. The client and server establish a connection, usually on port 443 for web traffic (default port for HTTPS).

# 2. ClientHello & ServerHello messages

After establishing a connection, the client and server need to agree on security settings.

- SSL: The client sends a list of supported cipher suites, and other settings. The server then sends a response selecting the SSL version, cipher suites, and other settings.

- TLS: Along with supported cipher suites, and other settings, the client can also send "key share" for Diffie-Hellman (DH) or Elliptic Curve Diffie-Hellman (ECDH) (if supported). The server then sends a response selecting the TLS version, cipher suites, & other settings.

# 3. Server Certificate

SSL & TLS: After the “ClientHello” and “ServerHello” messages have been communicated, the server sends its digital certificate to the client.

# 4. Key exchange

At this phase, the protocols significantly differ.

SSL: Predominantly uses RSA for key exchange.

TLS: Uses other mechanisms like DH and ECDH.

# 5. Client Certificate (optional)

SSL & TLS: After keys have been exchanged, the server can request a client certificate if it must validate the client's identity.

# 6. Client and Server Finished messages

SSL & TLS: Once the authentication phase is complete, “Finished” messages are sent. The only difference between the protocols here is that the cryptographic computations behind the message can differ.

# 7. Encrypted data transfer

The connection has been established, settings agreed upon, & authentication has been completed—data transfer can finally begin.

SSL: Uses older encryption algorithms, some of which are vulnerable.

TLS: Uses updated & more robust encryption algorithms.

# 8. Termination

SSL & TLS: After the data transfer has been completed, alert messages can be sent by the client & server to terminate the connection.

TLS has overcome the vulnerabilities of SSL. Its refined digital handshake, key exchange mechanisms, and cryptographic methods have led to more robust encryption, enhanced security, and better extensibility.
