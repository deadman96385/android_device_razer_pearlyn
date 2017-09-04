package com.gabrielgagz.ledpearlyn;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.io.*;

public class LedPearlynReceiver extends BroadcastReceiver {

    public static boolean wasScreenOn = true;

    @Override
    public void onReceive(final Context context, final Intent intent) {
		// Start the service on boot
		if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            Intent serviceIntent = new Intent(context, LedPearlynService.class);
            context.startService(serviceIntent);
            Log.i("LedPearlyn","Started");
        // Shutdown the led if device goes to Daydream or Sleep   
        } else if (intent.getAction().equals(Intent.ACTION_SCREEN_OFF)) {
			writeledvalue("0");
            wasScreenOn = false;
            Log.i("LedPearlyn","Off"); 
        // Set the brightness to max if the devices wakes up from sleep or Daydream    
        } else if (intent.getAction().equals(Intent.ACTION_SCREEN_ON)) {
			writeledvalue("255"); 
            wasScreenOn = true;
            Log.i("LedPearlyn","On");
        }  else if (intent.getAction().equals(Intent.ACTION_DREAMING_STARTED)) {
			writeledvalue("0"); 
            wasScreenOn = true;
            Log.i("LedPearlyn","Off");
        }  else if (intent.getAction().equals(Intent.ACTION_DREAMING_STOPPED)) {
			writeledvalue("255"); 
            wasScreenOn = true;
            Log.i("LedPearlyn","On");
        }        
    }
    
    public void writeledvalue(String value) {
    try {
			String f = "/sys/devices/leds-qpnp-e6f58400/leds/pearlyn/brightness";
			FileWriter w = new FileWriter(f);
			BufferedWriter bw = new BufferedWriter(w);
			PrintWriter wr = new PrintWriter(bw);
			wr.write(value); 
			wr.close();
			bw.close();
            } catch(IOException e) {
            e.printStackTrace();
			}
}	

}

