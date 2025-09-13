package fr.devmobs;

import javafx.application.Application;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;

public class MainClassFX extends Application {
    @Override
    public void start(Stage primaryStage) {
        try {
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/fr/devmobs/MainClassFX.fxml"));
            Parent root = loader.load();
            primaryStage.setTitle("Template Main Application (JavaFX)");
            Scene scene = new Scene(root, 430, 128);
            //primaryStage.setMinWidth(430);
            //primaryStage.setMinHeight(128);
            primaryStage.setScene(scene);
            primaryStage.show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}
