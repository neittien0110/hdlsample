library IEEE;						 -- Su dung thu vien chuan	
use IEEE.std_logic_1164.all;		 -- Su dung cac phan tu logic
use IEEE.std_logic_signed.all;		 -- Khai bao goi std_logic_signed de co phep nhan 2 so co dau

--! @brief		Bo nhan 2 toan hang (multiplier) 2 so co dau 
--! @details	+ De nhan 2 so co dau, phai su dung them goi IEEE.std_logic_signed.all <br>
--!             + Minh hoa cho viec thuc hien phep nhan tren 2 tin hieu STD_LOGIC_VECTOR. <br>
--!             + Minh hoa viec su dung tham so generic. <br>	 
--! @remark		De thuc hien nhan khong dau, chi viec thay goi std_logic_signed bang std_logic_unsigned,
--!             giu nguyen code, la duoc. Xem multiplier_unsigned.
entity multiplier_signed is
	generic
	(	
	    --! @brief	Do rong cua 2 toan hang dau vao. Don vi bit.
		BUS_WIDTH: integer := 8
	);
	port
	(
		A : in std_logic_vector(BUS_WIDTH-1 downto 0);   --! @brief	Toan hang vao thu nhat cua phep nhan
		B : in std_logic_vector(BUS_WIDTH-1 downto 0);   --! @brief	Toan hang vao thu hai cua phep nhan
		Q : out std_logic_vector(BUS_WIDTH*2-2 downto 0) --! @brief	Toan hang ra, ket qua cua phep nhan
	);
end multiplier_signed;

--! @brief		Chi can ap dung phep nhan tren 2 tin hieu STD_LOGIC_VECTOR la xong.
--! @details 	Phep nhan co dau, voi hai tin hieu STD_LOGIC_VECTOR bang toan tu * trong goi IEEE.std_logic_signed 
architecture dataflow of multiplier_signed is
begin			 
	Q <= A * B;
end dataflow;