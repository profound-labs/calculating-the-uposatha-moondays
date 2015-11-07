package main

import "fmt"
import "github.com/splendidmoons/suriya-go"

func main() {
	suYear := suriya.SuriyaYear{}
	suYear.Init(1963) // CS 1325
	fmt.Println(suYear.Is_Adhikamasa())
	// false
	fmt.Println(suYear.Is_Adhikavara())
	// true
	fmt.Println(suYear.AsalhaPuja().Format("2006 Jan 2"))
	// 1963 Jul 6
}
