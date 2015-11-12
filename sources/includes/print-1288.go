package main

import "fmt"
import "github.com/splendidmoons/suriya-go"

func main() {
	var suDays []suriya.SuriyaDay
	var day suriya.SuriyaDay
	var year suriya.SuriyaYear

	// 1288 April 14 is 41 days into the lunar year,
	// counting from Citta 1
	day.Init(1288, 41)
	suDays = append(suDays, day)

	// Let's also see Asalha Puja day. This is day 103,
	// which would have been 1288 Jun 15.
	day.Init(1288, 103)
	suDays = append(suDays, day)

	// Print the results:

	year.Init(1288)
	fmt.Printf("Year: %v\nAdhikamāsa: %v\nAdhikavāra: %v\n",
		year.Year, year.Is_Adhikamasa(), year.Is_Adhikavara())

	fmtStr := `---
Year, Day: %v, %v
True Sun: %v
True Moon: %v
Tithi: %v
`
	for _, day = range suDays {
		fmt.Printf(fmtStr,
			day.Year, day.Day,
			suriya.DegreeToRalString(day.TrueSun),
			suriya.DegreeToRalString(day.TrueMoon),
			day.Tithi)
	}
}
