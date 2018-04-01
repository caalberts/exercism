package clock

import "fmt"

type Time struct {
	Hour    int
	Minutes int
}

type Clock interface {
	Add(minutes int) Time
	Subtract(minutes int) Time
	String() string
}

const (
	hoursPerDay    = 24
	minutesPerHour = 60
	minutesPerDay  = 1440
)

func New(hour, minutes int) Time {
	totalMinutes := totalMinutes(hour, minutes)
	return minutesToTime(totalMinutes)
}

func (t Time) String() string {
	return fmt.Sprintf("%02d:%02d", t.Hour, t.Minutes)
}

func (t Time) Add(minutes int) Time {
	return minutesToTime(t.totalMinutes() + minutes)
}

func (t Time) Subtract(minutes int) Time {
	return minutesToTime(t.totalMinutes() - minutes)
}

func (t Time) totalMinutes() int {
	return (t.Hour * minutesPerHour) + t.Minutes
}

func minutesToTime(minutes int) Time {
	minutesInDay := minutesPerDay + (minutes % minutesPerDay)
	hr := (minutesInDay / minutesPerHour) % hoursPerDay
	mins := minutesInDay % minutesPerHour

	return Time{
		Hour:    hr,
		Minutes: mins,
	}
}

func totalMinutes(hour, minutes int) int {
	return (hour * minutesPerHour) + minutes
}
