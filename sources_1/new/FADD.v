//���������Ϸ���ʹ����һЩ���Ϸ��Ĳ�������NaN�����������
//���磺���������󸡵�������ʱ����������ķ�������ֹ����ͱ������㣨�����ֵ��Ϊ�������
//���磺���������С��������Сʱ����������ķ����н���С��������Ϊ0����һ��С��2^Emin�ķǹ������ʾ��С�������ȷ�ʽ����
module FADD (
    input clk,
    input rst,
    input [31:0] x,y,
    input [1:0] round,
    output reg [31:0] z,
    output reg [2:0] error,
    output reg [1:0] overflow
);
    parameter START = 3'b000, EQUALEXP = 3'b001, ADDM = 3'b010, NORMAL = 3'b011, ROUND = 3'b100, WAIT = 3'b101;
    reg [24:0] m_x,m_y,m_z;
    reg [24:0] m_z_temp;
    reg [7:0] exponent_x,exponent_y,exponent_z;
    reg sign_z;
    wire sign_x,sign_y;
    reg [23:0] out_z,mid_z,out_z_temp;
    reg [1:0] bigger;
    reg [4:0] first_one_bit;
    reg [2:0] next, state;
    reg [1:0] zero;
    reg signed [8:0] delta_e;
    reg [1:0] big_delta_e;
    wire [4:0] bit4,bit3,bit2,bit1;
    wire [48:0] temp;
    reg [31:0] z_temp;
    reg input_change,flag,flag_;
    wire new;
    // reg try;
 
//============================״̬��ת�������߼�====================================
    always@(posedge clk or posedge rst) begin
        if(rst) begin state <= WAIT;end
        else begin state <= next;end
    end
 
//============================����1�������ݵ����flag�ź�====================================
    always@(x,y,round,rst) begin
        if(rst) begin
            input_change = 0;
        end
        else begin
        input_change = ~input_change;
        end
    end
 
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            flag <= 0;
            flag_ <= 0;
        end
        else begin
            flag <= input_change;
            flag_ <= flag;
        end
    end
 
    assign new = flag ^ flag_;
 
