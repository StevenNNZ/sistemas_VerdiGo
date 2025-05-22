/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author estiv
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {

  public static void sendAlert(HttpServletResponse response, String title, String message, String icon, String redirectUrl) throws IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
        out.write(
            "<html><head>"
            + "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>"
            + "</head><body>"
            + "<script>"
            + "Swal.fire({"
            + "title: '" + title + "',"
            + "text: '" + message + "',"
            + "icon: '" + icon + "',"
            + "confirmButtonText: 'OK'"
            + "}).then(() => {"
            + "window.location.href = '" + redirectUrl + "';"
            + "});"
            + "</script>"
            + "</body></html>"
        );
    }
}
}
