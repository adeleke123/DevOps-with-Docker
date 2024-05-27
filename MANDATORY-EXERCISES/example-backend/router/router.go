package router

import (
	"fmt"
	"net/http"
	"os"
	"server/cache"
	"server/common"
	"server/controller"
	"server/pgconnection"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func pingpong(context *gin.Context) {
	redis := context.Query("redis") == "true"
	postgres := context.Query("postgres") == "true"

	if redis {
		_, err := cache.TryRedis()
		if err != nil {
			context.String(http.StatusNotImplemented, err.Error())
			return
		}
		context.String(http.StatusOK, "pong")
		return
	}
	if postgres {
		_, err := pgconnection.TryPostgres()
		if err != nil {
			context.String(http.StatusNotImplemented, err.Error())
			return
		}
		context.String(http.StatusOK, "pong")
		return
	}

	context.String(http.StatusOK, "pong")
}

// Router is the gin server router
func Router() *gin.Engine {
	// Allowing requests from localhost:5000
	allowedOrigin := common.FallbackString(os.Getenv("REQUEST_ORIGIN"), "http://localhost:5000")

	cacheErr := cache.InitializeRedisClient()
	if cacheErr != nil {
		fmt.Println(cacheErr)
	}
	pgErr := pgconnection.InitializePostgresClient()
	if pgErr != nil {
		fmt.Println(pgErr)
	}

	config := cors.DefaultConfig()
	config.AllowOrigins = []string{allowedOrigin}
	config.AllowHeaders = []string{"Origin", "Content-Type", "Accept", "Authorization"}
	config.AllowMethods = []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"}

	router := gin.Default()
	router.Use(cors.New(config))

	router.GET("/ping", pingpong)

	router.GET("/messages", controller.GetMessages)
	router.POST("/messages", controller.CreateMessage)

	router.NoRoute(func(context *gin.Context) {
		path := context.Request.URL.Path
		context.String(404, "The only API of this app is /ping. Request received to path "+path+" and this resulted in 404.")
	})

	return router
}

