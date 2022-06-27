`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2022 12:08:17
// Design Name: 
// Module Name: ButtonControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ButtonControl(
input clock,
input reset,
input button,
output reg valid_vote
  );
    
    reg [30:0] counter;
    
    //1sec / 10ms = 100000000
    
    always @(posedge clock)
    begin
        if(reset)
            counter <=0;
        else
        begin
            if(button & counter < 100000001)
                counter <= counter + 1;
            else if (!button)
                counter <= 0;
        
        end
end

always @(posedge clock)
begin
    if(reset)
        valid_vote <= 1'b0;
    else
    begin
    //when 
        if(counter == 100000000)
           valid_vote <= 1'b1;
        else
            valid_vote <= 1'b0;
    end
end
    
    
endmodule
