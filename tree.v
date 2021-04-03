module tree( 
    input wire clk,
    input wire reset,
    input wire next_branch_0,
    input wire next_branch_1,
    input wire next_branch_2,
    input wire next_branch_3,
    input wire next_branch_4,
    input wire next_branch_5,
    input wire next_branch_6,
    input wire next_branch_7,
    input wire next_branch_8,
    input wire next_branch_9,
    output wire [10:0] next_feature_1,
    output wire [10:0] next_feature_2,
    output wire [10:0] next_feature_3,
    output wire [10:0] next_feature_4,
    output wire [10:0] next_feature_5,
    output wire [10:0] next_feature_6,
    output wire [10:0] next_feature_7,
    output wire [10:0] next_feature_8,
    output wire [10:0] next_feature_9,
    output wire [10:0] result_index
);

reg [10:0] node_index[9:0];
assign result_index = node_index[9] - 10'd1023;
assign next_feature_1 = node_index[0];
assign next_feature_2 = node_index[1];
assign next_feature_3 = node_index[2];
assign next_feature_4 = node_index[3];
assign next_feature_5 = node_index[4];
assign next_feature_6 = node_index[5];
assign next_feature_7 = node_index[6];
assign next_feature_8 = node_index[7];
assign next_feature_9 = node_index[8];

always @(negedge clk) begin
    if (reset == 1'b1) begin
        node_index[0] <= 11'd0;
        node_index[1] <= 11'd0;
        node_index[2] <= 11'd0;
        node_index[3] <= 11'd0;
        node_index[4] <= 11'd0;
        node_index[5] <= 11'd0;
        node_index[6] <= 11'd0;
        node_index[7] <= 11'd0;
        node_index[8] <= 11'd0;
        node_index[9] <= 11'd0;
    end else begin
        node_index[0] <= 11'd1 + {10'd0, next_branch_0};
        node_index[1] <= (node_index[0] << 1) + 11'd1 + {10'd0, next_branch_1};
        node_index[2] <= (node_index[1] << 1) + 11'd1 + {10'd0, next_branch_2};
        node_index[3] <= (node_index[2] << 1) + 11'd1 + {10'd0, next_branch_3};
        node_index[4] <= (node_index[3] << 1) + 11'd1 + {10'd0, next_branch_4};
        node_index[5] <= (node_index[4] << 1) + 11'd1 + {10'd0, next_branch_5};
        node_index[6] <= (node_index[5] << 1) + 11'd1 + {10'd0, next_branch_6};
        node_index[7] <= (node_index[6] << 1) + 11'd1 + {10'd0, next_branch_7};
        node_index[8] <= (node_index[7] << 1) + 11'd1 + {10'd0, next_branch_8};
        node_index[9] <= (node_index[8] << 1) + 11'd1 + {10'd0, next_branch_9};
    end
end
endmodule
