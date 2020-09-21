package objects

data class BoxObject(
        val originalIndex : Int,
        val letter : String,
        var number : Int,
        var result : String
){
    fun append(string: String){
        result = "$result$string"
    }
}

data class BoxResult(
        val originalText : List<String>,
        val encrypted : String,
        val key : String,
        val list : ArrayList<BoxObject>
)

data class MatrixResult(
        val keyMatrix : ArrayList<IntArray>,
        val textMatrix : ArrayList<IntArray>,
        val encryptedResultMatrix : Array<IntArray>
)