import com.fasterxml.jackson.databind.ObjectMapper
import encryption.BoxEncryption
import encryption.MatrixEncryption
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import java.io.FileOutputStream
import java.util.*

fun main(args: Array<String>) {
    val result = BoxEncryption.decrypt("ELDAA AILT SDAE TOACR HVOR","PATIO")

    println(ObjectMapper().writeValueAsString(result))
}
