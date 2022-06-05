package models

import "time"

type User struct {
	ID        string    `json:"id"`
	Username  string    `json:"Username"`
	Password  string    `json:"password"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Barber struct {
	ID        string    `json:"id"`
	Name      string    `json:"name"`
	Surname   string    `json:"surname"`
	About     string    `json:"about"`
	phoneNum  string    `json:"phone_num"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type BarberTimetable struct {
	Id        string    `json:"id"`
	BarberId  string    `json:"barber_id"`
	UserId    string    `json:"user_id"`
	Service   string    `json:"service"`
	Date      string    `json:"date"`
	FromTime  string    `json:"from_time"`
	ToTime    string    `json:"to_time"`
	Payment   string    `json:"payment"`
	CreatedAt time.Time `json:"created_at"`
	Status    bool      `json:"status"`
}

type GetBarberTimetable struct {
	Id        string    `json:"id"`
	UserId    string    `json:"user_id"`
	Service   string    `json:"service"`
	Date      string    `json:"date"`
	FromTime  string    `json:"from_time"`
	ToTime    string    `json:"to_time"`
	Payment   string    `json:"payment"`
	CreatedAt time.Time `json:"created_at"`
	Status    bool      `json:"status"`
}

type GetUserBookings struct {
	Id        string    `json:"id"`
	BarberId  string    `json:"barber_id"`
	Service   string    `json:"service"`
	Date      string    `json:"date"`
	FromTime  string    `json:"from_time"`
	ToTime    string    `json:"to_time"`
	Payment   string    `json:"payment"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
	Status    bool      `json:"status"`
}

type BarberTimetableQueryParamModel struct {
	BarberId string `json:"barber_id"`
	Date     string `json:"date"`
}

type UserTimetableQueryParamModel struct {
	UserId string `json:"user_id"`
	Date   string `json:"date"`
}

type BarberBookingQueryParamModel struct {
	Id       string `json:"id"`
	BarberId string `json:"barber_id"`
	UserId   string `json:"user_id"`
	Service  string `json:"service"`
	Date     string `json:"date"`
	FromTime string `json:"from_time"`
	ToTime   string `json:"to_time"`
	Payment  string `json:"payment"`
}

type BarberTimetableListModel struct {
	BarberTimetable []GetBarberTimetable `json:"barber_timetable"`
}

type UserTimetableListModel struct {
	UserTimetable []GetUserBookings `json:"user_bookings"`
}
