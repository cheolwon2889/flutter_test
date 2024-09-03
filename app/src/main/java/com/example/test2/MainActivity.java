package com.example.test2;

import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {

    static RequestQueue requestQueue;
    TextView tv1;
    String targetDate;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn1 = findViewById(R.id.btn1);
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                makeRequest();
            }
        });
        tv1 = findViewById(R.id.tv1);
        if (requestQueue == null) {
            requestQueue = Volley.newRequestQueue(getApplicationContext());
        }

        DatePicker dp1 = findViewById(R.id.dp1);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                dp1.setOnDateChangedListener(new DatePicker.OnDateChangedListener() {
                    @Override
                    public void onDateChanged(DatePicker datePicker, int i, int i1, int i2) {
                        String month,day;
                        if ((i1+1)<10) {
                            month = "0"+(i1+1);
                        } else {
                            month = (i+1)+"";
                        }
                        if (i2 < 10) {
                            day = "0"+i2;
                        } else {
                            day = i2+"";
                        }
                        targetDate = i+month+day;
                        Toast.makeText(getApplicationContext() , "날짜"+ targetDate,Toast.LENGTH_SHORT).toString();
                    }
                });
            }



    } //onCreate

    void makeRequest() {
        String url ="http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=82ca741a2844c5c180a208137bb92bd7&targetDt="+targetDate;
        StringRequest request = new StringRequest(Request.Method.GET, url
                , new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                String rs1 = response.substring(response.indexOf("["), response.indexOf("]")+1);
                jsonParsing(rs1);
//                tv1.append(response);
                Log.i("MyTag", response);
            }
        }
        , new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        });
        requestQueue.add(request);

    }
    void jsonParsing(String result) {
        StringBuilder sb = new StringBuilder();

        try {
            sb.setLength(0);
            JSONArray jArray = new JSONArray(result);
            for (int i =0; i<jArray.length();i++) {
                JSONObject obj = jArray.getJSONObject(i);
                String rank = obj.getString("rank");
                String name = obj.getString("movieNm");
                sb.append(rank+ "위 "+ name+ "\n");
            }
        tv1.append(sb.toString());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }


}