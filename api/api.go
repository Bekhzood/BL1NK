package api

import (
	"fmt"

	v1 "github.com/Bekhzood/BL1NK/api/handlers"
	"github.com/Bekhzood/BL1NK/config"
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
)

func New(cfg config.Config, db *sqlx.DB) (*gin.Engine, error) {
	fmt.Println("Starting the server")
	router := gin.New()

	router.Use(gin.Logger(), gin.Recovery())

	handlerV1 := v1.New(cfg, db)
	rV1 := router.Group("/v1")
	{
		endpointsV1(rV1, handlerV1)
	}
	return router, nil
}
