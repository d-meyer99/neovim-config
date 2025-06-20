package main

import (
	"aoc/shared"
	"fmt"
)

const inputFile = "{{_file_name_}}.txt"

var p1, p2 = 0, 0

func main() {
	shared.ReadInput(inputFile, processLine)
	fmt.Println("Part 1 output:", p1)
	fmt.Println("Part 2 output:", p2)
}

func processLine(line string) {
	{{_cursor_}}
}
