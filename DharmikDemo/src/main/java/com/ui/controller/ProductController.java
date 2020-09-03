package com.ui.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.ui.dao.ProductDAO;
import com.ui.model.Location;
import com.ui.model.MasterMemberRegister;
import com.ui.model.MemberFamilyRegister;
import com.ui.model.MemberPersonalInformation;
import com.ui.model.Product;

@RestController
public class ProductController {
	
	MixController mixCon;
	
	@Autowired
	ProductDAO productnDao;
	
	 private static final Logger logger = LoggerFactory.getLogger(MasterMemberPlanController.class);
	 
	
	
	@PostMapping("addProduct")
    public int addProduct(@RequestBody Product product, HttpServletRequest request, HttpSession session)
 
    {
		
	 logger.info("***** Add Product  *****");
        String result = "";
        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
        System.out.println("============================================================="+userid);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }

        String s = "y";

        product.setCreatedBy(userid);
        product.setIpAddress(ip);
        product.setStatus(s);
        result = productnDao.addProduct(product);
    	int id = 0;
    	
        if (result.equals("Success")) {

			logger.info("***** Last Member Id Id Got it in PRODUCT *****");

			id = productnDao.getLastPr();

		}
		return id;
       
    }
	@GetMapping(value = "getAllProductName")
	  public List<Product> getAllProductName(HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return productnDao.getAllProduct();
	  }
	
	@GetMapping(value = "getAllProductTaxName")
	  public List<Product> getAllProductTaxName(int product_id,HttpServletRequest request) {
	      logger.info("***** getAllProductName*****");
	      return productnDao.getAllProductTax(product_id);
	  }
	
	
	 @GetMapping(value = "/getProductById")
	  public Product getProductById(int product_id, HttpServletRequest request) {
	      logger.info("*****  getProductById *****");
	      return productnDao.getProductById(product_id);
	  }
	 
	 
	 @GetMapping(value = "/getProductTaxById")
	  public Product getProductTaxById(int product_id, HttpServletRequest request) {
	      logger.info("***** GET getProductTaxById *****");
	      return productnDao.getProducTaxtById(product_id);
	  }
	 
	 
	 @PostMapping(value = "editProductName")
	  public String editBatch(@RequestBody Product product, HttpSession session, HttpServletRequest request,
	          HttpServletResponse response) {
	      logger.info("***** EDIT Product *****");
	      String result = "";

	      int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
	      String ipaddress = request.getHeader("X-FORWARDED-FOR");
	      
	      if (ipaddress == null) {
	          ipaddress = request.getRemoteAddr();
	      }
	      String s = "y";
	    // System.out.println("//////////////////////////////___++++"+product.getProduct_id()); 
	      product.setCreatedBy(id);
	      product.setIpAddress(ipaddress);
	      product.setStatus(s);

	    
	        result = productnDao.editProduct(product);
	      
	      return result;
	  }
	 
	 
	 @DeleteMapping(value = "deleteProduct")
	  public void delete(int product_id) {
	      logger.info("***** DELETE location Name *****");
	      productnDao.deleteProduct(product_id);
	  }
	 
	 @PostMapping("/InsertProductTax")
	 public String addProductTax1(int product_id,int tax_type,float tax_value, String status,String createdDate, String ipAddress,
			  HttpServletRequest request, HttpSession session) {
				
		 logger.info("*****  addProductTax  *****");
	      String result1 = "";
	      int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	      System.out.println("============================================================="+userid);
	      String ip = request.getHeader("X-FORWARDED-FOR");
	      if (ip == null) {
	          ip = request.getRemoteAddr();
	      }
	      String s = "y";
	      
	      Product m1 = new Product();
	      	
	       	m1.setTax_type(tax_type);
	       	m1.setTax_value(tax_value);
	       	m1.setProduct_id(product_id);
	      	m1.setCreatedBy(userid);
	        m1.setIpAddress(ip);
	        m1.setStatus(s);
	        
			
		result1=productnDao.addProductTaxData(m1);
			
		 return result1;
		 
	}
	 
	 @DeleteMapping(value = "deleteProductTax")
	  public void deleteTax(int product_tax_id) {
	      logger.info("***** DELETE TAx Name *****");
	      productnDao.deleteProductTax(product_tax_id);
	  }
	 
	 @PostMapping("addProductImage")
		public String addMasterPlan(@RequestBody Product product, HttpServletRequest request,
				HttpSession session) throws IOException, WriterException

		{
			logger.info("***** Add ProductImage  *****");
			
		
			
			mixCon = new MixController();
			
			byte[] ii = mixCon.getImageByte(product.getImage());
			String im = mixCon.uploadImage(ii, "mk", "Profile Picture",product.getValuex(), product.getValuey(), product.getValuew(),product.getValueh(), request);
			
			product.setProduct_image(im);
			String result = "";
			int userid = Integer.parseInt(session.getAttribute("adminuserid").toString());
			System.out.println("=============================================================" + userid);
			String ip = request.getHeader("X-FORWARDED-FOR");
			if (ip == null) {
				ip = request.getRemoteAddr();
			}

			String s = "y";
			
			product.setCreatedBy(userid);
			product.setIpAddress(ip);
			product.setStatus(s);
				
			result = productnDao.addProductTaxData(product);
	        //result = productnDao.addProductImageData(product);

			return result;
		}

	 @GetMapping(value = "getAllProductImages")
	  public List<Product> getAllProductImages(HttpServletRequest request) {
	      logger.info("***** getAllProductImages*****");
	      return productnDao.getAllProductImages();
	  }
	 
	 
	 
		
	  
	  	@PostMapping("/addData")
	    public String addProductImageData(@RequestParam(value = "image", required = false) MultipartFile[] image, String Secertcode,
	    		int product_sequence,
	    		 String createdDate, int valuex, int valuey, int valuew, int valueh,int index,
	    		String status,String ipAddress, HttpServletRequest request, HttpSession session) throws IOException, WriterException
	 
	    {
			 logger.info("***** Add Master Plan *****");
	        String result = "";
	        int  userid = Integer.parseInt(session.getAttribute("adminuserid").toString());    
	        System.out.println("============================================================="+userid);
	        String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) {
	            ip = request.getRemoteAddr();
	        }
	        String s = "y";
	        int product_id=productnDao.getLastProductId();
	       
	    	
	        System.out.println("/////////////////////////////"+product_id);
	      
	      
	     
	        mixCon = new MixController();
	   
	        Product m = new Product();
	        m.setProduct_id(product_id);
	        System.out.println("/////////////////getSecertcode///////////"+ m.getSecertcode());
	        String qrcodeimage = "";
			 String membershipid = Secertcode;
			  System.out.println("/////////////////////////////"+membershipid);
			String barcodeImage = "";
			String barcodevalue = membershipid;

		
			  String im = mixCon.uploadImage(image[index], "Profile Picture",valuex, valuey, valuew,valueh, request);
	
			  m.setSecertcode(Secertcode);
	     
	          m.setProduct_sequence(product_sequence);		  
			   m.setProduct_image(im);
			  
		
		
			Code128Bean bar = new Code128Bean();
			final int dpi = 128;
			bar.setModuleWidth(UnitConv.in2mm(1.0f / dpi));
			bar.setFontSize(2.0);
			bar.doQuietZone(false);

			File dir1 = new File(request.getRealPath("") + "/resources/admin/images/barcode/");

			if (!dir1.exists()) {
				dir1.mkdirs();
			}
			String path1 = request.getRealPath("/resources/admin/images/barcode/");
			File uploadfile1 = new File(path1 + File.separator + membershipid + ".png");

			BufferedOutputStream bufferedoutput1 = null;
			bufferedoutput1 = new BufferedOutputStream(new FileOutputStream(uploadfile1));
			try {
				BitmapCanvasProvider canvasProvider = new BitmapCanvasProvider(bufferedoutput1, "image/x-png", dpi,
						BufferedImage.TYPE_BYTE_BINARY, false, 0);

				bar.generateBarcode(canvasProvider, barcodevalue);

				canvasProvider.finish();

				File ff = new File(path1);
				File files[] = ff.listFiles();

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile()) {

					}
				}
				/*		 barcodeImage = request.getScheme() + "://"
				 +request.getServerName() + ":" + request.getServerPort()
				+"/PresidencyClub/resources/admin/images/barcode/" + membershipid + ".png";
				 */			 
				 
				barcodeImage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
						+ "DharmikDemo/resources/admin/images/barcode/" + membershipid + ".png";
						

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				bufferedoutput1.close();
			}

			/* Generate BarCode End */

			/* Generate QRCode Start */

			File dir2 = new File(request.getRealPath("") + "/resources/admin/images/qrcode/");
			if (!dir2.exists())
				dir2.mkdirs();

			String path2 = request.getRealPath("/resources/admin/images/qrcode/");

			int size = 125;
			String fileType = "png";

			Hashtable hintMap = new Hashtable();

			hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

			QRCodeWriter qrCodeWriter = new QRCodeWriter();

			BitMatrix byteMatrix = null;
			try {
				byteMatrix = qrCodeWriter.encode(membershipid, BarcodeFormat.QR_CODE, size, size, hintMap);
			} catch (WriterException e1) {
				e1.printStackTrace();
			}

			int matrixWidth = byteMatrix.getWidth();

			BufferedImage image1 = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
			image1.createGraphics();

			Graphics2D graphics = (Graphics2D) image1.getGraphics();
			graphics.setColor(Color.WHITE);
			graphics.fillRect(0, 0, matrixWidth, matrixWidth);
			graphics.setColor(Color.BLACK);

			for (int i = 0; i < matrixWidth; i++) {
				for (int j = 0; j < matrixWidth; j++) {
					if (byteMatrix.get(i, j)) {
						graphics.fillRect(i, j, 1, 1);
					}
				}
			}

			File qrFile = new File(path2 + File.separator + membershipid + ".png");
			ImageIO.write(image1, fileType, qrFile);
			/*
			 qrcodeimage = request.getScheme() + "://" + request.getServerName()
		      +":" + request.getServerPort()
			 +"/PresidencyClub/resources/admin/images/qrcode/" + membershipid + ".png";
	*/		
				qrcodeimage = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "DharmikDemo/resources/admin/images/qrcode/" + membershipid + ".png";

			/* Generate QRCode End */
		  
			m.setBarcodeImage(barcodeImage);
			m.setQrcodeimage(qrcodeimage);
		
	        m.setCreatedBy(userid);
	        m.setIpAddress(ip);
	        m.setStatus(s);
			
			
	        result = productnDao.addProductImageData(m);
	       
	       
	  
	        return result;
	    }
	  	

	
}
