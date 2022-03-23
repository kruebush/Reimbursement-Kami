package com.training.cucumber;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;

//Glue code for selenium/cucumber with annotations

public class LoginStepsE {
	String browserName = "edge";
	WebDriver driver;
	@Given("browser is open")
	public void browser_is_open() {
		System.out.println("#Step - browser is open");
		if (browserName.equals("edge")) {
			WebDriverManager.edgedriver().setup();
			;
			driver = new EdgeDriver();
		} else if (browserName.equals("chrome")) {
			WebDriverManager.chromedriver().setup();
			driver = new ChromeDriver();
		}}
	@Given("user is on login page")
	public void user_is_on_login_page() {
		System.out.println("#Step - user is on login page");
		driver.get("http://localhost:8080/project1-Kami/loginpage.html");
		assertTrue(driver.findElement(By.id("username")).isDisplayed());
	}
	@When("user enters username and password")
	public void user_enters_username_and_password() {
		System.out.println("#Step - user enters username and password");
		driver.findElement(By.xpath("//*[@id=\"username\"]")).sendKeys("Atano");
		driver.findElement(By.xpath("//*[@id=\"password\"]")).sendKeys("Atano123");
	}
	@When("user clicks on login button")
	public void user_clicks_on_login_button() {
		System.out.println("#Step - user clicks on login button");
		driver.findElement(By.xpath("//*[@id=\"submitlogin\"]")).click();		
	}
	@Then("user is navigated to the home page")
	public void user_is_navigated_to_the_home_page() {
		assertTrue(driver.findElement(By.id("employee_container")).isDisplayed());
		System.out.println("#Step - user is navigated to the home page");


	}

}

