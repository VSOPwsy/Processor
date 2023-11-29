module PriorityEncode #(
	parameter INPUT_NUM = 256
)(
    input [INPUT_NUM-1:0] in,
    output reg [$clog2(INPUT_NUM)-1:0] out,
    output reg none
);
	generate
		if (INPUT_NUM == 256) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else if (in[8]) begin
					out = 8;
					none = 0;
				end
				else if (in[9]) begin
					out = 9;
					none = 0;
				end
				else if (in[10]) begin
					out = 10;
					none = 0;
				end
				else if (in[11]) begin
					out = 11;
					none = 0;
				end
				else if (in[12]) begin
					out = 12;
					none = 0;
				end
				else if (in[13]) begin
					out = 13;
					none = 0;
				end
				else if (in[14]) begin
					out = 14;
					none = 0;
				end
				else if (in[15]) begin
					out = 15;
					none = 0;
				end
				else if (in[16]) begin
					out = 16;
					none = 0;
				end
				else if (in[17]) begin
					out = 17;
					none = 0;
				end
				else if (in[18]) begin
					out = 18;
					none = 0;
				end
				else if (in[19]) begin
					out = 19;
					none = 0;
				end
				else if (in[20]) begin
					out = 20;
					none = 0;
				end
				else if (in[21]) begin
					out = 21;
					none = 0;
				end
				else if (in[22]) begin
					out = 22;
					none = 0;
				end
				else if (in[23]) begin
					out = 23;
					none = 0;
				end
				else if (in[24]) begin
					out = 24;
					none = 0;
				end
				else if (in[25]) begin
					out = 25;
					none = 0;
				end
				else if (in[26]) begin
					out = 26;
					none = 0;
				end
				else if (in[27]) begin
					out = 27;
					none = 0;
				end
				else if (in[28]) begin
					out = 28;
					none = 0;
				end
				else if (in[29]) begin
					out = 29;
					none = 0;
				end
				else if (in[30]) begin
					out = 30;
					none = 0;
				end
				else if (in[31]) begin
					out = 31;
					none = 0;
				end
				else if (in[32]) begin
					out = 32;
					none = 0;
				end
				else if (in[33]) begin
					out = 33;
					none = 0;
				end
				else if (in[34]) begin
					out = 34;
					none = 0;
				end
				else if (in[35]) begin
					out = 35;
					none = 0;
				end
				else if (in[36]) begin
					out = 36;
					none = 0;
				end
				else if (in[37]) begin
					out = 37;
					none = 0;
				end
				else if (in[38]) begin
					out = 38;
					none = 0;
				end
				else if (in[39]) begin
					out = 39;
					none = 0;
				end
				else if (in[40]) begin
					out = 40;
					none = 0;
				end
				else if (in[41]) begin
					out = 41;
					none = 0;
				end
				else if (in[42]) begin
					out = 42;
					none = 0;
				end
				else if (in[43]) begin
					out = 43;
					none = 0;
				end
				else if (in[44]) begin
					out = 44;
					none = 0;
				end
				else if (in[45]) begin
					out = 45;
					none = 0;
				end
				else if (in[46]) begin
					out = 46;
					none = 0;
				end
				else if (in[47]) begin
					out = 47;
					none = 0;
				end
				else if (in[48]) begin
					out = 48;
					none = 0;
				end
				else if (in[49]) begin
					out = 49;
					none = 0;
				end
				else if (in[50]) begin
					out = 50;
					none = 0;
				end
				else if (in[51]) begin
					out = 51;
					none = 0;
				end
				else if (in[52]) begin
					out = 52;
					none = 0;
				end
				else if (in[53]) begin
					out = 53;
					none = 0;
				end
				else if (in[54]) begin
					out = 54;
					none = 0;
				end
				else if (in[55]) begin
					out = 55;
					none = 0;
				end
				else if (in[56]) begin
					out = 56;
					none = 0;
				end
				else if (in[57]) begin
					out = 57;
					none = 0;
				end
				else if (in[58]) begin
					out = 58;
					none = 0;
				end
				else if (in[59]) begin
					out = 59;
					none = 0;
				end
				else if (in[60]) begin
					out = 60;
					none = 0;
				end
				else if (in[61]) begin
					out = 61;
					none = 0;
				end
				else if (in[62]) begin
					out = 62;
					none = 0;
				end
				else if (in[63]) begin
					out = 63;
					none = 0;
				end
				else if (in[64]) begin
					out = 64;
					none = 0;
				end
				else if (in[65]) begin
					out = 65;
					none = 0;
				end
				else if (in[66]) begin
					out = 66;
					none = 0;
				end
				else if (in[67]) begin
					out = 67;
					none = 0;
				end
				else if (in[68]) begin
					out = 68;
					none = 0;
				end
				else if (in[69]) begin
					out = 69;
					none = 0;
				end
				else if (in[70]) begin
					out = 70;
					none = 0;
				end
				else if (in[71]) begin
					out = 71;
					none = 0;
				end
				else if (in[72]) begin
					out = 72;
					none = 0;
				end
				else if (in[73]) begin
					out = 73;
					none = 0;
				end
				else if (in[74]) begin
					out = 74;
					none = 0;
				end
				else if (in[75]) begin
					out = 75;
					none = 0;
				end
				else if (in[76]) begin
					out = 76;
					none = 0;
				end
				else if (in[77]) begin
					out = 77;
					none = 0;
				end
				else if (in[78]) begin
					out = 78;
					none = 0;
				end
				else if (in[79]) begin
					out = 79;
					none = 0;
				end
				else if (in[80]) begin
					out = 80;
					none = 0;
				end
				else if (in[81]) begin
					out = 81;
					none = 0;
				end
				else if (in[82]) begin
					out = 82;
					none = 0;
				end
				else if (in[83]) begin
					out = 83;
					none = 0;
				end
				else if (in[84]) begin
					out = 84;
					none = 0;
				end
				else if (in[85]) begin
					out = 85;
					none = 0;
				end
				else if (in[86]) begin
					out = 86;
					none = 0;
				end
				else if (in[87]) begin
					out = 87;
					none = 0;
				end
				else if (in[88]) begin
					out = 88;
					none = 0;
				end
				else if (in[89]) begin
					out = 89;
					none = 0;
				end
				else if (in[90]) begin
					out = 90;
					none = 0;
				end
				else if (in[91]) begin
					out = 91;
					none = 0;
				end
				else if (in[92]) begin
					out = 92;
					none = 0;
				end
				else if (in[93]) begin
					out = 93;
					none = 0;
				end
				else if (in[94]) begin
					out = 94;
					none = 0;
				end
				else if (in[95]) begin
					out = 95;
					none = 0;
				end
				else if (in[96]) begin
					out = 96;
					none = 0;
				end
				else if (in[97]) begin
					out = 97;
					none = 0;
				end
				else if (in[98]) begin
					out = 98;
					none = 0;
				end
				else if (in[99]) begin
					out = 99;
					none = 0;
				end
				else if (in[100]) begin
					out = 100;
					none = 0;
				end
				else if (in[101]) begin
					out = 101;
					none = 0;
				end
				else if (in[102]) begin
					out = 102;
					none = 0;
				end
				else if (in[103]) begin
					out = 103;
					none = 0;
				end
				else if (in[104]) begin
					out = 104;
					none = 0;
				end
				else if (in[105]) begin
					out = 105;
					none = 0;
				end
				else if (in[106]) begin
					out = 106;
					none = 0;
				end
				else if (in[107]) begin
					out = 107;
					none = 0;
				end
				else if (in[108]) begin
					out = 108;
					none = 0;
				end
				else if (in[109]) begin
					out = 109;
					none = 0;
				end
				else if (in[110]) begin
					out = 110;
					none = 0;
				end
				else if (in[111]) begin
					out = 111;
					none = 0;
				end
				else if (in[112]) begin
					out = 112;
					none = 0;
				end
				else if (in[113]) begin
					out = 113;
					none = 0;
				end
				else if (in[114]) begin
					out = 114;
					none = 0;
				end
				else if (in[115]) begin
					out = 115;
					none = 0;
				end
				else if (in[116]) begin
					out = 116;
					none = 0;
				end
				else if (in[117]) begin
					out = 117;
					none = 0;
				end
				else if (in[118]) begin
					out = 118;
					none = 0;
				end
				else if (in[119]) begin
					out = 119;
					none = 0;
				end
				else if (in[120]) begin
					out = 120;
					none = 0;
				end
				else if (in[121]) begin
					out = 121;
					none = 0;
				end
				else if (in[122]) begin
					out = 122;
					none = 0;
				end
				else if (in[123]) begin
					out = 123;
					none = 0;
				end
				else if (in[124]) begin
					out = 124;
					none = 0;
				end
				else if (in[125]) begin
					out = 125;
					none = 0;
				end
				else if (in[126]) begin
					out = 126;
					none = 0;
				end
				else if (in[127]) begin
					out = 127;
					none = 0;
				end
				else if (in[128]) begin
					out = 128;
					none = 0;
				end
				else if (in[129]) begin
					out = 129;
					none = 0;
				end
				else if (in[130]) begin
					out = 130;
					none = 0;
				end
				else if (in[131]) begin
					out = 131;
					none = 0;
				end
				else if (in[132]) begin
					out = 132;
					none = 0;
				end
				else if (in[133]) begin
					out = 133;
					none = 0;
				end
				else if (in[134]) begin
					out = 134;
					none = 0;
				end
				else if (in[135]) begin
					out = 135;
					none = 0;
				end
				else if (in[136]) begin
					out = 136;
					none = 0;
				end
				else if (in[137]) begin
					out = 137;
					none = 0;
				end
				else if (in[138]) begin
					out = 138;
					none = 0;
				end
				else if (in[139]) begin
					out = 139;
					none = 0;
				end
				else if (in[140]) begin
					out = 140;
					none = 0;
				end
				else if (in[141]) begin
					out = 141;
					none = 0;
				end
				else if (in[142]) begin
					out = 142;
					none = 0;
				end
				else if (in[143]) begin
					out = 143;
					none = 0;
				end
				else if (in[144]) begin
					out = 144;
					none = 0;
				end
				else if (in[145]) begin
					out = 145;
					none = 0;
				end
				else if (in[146]) begin
					out = 146;
					none = 0;
				end
				else if (in[147]) begin
					out = 147;
					none = 0;
				end
				else if (in[148]) begin
					out = 148;
					none = 0;
				end
				else if (in[149]) begin
					out = 149;
					none = 0;
				end
				else if (in[150]) begin
					out = 150;
					none = 0;
				end
				else if (in[151]) begin
					out = 151;
					none = 0;
				end
				else if (in[152]) begin
					out = 152;
					none = 0;
				end
				else if (in[153]) begin
					out = 153;
					none = 0;
				end
				else if (in[154]) begin
					out = 154;
					none = 0;
				end
				else if (in[155]) begin
					out = 155;
					none = 0;
				end
				else if (in[156]) begin
					out = 156;
					none = 0;
				end
				else if (in[157]) begin
					out = 157;
					none = 0;
				end
				else if (in[158]) begin
					out = 158;
					none = 0;
				end
				else if (in[159]) begin
					out = 159;
					none = 0;
				end
				else if (in[160]) begin
					out = 160;
					none = 0;
				end
				else if (in[161]) begin
					out = 161;
					none = 0;
				end
				else if (in[162]) begin
					out = 162;
					none = 0;
				end
				else if (in[163]) begin
					out = 163;
					none = 0;
				end
				else if (in[164]) begin
					out = 164;
					none = 0;
				end
				else if (in[165]) begin
					out = 165;
					none = 0;
				end
				else if (in[166]) begin
					out = 166;
					none = 0;
				end
				else if (in[167]) begin
					out = 167;
					none = 0;
				end
				else if (in[168]) begin
					out = 168;
					none = 0;
				end
				else if (in[169]) begin
					out = 169;
					none = 0;
				end
				else if (in[170]) begin
					out = 170;
					none = 0;
				end
				else if (in[171]) begin
					out = 171;
					none = 0;
				end
				else if (in[172]) begin
					out = 172;
					none = 0;
				end
				else if (in[173]) begin
					out = 173;
					none = 0;
				end
				else if (in[174]) begin
					out = 174;
					none = 0;
				end
				else if (in[175]) begin
					out = 175;
					none = 0;
				end
				else if (in[176]) begin
					out = 176;
					none = 0;
				end
				else if (in[177]) begin
					out = 177;
					none = 0;
				end
				else if (in[178]) begin
					out = 178;
					none = 0;
				end
				else if (in[179]) begin
					out = 179;
					none = 0;
				end
				else if (in[180]) begin
					out = 180;
					none = 0;
				end
				else if (in[181]) begin
					out = 181;
					none = 0;
				end
				else if (in[182]) begin
					out = 182;
					none = 0;
				end
				else if (in[183]) begin
					out = 183;
					none = 0;
				end
				else if (in[184]) begin
					out = 184;
					none = 0;
				end
				else if (in[185]) begin
					out = 185;
					none = 0;
				end
				else if (in[186]) begin
					out = 186;
					none = 0;
				end
				else if (in[187]) begin
					out = 187;
					none = 0;
				end
				else if (in[188]) begin
					out = 188;
					none = 0;
				end
				else if (in[189]) begin
					out = 189;
					none = 0;
				end
				else if (in[190]) begin
					out = 190;
					none = 0;
				end
				else if (in[191]) begin
					out = 191;
					none = 0;
				end
				else if (in[192]) begin
					out = 192;
					none = 0;
				end
				else if (in[193]) begin
					out = 193;
					none = 0;
				end
				else if (in[194]) begin
					out = 194;
					none = 0;
				end
				else if (in[195]) begin
					out = 195;
					none = 0;
				end
				else if (in[196]) begin
					out = 196;
					none = 0;
				end
				else if (in[197]) begin
					out = 197;
					none = 0;
				end
				else if (in[198]) begin
					out = 198;
					none = 0;
				end
				else if (in[199]) begin
					out = 199;
					none = 0;
				end
				else if (in[200]) begin
					out = 200;
					none = 0;
				end
				else if (in[201]) begin
					out = 201;
					none = 0;
				end
				else if (in[202]) begin
					out = 202;
					none = 0;
				end
				else if (in[203]) begin
					out = 203;
					none = 0;
				end
				else if (in[204]) begin
					out = 204;
					none = 0;
				end
				else if (in[205]) begin
					out = 205;
					none = 0;
				end
				else if (in[206]) begin
					out = 206;
					none = 0;
				end
				else if (in[207]) begin
					out = 207;
					none = 0;
				end
				else if (in[208]) begin
					out = 208;
					none = 0;
				end
				else if (in[209]) begin
					out = 209;
					none = 0;
				end
				else if (in[210]) begin
					out = 210;
					none = 0;
				end
				else if (in[211]) begin
					out = 211;
					none = 0;
				end
				else if (in[212]) begin
					out = 212;
					none = 0;
				end
				else if (in[213]) begin
					out = 213;
					none = 0;
				end
				else if (in[214]) begin
					out = 214;
					none = 0;
				end
				else if (in[215]) begin
					out = 215;
					none = 0;
				end
				else if (in[216]) begin
					out = 216;
					none = 0;
				end
				else if (in[217]) begin
					out = 217;
					none = 0;
				end
				else if (in[218]) begin
					out = 218;
					none = 0;
				end
				else if (in[219]) begin
					out = 219;
					none = 0;
				end
				else if (in[220]) begin
					out = 220;
					none = 0;
				end
				else if (in[221]) begin
					out = 221;
					none = 0;
				end
				else if (in[222]) begin
					out = 222;
					none = 0;
				end
				else if (in[223]) begin
					out = 223;
					none = 0;
				end
				else if (in[224]) begin
					out = 224;
					none = 0;
				end
				else if (in[225]) begin
					out = 225;
					none = 0;
				end
				else if (in[226]) begin
					out = 226;
					none = 0;
				end
				else if (in[227]) begin
					out = 227;
					none = 0;
				end
				else if (in[228]) begin
					out = 228;
					none = 0;
				end
				else if (in[229]) begin
					out = 229;
					none = 0;
				end
				else if (in[230]) begin
					out = 230;
					none = 0;
				end
				else if (in[231]) begin
					out = 231;
					none = 0;
				end
				else if (in[232]) begin
					out = 232;
					none = 0;
				end
				else if (in[233]) begin
					out = 233;
					none = 0;
				end
				else if (in[234]) begin
					out = 234;
					none = 0;
				end
				else if (in[235]) begin
					out = 235;
					none = 0;
				end
				else if (in[236]) begin
					out = 236;
					none = 0;
				end
				else if (in[237]) begin
					out = 237;
					none = 0;
				end
				else if (in[238]) begin
					out = 238;
					none = 0;
				end
				else if (in[239]) begin
					out = 239;
					none = 0;
				end
				else if (in[240]) begin
					out = 240;
					none = 0;
				end
				else if (in[241]) begin
					out = 241;
					none = 0;
				end
				else if (in[242]) begin
					out = 242;
					none = 0;
				end
				else if (in[243]) begin
					out = 243;
					none = 0;
				end
				else if (in[244]) begin
					out = 244;
					none = 0;
				end
				else if (in[245]) begin
					out = 245;
					none = 0;
				end
				else if (in[246]) begin
					out = 246;
					none = 0;
				end
				else if (in[247]) begin
					out = 247;
					none = 0;
				end
				else if (in[248]) begin
					out = 248;
					none = 0;
				end
				else if (in[249]) begin
					out = 249;
					none = 0;
				end
				else if (in[250]) begin
					out = 250;
					none = 0;
				end
				else if (in[251]) begin
					out = 251;
					none = 0;
				end
				else if (in[252]) begin
					out = 252;
					none = 0;
				end
				else if (in[253]) begin
					out = 253;
					none = 0;
				end
				else if (in[254]) begin
					out = 254;
					none = 0;
				end
				else if (in[255]) begin
					out = 255;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 127) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else if (in[8]) begin
					out = 8;
					none = 0;
				end
				else if (in[9]) begin
					out = 9;
					none = 0;
				end
				else if (in[10]) begin
					out = 10;
					none = 0;
				end
				else if (in[11]) begin
					out = 11;
					none = 0;
				end
				else if (in[12]) begin
					out = 12;
					none = 0;
				end
				else if (in[13]) begin
					out = 13;
					none = 0;
				end
				else if (in[14]) begin
					out = 14;
					none = 0;
				end
				else if (in[15]) begin
					out = 15;
					none = 0;
				end
				else if (in[16]) begin
					out = 16;
					none = 0;
				end
				else if (in[17]) begin
					out = 17;
					none = 0;
				end
				else if (in[18]) begin
					out = 18;
					none = 0;
				end
				else if (in[19]) begin
					out = 19;
					none = 0;
				end
				else if (in[20]) begin
					out = 20;
					none = 0;
				end
				else if (in[21]) begin
					out = 21;
					none = 0;
				end
				else if (in[22]) begin
					out = 22;
					none = 0;
				end
				else if (in[23]) begin
					out = 23;
					none = 0;
				end
				else if (in[24]) begin
					out = 24;
					none = 0;
				end
				else if (in[25]) begin
					out = 25;
					none = 0;
				end
				else if (in[26]) begin
					out = 26;
					none = 0;
				end
				else if (in[27]) begin
					out = 27;
					none = 0;
				end
				else if (in[28]) begin
					out = 28;
					none = 0;
				end
				else if (in[29]) begin
					out = 29;
					none = 0;
				end
				else if (in[30]) begin
					out = 30;
					none = 0;
				end
				else if (in[31]) begin
					out = 31;
					none = 0;
				end
				else if (in[32]) begin
					out = 32;
					none = 0;
				end
				else if (in[33]) begin
					out = 33;
					none = 0;
				end
				else if (in[34]) begin
					out = 34;
					none = 0;
				end
				else if (in[35]) begin
					out = 35;
					none = 0;
				end
				else if (in[36]) begin
					out = 36;
					none = 0;
				end
				else if (in[37]) begin
					out = 37;
					none = 0;
				end
				else if (in[38]) begin
					out = 38;
					none = 0;
				end
				else if (in[39]) begin
					out = 39;
					none = 0;
				end
				else if (in[40]) begin
					out = 40;
					none = 0;
				end
				else if (in[41]) begin
					out = 41;
					none = 0;
				end
				else if (in[42]) begin
					out = 42;
					none = 0;
				end
				else if (in[43]) begin
					out = 43;
					none = 0;
				end
				else if (in[44]) begin
					out = 44;
					none = 0;
				end
				else if (in[45]) begin
					out = 45;
					none = 0;
				end
				else if (in[46]) begin
					out = 46;
					none = 0;
				end
				else if (in[47]) begin
					out = 47;
					none = 0;
				end
				else if (in[48]) begin
					out = 48;
					none = 0;
				end
				else if (in[49]) begin
					out = 49;
					none = 0;
				end
				else if (in[50]) begin
					out = 50;
					none = 0;
				end
				else if (in[51]) begin
					out = 51;
					none = 0;
				end
				else if (in[52]) begin
					out = 52;
					none = 0;
				end
				else if (in[53]) begin
					out = 53;
					none = 0;
				end
				else if (in[54]) begin
					out = 54;
					none = 0;
				end
				else if (in[55]) begin
					out = 55;
					none = 0;
				end
				else if (in[56]) begin
					out = 56;
					none = 0;
				end
				else if (in[57]) begin
					out = 57;
					none = 0;
				end
				else if (in[58]) begin
					out = 58;
					none = 0;
				end
				else if (in[59]) begin
					out = 59;
					none = 0;
				end
				else if (in[60]) begin
					out = 60;
					none = 0;
				end
				else if (in[61]) begin
					out = 61;
					none = 0;
				end
				else if (in[62]) begin
					out = 62;
					none = 0;
				end
				else if (in[63]) begin
					out = 63;
					none = 0;
				end
				else if (in[64]) begin
					out = 64;
					none = 0;
				end
				else if (in[65]) begin
					out = 65;
					none = 0;
				end
				else if (in[66]) begin
					out = 66;
					none = 0;
				end
				else if (in[67]) begin
					out = 67;
					none = 0;
				end
				else if (in[68]) begin
					out = 68;
					none = 0;
				end
				else if (in[69]) begin
					out = 69;
					none = 0;
				end
				else if (in[70]) begin
					out = 70;
					none = 0;
				end
				else if (in[71]) begin
					out = 71;
					none = 0;
				end
				else if (in[72]) begin
					out = 72;
					none = 0;
				end
				else if (in[73]) begin
					out = 73;
					none = 0;
				end
				else if (in[74]) begin
					out = 74;
					none = 0;
				end
				else if (in[75]) begin
					out = 75;
					none = 0;
				end
				else if (in[76]) begin
					out = 76;
					none = 0;
				end
				else if (in[77]) begin
					out = 77;
					none = 0;
				end
				else if (in[78]) begin
					out = 78;
					none = 0;
				end
				else if (in[79]) begin
					out = 79;
					none = 0;
				end
				else if (in[80]) begin
					out = 80;
					none = 0;
				end
				else if (in[81]) begin
					out = 81;
					none = 0;
				end
				else if (in[82]) begin
					out = 82;
					none = 0;
				end
				else if (in[83]) begin
					out = 83;
					none = 0;
				end
				else if (in[84]) begin
					out = 84;
					none = 0;
				end
				else if (in[85]) begin
					out = 85;
					none = 0;
				end
				else if (in[86]) begin
					out = 86;
					none = 0;
				end
				else if (in[87]) begin
					out = 87;
					none = 0;
				end
				else if (in[88]) begin
					out = 88;
					none = 0;
				end
				else if (in[89]) begin
					out = 89;
					none = 0;
				end
				else if (in[90]) begin
					out = 90;
					none = 0;
				end
				else if (in[91]) begin
					out = 91;
					none = 0;
				end
				else if (in[92]) begin
					out = 92;
					none = 0;
				end
				else if (in[93]) begin
					out = 93;
					none = 0;
				end
				else if (in[94]) begin
					out = 94;
					none = 0;
				end
				else if (in[95]) begin
					out = 95;
					none = 0;
				end
				else if (in[96]) begin
					out = 96;
					none = 0;
				end
				else if (in[97]) begin
					out = 97;
					none = 0;
				end
				else if (in[98]) begin
					out = 98;
					none = 0;
				end
				else if (in[99]) begin
					out = 99;
					none = 0;
				end
				else if (in[100]) begin
					out = 100;
					none = 0;
				end
				else if (in[101]) begin
					out = 101;
					none = 0;
				end
				else if (in[102]) begin
					out = 102;
					none = 0;
				end
				else if (in[103]) begin
					out = 103;
					none = 0;
				end
				else if (in[104]) begin
					out = 104;
					none = 0;
				end
				else if (in[105]) begin
					out = 105;
					none = 0;
				end
				else if (in[106]) begin
					out = 106;
					none = 0;
				end
				else if (in[107]) begin
					out = 107;
					none = 0;
				end
				else if (in[108]) begin
					out = 108;
					none = 0;
				end
				else if (in[109]) begin
					out = 109;
					none = 0;
				end
				else if (in[110]) begin
					out = 110;
					none = 0;
				end
				else if (in[111]) begin
					out = 111;
					none = 0;
				end
				else if (in[112]) begin
					out = 112;
					none = 0;
				end
				else if (in[113]) begin
					out = 113;
					none = 0;
				end
				else if (in[114]) begin
					out = 114;
					none = 0;
				end
				else if (in[115]) begin
					out = 115;
					none = 0;
				end
				else if (in[116]) begin
					out = 116;
					none = 0;
				end
				else if (in[117]) begin
					out = 117;
					none = 0;
				end
				else if (in[118]) begin
					out = 118;
					none = 0;
				end
				else if (in[119]) begin
					out = 119;
					none = 0;
				end
				else if (in[120]) begin
					out = 120;
					none = 0;
				end
				else if (in[121]) begin
					out = 121;
					none = 0;
				end
				else if (in[122]) begin
					out = 122;
					none = 0;
				end
				else if (in[123]) begin
					out = 123;
					none = 0;
				end
				else if (in[124]) begin
					out = 124;
					none = 0;
				end
				else if (in[125]) begin
					out = 125;
					none = 0;
				end
				else if (in[126]) begin
					out = 126;
					none = 0;
				end
				else if (in[127]) begin
					out = 127;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 64) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else if (in[8]) begin
					out = 8;
					none = 0;
				end
				else if (in[9]) begin
					out = 9;
					none = 0;
				end
				else if (in[10]) begin
					out = 10;
					none = 0;
				end
				else if (in[11]) begin
					out = 11;
					none = 0;
				end
				else if (in[12]) begin
					out = 12;
					none = 0;
				end
				else if (in[13]) begin
					out = 13;
					none = 0;
				end
				else if (in[14]) begin
					out = 14;
					none = 0;
				end
				else if (in[15]) begin
					out = 15;
					none = 0;
				end
				else if (in[16]) begin
					out = 16;
					none = 0;
				end
				else if (in[17]) begin
					out = 17;
					none = 0;
				end
				else if (in[18]) begin
					out = 18;
					none = 0;
				end
				else if (in[19]) begin
					out = 19;
					none = 0;
				end
				else if (in[20]) begin
					out = 20;
					none = 0;
				end
				else if (in[21]) begin
					out = 21;
					none = 0;
				end
				else if (in[22]) begin
					out = 22;
					none = 0;
				end
				else if (in[23]) begin
					out = 23;
					none = 0;
				end
				else if (in[24]) begin
					out = 24;
					none = 0;
				end
				else if (in[25]) begin
					out = 25;
					none = 0;
				end
				else if (in[26]) begin
					out = 26;
					none = 0;
				end
				else if (in[27]) begin
					out = 27;
					none = 0;
				end
				else if (in[28]) begin
					out = 28;
					none = 0;
				end
				else if (in[29]) begin
					out = 29;
					none = 0;
				end
				else if (in[30]) begin
					out = 30;
					none = 0;
				end
				else if (in[31]) begin
					out = 31;
					none = 0;
				end
				else if (in[32]) begin
					out = 32;
					none = 0;
				end
				else if (in[33]) begin
					out = 33;
					none = 0;
				end
				else if (in[34]) begin
					out = 34;
					none = 0;
				end
				else if (in[35]) begin
					out = 35;
					none = 0;
				end
				else if (in[36]) begin
					out = 36;
					none = 0;
				end
				else if (in[37]) begin
					out = 37;
					none = 0;
				end
				else if (in[38]) begin
					out = 38;
					none = 0;
				end
				else if (in[39]) begin
					out = 39;
					none = 0;
				end
				else if (in[40]) begin
					out = 40;
					none = 0;
				end
				else if (in[41]) begin
					out = 41;
					none = 0;
				end
				else if (in[42]) begin
					out = 42;
					none = 0;
				end
				else if (in[43]) begin
					out = 43;
					none = 0;
				end
				else if (in[44]) begin
					out = 44;
					none = 0;
				end
				else if (in[45]) begin
					out = 45;
					none = 0;
				end
				else if (in[46]) begin
					out = 46;
					none = 0;
				end
				else if (in[47]) begin
					out = 47;
					none = 0;
				end
				else if (in[48]) begin
					out = 48;
					none = 0;
				end
				else if (in[49]) begin
					out = 49;
					none = 0;
				end
				else if (in[50]) begin
					out = 50;
					none = 0;
				end
				else if (in[51]) begin
					out = 51;
					none = 0;
				end
				else if (in[52]) begin
					out = 52;
					none = 0;
				end
				else if (in[53]) begin
					out = 53;
					none = 0;
				end
				else if (in[54]) begin
					out = 54;
					none = 0;
				end
				else if (in[55]) begin
					out = 55;
					none = 0;
				end
				else if (in[56]) begin
					out = 56;
					none = 0;
				end
				else if (in[57]) begin
					out = 57;
					none = 0;
				end
				else if (in[58]) begin
					out = 58;
					none = 0;
				end
				else if (in[59]) begin
					out = 59;
					none = 0;
				end
				else if (in[60]) begin
					out = 60;
					none = 0;
				end
				else if (in[61]) begin
					out = 61;
					none = 0;
				end
				else if (in[62]) begin
					out = 62;
					none = 0;
				end
				else if (in[63]) begin
					out = 63;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 32) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else if (in[8]) begin
					out = 8;
					none = 0;
				end
				else if (in[9]) begin
					out = 9;
					none = 0;
				end
				else if (in[10]) begin
					out = 10;
					none = 0;
				end
				else if (in[11]) begin
					out = 11;
					none = 0;
				end
				else if (in[12]) begin
					out = 12;
					none = 0;
				end
				else if (in[13]) begin
					out = 13;
					none = 0;
				end
				else if (in[14]) begin
					out = 14;
					none = 0;
				end
				else if (in[15]) begin
					out = 15;
					none = 0;
				end
				else if (in[16]) begin
					out = 16;
					none = 0;
				end
				else if (in[17]) begin
					out = 17;
					none = 0;
				end
				else if (in[18]) begin
					out = 18;
					none = 0;
				end
				else if (in[19]) begin
					out = 19;
					none = 0;
				end
				else if (in[20]) begin
					out = 20;
					none = 0;
				end
				else if (in[21]) begin
					out = 21;
					none = 0;
				end
				else if (in[22]) begin
					out = 22;
					none = 0;
				end
				else if (in[23]) begin
					out = 23;
					none = 0;
				end
				else if (in[24]) begin
					out = 24;
					none = 0;
				end
				else if (in[25]) begin
					out = 25;
					none = 0;
				end
				else if (in[26]) begin
					out = 26;
					none = 0;
				end
				else if (in[27]) begin
					out = 27;
					none = 0;
				end
				else if (in[28]) begin
					out = 28;
					none = 0;
				end
				else if (in[29]) begin
					out = 29;
					none = 0;
				end
				else if (in[30]) begin
					out = 30;
					none = 0;
				end
				else if (in[31]) begin
					out = 31;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 16) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else if (in[8]) begin
					out = 8;
					none = 0;
				end
				else if (in[9]) begin
					out = 9;
					none = 0;
				end
				else if (in[10]) begin
					out = 10;
					none = 0;
				end
				else if (in[11]) begin
					out = 11;
					none = 0;
				end
				else if (in[12]) begin
					out = 12;
					none = 0;
				end
				else if (in[13]) begin
					out = 13;
					none = 0;
				end
				else if (in[14]) begin
					out = 14;
					none = 0;
				end
				else if (in[15]) begin
					out = 15;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 8) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else if (in[4]) begin
					out = 4;
					none = 0;
				end
				else if (in[5]) begin
					out = 5;
					none = 0;
				end
				else if (in[6]) begin
					out = 6;
					none = 0;
				end
				else if (in[7]) begin
					out = 7;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
    		end
		end
		else if (INPUT_NUM == 4) begin
			always @(*) begin
				if (in[0]) begin
					out = 0;
					none = 0;
				end
				else if (in[1]) begin
					out = 1;
					none = 0;
				end
				else if (in[2]) begin
					out = 2;
					none = 0;
				end
				else if (in[3]) begin
					out = 3;
					none = 0;
				end
				else begin
					out = 0;
					none = 1;
				end
			end
		end
	endgenerate
endmodule