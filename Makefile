CC = g++
CFLAGS = -std=c++17 -O2 -I./src -I./external -I./external/entt
LDFLAGS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

SRC = $(shell find src -name "*.cpp" ! -name "DiagnoseEntity.cpp" ! -name "FlecsEntityManager.cpp")
OBJ = $(SRC:.cpp=.o)
TARGET = BattleIA_App

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)

run: all
	./$(TARGET)
