package MCDN;

import ru.qatools.properties.PropertyLoader;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

public class Paths {

    private static final String baseDir = System.getProperty("user.dir");
    private static final String PROPERTIES_FILE = "/application.properties";

    public static String pathToJsons() {
        return baseDir + "/src/test/java/jsons/";
    }

    public static String pathToData() {
        return baseDir + "/src/test/java/data/";
    }

    /**
     * Вспомогательный метод, возвращает свойства из файла /application.properties
     *
     * @return свойства из файла /application.properties
     */
    public static Properties getPropertiesInstance() {
        Properties instance = new Properties();
        InputStream resourceStream = PropertyLoader.class.getResourceAsStream(PROPERTIES_FILE);
        InputStreamReader inputStream = new InputStreamReader(resourceStream, StandardCharsets.UTF_8);

        try {
            instance.load(inputStream);
        } catch (Exception ignored) {

        }

        return instance;
    }
}
