task checker;

input integer iteration;

repeat (iteration) @ (posedge clk) begin
	if (cond.salida_gray_cond == synth.salida_gray) begin  ////// sb.sb_gnt0 ????????????????
       $fdisplay(log, "PASS");
        end
        else begin
          $fdisplay(log, "Time=%.0f Error dut: salida_gray =%d, conductual: salida_gray =%d", $time,synth.salida_gray, cond.salida_gray_cond);
        end
end
endtask
