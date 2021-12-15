SELECT
thang,
CASE 
	WHEN phanam = 'PHA NAM'then 'MDS'
	WHEN makenhkh = 'DLPP' THEN 'OTC' ELSE makenhkh 
END as makenhkh,
f_sales.manv,
d_users.position,
d_users.tencvbh,
d_users.tenquanlytt,
d_users.tenquanlykhuvuc,
d_users.tenquanlyvung,
0 as kh_total,
0 as kh_yttn,
0 as kh_spmoi,
0 as kh_spcl,
--NOT IN CALENDAR
macongtycn,
ngaychungtu,
sodondathang,
makhcu,
tenkhachhang,
tentinhkh,
makenhphu,
masanpham,
tensanphamviettat,
soluong,
doanhsochuavat,
phanloaispcl,
nhomsp,
khuvucviettat,
chinhanh,
newhco,
phanam,
manvgh,
donvigiaohang,
'f_sales' as datatype
FROM "f_sales"
LEFT JOIN d_users ON
f_sales.manv = d_users.manv
WHERE thang >= '2021-09-01'
AND LEFT(masanpham,1) != 'V' 
AND f_sales.manv not in ('MA001', 'MA002', 'QUYNHPTA')
AND makenhkh != 'NB'

UNION ALL

SELECT
thang,
makenhkh,
d_calendar.manv,
d_users.position,
COALESCE (d_users.tencvbh, d_calendar.tencvbh),
COALESCE (d_users.tenquanlytt, d_calendar.tenquanlytt),
COALESCE (d_users.tenquanlykhuvuc, d_calendar.tenquanlykhuvuc),
COALESCE (d_users.tenquanlyvung, d_calendar.tenquanlyvung),
kh_total,
kh_yttn,
kh_spmoi,
kh_spcl,
--ADD FROM f_sales
NULL as macongtycn,
thang as ngaychungtu,
NULL as sodondathang,
NULL as makhcu,
NULL as tenkhachhang,
NULL as tentinhkh,
NULL as makenhphu,
NULL as masanpham,
NULL as tensanphamviettat,
NULL as soluong,
0 as doanhsochuavat,
NULL as phanloaispcl,
NULL as nhomsp,
NULL as khuvucviettat,
NULL as chinhanh,
NULL as newhco,
NULL as phanam,
NULL as manvgh,
NULL as donvigiaohang,
'd_calendar' as datatype
FROM "d_calendar"
LEFT JOIN d_users ON
d_calendar.manv = d_users.manv
WHERE thang >='2021-09-01'