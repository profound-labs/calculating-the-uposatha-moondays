package main

import (
	"fmt"

	"github.com/splendidmoons/suriya-go"
)

func main() {
	suDay := suriya.SuriyaDay{}
	suDay.Init(1565, 298)
	fmt.Printf(`Day: %v
Date: %v
Horakhun: %v
Tithi: %v
True Sun: %v
True Moon: %v
`,
		suDay.Day,
		suriya.HorakhunToDate(int64(suDay.Horakhun)).Format("2006 Jan 2"),
		suDay.Horakhun,
		suDay.Tithi,
		suriya.DegreeToRalString(suDay.TrueSun),
		suriya.DegreeToRalString(suDay.TrueMoon),
	)
}
