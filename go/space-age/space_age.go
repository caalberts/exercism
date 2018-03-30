package space

// Planet contains planet name
type Planet string

// EarthOrbit is the orbital period of Earth in seconds
const EarthOrbit = 31557600

// RelativeOrbit of planets relative to Earth
var RelativeOrbit = map[Planet]float64{
	"Earth":   1.0,
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

// Age calculates someone's age on a planet
func Age(seconds float64, planet Planet) float64 {
	return seconds / EarthOrbit / RelativeOrbit[planet]
}
