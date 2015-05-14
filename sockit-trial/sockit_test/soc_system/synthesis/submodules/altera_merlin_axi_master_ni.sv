// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/14.1/ip/merlin/altera_merlin_axi_master_ni/altera_merlin_axi_master_ni.sv#1 $
// $Revision: #1 $
// $Date: 2014/10/06 $    
// $Author: swbranch $

//-----------------------------------------
// AXI Master Agent
//
// Converts AXI master transactions into
// Merlin network packets.
//-----------------------------------------
`timescale 1 ns / 1 ns

module altera_merlin_axi_master_ni
#( 
    //----------------
    // AXI Interface Parameters
    //----------------
   parameter  ID_WIDTH = 2,
              ADDR_WIDTH = 32,
              RDATA_WIDTH = 32,
              WDATA_WIDTH = 32,
              ADDR_USER_WIDTH = 8,
              DATA_USER_WIDTH = 8,
              AXI_LOCK_WIDTH = 2,
              AXI_BURST_LENGTH_WIDTH = 4,
              WRITE_ISSUING_CAPABILITY = 16,
              READ_ISSUING_CAPABILITY = 16,
              AXI_VERSION = "AXI3",
                           
    //-------------------------
    // Packet Format Parameters
    //-------------------------
            PKT_THREAD_ID_H = 109,
            PKT_THREAD_ID_L = 108,
            PKT_QOS_H = 113,
            PKT_QOS_L = 110,
            PKT_BEGIN_BURST = 104,
            PKT_CACHE_H = 103,
            PKT_CACHE_L = 100,
            PKT_ADDR_SIDEBAND_H = 99,
            PKT_ADDR_SIDEBAND_L = 92,
            PKT_DATA_SIDEBAND_H = 124,
  
            PKT_DATA_SIDEBAND_L = 118,
            PKT_PROTECTION_H = 89,
            PKT_PROTECTION_L = 87,
            PKT_BURST_SIZE_H = 84, 
            PKT_BURST_SIZE_L = 82,
            PKT_BURST_TYPE_H = 86,
            PKT_BURST_TYPE_L = 85, 
            PKT_RESPONSE_STATUS_L = 106,
            PKT_RESPONSE_STATUS_H = 107,
            PKT_BURSTWRAP_H = 79,
            PKT_BURSTWRAP_L = 77,
            PKT_BYTE_CNT_H = 76,
            PKT_BYTE_CNT_L = 74,
            PKT_ADDR_H = 73,
            PKT_ADDR_L = 42,
            PKT_TRANS_EXCLUSIVE = 80,
            PKT_TRANS_LOCK = 105,
            PKT_TRANS_COMPRESSED_READ = 41,
            PKT_TRANS_POSTED = 40,
            PKT_TRANS_WRITE = 39,
            PKT_TRANS_READ = 38,
            PKT_DATA_H = 37,
            PKT_DATA_L = 6,
            PKT_BYTEEN_H = 5,
            PKT_BYTEEN_L = 2,
            PKT_SRC_ID_H = 1,
            PKT_SRC_ID_L = 1,
            PKT_DEST_ID_H = 0,
            PKT_DEST_ID_L = 0,
			PKT_ORI_BURST_SIZE_H = 127,
			PKT_ORI_BURST_SIZE_L = 125,
            ST_DATA_W = 128,
            ST_CHANNEL_W = 1,
                           
    //----------------
    // Agent Parameters
    //----------------
            ID = 1,
    //----------------
    // Derived Parameters
    //----------------
            PKT_BURSTWRAP_W = PKT_BURSTWRAP_H - PKT_BURSTWRAP_L + 1,
            PKT_BYTE_CNT_W = PKT_BYTE_CNT_H - PKT_BYTE_CNT_L + 1,
            PKT_ADDR_W = PKT_ADDR_H - PKT_ADDR_L + 1,
            PKT_DATA_W = PKT_DATA_H - PKT_DATA_L + 1,
            PKT_BYTEEN_W = PKT_BYTEEN_H - PKT_BYTEEN_L + 1,
            PKT_SRC_ID_W = PKT_SRC_ID_H - PKT_SRC_ID_L + 1,
            PKT_DEST_ID_W = PKT_DEST_ID_H - PKT_DEST_ID_L + 1
)
(
    //----------------
    // Global Signals
    //----------------
    input                                aclk,
    input                                aresetn,
    //----------------------------
    // AXI SLAVE SIDE INTERFACES
    //----------------------------
    // Write Address Channel
    //----------------
    input [ID_WIDTH-1:0]                 awid,
    input [ADDR_WIDTH-1:0]               awaddr,
    input [AXI_BURST_LENGTH_WIDTH - 1:0] awlen, 
    input [2:0]                          awsize,
    input [1:0]                          awburst,
    input [AXI_LOCK_WIDTH-1:0]           awlock,
    input [3:0]                          awcache,
    input [2:0]                          awprot,
    input [3:0]                          awqos,
    input [3:0]                          awregion, 
    input [ADDR_USER_WIDTH-1:0]          awuser,
    input                                awvalid,
    output reg                           awready,
    //----------------
    // Write Data Channel
    //----------------
    input [ID_WIDTH-1:0]                 wid,
    input [PKT_DATA_W-1:0]               wdata,
    input [(PKT_DATA_W/8)-1:0]           wstrb,
    input                                wlast,
    input                                wvalid,
    input [DATA_USER_WIDTH-1:0]          wuser,
    output reg                           wready,
    //----------------
    // Write Response Channel
    //----------------
    output reg [ID_WIDTH-1:0]            bid,
    output reg [1:0]                     bresp,
    output                               bvalid,
    input                                bready,
    output reg [DATA_USER_WIDTH-1:0]     buser, 
    //----------------
    // Read Address Channel
    //----------------
    input [ID_WIDTH-1:0]                 arid,
    input [ADDR_WIDTH-1:0]               araddr,
    input [AXI_BURST_LENGTH_WIDTH - 1:0] arlen,
    input [2:0]                          arsize,
    input [1:0]                          arburst,
    input [AXI_LOCK_WIDTH-1:0]           arlock,
    input [3:0]                          arcache,
    input [2:0]                          arprot,
    input [3:0]                          arqos,
    input [3:0]                          arregion,
    input [ADDR_USER_WIDTH-1:0]          aruser,
    input                                arvalid,
    output                               arready,
    //----------------
    // Read Data Channel
    //----------------
    output reg [ID_WIDTH-1:0]            rid,
    output reg [PKT_DATA_W-1:0]          rdata,
    output reg [1:0]                     rresp,
    output                               rlast,
    output                               rvalid,
    input                                rready,
    output reg [DATA_USER_WIDTH-1:0]     ruser,
    //----------------------------
    // NETWORK SIDE INTERFACES
    //----------------------------
    // WRITE Channel 
    //------------------
    // Command Source
    //----------------
    output reg                           write_cp_valid,
    output reg [ST_DATA_W-1:0]           write_cp_data,
    output wire                          write_cp_startofpacket,
    output wire                          write_cp_endofpacket,
    input                                write_cp_ready,
    //----------------
    // Response Sink
    //----------------
    input                                write_rp_valid,
    input [ST_DATA_W-1 : 0]              write_rp_data,
    input [ST_CHANNEL_W-1 : 0]           write_rp_channel,
    input                                write_rp_startofpacket,
    input                                write_rp_endofpacket,
    output reg                           write_rp_ready, 
    //-------------------
    // READ Channel 
    //-------------------
    // Command Source
    //----------------
    output reg                           read_cp_valid,
    output reg [ST_DATA_W-1:0]           read_cp_data,
    output wire                          read_cp_startofpacket,
    output wire                          read_cp_endofpacket,
    input                                read_cp_ready,
    //----------------
    // Response Sink
    //----------------
    input                                read_rp_valid,
    input [ST_DATA_W-1 : 0]              read_rp_data,
    input [ST_CHANNEL_W-1 : 0]           read_rp_channel,
    input                                read_rp_startofpacket,
    input                                read_rp_endofpacket,
    output reg                           read_rp_ready
        
);

//--------------------------------------
// Local parameters
//--------------------------------------
localparam NUMSYMBOLS           = PKT_DATA_W/8;
localparam BITS_PER_SYMBOL      = 8;

typedef enum bit [1:0] 
{
    FIXED       = 2'b00,
    INCR        = 2'b01,
    WRAP        = 2'b10,
    RESERVED    = 2'b11
} AxiBurstType;

//----------------------------------------------------
// AXSIZE decoding
//
// Turns the axsize value into the actual number of bytes
// being transferred.
// ---------------------------------------------------
function reg[7:0] bytes_in_transfer;
    input [2:0] axsize;

    case (axsize)
        3'b000: bytes_in_transfer = 8'b00000001;
        3'b001: bytes_in_transfer = 8'b00000010;
        3'b010: bytes_in_transfer = 8'b00000100;
        3'b011: bytes_in_transfer = 8'b00001000;
        3'b100: bytes_in_transfer = 8'b00010000;
        3'b101: bytes_in_transfer = 8'b00100000;
        3'b110: bytes_in_transfer = 8'b01000000;
        3'b111: bytes_in_transfer = 8'b10000000;
        default:bytes_in_transfer = 8'b00000001;
    endcase

endfunction

    // --------------------------------------------------
    // Ceil(log2()) function log2ceil of 4 = 2
    // --------------------------------------------------
    function integer log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

//--------------------------------------
//  Burst type decode
//--------------------------------------
AxiBurstType write_burst_type, read_burst_type;

function AxiBurstType burst_type_decode 
(
    input [1:0] axburst
);
    AxiBurstType burst_type;
    begin
        case (axburst)
            2'b00    : burst_type = FIXED;
            2'b01    : burst_type = INCR;
            2'b10    : burst_type = WRAP;
            2'b11    : burst_type = RESERVED;
            default  : burst_type = INCR;
        endcase
        return burst_type;
    end
endfunction

always_comb
    begin
        write_burst_type = burst_type_decode(awburst);
        read_burst_type  = burst_type_decode(arburst);
    end

//--------------------------------------
// Calculate the value of burstwrap for a wrapping burst. 
// The algorithm figures out the width of the burstwrap 
// boundary, and uses that to set a bit mask for burstwrap.
//
// This should synthesize to a small adder, followed by a 
// per-bit comparator (which gets folded into the adder).
//--------------------------------------
reg     [31 : 0]                        burstwrap_value_write;
reg     [31 : 0]                        burstwrap_value_read;
reg     [PKT_BURSTWRAP_W - 2 : 0]       burstwrap_boundary_write;
reg     [PKT_BURSTWRAP_W - 2 : 0]       burstwrap_boundary_read;
wire    [31 : 0]                        burstwrap_boundary_width_write;
wire    [31 : 0]                        burstwrap_boundary_width_read;

reg     [PKT_ADDR_W-1 : 0]              incremented_burst_address;
reg     [PKT_ADDR_W-1 : 0]              burstwrap_mask;
reg     [PKT_ADDR_W-1 : 0]              burst_address_high;
reg     [PKT_ADDR_W-1 : 0]              burst_address_low;

assign burstwrap_boundary_width_write   =    awsize + log2ceil(awlen + 1);
assign burstwrap_boundary_width_read    =    arsize + log2ceil(arlen + 1);

function reg [PKT_BURSTWRAP_W - 2 : 0] burstwrap_boundary_calculation
(
    input [31 : 0]  burstwrap_boundary_width,
    input int       width = PKT_BURSTWRAP_W - 1
);
    integer i;

    burstwrap_boundary_calculation = 0;
    for (i = 0; i < width; i++) begin
        if (burstwrap_boundary_width > i)
            burstwrap_boundary_calculation[i] = 1;
    end

endfunction 

assign burstwrap_boundary_write = burstwrap_boundary_calculation(burstwrap_boundary_width_write, PKT_BURSTWRAP_W - 1);
assign burstwrap_boundary_read  = burstwrap_boundary_calculation(burstwrap_boundary_width_read, PKT_BURSTWRAP_W - 1);

//--------------------------------------
// Use the burst type to set correct burstwrap value and address increment
//--------------------------------------

wire    [31:0]  bytes_in_transfer_minusone_write_wire;     // eliminates synthesis warning
wire    [31:0]  bytes_in_transfer_minusone_read_wire;     // eliminates synthesis warning 

assign  bytes_in_transfer_minusone_write_wire = bytes_in_transfer(awsize) - 1;
assign  bytes_in_transfer_minusone_read_wire  = bytes_in_transfer(arsize) - 1; 

always_comb
begin
    burstwrap_value_write = 0;
    case (write_burst_type)
        INCR:    
        begin
            burstwrap_value_write[PKT_BURSTWRAP_W - 1 : 0]    = {PKT_BURSTWRAP_W {1'b1}};
        end 
        WRAP:
        begin
            burstwrap_value_write[PKT_BURSTWRAP_W - 1 : 0]    = {1'b0, burstwrap_boundary_write};
        end
        FIXED:
        begin
            burstwrap_value_write[PKT_BURSTWRAP_W - 1 : 0]    = bytes_in_transfer_minusone_write_wire[PKT_BURSTWRAP_W -1 : 0];
        end
        default:
        begin
            burstwrap_value_write[PKT_BURSTWRAP_W - 1 : 0]    = {PKT_BURSTWRAP_W {1'b1}};
        end
    endcase
end

always_comb
begin
    burstwrap_value_read = 0;
    case (read_burst_type)
        INCR:    
        begin
            burstwrap_value_read[PKT_BURSTWRAP_W - 1 : 0] = {PKT_BURSTWRAP_W {1'b1}};
        end 
        WRAP:
        begin
            burstwrap_value_read[PKT_BURSTWRAP_W - 1 : 0] = {1'b0, burstwrap_boundary_read};
        end
        FIXED:
        begin
            burstwrap_value_read[PKT_BURSTWRAP_W - 1 : 0] = bytes_in_transfer_minusone_read_wire[PKT_BURSTWRAP_W -1 : 0];    
        end
        default:
        begin
            burstwrap_value_read[PKT_BURSTWRAP_W - 1 : 0] = {PKT_BURSTWRAP_W {1'b1}};
        end
    endcase
end

//--------------------------------------
// Global signals
//--------------------------------------
wire [31:0] id_int      = ID;

//--------------------------------------
// Command control for write packet 
//--------------------------------------
// Handling address and data 
// 
// The master NI will only send a packet
// when it receives both address and data.

wire write_addr_data_both_valid;
wire network_ready;

assign write_addr_data_both_valid = awvalid && wvalid;
assign network_ready = write_cp_ready;


//-------------------------
// Burst address and bytecount assignment
// ------------------------
reg [PKT_ADDR_W-1       : 0]    start_address;
reg [PKT_BYTE_CNT_W-1   : 0]    total_write_bytecount;
reg [PKT_BYTE_CNT_W-1   : 0]    total_read_bytecount;
reg [PKT_BYTE_CNT_W-1   : 0]    write_burst_bytecount;

reg [PKT_ADDR_W-1       : 0]    burst_address;
reg [PKT_BYTE_CNT_W-1   : 0]    burst_bytecount;


// Keep temporary address
wire    [PKT_ADDR_W-1 : 0]      second_burst_address;
wire    [PKT_ADDR_W-1 : 0]      burst_address_incr;
reg     [PKT_BYTE_CNT_W-1 : 0]  total_bytecount_left;

reg    [31:0]                   total_write_bytecount_wire;  // to eliminate QIS warning
reg    [31:0]                   total_read_bytecount_wire;   // to eliminate QIS warning
reg    [31:0]                   total_bytecount_left_wire;   // to eliminate QIS warning

// First address and bytecount of a burst
always_comb
begin
    total_write_bytecount_wire  = (awlen + 1) << log2ceil(NUMSYMBOLS);
    total_read_bytecount_wire   = (arlen + 1) << log2ceil(NUMSYMBOLS);
    total_write_bytecount       = total_write_bytecount_wire[PKT_BYTE_CNT_W-1:0];
    total_read_bytecount        = total_read_bytecount_wire[PKT_BYTE_CNT_W-1:0];
    start_address               = awaddr; 
end
//-----------------------------------------------------------------------
// The address_alignment is used to align address to size and increment burst address if needed
// it has input: {burswrap_boundary, start_addr, bursttype, burst_zize}
// return output is aligned address and increment if set, with Wrap the output address will wrap
// according to wrap boundary. Fixed burst, address will be kept same
// In case INCREMENT_ADDRESS = 0, the component acts as combinational logic and return algined address
// and a mask to algin address if wish to use.
//
// Refer for comments inside the component for more details
//-----------------------------------------------------------------------
    
    reg [PKT_ADDR_W-1 : 0] address_aligned;

    generate
        if (AXI_VERSION != "AXI4Lite") begin
            reg [PKT_ADDR_W + (PKT_BURSTWRAP_W-1) + 4 : 0] address_for_alignment;
            reg [PKT_ADDR_W+log2ceil(NUMSYMBOLS)-1 :0]  address_after_alignment;
            assign address_aligned          = address_after_alignment[PKT_ADDR_W - 1 : 0];
            assign address_for_alignment  = {burstwrap_boundary_write,awburst, start_address, awsize};

            altera_merlin_address_alignment
                #(
                  .ADDR_W (PKT_ADDR_W),
                  .BURSTWRAP_W (PKT_BURSTWRAP_W),
                  .INCREMENT_ADDRESS (1),
                  .NUMSYMBOLS (NUMSYMBOLS)
                  ) align_address_to_size
            (
             .clk (aclk),
             .reset (aresetn),
             .in_data (address_for_alignment),
             .in_valid (write_addr_data_both_valid),
             .in_sop (write_cp_startofpacket),
             .in_eop (wlast),

             .out_data (address_after_alignment),
             .out_ready (write_cp_ready)
             );
        end else begin
           assign address_aligned = start_address; 
        end
    endgenerate
    
     
// -----------------------------------------------------------------------------

// increase address and decrease bytecount
assign total_bytecount_left_wire    =   write_burst_bytecount - NUMSYMBOLS;
assign total_bytecount_left         =   total_bytecount_left_wire[PKT_BYTE_CNT_W-1:0];

always_comb
begin
    if (write_cp_startofpacket)
        begin
            write_burst_bytecount   =    total_write_bytecount;
        end
    else 
        begin
            write_burst_bytecount   =    burst_bytecount;
        end
end

always_ff @(posedge aclk, negedge aresetn)
begin
    if (!aresetn)
        begin
            burst_bytecount     <= {PKT_BYTE_CNT_W{1'b0}};
        end
    else
        begin
            if (write_addr_data_both_valid && write_cp_ready)
                begin
                    burst_bytecount     <=    total_bytecount_left;
                end
        end

end

//------------------------------------------------------
// Generate startofpacket ~ beginbursttransfer
// -----------------------------------------------------
reg sop_enable;
always_ff @(posedge aclk, negedge aresetn)
begin
    if (!aresetn)
        begin
            sop_enable <= 1'b1;
        end
    else
        begin
            // sop for write channel
            if (write_addr_data_both_valid && write_cp_ready)
                begin
                    sop_enable <= 1'b0;
                    if (wlast)
                        sop_enable <= 1'b1;
                end
        end
end
            
assign write_cp_startofpacket       = sop_enable;
assign write_cp_endofpacket         = wlast;   
assign read_cp_startofpacket        = 1'b1;
assign read_cp_endofpacket          = 1'b1;   


//--------------------------------------------------------
// AW/WREADY control
//
// Backpresure AWREADY until the data phase is complete
//--------------------------------------------------------
always_comb  
    begin
        awready     = 0;
        wready      = 0;
        if (write_addr_data_both_valid)
            begin
                wready      = network_ready;   
                if (wlast)
                    // allow AWREADY on the last burst cycle
                    awready = network_ready;
            end
    end
    
assign write_cp_valid    = write_addr_data_both_valid;

//--------------------------------------
// Command control for write response packet 
//--------------------------------------
assign bvalid            = write_rp_valid;
assign write_rp_ready    = bready;


//--------------------------------------
// Form write transaction packet
//--------------------------------------
always_comb  
    begin
        write_cp_data                                       = '0;
        write_cp_data[PKT_BYTE_CNT_H :PKT_BYTE_CNT_L ]      = write_burst_bytecount; 
        write_cp_data[PKT_TRANS_EXCLUSIVE            ]      = awlock[0];
        write_cp_data[PKT_TRANS_LOCK                 ]      = '0;
        write_cp_data[PKT_TRANS_COMPRESSED_READ      ]      = '0;
        write_cp_data[PKT_TRANS_READ                 ]      = '0;
        write_cp_data[PKT_TRANS_WRITE                ]      = 1'b1; 
        write_cp_data[PKT_TRANS_POSTED               ]      = '0;
        write_cp_data[PKT_BURSTWRAP_H:PKT_BURSTWRAP_L]      = burstwrap_value_write[PKT_BURSTWRAP_W - 1 : 0];
        write_cp_data[PKT_ADDR_H     :PKT_ADDR_L     ]      = address_aligned;
        write_cp_data[PKT_DATA_H     :PKT_DATA_L     ]      = wdata;
        write_cp_data[PKT_BYTEEN_H   :PKT_BYTEEN_L   ]      = wstrb;
        write_cp_data[PKT_BURST_SIZE_H :PKT_BURST_SIZE_L]   = awsize;
        write_cp_data[PKT_BURST_TYPE_H :PKT_BURST_TYPE_L]   = awburst;
        write_cp_data[PKT_SRC_ID_H   :PKT_SRC_ID_L   ]      = id_int[PKT_SRC_ID_W-1:0];
        write_cp_data[PKT_PROTECTION_H :PKT_PROTECTION_L]   = awprot;
        write_cp_data[PKT_THREAD_ID_H :PKT_THREAD_ID_L]     = awid;
        write_cp_data[PKT_CACHE_H :PKT_CACHE_L]             = awcache;
        write_cp_data[PKT_ADDR_SIDEBAND_H:PKT_ADDR_SIDEBAND_L] = awuser;
		write_cp_data[PKT_ORI_BURST_SIZE_H :PKT_ORI_BURST_SIZE_L] = awsize;
		
        //  AXI4 signals: receive from the translator
        if (AXI_VERSION == "AXI4") begin
            write_cp_data[PKT_QOS_H : PKT_QOS_L]                     = awqos;
            write_cp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L] = wuser;
        end else begin //AXI3: set with default value
            write_cp_data[PKT_QOS_H : PKT_QOS_L]                     = '0;
            write_cp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L] = '0;
        end
        
        // Receive Response packet from the Slave
        bresp = write_rp_data[PKT_RESPONSE_STATUS_H : PKT_RESPONSE_STATUS_L];
        bid   = write_rp_data[PKT_THREAD_ID_H : PKT_THREAD_ID_L];
        // AXI4 signals
        buser = write_rp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L];
    end


//--------------------------------------
// Form read transaction packet 
//--------------------------------------
always_comb  
    begin
        read_cp_data                                        = '0;
        read_cp_data[PKT_BYTE_CNT_H :PKT_BYTE_CNT_L ]       = total_read_bytecount;
        read_cp_data[PKT_TRANS_EXCLUSIVE            ]       = arlock[0];
        read_cp_data[PKT_TRANS_LOCK                 ]       = '0;
        if (AXI_VERSION != "AXI4Lite") begin
            read_cp_data[PKT_TRANS_COMPRESSED_READ] = 1'b1;
        end else begin
            read_cp_data[PKT_TRANS_COMPRESSED_READ] = '0;
        end
        read_cp_data[PKT_TRANS_READ                 ]       = '1;
        read_cp_data[PKT_TRANS_WRITE                ]       = '0;
        read_cp_data[PKT_TRANS_POSTED               ]       = '0;
        read_cp_data[PKT_BURSTWRAP_H:PKT_BURSTWRAP_L]       = burstwrap_value_read[PKT_BURSTWRAP_W - 1 : 0]; 
        read_cp_data[PKT_ADDR_H     :PKT_ADDR_L     ]       = araddr;
        read_cp_data[PKT_DATA_H     :PKT_DATA_L     ]       = '0;
        read_cp_data[PKT_BYTEEN_H   :PKT_BYTEEN_L   ]       = {PKT_BYTEEN_W{1'b1}};
        read_cp_data[PKT_SRC_ID_H   :PKT_SRC_ID_L   ]       = id_int[PKT_SRC_ID_W-1:0];
        read_cp_data[PKT_BURST_SIZE_H :PKT_BURST_SIZE_L]    = arsize;
		read_cp_data[PKT_ORI_BURST_SIZE_H :PKT_ORI_BURST_SIZE_L] = arsize;
        read_cp_data[PKT_BURST_TYPE_H :PKT_BURST_TYPE_L]    = arburst;
        read_cp_data[PKT_PROTECTION_H : PKT_PROTECTION_L]   = arprot;
        read_cp_data[PKT_THREAD_ID_H  : PKT_THREAD_ID_L]    = arid;
        read_cp_data[PKT_CACHE_H  : PKT_CACHE_L]            = arcache;

        read_cp_data[PKT_ADDR_SIDEBAND_H:PKT_ADDR_SIDEBAND_L] = aruser;
        // AXI4 signals: receive from translator
        if (AXI_VERSION == "AXI4") begin
            read_cp_data[PKT_QOS_H : PKT_QOS_L]                     = arqos;
            read_cp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L] = aruser;
        end else begin
            read_cp_data[PKT_QOS_H : PKT_QOS_L]                     = '0;
            read_cp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L] = '0;
        end
        
        // Read data packet from the Slave, connect to rdata
        rdata    = read_rp_data[PKT_DATA_H     :PKT_DATA_L];
        rresp    = read_rp_data[PKT_RESPONSE_STATUS_H : PKT_RESPONSE_STATUS_L];
        rid      = read_rp_data[PKT_THREAD_ID_H : PKT_THREAD_ID_L];
        // AXI4 signals
        ruser    = read_rp_data[PKT_DATA_SIDEBAND_H : PKT_DATA_SIDEBAND_L];
    end

//--------------------------------------
// Command control for read packets
//--------------------------------------
assign    read_cp_valid                 = arvalid;
assign    arready                       = read_cp_ready;

//--------------------------------------
// Command for handling read data
//--------------------------------------
assign rvalid                   = read_rp_valid;
assign read_rp_ready            = rready;
assign rlast                    = read_rp_endofpacket;

//--------------------------------------
// Assertions
//--------------------------------------
// synthesis translate_off
    generate
        if (WRITE_ISSUING_CAPABILITY == 1) begin
            wire write_cmd_accepted;
            wire write_response_accepted;
            wire write_response_count_is_1;
            reg [log2ceil(WRITE_ISSUING_CAPABILITY+1)-1:0] pending_write_response_count;
            reg [log2ceil(WRITE_ISSUING_CAPABILITY+1)-1:0] next_pending_write_response_count;
    
            assign write_cmd_accepted  = write_cp_valid && write_cp_ready && write_cp_endofpacket;
            assign write_response_accepted  = write_rp_valid && write_rp_ready && write_rp_endofpacket;
    
            always_comb
                begin
                    next_pending_write_response_count  = pending_write_response_count;
                    if (write_cmd_accepted)
                        next_pending_write_response_count  = pending_write_response_count + 1'b1;
                    if (write_response_accepted)
                        next_pending_write_response_count  = pending_write_response_count - 1'b1;
                    if (write_cmd_accepted && write_response_accepted)
                        next_pending_write_response_count  = pending_write_response_count;
                end
            always_ff @(posedge aclk, negedge aresetn)
                begin
                    if (!aresetn) begin
                        pending_write_response_count <= '0;
                    end else begin
                        pending_write_response_count <= next_pending_write_response_count;
                    end
                end
            
            assign write_response_count_is_1  = (pending_write_response_count == 1);
            // assertion
            ERROR_WRITE_ISSUING_CAPABILITY_equal_1_but_master_sends_more_commands_or_switch_slave_before_response_back_please_visit_the_parameter:
                assert property (@(posedge aclk)
                    disable iff (!aresetn) !(write_response_count_is_1 && write_cmd_accepted));
            end // if (WRITE_ISSUING_CAPABILITY == 1)
        
        if (READ_ISSUING_CAPABILITY == 1) begin
            wire read_cmd_accepted;
            wire read_response_accepted;
            wire read_response_count_is_1;
    
            reg [log2ceil(READ_ISSUING_CAPABILITY+1)-1:0]  pending_read_response_count;
            reg [log2ceil(READ_ISSUING_CAPABILITY+1)-1:0]  next_pending_read_response_count;
    
            assign read_cmd_accepted  = read_cp_valid && read_cp_ready && read_cp_endofpacket;
            assign read_response_accepted  = read_rp_valid && read_rp_ready && read_rp_endofpacket;
    
            always_comb
                begin
                    next_pending_read_response_count   = pending_read_response_count;
                    if (read_cmd_accepted)
                        next_pending_read_response_count  = pending_read_response_count + 1'b1;
                    if (read_response_accepted)
                        next_pending_read_response_count  = pending_read_response_count - 1'b1;
                    if (read_cmd_accepted && read_response_accepted)
                        next_pending_read_response_count  = pending_read_response_count;
                end
            always_ff @(posedge aclk, negedge aresetn)
                begin
                    if (!aresetn) begin
                        pending_read_response_count  <= '0;
                    end else begin
                        pending_read_response_count  <= next_pending_read_response_count;
                    end
                end
            assign read_response_count_is_1 = (pending_read_response_count == 1);
            ERROR_READ_ISSUING_CAPABILITY_equal_1_but_master_sends_more_commands_or_switch_slave_before_response_back_please_visit_the_parameter:
                assert property (@(posedge aclk)
                    disable iff (!aresetn) !(read_response_count_is_1 && read_cmd_accepted));
        end // if (READ_ISSUING_CAPABILITY == 1)
    endgenerate
    
ERROR_awlock_reserved_value:
    assert property (@(posedge aclk)
        disable iff (!aresetn) ( !(awvalid && awlock == 2'b11) ));

ERROR_arlock_reserved_value:
    assert property (@(posedge aclk)
        disable iff (!aresetn) ( !(arvalid && arlock == 2'b11) ));

// synthesis translate_on
endmodule
