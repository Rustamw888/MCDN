package runners;

import cucumber.api.CucumberOptions;
import cucumber.api.SnippetType;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/features",
        glue = {"stepDef", "runners"},
//        tags = {"@all", "~@ignore"},
        tags = {"@id-12.2", "~@ignore"},
//        tags = {"@mock", "~@ignore"},
        strict = true,
        snippets = SnippetType.CAMELCASE,
        monochrome = true,
        format = {"json:target/cucumber.json", "html:target/site/cucumber-pretty"},
        plugin = "ru.yandex.qatools.allure.cucumberjvm.AllureReporter"
)
public class TestFirstRunner {
}
