/*
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.cmactions;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import java.io.*;

public class BootCompletedReceiver extends BroadcastReceiver {

    public static boolean wasScreenOn = true;

    @Override
    public void onReceive(final Context context, final Intent intent) {
		// Start the service on boot
		if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())) {
            Intent serviceIntent = new Intent(context, CMActionsService.class);
            context.startService(serviceIntent);
            Log.i("LedPearlyn","Started");
        // Shutdown the led if device goes to Daydream or Sleep   
        } else if (intent.getAction().equals(Intent.ACTION_SCREEN_OFF) || intent.getAction().equals(Intent.ACTION_DREAMING_STARTED)) {
			writeledvalue("1");
            wasScreenOn = false;
            Log.i("LedPearlyn","Off"); 
        // Set the brightness to max if the devices wakes up from sleep or Daydream    
        } else if (intent.getAction().equals(Intent.ACTION_SCREEN_ON) || intent.getAction().equals(Intent.ACTION_DREAMING_STOPPED)) {
			writeledvalue("255"); 
            wasScreenOn = true;
            Log.i("LedPearlyn","On");
        } 
    }
    
    public void writeledvalue(String value) {
    try {
			String f = "/proc/led_device";
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

