package encryption

import objects.MatrixResult
import utils.firstWhere

object MatrixEncryption{
    fun encrypt(text : String, key : ArrayList<Int>) : MatrixResult {
        val r2 = 3 //filas del 1
        val c1 = 3 //columnas del 1

        val r1 = 3 //filas del 2


        //Generar la primera matriz (llave)
        val keyMatrix = arrayListOf<IntArray>()
        key.chunked(3).map {
            keyMatrix.add(intArrayOf(it[0], it[1], it[2]))
        }

        //Generar la segunda matriz (texto a encriptar)
        val firstGroup = arrayListOf<Int>()
        val secondGroup = arrayListOf<Int>()
        val thirdGroup = arrayListOf<Int>()
        text.chunked(3).map {
            if (it.length == 1){
                firstGroup.add(getLetterNumericalValue(it[0].toString()))
                secondGroup.add(27)
                thirdGroup.add(27)
            }
            if (it.length == 2){
                firstGroup.add(getLetterNumericalValue(it[0].toString()))
                secondGroup.add(getLetterNumericalValue(it[1].toString()))
                thirdGroup.add(27)
            }
            if (it.length == 3){
                firstGroup.add(getLetterNumericalValue(it[0].toString()))
                secondGroup.add(getLetterNumericalValue(it[1].toString()))
                thirdGroup.add(getLetterNumericalValue(it[2].toString()))
            }

        }

        val textMatrix = arrayListOf(
                intArrayOf(*firstGroup.toIntArray()),
                intArrayOf(*secondGroup.toIntArray()),
                intArrayOf(*thirdGroup.toIntArray())
        )

        //Definir la cantidad de columnas de la segunda matriz
        val c2 = firstGroup.size

        // Multiplicacion de matrices
        val product = multiplyMatrices(keyMatrix, textMatrix, r1, c1, c2)

        return MatrixResult(keyMatrix, textMatrix, product)
    }

    private fun multiplyMatrices(firstMatrix: ArrayList<IntArray>, secondMatrix: ArrayList<IntArray>, r1: Int, c1: Int, c2: Int): Array<IntArray> {
        val product = Array(r1) { IntArray(c2) }
        for (i in 0..r1 - 1) {
            for (j in 0..c2 - 1) {
                for (k in 0..c1 - 1) {
                    product[i][j] += firstMatrix[i][k] * secondMatrix[k][j]
                }
            }
        }

        return product
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