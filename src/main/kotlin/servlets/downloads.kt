package servlets

import java.io.File
import java.io.FileInputStream
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class DownloadServlet : HttpServlet(){
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        doPost(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val fileName = req!!.getParameter("file")
        val file = File("WEB-INF/download-resources/$fileName")

        val contentType = req.getParameter("type")
        when(contentType){
            "zip" -> resp!!.contentType = "application/zip"
            "pdf" -> resp!!.contentType = "application/pdf"
            "excel" -> resp!!.contentType = "application/vnd.ms-excel"
            else -> resp!!.contentType = "application/zip"
        }

        resp.setHeader("Content-disposition","attachment; filename=${file.name}")
        resp.setContentLength(file.length().toInt())

        try{
            val fileInputStream = FileInputStream(file)
            val output = resp.outputStream
            
            fileInputStream.copyTo(output, 1024)
        }catch (ex : Exception){

        }
    }
}

class DownloadPdf : HttpServlet(){
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        doPost(req, resp)
    }

    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val fileName = req!!.getParameter("file")
        val file = File("WEB-INF/download-resources/$fileName")
        resp!!.contentType = "application/pdf"
        resp.setHeader("Content-disposition","attachment; filename=${file.name}")
        resp.setContentLength(file.length().toInt())

        try{
            val fileInputStream = FileInputStream(file)
            val output = resp.outputStream

            fileInputStream.copyTo(output, 1024)
        }catch (ex : Exception){

        }
    }
}