//============================ADDM״̬�µ�β��������߼�====================================
    always@(*)begin//ADDM
        {m_z_temp,out_z_temp} = 0;
        if(state == ADDM) begin
            if(sign_x ^ sign_y)begin//������
                if(bigger == 2'b01)begin//xָ������y
                    {m_z_temp,out_z_temp} = {m_x,24'd0} - {m_y,out_z};
                end
                else if(bigger == 2'b10)begin//yָ������x
                    {m_z_temp,out_z_temp} = {m_y,24'd0} - {m_x,out_z};
                end
                else if(bigger == 2'b00)begin
                    m_z_temp = (m_x > m_y)?(m_x - m_y):(m_y - m_x);
                end
            end
            else begin
                m_z_temp = m_x + m_y;
            end
        end
    end
//============================ROUND״̬�µ����ֵ��������߼�====================================
    always@(*)begin//ROUND
        z_temp = 0;
        if(state == ROUND) begin
            //------������0���------
            if(zero) begin
                if(zero == 2'b10)begin
                    z_temp = {sign_y,exponent_y[7:0],m_y[22:0]};
                end
                else if(zero == 2'b01)begin
                    z_temp = {sign_x,exponent_x[7:0],m_x[22:0]};
                end
            end
            //------ָ�����ϴ����------
            else if(big_delta_e) begin
                if(big_delta_e == 2'b01) begin//yԶ����x
                    case(round)
                        2'b00:begin//��0����
                            if(sign_y ^ sign_x==1)begin//���
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin//ͬ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                        2'b01:begin//������������루��ż�����룩
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b10:begin//�������������
                            if(sign_x)begin//xΪ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//�����������
                            if(!sign_x)begin//xΪ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                        end
                    endcase
                end
                else if(big_delta_e == 2'b10)begin//xԶ����y
                    case(round)
                        2'b00:begin//��0����
                            if(sign_y ^ sign_x==1)begin//���
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin//ͬ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                        2'b01:begin//������������루��ż�����룩
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b10:begin//�������������
                            if(sign_y)begin//yΪ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//�����������
                            if(!sign_y)begin//yΪ��
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]-23'b1};
                            end
                        end
                    endcase
                end
            end
            //------�������------
            else if((error == 0) && (overflow == 0)) begin
                if(out_z)begin//Ҫ��������
                    case(round)
                        2'b00:begin//��0����
                            z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                        end
                        2'b01:begin//������������루��ż�����룩
                            if(out_z > mid_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else if(out_z < mid_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else if(m_z[0] == 0)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b10:begin//�������������
                            if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                        end
                        2'b11:begin//�����������
                            if(sign_z)begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]+23'b1};
                            end
                            else begin
                                z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                            end
                        end
                    endcase
                end
                else begin
                    z_temp = {sign_z,exponent_z[7:0],m_z[22:0]};
                end
            end
        end
    end
//============================����λ��ֵ�������Чλ�жϵ�����߼�====================================
    assign sign_x = x[31];
    assign sign_y = y[31];
    assign bit4 = m_z_temp[23]?23:m_z_temp[22]?22:m_z_temp[21]?21:m_z_temp[20]?20:m_z_temp[19]?19:m_z_temp[18]?18:0;
    assign bit3 = m_z_temp[17]?17:m_z_temp[16]?16:m_z_temp[15]?15:m_z_temp[14]?14:m_z_temp[13]?13:m_z_temp[12]?12:0;
    assign bit2 = m_z_temp[11]?11:m_z_temp[10]?10:m_z_temp[9]?9:m_z_temp[8]?8:m_z_temp[7]?7:m_z_temp[6]?6:0;
    assign bit1 = m_z_temp[5]?5:m_z_temp[4]?4:m_z_temp[3]?3:m_z_temp[2]?2:m_z_temp[1]?1:m_z_temp[0]?0:0;
    assign temp = {m_z,out_z};
//============================״̬ת���ж�����߼�====================================
    always@(*) begin
        case(state)
            START:begin
                if((x[30:23]==8'd255)||(y[30:23]==8'd255))begin//������NaN�������
                    next = ROUND;
                end
                else if(x[30:23]==8'd0)begin
                    if(x[22:0]==0)begin//x=0
                        next = ROUND;
                    end
                    else begin//�ǹ�Լ��
                        next = ROUND;
                    end
                end
                else if(y[30:23]==8'd0)begin//y=0
                    if(y[22:0]==0)begin//y=0
                        next = ROUND;
                    end
                    else begin//�ǹ�Լ��
                        next = ROUND;
                    end
                end
                else begin
                    next = EQUALEXP;
                end
            end
            EQUALEXP:begin
                if ((delta_e <= -25) || (delta_e >= 25)) begin
                    next = ROUND;
                end
                else begin
                next = ADDM;
                end
            end
            ADDM:begin next = NORMAL;end
            NORMAL:begin next = ROUND;end
            ROUND:begin next = new?START:WAIT;end
            WAIT:begin next = new?START:WAIT;end
            default:begin next = START;end
        endcase
    end
//============================״̬�������ʱ���߼�====================================
    always@(posedge clk or posedge rst) begin
        if(rst) begin 
            error <= 3'b000;
            zero <= 0;
            overflow <= 0;
            
        end
        else begin
            case(state)
                START:begin
                    //����ָ����β��
                    exponent_x <= x[30:23];
                    exponent_y <= y[30:23];
                    m_x <= {1'b0,1'b1,x[22:0]};//���λ��������� 1.F
                    m_y <= {1'b0,1'b1,y[22:0]};
                    out_z <= 24'b0;
                    mid_z <= {1'b1,23'b0};
                    zero <= 0;
                    error <= 3'b000;
                    delta_e <= x[30:23] - y[30:23];
                    //ֻ�н���[1,254]��ʵ��0�ǹ������
                    if((x[30:23]==8'd255)||(y[30:23]==8'd255))begin//������NaN�������
                        error <= 3'b001;
                    end
                    else if(x[30:23]==8'd0)begin
                        if(x[22:0]==0)begin//x=0
                            zero <= 2'b10;
                        end
                        else begin//�ǹ�Լ��
                            error <= 3'b001;
                        end
                    end
                    else if(y[30:23]==8'd0)begin//y=0
                        if(y[22:0]==0)begin//y=0
                            zero <= 2'b01;
                        end
                        else begin//�ǹ�Լ��
                            error <= 3'b001;
                        end
                    end
                end
                EQUALEXP:begin//�Խ״���  
                    big_delta_e <= 0;
                    if (delta_e <= -25)begin //yԶ����x
                        big_delta_e <= 1;
                        sign_z <= sign_y;
                        exponent_z <= exponent_y;
                        m_z <= m_y;
                    end
                    else if(delta_e >= 25)begin//xԶ����y,24�պ��Ƴ�
                        big_delta_e <= 2;
                        sign_z <= sign_x;
                        exponent_z <= exponent_x;
                        m_z <= m_x;
                    end
                    else if (delta_e > 0) begin//xָ������y��yβ����Ҫ����?
                        {m_y,out_z} <= {m_y,out_z} >> delta_e;
                        exponent_y <= exponent_x;
                        bigger <= 2'b01;
                    end
                    else if (delta_e < 0) begin//yָ������x��xβ����Ҫ����?
                        {m_x,out_z} <= {m_x,out_z} >> (-delta_e);
                        exponent_x <= exponent_y;
                        bigger <= 2'b10;
                    end
                    else begin
                        bigger <= 2'b00;
                    end
                end
 
                ADDM:begin
                    exponent_z <= exponent_x;
                    m_z <= m_z_temp;
                    out_z <= out_z_temp;
                    if(sign_x ^ sign_y)begin//������
                        if(bigger == 2'b01)begin//xָ������y
                            sign_z <= sign_x;
                        end
                        else if(bigger == 2'b10)begin//yָ������x
                            sign_z <= sign_y;
                        end
                        else if(bigger == 2'b00)begin                            
                            sign_z <= (m_x > m_y)?sign_x:sign_y;
                        end
                    end
                    else begin                        
                        sign_z <= sign_x;
                    end
                    first_one_bit <= bit4?bit4:bit3?bit3:bit2?bit2:bit1?bit1:0;//m_z�е�1������1��bitλ
                end
                NORMAL:begin
                    error <= 3'b000;
                    overflow <= 2'b00;
                    if(m_z[24])begin
                        if(exponent_z == 254) begin
                            if(m_z[23:1])begin//NaN,����
                                error <= 3'b100;
                                overflow <= 2'b01;
                            end
                            else begin//���������
                                error <= 3'b011;
                                overflow <= 2'b01;
                            end
                        end
                        else begin
                            m_z <= m_z >> 1;
                            exponent_z <= exponent_z + 1;
                        end
                    end
                    else begin
                        if((exponent_z < (23 - first_one_bit)) || 
                        (exponent_z == (23 - first_one_bit) && (temp[(first_one_bit+1) +: 23] != 0)))begin//����
                            error <= 3'b010;
                            overflow <= 2'b10;
                        end
                        else begin
                            {m_z,out_z} <= {m_z,out_z} << (23 - first_one_bit);
                            exponent_z <= exponent_z - (23 - first_one_bit);
                        end
                    end
                end
                ROUND:begin
                    if(z_temp[30:23]==8'd255)begin//������NaN�������
                        if(z_temp[22:0])begin//NaN
                            error <= 3'b100;
                            overflow <= 2'b01;
                        end
                        else begin//�����?
                            error <= 3'b011;
                            overflow <= 2'b01;
                        end
                    end
                    else if(z_temp[30:23]==8'd0)begin//
                        if(z_temp[22:0])begin//�ǹ�Լ��,����
                            error <= 3'b010;
                            overflow <= 2'b10;
                        end
                    end
                    z <= z_temp;
                end
            endcase
        end
    end
endmodule