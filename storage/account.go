package storage

import (
	"fmt"

	"github.com/Bekhzood/BL1NK/models"
	"github.com/jmoiron/sqlx"
)

type accountRepo struct {
	db *sqlx.DB
}

func NewAccountRepo(db *sqlx.DB) *accountRepo {
	return &accountRepo{db: db}
}

func (a *accountRepo) GetBarberBooking(queryParam models.BarberTimetableQueryParamModel) (res models.BarberTimetableListModel, err error) {
	var barberBooking models.GetBarberTimetable
	params := make(map[string]interface{})

	fmt.Println(queryParam.Date)

	query := `SELECT id, user_id, date, from_time, to_time, service, payment, status, created_at FROM barber_timetable`
	filter := " WHERE 1=1"
	order := " ORDER BY created_at"
	arrangement := " DESC"

	if len(queryParam.BarberId) > 0 {
		params["barber_id"] = queryParam.BarberId
		filter += " AND (barber_id = :barber_id)"
	}

	if len(queryParam.Date) > 0 {
		params["date_s"] = queryParam.Date
		filter += " AND (date = :date_s)"
	}

	fullQuery := query + filter + order + arrangement

	rows, err := a.db.NamedQuery(fullQuery, params)

	if err != nil {
		return res, err
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(
			&barberBooking.Id,
			&barberBooking.UserId,
			&barberBooking.Date,
			&barberBooking.FromTime,
			&barberBooking.ToTime,
			&barberBooking.Service,
			&barberBooking.Payment,
			&barberBooking.Status,
			&barberBooking.CreatedAt,
		)
		if err != nil {
			return res, err
		}
		res.BarberTimetable = append(res.BarberTimetable, barberBooking)
	}
	return res, nil
}

func (a *accountRepo) GetUserBooking(queryParam models.UserTimetableQueryParamModel) (res models.UserTimetableListModel, err error) {
	var userBooking models.GetUserBookings

	params := make(map[string]interface{})
	fmt.Println(queryParam.Date)
	query := `SELECT id, barber_id, date, from_time, to_time, service, payment, status, created_at FROM barber_timetable`
	filter := " WHERE 1=1"
	order := " ORDER BY created_at"
	arrangement := " DESC"

	if len(queryParam.UserId) > 0 {
		params["user_id"] = queryParam.UserId
		filter += " AND (user_id = :user_id)"
	}

	if len(queryParam.Date) > 0 {
		params["date"] = queryParam.Date
		filter += " AND (date = :date)"
	}

	fullQuery := query + filter + order + arrangement

	rows, err := a.db.NamedQuery(fullQuery, params)

	if err != nil {
		return res, err
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(
			&userBooking.Id,
			&userBooking.BarberId,
			&userBooking.Date,
			&userBooking.FromTime,
			&userBooking.ToTime,
			&userBooking.Service,
			&userBooking.Payment,
			&userBooking.Status,
			&userBooking.CreatedAt,
		)
		if err != nil {
			return res, err
		}
		res.UserTimetable = append(res.UserTimetable, userBooking)
	}
	return res, nil
}

func (a *accountRepo) CreateBooking(entity models.BarberBookingQueryParamModel) (res models.BarberTimetable, err error) {

	err = a.db.QueryRow(`INSERT INTO barber_timetable (
		barber_id,
		user_id,
		service,
		date,
		from_time,
		to_time,
		payment
	) VALUES (
		$1,
		$2,
		$3,
		$4,
		$5,
		$6,
	    $7
	) RETURNING id`,
		&entity.BarberId,
		&entity.UserId,
		&entity.Service,
		&entity.Date,
		&entity.FromTime,
		&entity.ToTime,
		&entity.Payment).Scan(&res.Id)

	if err != nil {
		return res, err
	}

	res.BarberId = entity.BarberId
	res.UserId = entity.UserId
	res.Service = entity.Service
	res.Date = entity.Date
	res.FromTime = entity.FromTime
	res.ToTime = entity.ToTime
	res.Payment = entity.Payment
	res.Status = true
	fmt.Println(res.Id)

	return res, nil
}

func (a *accountRepo) UpdateBooking(booking_id string) (res models.BarberTimetable, err error) {
	return res, nil
}

func (a *accountRepo) DeleteBooking(booking_id string) (res models.BarberTimetable, err error) {
	return res, nil
}
