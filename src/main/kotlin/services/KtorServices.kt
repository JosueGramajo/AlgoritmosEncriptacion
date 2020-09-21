package services

import io.ktor.application.*
import io.ktor.features.*
import io.ktor.jackson.jackson
import io.ktor.response.respondRedirect
import io.ktor.routing.*
import java.text.DateFormat

// Entry Point of the application as defined in resources/application.conf.
// @see https://ktor.io/servers/configuration.html#hocon-file
fun Application.main() {
    // This adds Date and Server headers to each response, and allows custom additional headers
    install(DefaultHeaders)
    // This uses use the logger to log every call (request/response)
    install(CallLogging)

    install(ContentNegotiation) {
        jackson {
            dateFormat = DateFormat.getDateInstance()
            disableDefaultTyping()
        }
    }
    routing {
        get("/") {
            call.respondRedirect("/encriptacion")
        }
    }
}