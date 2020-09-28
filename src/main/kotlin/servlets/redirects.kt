package servlets

import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class EncryptionServlet : HttpServlet(){
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req!!.getRequestDispatcher("encryption.jsp").forward(req, resp)
    }
}
class DecryptionServlet : HttpServlet(){
    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        req!!.getRequestDispatcher("decryption.jsp").forward(req, resp)
    }
}