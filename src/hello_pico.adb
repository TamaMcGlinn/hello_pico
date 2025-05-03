with Rp.Device;
with Rp.Clock;
with Rp.Gpio;
with Pico;

procedure Hello_Pico is
begin
   Rp.Clock.Initialize (Pico.Xosc_Frequency);
   Rp.Device.Timer.Enable;
   Pico.Led.Configure (Rp.Gpio.Output);

   loop
      Pico.Led.Set;
      Rp.Device.Timer.Delay_Milliseconds (900);
      Pico.Led.Clear;
      Rp.Device.Timer.Delay_Milliseconds (100);
   end loop;
end Hello_Pico;
