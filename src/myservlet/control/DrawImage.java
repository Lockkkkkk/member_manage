package myservlet.control;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 生成随机图片，用来作为验证码
 */
public class DrawImage extends HttpServlet {
    private static final long serialVersionUID = 3038623696184546092L;
    int width = 60, height = 20;
    Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String createTypeFlag = request.getParameter("createTypeFlag");//接收客户端传递的createTypeFlag标识
        //1.在内存中创建一张图片
        BufferedImage bi = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
        //2.得到图片
        Graphics g = bi.getGraphics();
        Random random1 = new Random();
        g.setColor(getRandColor(200, 250));
    	g.fillRect(0, 0, width, height);
    	g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
    	g.setColor(getRandColor(160, 200));
    	for (int i = 0; i < 155; i++) {
    		int x = random1.nextInt(width);
    		int y = random1.nextInt(height);
    		int xl = random1.nextInt(12);
    		int yl = random1.nextInt(12);
    		g.drawLine(x, y, x + xl, y + yl);
    	}
    	String sRand = "";
    	for (int i = 0; i < 4; i++) {
    		String rand = String.valueOf(random1.nextInt(10));
    		sRand += rand;
    		g.setColor(new Color(20 + random1.nextInt(110), 20 + random1.nextInt(110), 20 + random1.nextInt(110)));
    		g.drawString(rand, 13 * i + 6, 16);
    	}
       
       //根据客户端传递的createTypeFlag标识生成验证码图片
        //7.将随机数存在session中
        request.getSession().setAttribute("checkcode", sRand);
        //8.设置响应头通知浏览器以图片的形式打开
        response.setContentType("image/jpeg");//等同于response.setHeader("Content-Type", "image/jpeg");
        //9.设置响应头控制浏览器不要缓存
        response.setDateHeader("expries", 0);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        //10.将图片写给浏览器
        ImageIO.write(bi, "jpg", response.getOutputStream());
    }
}