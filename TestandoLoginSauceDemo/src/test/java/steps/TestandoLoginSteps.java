package steps;

import io.cucumber.java.Before;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.Então;
import io.cucumber.java.pt.Quando;
import org.junit.After;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


public class TestandoLoginSteps {

    WebDriver driver;

    @Before
    public void inicio() {

        System.setProperty("webdriver.chrome.driver", "C:\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
    }

    @After
    public void finaliza() {
        driver.quit();
    }

    @Dado("que o usuário está na tela de login")
    public void que_o_usuário_está_na_tela_de_login() {

        driver.get("https://www.saucedemo.com/");

    }

    @Quando("preenche o username com {string}")
    public void preenche_o_username_com(String username) {

        driver.findElement(By.id("user-name")).sendKeys(username);

    }


    @Quando("preencher password com {string}")
    public void preencher_password_com(String password) {

        driver.findElement(By.id("password")).sendKeys(password);

    }


    @Quando("clica no botão de login")
    public void clica_no_botão_de_login() {

        driver.findElement(By.id("login-button")).click();

    }


    @Então("deve ter acesso")
    public void deve_ter_acesso() {

        Assert.assertTrue(driver.findElement(By.tagName("body")).getText().contains("PRODUCTS"));
        driver.quit();

    }

    @Então("deve aparecer uma mensagem {string}")
    public void deve_aparecer_uma_mensagem(String mensagem) {

        Assert.assertTrue(driver.findElement(By.tagName("body")).getText().contains(mensagem));
        driver.quit();

    }


}
