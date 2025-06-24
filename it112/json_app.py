import json

def write_json(filename, data):
    with open(filename, 'w') as f:
        json.dump(data, f, indent=4)
    print(f"Data written to {filename}")

def read_json(filename):
    with open(filename, 'r') as f:
        data = json.load(f)
    return data

if __name__ == "__main__":
    my_data = {
        "name": "ChatGPT",
        "language": "Python",
        "version": 3.8,
        "features": ["JSON handling", "file IO", "easy to use"]
    }

    filename = "data.json"

    # Write data to JSON file
    write_json(filename, my_data)

    # Read data back from JSON file
    read_data = read_json(filename)
    print("Read data:", read_data)
