package main

import (
	"fmt"

	"github.com/splendidmoons/suriya-go"
)

func main() {
	for year := 1958; year <= 2040; year++ {
		su := suriya.SuriyaYear{}
		su.Init(year)
		mark := " "
		if su.Is_Adhikamasa() {
			mark = "m"
		} else if su.Is_Adhikavara() {
			mark = "d"
		}
		fmt.Printf("%d %d - %s - %s\n", su.Year, su.Cs_year, mark, su.KatString())
	}
}
