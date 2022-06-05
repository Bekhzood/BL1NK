package main

import (
	"fmt"
	"log"
	"github.com/jmoiron/sqlx"
	"github.com/Bekhzood/BL1NK/config"
	"github.com/Bekhzood/BL1NK/api"
	_ "github.com/lib/pq"
)

func main() {
	cfg := config.Load()

	psqlConnString := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		cfg.PostgresHost,
		cfg.PostgresPort,
		cfg.PostgresUser,
		cfg.PostgresPassword,
		cfg.PostgresDatabase,
	)
	fmt.Println(psqlConnString)

	db, err := sqlx.Connect("postgres", psqlConnString)
	if err != nil {
		log.Panic("error connecting to postgres", err)
	}

	apiServer, err := api.New(cfg, db)
	if err != nil {
		log.Panic("error on the api server", err)
	}

	err = apiServer.Run(cfg.HTTPPort)
	if err != nil {
		panic(err)
	}
}
