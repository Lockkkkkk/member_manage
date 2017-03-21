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
 * �������ͼƬ��������Ϊ��֤��
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
        String createTypeFlag = request.getParameter("createTypeFlag");//���տͻ��˴��ݵ�createTypeFlag��ʶ
        //1.���ڴ��д���һ��ͼƬ
        BufferedImage bi = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
        //2.�õ�ͼƬ
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
       
       //���ݿͻ��˴��ݵ�createTypeFlag��ʶ������֤��ͼƬ
        //7.�����������session��
        request.getSession().setAttribute("checkcode", sRand);
        //8.������Ӧͷ֪ͨ�������ͼƬ����ʽ��
        response.setContentType("image/jpeg");//��ͬ��response.setHeader("Content-Type", "image/jpeg");
        //9.������Ӧͷ�����������Ҫ����
        response.setDateHeader("expries", 0);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        //10.��ͼƬд�������
        ImageIO.write(bi, "jpg", response.getOutputStream());
    }
}