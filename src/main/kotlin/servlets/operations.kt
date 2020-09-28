package servlets

import com.fasterxml.jackson.databind.ObjectMapper
import com.google.appengine.tools.admin.ResourceLimits.request
import encryption.BoxEncryption
import encryption.MatrixEncryption
import utils.isNumeric
import java.io.ByteArrayInputStream
import javax.servlet.ServletContext
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.servlet.annotation.MultipartConfig
import javax.servlet.http.Part

class EncryptDataServlet : HttpServlet(){
    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val type = req!!.getParameter("type").toString().toInt()
        val message = req.getParameter("message").toString()
        val boxKey = req.getParameter("box-key").toString()
        val keyList = arrayListOf<Int>()
        for (i in 1..9){
            var value = req.getParameter("m$i").toString()
            if (value.isBlank() ||  !value.isNumeric()){
                value = "0"
            }
            keyList.add(value.toInt())
        }

        resp!!.contentType = "text/html; charset=UTF-8";
        resp.characterEncoding = "UTF-8";
        val out = resp.writer

        when(type){
            1 -> {
                //Cajas
                val boxEncryptionResult = BoxEncryption.encrypt(message, boxKey)
                out.println(ObjectMapper().writeValueAsString(boxEncryptionResult))
                return
            }
            2 -> {
                //Matrices
                val matrixEncryptionResult = MatrixEncryption.encrypt(message, keyList)
                out.println(ObjectMapper().writeValueAsString(matrixEncryptionResult))
                return
            }
        }
    }
}

@MultipartConfig
class DecryptDataServlet : HttpServlet(){
    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val type = req!!.getParameter("type").toString().toInt()
        var message = req.getParameter("message").toString()
        val boxKey = req.getParameter("box-key").toString()
        val keyList = arrayListOf<Int>()
        for (i in 1..9){
            var value = req.getParameter("m$i").toString()
            if (value.isBlank() ||  !value.isNumeric()){
                value = "0"
            }
            keyList.add(value.toInt())
        }

        var textFileMultipart : Part? = null
        try {
            textFileMultipart = req.getPart("file") ?: null
        }catch (ex : Exception){

        }

        textFileMultipart?.let {
            message = it.inputStream.bufferedReader().use { it.readText() }.trim()
        }

        resp!!.contentType = "text/html; charset=UTF-8";
        resp.characterEncoding = "UTF-8";
        val out = resp.writer

        when(type){
            1 -> {
                //Cajas
                val boxDecryptionResult = BoxEncryption.decrypt(message, boxKey)
                if (boxDecryptionResult != null){
                    out.println(ObjectMapper().writeValueAsString(boxDecryptionResult))
                    return
                }else{
                    resp.status = HttpServletResponse.SC_UNAUTHORIZED
                    out.println("La llave ingresada es incorrecta")
                    return
                }

            }
            2 -> {
                //Matrices
                //TODO
            }
        }
    }
}


class DownloadTextFile : HttpServlet(){
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        doPost(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {

        val fileName = "resultado.txt"
        val fileContent = req!!.getParameter("result").replace("|", "\n")

        resp!!.setContentType("text/plain")
        resp.setContentLength(fileContent.length)
        resp.setContentType("application/octet-stream; charset=UTF-8")
        resp.setHeader("Content-Disposition", "attachment; filename=\"$fileName\"")
        resp.addHeader("Pargam", "no-cache")
        resp.addHeader("Cache-Control", "no-cache")

        val inputStream = ByteArrayInputStream(fileContent.toByteArray())
        val outStream = resp.getOutputStream()

        val buffer = ByteArray(4096)
        var bytesRead = -1

        while (inputStream.read(buffer).also { bytesRead = it } != -1) {
            outStream.write(buffer, 0, bytesRead)
        }

        inputStream.close()
        outStream.close()
    }
}