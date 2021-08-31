package com.sample;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static java.lang.Thread.sleep;

@WebServlet(urlPatterns = "/test-timeout")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        try {
            sleep(342000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ServletOutputStream out = resp.getOutputStream();
        out.write("hello world".getBytes());
        out.flush();
        out.close();
    }
}