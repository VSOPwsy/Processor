module PriorityEncoder #(
	parameter INPUT_NUM = 256
)(
    input [INPUT_NUM-1:0] in,
    output reg [$clog2(INPUT_NUM)-1:0] out,
    output reg none
);
	generate
		if (INPUT_NUM == 256) begin
			always @(*) begin
				casex (in)
					1'b1: begin
						out = 0;
						none = 0;
					end
					{1'b1,{1{1'bx}}}: begin
						out = 1;
						none = 0;
					end
					{1'b1,{2{1'bx}}}: begin
						out = 2;
						none = 0;
					end
					{1'b1,{3{1'bx}}}: begin
						out = 3;
						none = 0;
					end
					{1'b1,{4{1'bx}}}: begin
						out = 4;
						none = 0;
					end
					{1'b1,{5{1'bx}}}: begin
						out = 5;
						none = 0;
					end
					{1'b1,{6{1'bx}}}: begin
						out = 6;
						none = 0;
					end
					{1'b1,{7{1'bx}}}: begin
						out = 7;
						none = 0;
					end
					{1'b1,{8{1'bx}}}: begin
						out = 8;
						none = 0;
					end
					{1'b1,{9{1'bx}}}: begin
						out = 9;
						none = 0;
					end
					{1'b1,{10{1'bx}}}: begin
						out = 10;
						none = 0;
					end
					{1'b1,{11{1'bx}}}: begin
						out = 11;
						none = 0;
					end
					{1'b1,{12{1'bx}}}: begin
						out = 12;
						none = 0;
					end
					{1'b1,{13{1'bx}}}: begin
						out = 13;
						none = 0;
					end
					{1'b1,{14{1'bx}}}: begin
						out = 14;
						none = 0;
					end
					{1'b1,{15{1'bx}}}: begin
						out = 15;
						none = 0;
					end
					{1'b1,{16{1'bx}}}: begin
						out = 16;
						none = 0;
					end
					{1'b1,{17{1'bx}}}: begin
						out = 17;
						none = 0;
					end
					{1'b1,{18{1'bx}}}: begin
						out = 18;
						none = 0;
					end
					{1'b1,{19{1'bx}}}: begin
						out = 19;
						none = 0;
					end
					{1'b1,{20{1'bx}}}: begin
						out = 20;
						none = 0;
					end
					{1'b1,{21{1'bx}}}: begin
						out = 21;
						none = 0;
					end
					{1'b1,{22{1'bx}}}: begin
						out = 22;
						none = 0;
					end
					{1'b1,{23{1'bx}}}: begin
						out = 23;
						none = 0;
					end
					{1'b1,{24{1'bx}}}: begin
						out = 24;
						none = 0;
					end
					{1'b1,{25{1'bx}}}: begin
						out = 25;
						none = 0;
					end
					{1'b1,{26{1'bx}}}: begin
						out = 26;
						none = 0;
					end
					{1'b1,{27{1'bx}}}: begin
						out = 27;
						none = 0;
					end
					{1'b1,{28{1'bx}}}: begin
						out = 28;
						none = 0;
					end
					{1'b1,{29{1'bx}}}: begin
						out = 29;
						none = 0;
					end
					{1'b1,{30{1'bx}}}: begin
						out = 30;
						none = 0;
					end
					{1'b1,{31{1'bx}}}: begin
						out = 31;
						none = 0;
					end
					{1'b1,{32{1'bx}}}: begin
						out = 32;
						none = 0;
					end
					{1'b1,{33{1'bx}}}: begin
						out = 33;
						none = 0;
					end
					{1'b1,{34{1'bx}}}: begin
						out = 34;
						none = 0;
					end
					{1'b1,{35{1'bx}}}: begin
						out = 35;
						none = 0;
					end
					{1'b1,{36{1'bx}}}: begin
						out = 36;
						none = 0;
					end
					{1'b1,{37{1'bx}}}: begin
						out = 37;
						none = 0;
					end
					{1'b1,{38{1'bx}}}: begin
						out = 38;
						none = 0;
					end
					{1'b1,{39{1'bx}}}: begin
						out = 39;
						none = 0;
					end
					{1'b1,{40{1'bx}}}: begin
						out = 40;
						none = 0;
					end
					{1'b1,{41{1'bx}}}: begin
						out = 41;
						none = 0;
					end
					{1'b1,{42{1'bx}}}: begin
						out = 42;
						none = 0;
					end
					{1'b1,{43{1'bx}}}: begin
						out = 43;
						none = 0;
					end
					{1'b1,{44{1'bx}}}: begin
						out = 44;
						none = 0;
					end
					{1'b1,{45{1'bx}}}: begin
						out = 45;
						none = 0;
					end
					{1'b1,{46{1'bx}}}: begin
						out = 46;
						none = 0;
					end
					{1'b1,{47{1'bx}}}: begin
						out = 47;
						none = 0;
					end
					{1'b1,{48{1'bx}}}: begin
						out = 48;
						none = 0;
					end
					{1'b1,{49{1'bx}}}: begin
						out = 49;
						none = 0;
					end
					{1'b1,{50{1'bx}}}: begin
						out = 50;
						none = 0;
					end
					{1'b1,{51{1'bx}}}: begin
						out = 51;
						none = 0;
					end
					{1'b1,{52{1'bx}}}: begin
						out = 52;
						none = 0;
					end
					{1'b1,{53{1'bx}}}: begin
						out = 53;
						none = 0;
					end
					{1'b1,{54{1'bx}}}: begin
						out = 54;
						none = 0;
					end
					{1'b1,{55{1'bx}}}: begin
						out = 55;
						none = 0;
					end
					{1'b1,{56{1'bx}}}: begin
						out = 56;
						none = 0;
					end
					{1'b1,{57{1'bx}}}: begin
						out = 57;
						none = 0;
					end
					{1'b1,{58{1'bx}}}: begin
						out = 58;
						none = 0;
					end
					{1'b1,{59{1'bx}}}: begin
						out = 59;
						none = 0;
					end
					{1'b1,{60{1'bx}}}: begin
						out = 60;
						none = 0;
					end
					{1'b1,{61{1'bx}}}: begin
						out = 61;
						none = 0;
					end
					{1'b1,{62{1'bx}}}: begin
						out = 62;
						none = 0;
					end
					{1'b1,{63{1'bx}}}: begin
						out = 63;
						none = 0;
					end
					{1'b1,{64{1'bx}}}: begin
						out = 64;
						none = 0;
					end
					{1'b1,{65{1'bx}}}: begin
						out = 65;
						none = 0;
					end
					{1'b1,{66{1'bx}}}: begin
						out = 66;
						none = 0;
					end
					{1'b1,{67{1'bx}}}: begin
						out = 67;
						none = 0;
					end
					{1'b1,{68{1'bx}}}: begin
						out = 68;
						none = 0;
					end
					{1'b1,{69{1'bx}}}: begin
						out = 69;
						none = 0;
					end
					{1'b1,{70{1'bx}}}: begin
						out = 70;
						none = 0;
					end
					{1'b1,{71{1'bx}}}: begin
						out = 71;
						none = 0;
					end
					{1'b1,{72{1'bx}}}: begin
						out = 72;
						none = 0;
					end
					{1'b1,{73{1'bx}}}: begin
						out = 73;
						none = 0;
					end
					{1'b1,{74{1'bx}}}: begin
						out = 74;
						none = 0;
					end
					{1'b1,{75{1'bx}}}: begin
						out = 75;
						none = 0;
					end
					{1'b1,{76{1'bx}}}: begin
						out = 76;
						none = 0;
					end
					{1'b1,{77{1'bx}}}: begin
						out = 77;
						none = 0;
					end
					{1'b1,{78{1'bx}}}: begin
						out = 78;
						none = 0;
					end
					{1'b1,{79{1'bx}}}: begin
						out = 79;
						none = 0;
					end
					{1'b1,{80{1'bx}}}: begin
						out = 80;
						none = 0;
					end
					{1'b1,{81{1'bx}}}: begin
						out = 81;
						none = 0;
					end
					{1'b1,{82{1'bx}}}: begin
						out = 82;
						none = 0;
					end
					{1'b1,{83{1'bx}}}: begin
						out = 83;
						none = 0;
					end
					{1'b1,{84{1'bx}}}: begin
						out = 84;
						none = 0;
					end
					{1'b1,{85{1'bx}}}: begin
						out = 85;
						none = 0;
					end
					{1'b1,{86{1'bx}}}: begin
						out = 86;
						none = 0;
					end
					{1'b1,{87{1'bx}}}: begin
						out = 87;
						none = 0;
					end
					{1'b1,{88{1'bx}}}: begin
						out = 88;
						none = 0;
					end
					{1'b1,{89{1'bx}}}: begin
						out = 89;
						none = 0;
					end
					{1'b1,{90{1'bx}}}: begin
						out = 90;
						none = 0;
					end
					{1'b1,{91{1'bx}}}: begin
						out = 91;
						none = 0;
					end
					{1'b1,{92{1'bx}}}: begin
						out = 92;
						none = 0;
					end
					{1'b1,{93{1'bx}}}: begin
						out = 93;
						none = 0;
					end
					{1'b1,{94{1'bx}}}: begin
						out = 94;
						none = 0;
					end
					{1'b1,{95{1'bx}}}: begin
						out = 95;
						none = 0;
					end
					{1'b1,{96{1'bx}}}: begin
						out = 96;
						none = 0;
					end
					{1'b1,{97{1'bx}}}: begin
						out = 97;
						none = 0;
					end
					{1'b1,{98{1'bx}}}: begin
						out = 98;
						none = 0;
					end
					{1'b1,{99{1'bx}}}: begin
						out = 99;
						none = 0;
					end
					{1'b1,{100{1'bx}}}: begin
						out = 100;
						none = 0;
					end
					{1'b1,{101{1'bx}}}: begin
						out = 101;
						none = 0;
					end
					{1'b1,{102{1'bx}}}: begin
						out = 102;
						none = 0;
					end
					{1'b1,{103{1'bx}}}: begin
						out = 103;
						none = 0;
					end
					{1'b1,{104{1'bx}}}: begin
						out = 104;
						none = 0;
					end
					{1'b1,{105{1'bx}}}: begin
						out = 105;
						none = 0;
					end
					{1'b1,{106{1'bx}}}: begin
						out = 106;
						none = 0;
					end
					{1'b1,{107{1'bx}}}: begin
						out = 107;
						none = 0;
					end
					{1'b1,{108{1'bx}}}: begin
						out = 108;
						none = 0;
					end
					{1'b1,{109{1'bx}}}: begin
						out = 109;
						none = 0;
					end
					{1'b1,{110{1'bx}}}: begin
						out = 110;
						none = 0;
					end
					{1'b1,{111{1'bx}}}: begin
						out = 111;
						none = 0;
					end
					{1'b1,{112{1'bx}}}: begin
						out = 112;
						none = 0;
					end
					{1'b1,{113{1'bx}}}: begin
						out = 113;
						none = 0;
					end
					{1'b1,{114{1'bx}}}: begin
						out = 114;
						none = 0;
					end
					{1'b1,{115{1'bx}}}: begin
						out = 115;
						none = 0;
					end
					{1'b1,{116{1'bx}}}: begin
						out = 116;
						none = 0;
					end
					{1'b1,{117{1'bx}}}: begin
						out = 117;
						none = 0;
					end
					{1'b1,{118{1'bx}}}: begin
						out = 118;
						none = 0;
					end
					{1'b1,{119{1'bx}}}: begin
						out = 119;
						none = 0;
					end
					{1'b1,{120{1'bx}}}: begin
						out = 120;
						none = 0;
					end
					{1'b1,{121{1'bx}}}: begin
						out = 121;
						none = 0;
					end
					{1'b1,{122{1'bx}}}: begin
						out = 122;
						none = 0;
					end
					{1'b1,{123{1'bx}}}: begin
						out = 123;
						none = 0;
					end
					{1'b1,{124{1'bx}}}: begin
						out = 124;
						none = 0;
					end
					{1'b1,{125{1'bx}}}: begin
						out = 125;
						none = 0;
					end
					{1'b1,{126{1'bx}}}: begin
						out = 126;
						none = 0;
					end
					{1'b1,{127{1'bx}}}: begin
						out = 127;
						none = 0;
					end
					{1'b1,{128{1'bx}}}: begin
						out = 128;
						none = 0;
					end
					{1'b1,{129{1'bx}}}: begin
						out = 129;
						none = 0;
					end
					{1'b1,{130{1'bx}}}: begin
						out = 130;
						none = 0;
					end
					{1'b1,{131{1'bx}}}: begin
						out = 131;
						none = 0;
					end
					{1'b1,{132{1'bx}}}: begin
						out = 132;
						none = 0;
					end
					{1'b1,{133{1'bx}}}: begin
						out = 133;
						none = 0;
					end
					{1'b1,{134{1'bx}}}: begin
						out = 134;
						none = 0;
					end
					{1'b1,{135{1'bx}}}: begin
						out = 135;
						none = 0;
					end
					{1'b1,{136{1'bx}}}: begin
						out = 136;
						none = 0;
					end
					{1'b1,{137{1'bx}}}: begin
						out = 137;
						none = 0;
					end
					{1'b1,{138{1'bx}}}: begin
						out = 138;
						none = 0;
					end
					{1'b1,{139{1'bx}}}: begin
						out = 139;
						none = 0;
					end
					{1'b1,{140{1'bx}}}: begin
						out = 140;
						none = 0;
					end
					{1'b1,{141{1'bx}}}: begin
						out = 141;
						none = 0;
					end
					{1'b1,{142{1'bx}}}: begin
						out = 142;
						none = 0;
					end
					{1'b1,{143{1'bx}}}: begin
						out = 143;
						none = 0;
					end
					{1'b1,{144{1'bx}}}: begin
						out = 144;
						none = 0;
					end
					{1'b1,{145{1'bx}}}: begin
						out = 145;
						none = 0;
					end
					{1'b1,{146{1'bx}}}: begin
						out = 146;
						none = 0;
					end
					{1'b1,{147{1'bx}}}: begin
						out = 147;
						none = 0;
					end
					{1'b1,{148{1'bx}}}: begin
						out = 148;
						none = 0;
					end
					{1'b1,{149{1'bx}}}: begin
						out = 149;
						none = 0;
					end
					{1'b1,{150{1'bx}}}: begin
						out = 150;
						none = 0;
					end
					{1'b1,{151{1'bx}}}: begin
						out = 151;
						none = 0;
					end
					{1'b1,{152{1'bx}}}: begin
						out = 152;
						none = 0;
					end
					{1'b1,{153{1'bx}}}: begin
						out = 153;
						none = 0;
					end
					{1'b1,{154{1'bx}}}: begin
						out = 154;
						none = 0;
					end
					{1'b1,{155{1'bx}}}: begin
						out = 155;
						none = 0;
					end
					{1'b1,{156{1'bx}}}: begin
						out = 156;
						none = 0;
					end
					{1'b1,{157{1'bx}}}: begin
						out = 157;
						none = 0;
					end
					{1'b1,{158{1'bx}}}: begin
						out = 158;
						none = 0;
					end
					{1'b1,{159{1'bx}}}: begin
						out = 159;
						none = 0;
					end
					{1'b1,{160{1'bx}}}: begin
						out = 160;
						none = 0;
					end
					{1'b1,{161{1'bx}}}: begin
						out = 161;
						none = 0;
					end
					{1'b1,{162{1'bx}}}: begin
						out = 162;
						none = 0;
					end
					{1'b1,{163{1'bx}}}: begin
						out = 163;
						none = 0;
					end
					{1'b1,{164{1'bx}}}: begin
						out = 164;
						none = 0;
					end
					{1'b1,{165{1'bx}}}: begin
						out = 165;
						none = 0;
					end
					{1'b1,{166{1'bx}}}: begin
						out = 166;
						none = 0;
					end
					{1'b1,{167{1'bx}}}: begin
						out = 167;
						none = 0;
					end
					{1'b1,{168{1'bx}}}: begin
						out = 168;
						none = 0;
					end
					{1'b1,{169{1'bx}}}: begin
						out = 169;
						none = 0;
					end
					{1'b1,{170{1'bx}}}: begin
						out = 170;
						none = 0;
					end
					{1'b1,{171{1'bx}}}: begin
						out = 171;
						none = 0;
					end
					{1'b1,{172{1'bx}}}: begin
						out = 172;
						none = 0;
					end
					{1'b1,{173{1'bx}}}: begin
						out = 173;
						none = 0;
					end
					{1'b1,{174{1'bx}}}: begin
						out = 174;
						none = 0;
					end
					{1'b1,{175{1'bx}}}: begin
						out = 175;
						none = 0;
					end
					{1'b1,{176{1'bx}}}: begin
						out = 176;
						none = 0;
					end
					{1'b1,{177{1'bx}}}: begin
						out = 177;
						none = 0;
					end
					{1'b1,{178{1'bx}}}: begin
						out = 178;
						none = 0;
					end
					{1'b1,{179{1'bx}}}: begin
						out = 179;
						none = 0;
					end
					{1'b1,{180{1'bx}}}: begin
						out = 180;
						none = 0;
					end
					{1'b1,{181{1'bx}}}: begin
						out = 181;
						none = 0;
					end
					{1'b1,{182{1'bx}}}: begin
						out = 182;
						none = 0;
					end
					{1'b1,{183{1'bx}}}: begin
						out = 183;
						none = 0;
					end
					{1'b1,{184{1'bx}}}: begin
						out = 184;
						none = 0;
					end
					{1'b1,{185{1'bx}}}: begin
						out = 185;
						none = 0;
					end
					{1'b1,{186{1'bx}}}: begin
						out = 186;
						none = 0;
					end
					{1'b1,{187{1'bx}}}: begin
						out = 187;
						none = 0;
					end
					{1'b1,{188{1'bx}}}: begin
						out = 188;
						none = 0;
					end
					{1'b1,{189{1'bx}}}: begin
						out = 189;
						none = 0;
					end
					{1'b1,{190{1'bx}}}: begin
						out = 190;
						none = 0;
					end
					{1'b1,{191{1'bx}}}: begin
						out = 191;
						none = 0;
					end
					{1'b1,{192{1'bx}}}: begin
						out = 192;
						none = 0;
					end
					{1'b1,{193{1'bx}}}: begin
						out = 193;
						none = 0;
					end
					{1'b1,{194{1'bx}}}: begin
						out = 194;
						none = 0;
					end
					{1'b1,{195{1'bx}}}: begin
						out = 195;
						none = 0;
					end
					{1'b1,{196{1'bx}}}: begin
						out = 196;
						none = 0;
					end
					{1'b1,{197{1'bx}}}: begin
						out = 197;
						none = 0;
					end
					{1'b1,{198{1'bx}}}: begin
						out = 198;
						none = 0;
					end
					{1'b1,{199{1'bx}}}: begin
						out = 199;
						none = 0;
					end
					{1'b1,{200{1'bx}}}: begin
						out = 200;
						none = 0;
					end
					{1'b1,{201{1'bx}}}: begin
						out = 201;
						none = 0;
					end
					{1'b1,{202{1'bx}}}: begin
						out = 202;
						none = 0;
					end
					{1'b1,{203{1'bx}}}: begin
						out = 203;
						none = 0;
					end
					{1'b1,{204{1'bx}}}: begin
						out = 204;
						none = 0;
					end
					{1'b1,{205{1'bx}}}: begin
						out = 205;
						none = 0;
					end
					{1'b1,{206{1'bx}}}: begin
						out = 206;
						none = 0;
					end
					{1'b1,{207{1'bx}}}: begin
						out = 207;
						none = 0;
					end
					{1'b1,{208{1'bx}}}: begin
						out = 208;
						none = 0;
					end
					{1'b1,{209{1'bx}}}: begin
						out = 209;
						none = 0;
					end
					{1'b1,{210{1'bx}}}: begin
						out = 210;
						none = 0;
					end
					{1'b1,{211{1'bx}}}: begin
						out = 211;
						none = 0;
					end
					{1'b1,{212{1'bx}}}: begin
						out = 212;
						none = 0;
					end
					{1'b1,{213{1'bx}}}: begin
						out = 213;
						none = 0;
					end
					{1'b1,{214{1'bx}}}: begin
						out = 214;
						none = 0;
					end
					{1'b1,{215{1'bx}}}: begin
						out = 215;
						none = 0;
					end
					{1'b1,{216{1'bx}}}: begin
						out = 216;
						none = 0;
					end
					{1'b1,{217{1'bx}}}: begin
						out = 217;
						none = 0;
					end
					{1'b1,{218{1'bx}}}: begin
						out = 218;
						none = 0;
					end
					{1'b1,{219{1'bx}}}: begin
						out = 219;
						none = 0;
					end
					{1'b1,{220{1'bx}}}: begin
						out = 220;
						none = 0;
					end
					{1'b1,{221{1'bx}}}: begin
						out = 221;
						none = 0;
					end
					{1'b1,{222{1'bx}}}: begin
						out = 222;
						none = 0;
					end
					{1'b1,{223{1'bx}}}: begin
						out = 223;
						none = 0;
					end
					{1'b1,{224{1'bx}}}: begin
						out = 224;
						none = 0;
					end
					{1'b1,{225{1'bx}}}: begin
						out = 225;
						none = 0;
					end
					{1'b1,{226{1'bx}}}: begin
						out = 226;
						none = 0;
					end
					{1'b1,{227{1'bx}}}: begin
						out = 227;
						none = 0;
					end
					{1'b1,{228{1'bx}}}: begin
						out = 228;
						none = 0;
					end
					{1'b1,{229{1'bx}}}: begin
						out = 229;
						none = 0;
					end
					{1'b1,{230{1'bx}}}: begin
						out = 230;
						none = 0;
					end
					{1'b1,{231{1'bx}}}: begin
						out = 231;
						none = 0;
					end
					{1'b1,{232{1'bx}}}: begin
						out = 232;
						none = 0;
					end
					{1'b1,{233{1'bx}}}: begin
						out = 233;
						none = 0;
					end
					{1'b1,{234{1'bx}}}: begin
						out = 234;
						none = 0;
					end
					{1'b1,{235{1'bx}}}: begin
						out = 235;
						none = 0;
					end
					{1'b1,{236{1'bx}}}: begin
						out = 236;
						none = 0;
					end
					{1'b1,{237{1'bx}}}: begin
						out = 237;
						none = 0;
					end
					{1'b1,{238{1'bx}}}: begin
						out = 238;
						none = 0;
					end
					{1'b1,{239{1'bx}}}: begin
						out = 239;
						none = 0;
					end
					{1'b1,{240{1'bx}}}: begin
						out = 240;
						none = 0;
					end
					{1'b1,{241{1'bx}}}: begin
						out = 241;
						none = 0;
					end
					{1'b1,{242{1'bx}}}: begin
						out = 242;
						none = 0;
					end
					{1'b1,{243{1'bx}}}: begin
						out = 243;
						none = 0;
					end
					{1'b1,{244{1'bx}}}: begin
						out = 244;
						none = 0;
					end
					{1'b1,{245{1'bx}}}: begin
						out = 245;
						none = 0;
					end
					{1'b1,{246{1'bx}}}: begin
						out = 246;
						none = 0;
					end
					{1'b1,{247{1'bx}}}: begin
						out = 247;
						none = 0;
					end
					{1'b1,{248{1'bx}}}: begin
						out = 248;
						none = 0;
					end
					{1'b1,{249{1'bx}}}: begin
						out = 249;
						none = 0;
					end
					{1'b1,{250{1'bx}}}: begin
						out = 250;
						none = 0;
					end
					{1'b1,{251{1'bx}}}: begin
						out = 251;
						none = 0;
					end
					{1'b1,{252{1'bx}}}: begin
						out = 252;
						none = 0;
					end
					{1'b1,{253{1'bx}}}: begin
						out = 253;
						none = 0;
					end
					{1'b1,{254{1'bx}}}: begin
						out = 254;
						none = 0;
					end
					{1'b1,{255{1'bx}}}: begin
						out = 255;
						none = 0;
					end
					default: begin
						out = 255;
						none = 1;
					end
				endcase
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