import socket
import threading

def receive_messages():
    while True:
        try:
            message = client.recv(1024).decode('utf-8')
            print(message)
        except:
            print("Disconnected from server!")
            client.close()
            break

def send_messages():
    while True:
        message = input()
        if message.lower() == 'quit':
            client.close()
            break
        client.send(message.encode('utf-8'))

def start_client():
    global client
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(('127.0.0.1', 8080))
    
    print("Connected to chat server! Type 'quit' to exit.")
    
    receive_thread = threading.Thread(target=receive_messages)
    receive_thread.start()
    
    send_thread = threading.Thread(target=send_messages)
    send_thread.start()

if __name__ == "__main__":
    start_client()