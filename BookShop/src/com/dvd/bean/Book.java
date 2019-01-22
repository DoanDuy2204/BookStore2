package com.dvd.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.dvd.DAO.AuthorBookDAO;
import com.dvd.DAO.CategoryDAO;
import com.dvd.DAO.PublishHouseDAO;

public class Book {

	private int id;
	private String name;
	private String srcImage;
	private int soldNumber;
	private String[] description;
	private double sale;
	private double start;
	private String[] comment;
	private Category category;
	private PublishHouse publishHouse;
	private List<Author> authors ;
	private double price;
	private double priceAfterSale;
	private CategoryDAO categoryDao = new CategoryDAO();
	private AuthorBookDAO author_bookDao = new AuthorBookDAO();
	private PublishHouseDAO publishDao = new PublishHouseDAO();
	
	public Book() {
		super();
	}
	public Book(int id, String name, String srcImage, int soldNumber, String[] description, double sale, double start,
			String[] comment, Category category, PublishHouse publishHouse, List<Author> authors, double price,
			double priceAfterSale, CategoryDAO categoryDao, AuthorBookDAO author_bookDao, PublishHouseDAO publishDao) {
		super();
		this.id = id;
		this.name = name;
		this.srcImage = srcImage;
		this.soldNumber = soldNumber;
		this.description = description;
		this.sale = sale;
		this.start = start;
		this.comment = comment;
		this.category = category;
		this.publishHouse = publishHouse;
		this.authors = authors;
		this.price = price;
		this.priceAfterSale = priceAfterSale;
		this.categoryDao = categoryDao;
		this.author_bookDao = author_bookDao;
		this.publishDao = publishDao;
	}
	public Book(String name,double price,String srcImage, int soldNumber, String[] description, Category category,
			PublishHouse publishHouse, List<Author> author,double sale) {
		super();
		this.price = price;
		this.name = name;
		this.srcImage = srcImage;
		this.soldNumber = soldNumber;
		this.description = description;
		this.category = category;
		this.publishHouse = publishHouse;
		this.authors = author;
		this.sale = sale;
	}
	public Book(int id, String name,double price, String srcImage,int soldNumber, String[] description, Category category,
			PublishHouse publishHouse, List<Author> authors,double sale) {
		super();
		this.price = price;
		this.id = id;
		this.name = name;
		this.srcImage = srcImage;
		this.soldNumber = soldNumber;
		this.sale = sale;
		this.description = description;
		this.category = category;
		this.publishHouse = publishHouse;
		this.authors = authors;
	}
	public Book(ResultSet result) throws SQLException {
		this.setId(result.getInt("id"));
		this.setName(result.getString("name"));
		this.setSoldNumber(result.getInt("soldNumber"));
		this.setPrice(result.getDouble("price"));
		this.setSrcImage(result.getString("srcImage"));
		this.setSale(result.getDouble("sale"));
		this.setStart(result.getDouble("start"));
		this.setPriceAfterSale(this.price-(this.sale*this.getPrice()/100));
		this.category = categoryDao.findCategoryById(result.getInt("category_id"));
		this.publishHouse = publishDao.findPublishDaoById(result.getInt("publishHouse_id"));
		this.authors = author_bookDao.findAuthorsById(result.getInt("id"));
	}
	public double getStart() {
		return start;
	}
	public void setStart(double start) {
		this.start = start;
	}
	public String[] getComment() {
		return comment;
	}
	public void setComment(String[] comment) {
		this.comment = comment;
	}
	public double getPriceAfterSale() {
		return priceAfterSale;
	}
	public void setPriceAfterSale(double priceAfterSale) {
		this.priceAfterSale = priceAfterSale;
	}
	public double getSale() {
		return sale;
	}
	public void setSale(double sale) {
		this.sale = sale;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSrcImage() {
		return srcImage;
	}
	public void setSrcImage(String srcImage) {
		this.srcImage = srcImage;
	}
	public int getSoldNumber() {
		return soldNumber;
	}
	public void setSoldNumber(int soldNumber) {
		this.soldNumber = soldNumber;
	}
	public String[] getDescription() {
		return description;
	}
	public void setDescription(String[] description) {
		this.description = description;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public PublishHouse getPublishHouse() {
		return publishHouse;
	}
	public void setPublishHouse(PublishHouse publishHouse) {
		this.publishHouse = publishHouse;
	}
	public List<Author> getAuthor() {
		return authors;
	}
	public void setAuthor(List<Author> author) {
		this.authors = author;
	}
	
	
}
