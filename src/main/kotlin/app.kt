import encryption.BoxEncryption
import encryption.MatrixEncryption
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import java.io.FileOutputStream
import java.util.*

fun main(args: Array<String>) {
    MatrixEncryption.encrypt("hoy es el primer dia", arrayListOf(-1, 1, 1, -2, -3, 1, 3, 1, -2))
}
