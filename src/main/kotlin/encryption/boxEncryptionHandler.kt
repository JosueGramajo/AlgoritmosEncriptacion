package encryption

import objects.BoxDecryptionResult
import objects.BoxKeyObject
import objects.BoxObject
import objects.BoxResult
import utils.firstWhere
import utils.remove
import java.lang.IndexOutOfBoundsException
import java.lang.StringBuilder

object BoxEncryption{
    fun encrypt(message : String, keyStr : String) : BoxResult{
        val resultList = arrayListOf<BoxObject>()

        val key = keyStr.toLowerCase()

        var currentNumber = 1
        getAlphabetArray().map { currentLetter ->
            for (i in key.indices){
                val currentKeyLetter = key[i].toString()
                if (currentKeyLetter.equals(currentLetter)){
                    resultList.add(BoxObject(i, currentKeyLetter, currentNumber, ""))
                    currentNumber++
                }
            }
        }

        val parsedMessage = message.remove(" ")
        var currentCode = 0
        for (i in parsedMessage.indices){
            val currentChar = parsedMessage[i].toString()
            resultList.firstWhere { it.originalIndex == currentCode }!!.append(currentChar)
            currentCode++
            if (currentCode > key.length - 1) currentCode = 0
        }

        var encryptedStr = ""
        resultList.map {
            encryptedStr = "$encryptedStr ${it.result.toLowerCase()}"
        }

        resultList.sortBy { it.originalIndex }

        return BoxResult(parsedMessage.chunked(key.length), encryptedStr, key, resultList)
    }

    fun decrypt(message : String, keyStr : String) : BoxDecryptionResult?{
        val keyValues = arrayListOf<BoxKeyObject>()
        val key = keyStr.toLowerCase().trim()

        var currentNumber = 1
        getAlphabetArray().map { currentLetter ->
            for (i in key.indices){
                val currentKeyLetter = key[i].toString()
                if (currentKeyLetter.equals(currentLetter)){
                    keyValues.add(BoxKeyObject(i, currentKeyLetter, currentNumber, arrayListOf()))
                    currentNumber++
                }
            }
        }

        val words = message.trim().split(" ")
        keyValues.sortBy { it.value }

        if (words.size != keyValues.size){
            //mal
            return null
        }

        for (i in 0..keyValues.size - 1){
            val word = words.get(i)
            for (w in word.indices){
                val currentLetter = word[w].toString()
                keyValues.get(i).words.add(currentLetter)
            }
        }

        keyValues.sortBy { it.originalIndex }

        val result = StringBuilder()
        var index = 0
        var breakFor = false
        out@ for (i in 0..100){
            if (breakFor){
                break@out
            }
            keyValues.map {
                try {
                    val l = it.words.get(index) ?: ""
                    result.append(l)
                }catch (i : IndexOutOfBoundsException){
                    breakFor = true
                    return@map
                }
            }
            index++
        }


        return BoxDecryptionResult(result.chunked(key.length), result.toString().toLowerCase(), key, keyValues)
    }

    private fun getAlphabetArray() : ArrayList<String>{
        val array = arrayListOf<String>()
        var c = 'a'
        while (c <= 'z'){
            array.add(c.toString())
            ++c
        }
        return array
    }

    private fun getLetterNumericalValue(letter : String) : Int{
        val array = arrayListOf<Pair<Int, String>>()
        var c = 'a'
        var i = 1
        while (c <= 'z'){
            array.add(Pair(i, c.toString()))
            ++c
            i++
        }

        if (letter.isBlank()) return 27

        return array.firstWhere { it.second == letter.toLowerCase() }!!.first
    }
}