import socket
import threading

def handle_client(client_socket, client_address):
    print(f"[NEW CONNECTION] {client_address} connected.")
    
    while True:
        try:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            print(f"[{client_address}] {message}")
            
            # Broadcast to all clients
            broadcast(message, client_socket)
        except:
            break
    
    print(f"[DISCONNECTED] {client_address} disconnected.")
    client_socket.close()

def broadcast(message, sender_socket):
    for client in clients:
        if client != sender_socket:
            try:
                client.send(message.encode('utf-8'))
            except:
                clients.remove(client)

def start_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(('127.0.0.1', 8080))
    server.listen()
    print("[SERVER STARTED] Waiting for connections...")
    
    while True:
        client_socket, client_address = server.accept()
        clients.append(client_socket)
        thread = threading.Thread(target=handle_client, args=(client_socket, client_address))
        thread.start()
        print(f"[ACTIVE CONNECTIONS] {threading.active_count() - 1}")

clients = []

if __name__ == "__main__":
    start_server()