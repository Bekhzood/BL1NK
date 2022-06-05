package v1

import (
	"fmt"
	"time"

	"github.com/Bekhzood/BL1NK/models"
	"github.com/Bekhzood/BL1NK/storage"
	"github.com/gin-gonic/gin"
)

func (h *Handler) GetBarberBooking(c *gin.Context) {
	var (
		queryParam models.BarberTimetableQueryParamModel
		err        error
	)

	currentTime := time.Now()
	today := currentTime.Format("01-02-2006")

	queryParam.Date = c.DefaultQuery("date", today)

	queryParam.BarberId = c.Param("barber_id")
	fmt.Println(queryParam.BarberId)

	if queryParam.BarberId == "" {
		h.handleErrorResponse(c, 422, "validation error", "barber_id")
		return
	}

	res, err := storage.NewAccountRepo(h.storagePostgres).GetBarberBooking(queryParam)

	if err != nil {
		h.handleErrorResponse(c, 400, "bad request", err.Error())
		return
	}

	h.handleSuccessResponse(c, 200, "ok", res)
	return
}

func (h *Handler) GetUserBooking(c *gin.Context) {
	var (
		queryParam models.UserTimetableQueryParamModel
		err        error
	)

	queryParam.UserId = c.Param("user_id")
	fmt.Println(queryParam.UserId)

	if queryParam.UserId == "" {
		h.handleErrorResponse(c, 422, "validation error", "user_id")
		return
	}

	res, err := storage.NewAccountRepo(h.storagePostgres).GetUserBooking(queryParam)
	if err != nil {
		h.handleErrorResponse(c, 400, "bad request", err.Error())
		return
	}

	h.handleSuccessResponse(c, 200, "ok", res)
	return
}

func (h *Handler) CreateBooking(c *gin.Context) {
	var (
		queryParam models.BarberBookingQueryParamModel
		err        error
	)
	if err := c.ShouldBindJSON(&queryParam); err != nil {
		h.handleErrorResponse(c, 400, "json format error", err.Error())
	}

	fmt.Println(queryParam)
	fmt.Println(queryParam.Date)

	res, err := storage.NewAccountRepo(h.storagePostgres).CreateBooking(queryParam)

	if err != nil {
		h.handleErrorResponse(c, 400, "bad request", err.Error())
		return
	}

	h.handleSuccessResponse(c, 200, "ok", res)
	return
}

func (h *Handler) UpdateBooking(c *gin.Context) {
	id := c.Param("booking_id")

	res, err := storage.NewAccountRepo(h.storagePostgres).UpdateBooking(id)

	if err != nil {
		h.handleErrorResponse(c, 400, "bad request", err.Error())
		return
	}

	h.handleSuccessResponse(c, 200, "ok", res)
	return
}

func (h *Handler) DeleteBooking(c *gin.Context) {
	id := c.Param("booking_id")

	res, err := storage.NewAccountRepo(h.storagePostgres).DeleteBooking(id)

	if err != nil {
		h.handleErrorResponse(c, 400, "bad request", err.Error())
		return
	}

	h.handleSuccessResponse(c, 200, "ok", res)
	return
}
