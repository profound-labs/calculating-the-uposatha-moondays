package main

import (
	"fmt"

	"github.com/splendidmoons/suriya-go"
)

func main() {
	suDay := suriya.SuriyaDay{}
	suDay.Init(638, 1)
	fmt.Printf(`Horakhun: %v
Date: %v
True Sun: %v
True Moon: %v
Tithi: %v
`,
		suDay.Horakhun,
		suriya.HorakhunToDate(int64(suDay.Horakhun)).Format("2006 January 2"),
		suriya.DegreeToRalString(suDay.TrueSun),
		suriya.DegreeToRalString(suDay.TrueMoon),
		suDay.Tithi,
	)
}
