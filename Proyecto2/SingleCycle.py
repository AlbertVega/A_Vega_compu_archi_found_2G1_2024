from Processor import Processor

class SingleCycle(Processor):
    def __init__(self, cycleTime):
        super().__init__(cycleTime)

    def li(self, rd:str, imm:int):
        self.registerFile[self.registerFileDict[rd]] = imm
        print("loaded %d into %s"%(imm, rd))
    
    def add(self, rd:str, rs1:str, rs2:str):
        value1 = self.registerFile[self.registerFileDict[rs1]]
        value2 = self.registerFile[self.registerFileDict[rs2]]
        self.registerFile[self.registerFileDict[rd]] = value1+value2
        print("loaded sum result: %d in %s"%(value1+value2,rd))

    def sw(self, rs1:str, offset:int, rs2:str):
        addr = self.registerFile[self.registerFileDict[rs2]] + offset
        value = self.registerFile[self.registerFileDict[rs1]]
        self.memory[addr] = value
        print("stored %d in address %d"%(value, addr))

    def addi(self, rd:str, rs2:str, imm:int):
        value  = self.registerFile[self.registerFileDict[rs2]]+imm
        self.registerFile[self.registerFileDict[rd]] = value

        print("loaded sum result: %d in %s"%(value, rd))

    def beq(self, rs1:str, rs2:str, addr:int):
        value1 = self.registerFile[self.registerFileDict[rs1]]
        value2 = self.registerFile[self.registerFileDict[rs2]]
        if value1 == value2:
            self.pc = addr
            self.run(self.memory[addr])
            print("jumped to %d"%(addr))
            return
        print("did not make the jump")
    
    def j(self, addr:int):
        self.run(self.memory[addr])
        self.pc = addr
        print("jumped to %d"%(addr))

    def mul(self, rd:str, rs1:str, rs2:str):
        value1 = self.registerFile[self.registerFileDict[rs1]]
        value2 = self.registerFile[self.registerFileDict[rs2]]
        self.registerFile[self.registerFileDict[rd]] = value1*value2
        print("loaded mul result: %d in %s"%(value1*value2, rd))
    
    def lw(self, rd:str, offset:int, rs1:str):
        addr = self.registerFile[self.registerFileDict[rs1]]+offset
        value = self.memory[addr]
        self.registerFile[self.registerFileDict[rd]] = value
        print("loaded %d into %s"%(value, rd))

    def bge(self, rs1:str, rs2:str, addr:int):
        value1 = self.registerFile[self.registerFileDict[rs1]]
        value2 = self.registerFile[self.registerFileDict[rs2]]
        if value1 >= value2:
            self.pc = addr
            self.run(self.memory[addr])
            print("jumped to %d"%(addr))
            return
        print("did not make the jump")
    
    def run(self, instruction:str):
        operation = instruction.split(",")
        opNem = operation[0]
        if opNem == "li":
            self.li(operation[1],operation[2])
        elif opNem == "add":
            self.add(operation[1],operation[2],operation[3])
        elif opNem == "sw":
            self.sw(operation[1],operation[2],operation[3])
        elif opNem == "addi":
            self.addi(operation[1],operation[2],operation[3])
        elif opNem == "beq":
            self.beq(operation[1],operation[2],operation[3])
        

        print(opNem)