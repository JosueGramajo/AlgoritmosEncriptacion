package utils

import org.w3c.dom.Document
import org.w3c.dom.ls.DOMImplementationLS
import org.xml.sax.InputSource
import java.io.FileOutputStream
import java.io.StringReader
import java.io.StringWriter
import java.math.RoundingMode
import java.text.DecimalFormat
import java.util.*
import java.util.Date
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import kotlin.collections.ArrayList

fun String.isNumeric() : Boolean = Regex("^(-)?[0-9]*\$").matches(this)

fun String.isNumberWithDecimal() : Boolean = Regex("^\\d+(\\.\\d+)?\$").matches(this)

fun String.differs(str1 : String) : Boolean = !this.equals(str1)

fun Double.equalsWithDecimalTolerance(q1 : Double) : Boolean{
    val tolerance = 0.01
    if (this == q1 || this == (q1 - tolerance) || this == (q1 + tolerance)){
        return true
    }
    return false
}

fun Int.addZero() : String{
    if (this < 10) return "0$this"
    return this.toString()
}

fun Double.differsWithDecimalTolerance(q1 : Double) : Boolean{
    val tolerance = 0.01
    if (this.roundToTwoDecimals() == q1 || this.roundToTwoDecimals() == (q1 - tolerance) || this.roundToTwoDecimals() == (q1 + tolerance)){
        return false
    }
    return true
}

fun String.numberOf(char : Char) : Int{
    var count = 0
    for (c in this){
        if (c == char) count++
    }
    return count
}

fun Double.prettyFormat(currency : String) : String{
    var decimalAmount = 2
    this.toString().split(".")[1].let {
        if (it.length in 2..4){
            decimalAmount = it.length
        }
    }
    val sb = java.lang.StringBuilder()
    val fb = Formatter(sb, Locale.US)
    fb.format("$currency %(,.${decimalAmount}f", this)
    return sb.toString()
}

fun <T> List<T>.doesNotContain(element: T) : Boolean = !this.contains(element)

fun <T> Iterable<T>.firstWhere(predicate: (T) -> Boolean): T? {
    for (t in this) if (predicate(t)) return t
    return null
}

fun <T> List<T>.missingItemsFromList(list: List<T>) : List<T>{
    val rtnLst : MutableList<T> = mutableListOf()
    list.map {
        if (this.doesNotContain(it)) rtnLst.add(it)
    }
    return rtnLst
}

fun Double.roundToTwoDecimals() : Double{
    val df = DecimalFormat("#.##")
    df.roundingMode = RoundingMode.HALF_UP
    return df.format(this).toDouble()
}

fun <T> ArrayList<T>.mapInPlace(mutator: (T)->T) {
    this.forEachIndexed { idx, value ->
        mutator(value).let { newValue ->
            if (newValue !== value) this[idx] = mutator(value)
        }
    }
}

fun Regex.notMatches(pattern : String) : Boolean = !this.matches(pattern)

fun String.remove(vararg characters : String) : String{
    var rtn = this
    characters.map {
        rtn = rtn.replace(it, "")
    }
    return rtn
}

fun String.notEquals(str1: String) : Boolean = !(this.equals(str1))

fun String.equalsIgnoreCase(text : String) = this.toLowerCase().equals(text.toLowerCase())

fun String.prepareForSql() : String{
    var result = this
    result = result.replace("'", "''")
    return result
}

fun String.wordsSurroundedBy(delimiter : Char) : ArrayList<String>{
    val results = arrayListOf<String>()
    var builder = StringBuilder()
    var insideRange = false
    for (character in this){
        if (character == delimiter){
            if (insideRange){
                insideRange = false
                results.add(builder.toString())
            }else{
                insideRange = true
                builder = StringBuilder()
            }
        }else if (insideRange){
            builder.append(character)
        }
    }
    return results
}

fun Document.serializeToString() : String{
    val domImplementation = this.getImplementation() as DOMImplementationLS
    val lsOutput =  domImplementation.createLSOutput();
    lsOutput.setEncoding("UTF-8");
    val stringWriter = StringWriter()
    lsOutput.characterStream = stringWriter
    val lsSerializer = domImplementation.createLSSerializer()
    lsSerializer.write(this, lsOutput)
    return stringWriter.toString()
}

fun Document.writeXmlFileInPath(path : String){
    val os = FileOutputStream(path)
    val tf = TransformerFactory.newInstance()
    val trans = tf.newTransformer()
    trans.transform(DOMSource(this), StreamResult(os))
}

fun String.toDOM() : Document{
    val db = DocumentBuilderFactory.newInstance()
    db.isNamespaceAware = true
    val inputSource = InputSource()
    inputSource.characterStream = StringReader(this)
    return db.newDocumentBuilder().parse(inputSource)
}

