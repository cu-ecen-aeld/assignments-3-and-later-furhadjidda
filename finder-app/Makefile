# Makefile for the writer application

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS =

# Cross compiler
ifdef CROSS_COMPILE
    CC = $(CROSS_COMPILE)gcc
endif

# Directories
SRCDIR = .
OBJDIR = .
BINDIR = .

# Files
TARGET = writer
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))

# Default target
.PHONY: all
all: $(BINDIR)/$(TARGET)

# Build target
$(BINDIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)

# Object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(BINDIR)/$(TARGET)

# Dependencies (optional)
# You can add dependencies generation here if needed

# End of Makefile
