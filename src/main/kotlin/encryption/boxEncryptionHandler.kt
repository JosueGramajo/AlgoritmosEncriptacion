package encryption

import objects.BoxObject
import objects.BoxResult
import utils.firstWhere
import utils.remove

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

    private fun getAlphabetArray() : ArrayList<String>{
        val array = arrayListOf<String>()
        var c = 'a'
        while (c <= 'z'){
            array.add(c.toString())
            ++c
        }
        return array
    }
}