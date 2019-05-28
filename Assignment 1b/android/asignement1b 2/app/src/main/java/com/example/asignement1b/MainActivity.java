package com.example.asignement1b;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {


    Button auburnButton;
    Button bamaButton;
    Button secButton;
    ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        auburnButton = findViewById(R.id.auburnButton);
        bamaButton = findViewById(R.id.bamaButton);
        secButton = findViewById(R.id.secButton);
        imageView = findViewById(R.id.imageView);


        imageView.setImageResource(R.drawable.sec);
        auburnButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imageView.setImageResource(R.drawable.auburn);
            }
        });

        bamaButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imageView.setImageResource(R.drawable.bama);
            }
        });

        secButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                imageView.setImageResource(R.drawable.sec);
            }
        });
    }
}
