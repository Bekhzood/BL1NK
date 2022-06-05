package api

import (
	v1 "github.com/Bekhzood/BL1NK/api/handlers"
	"github.com/gin-gonic/gin"
)

func endpointsV1(r *gin.RouterGroup, h *v1.Handler) {
	r.GET("/timetable/:barber_id", h.GetBarberBooking)
	r.GET("/bookings/:user_id", h.GetUserBooking)
	r.POST("/bookings", h.CreateBooking)
	r.PUT("/bookings", h.UpdateBooking)
	r.DELETE("/bookings", h.DeleteBooking)
}
