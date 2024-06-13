import time
from SingleCycle import SingleCycle

def main():
    cycle_time = 0.1  # Set cycle time as needed
    processor = SingleCycle(cycle_time)
    
    # Read the assembly file
    file_path = "erathostenesSieve.s"
    with open(file_path, 'r') as file:
        instructions = file.readlines()

    # Execute each instruction
    for instruction in instructions:
        processor.run(instruction)
        time.sleep(cycle_time)  # Simulate cycle time

if __name__ == "__main__":
    main()
