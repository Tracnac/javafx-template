package fr.devmobs;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

public class MainClassFXController {
    @FXML
    private Button quitButton;
    @FXML
    private Button displayButton;
    @FXML
    private Button swapButton;
    @FXML
    private TextField ScratchInputTextField;
    @FXML
    private TextField FinalInputTextField;

    @FXML
    private void initialize() {
        quitButton.setOnAction(_ -> System.exit(0));
        swapButton.setOnAction(_ -> {
            String temp = ScratchInputTextField.getText();
            ScratchInputTextField.setText(FinalInputTextField.getText());
            FinalInputTextField.setText(temp);
        });
        displayButton.setOnAction(_ -> {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Information");
            alert.setHeaderText(null);
            alert.setContentText("Scratch: " + ScratchInputTextField.getText() + "\nFinal: " + FinalInputTextField.getText());
            alert.showAndWait();
        });
    }
}
