; ModuleID = '../data/hip_kernels/619/0/main.cu'
source_filename = "../data/hip_kernels/619/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_v1popDirs = protected addrspace(4) externally_initialized global [3 x [28 x float]] [[28 x float] [float 0x3FE72FEC60000000, float 0xBFEF18FC60000000, float 0x3FE7FCB920000000, float 0xBFE2ADABA0000000, float 0xBFB4BC6A80000000, float 0x3FEE346DC0000000, float 0x3FD47FCBA0000000, float 0xBFEBE0DEE0000000, float 0xBFC463F140000000, float 0xBFE0745380000000, float 0x3FEDC5D640000000, float 0x3FD7EAB360000000, float 0xBFE9B2FEC0000000, float 0xBFEA00D1C0000000, float 0x3FE3367A00000000, float 0xBFE25C91E0000000, float 0x3F63A92A40000000, float 0x3FE319CE00000000, float 0x3FC2617C20000000, float 0x3FE8D288C0000000, float 0xBFD9A02760000000, float 0xBFE0587940000000, float 0x3FCE666660000000, float 0xBFCC6DC5E0000000, float 0xBFE072B020000000, float 0x3FE09EECC0000000, float 0xBFB645A1C0000000, float 0x3FD8902DE0000000], [28 x float] [float 0xBFE4FD2200000000, float 0xBFBA161E40000000, float 0x3FE3F7CEE0000000, float 0xBFE8F34D60000000, float 0x3FEF03AFC0000000, float 0xBFCD97F620000000, float 0xBFED487FC0000000, float 0x3FDAECBFC0000000, float 0xBFEE816F00000000, float 0x3FEA28F5C0000000, float 0x3FCEB1C440000000, float 0x3FEC3126E0000000, float 0xBFDC5A1CA0000000, float 0x3FAE1B08A0000000, float 0xBFE13A92A0000000, float 0x3FE20F90A0000000, float 0x3FE9611340000000, float 0x3FE0745380000000, float 0xBFE89374C0000000, float 0xBFB1205BC0000000, float 0xBFE5581060000000, float 0xBFD194AF40000000, float 0x3FE01BDA60000000, float 0x3FE0226800000000, float 0x3FC4395820000000, float 0x3FC10CB2A0000000, float 0xBFE08240C0000000, float 0xBFD6B6AE80000000], [28 x float] [float 0x3FCB0BE0E0000000, float 0x3FCB367A00000000, float 0x3FCC49BA60000000, float 0x3FCD013AA0000000, float 0x3FCDC91D20000000, float 0x3FCE31F8A0000000, float 0x3FCF5F6FE0000000, float 0x3FD02F8380000000, float 0x3FD06DC5E0000000, float 0x3FD0985F00000000, float 0x3FD1BDA520000000, float 0x3FD292A300000000, float 0x3FD97F62C0000000, float 0x3FE28E8A80000000, float 0x3FE2EBEE00000000, float 0x3FE2FDF3C0000000, float 0x3FE37DBF40000000, float 0x3FE3B645A0000000, float 0x3FE3F8A0A0000000, float 0x3FE4147AE0000000, float 0x3FE41B08A0000000, float 0x3FEA113400000000, float 0x3FEA95E9E0000000, float 0x3FEAB43960000000, float 0x3FEAFAACE0000000, float 0x3FEB02DE00000000, float 0x3FEB4538E0000000, float 0x3FEB47AE20000000]], align 16
@motionProj = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x [28 x [8 x float]]] [[28 x [8 x float]] [[8 x float] [float 0x3F66462800000000, float 0x3F87D8CF40000000, float 0xBF62902580000000, float 0xBFB821E1E0000000, float 0xBFB6937D20000000, float 0xBF95B18540000000, float 0xBFB8E86400000000, float 0xBFB4CB18A0000000], [8 x float] [float 0xBF97E5A780000000, float 0xBFBB51EFC0000000, float 0xBFB3DF3B60000000, float 0x3F7ECC3E40000000, float 0x3F902AFDE0000000, float 0xBF79103C80000000, float 0xBFB9B402E0000000, float 0xBFB48BB900000000], [8 x float] [float 0x3F65F45E00000000, float 0xBFB4D36B40000000, float 0xBFB9DFA880000000, float 0xBF91A3B140000000, float 0xBFB4B263A0000000, float 0xBFBA0C3900000000, float 0xBF7F16B120000000, float 0x3F8BA55D20000000], [8 x float] [float 0xBFBB06E5C0000000, float 0xBFB342AAA0000000, float 0x3F736C58E0000000, float 0x3F8A932940000000, float 0xBF8CC6C540000000, float 0xBFBB8AD260000000, float 0xBFB330A4E0000000, float 0xBF947A9E20000000], [8 x float] [float 0xBFBA199780000000, float 0xBFB3FD1DC0000000, float 0xBF871DA380000000, float 0xBFB923E5C0000000, float 0xBFB5BB59E0000000, float 0x3F2B866E40000000, float 0x3F848ECD80000000, float 0xBF889BD840000000], [8 x float] [float 0x3F8B688BE0000000, float 0x3F7C0EBEE0000000, float 0xBFB0E1A400000000, float 0xBFBC7C73E0000000, float 0xBF93B42CC0000000, float 0xBFAD4280A0000000, float 0xBFBD50B960000000, float 0xBF99567DC0000000], [8 x float] [float 0xBFAF4DBE00000000, float 0x3F74E6E220000000, float 0x3F84384BA0000000, float 0xBFA4EC8500000000, float 0xBFBE7BD480000000, float 0xBFA4C96460000000, float 0xBF993D5340000000, float 0xBFBE5E8920000000], [8 x float] [float 0xBFA6920C00000000, float 0xBF99342680000000, float 0xBFBE0FF540000000, float 0xBFADD4A5E0000000, float 0x3F80C026C0000000, float 0x3F86E47DC0000000, float 0xBFA54FBDA0000000, float 0xBFBF8DF7A0000000], [8 x float] [float 0xBFBE23E180000000, float 0xBF98EDE540000000, float 0x3F824851A0000000, float 0xBF55592DA0000000, float 0xBFB4DC9820000000, float 0xBFBAC53B00000000, float 0xBF7CD91EE0000000, float 0xBFB12EF920000000], [8 x float] [float 0xBFBCBFA0A0000000, float 0xBF803D1460000000, float 0xBFAADFB500000000, float 0xBFBDEDAEC0000000, float 0xBF9EFBB0E0000000, float 0x3F84395820000000, float 0x3F0040BFE0000000, float 0xBFB47E2820000000], [8 x float] [float 0x3F772DE440000000, float 0xBFA3BADC00000000, float 0xBFBE6BA4A0000000, float 0xBFA547E060000000, float 0xBF695EE140000000, float 0xBFBC017120000000, float 0xBFB30EA180000000, float 0xBF53DFB0E0000000], [8 x float] [float 0xBFAE0AA640000000, float 0xBFBE32C200000000, float 0xBF8DC37A40000000, float 0xBF89913620000000, float 0xBFBE1A71A0000000, float 0xBFAFD3D420000000, float 0x3F3A155500000000, float 0x3F62168300000000], [8 x float] [float 0x3F93358F20000000, float 0xBFBD61E500000000, float 0xBFB28A1E00000000, float 0xBF902CD3A0000000, float 0xBF99746020000000, float 0xBFB8AF2D80000000, float 0xBFB7B2EE00000000, float 0x3FAC9F2FE0000000], [8 x float] [float 0x3FC7D59920000000, float 0x3FB11105E0000000, float 0xBFB809E560000000, float 0xBFB559B3E0000000, float 0xBFA9A719C0000000, float 0xBFB2CE67E0000000, float 0xBFB943F1C0000000, float 0x3FA141C820000000], [8 x float] [float 0xBFB4829D00000000, float 0xBFAC1D8E80000000, float 0xBFB55D91A0000000, float 0xBFB6E136E0000000, float 0x3FB2D26740000000, float 0x3FC92D01C0000000, float 0x3FA5EC80C0000000, float 0xBFB9818C60000000], [8 x float] [float 0x3FAC0A2880000000, float 0x3FC9173760000000, float 0x3FABA493C0000000, float 0xBFB8BD33E0000000, float 0xBFB46DF820000000, float 0xBFAACABC60000000, float 0xBFB45F4A20000000, float 0xBFB901C0C0000000], [8 x float] [float 0xBFB7C968A0000000, float 0x3FB0DCEC00000000, float 0x3FCAC33300000000, float 0x3FB1AEB3E0000000, float 0xBFB75B0BC0000000, float 0xBFB549E880000000, float 0xBFAD7B84E0000000, float 0xBFB59D8840000000], [8 x float] [float 0xBFB4862700000000, float 0xBFB82656A0000000, float 0x3FAA8587A0000000, float 0x3FCB2EF920000000, float 0x3FB7FBDF00000000, float 0xBFB49331A0000000, float 0xBFB61A9320000000, float 0xBFAE0D23E0000000], [8 x float] [float 0xBFB957EEE0000000, float 0xBFB2975B00000000, float 0xBFAE35E740000000, float 0xBFB746DC60000000, float 0xBFB0371DA0000000, float 0x3FC07839C0000000, float 0x3FCABDA940000000, float 0x3F96FC1580000000], [8 x float] [float 0xBFAEBDD340000000, float 0xBFB447E4A0000000, float 0xBFB76BD2C0000000, float 0x3FAD19BD40000000, float 0x3FCC766C60000000, float 0x3FBB166E00000000, float 0xBFB3215FC0000000, float 0xBFB65AAB40000000], [8 x float] [float 0x3F91A75CE0000000, float 0xBFB7F20A80000000, float 0xBFB2043A20000000, float 0xBFAF585BE0000000, float 0xBFB7E707E0000000, float 0xBFAAA5A460000000, float 0x3FC29003E0000000, float 0x3FCA47D3E0000000], [8 x float] [float 0x3FD2528280000000, float 0x3FB4F722E0000000, float 0xBFA2BECEE0000000, float 0xBFAAF251C0000000, float 0xBFAA50D6C0000000, float 0xBF93083560000000, float 0x3FC114DB60000000, float 0x3FD48C0060000000], [8 x float] [float 0xBF97768160000000, float 0x3FBAAF89C0000000, float 0x3FD2F1CB80000000, float 0x3FD4021080000000, float 0x3FC0B55680000000, float 0xBF89557140000000, float 0xBFA794EA00000000, float 0xBFA8068DC0000000], [8 x float] [float 0x3FC00357A0000000, float 0x3FD3B6A620000000, float 0x3FD346E4C0000000, float 0x3FBD4A2BA0000000, float 0xBF91D32400000000, float 0xBFA6D50660000000, float 0xBFA5FF8220000000, float 0xBF8863BEE0000000], [8 x float] [float 0x3FD4E4D1A0000000, float 0x3FD2B6D000000000, float 0x3FBA80BEE0000000, float 0xBF921F29A0000000, float 0xBFA50A45E0000000, float 0xBFA3C44C00000000, float 0x3F779BFE00000000, float 0x3FC44BA0E0000000], [8 x float] [float 0xBFA5508700000000, float 0xBF95193700000000, float 0x3FB81FB820000000, float 0x3FD250F400000000, float 0x3FD5576CC0000000, float 0x3FC5763E40000000, float 0x3F8168F8E0000000, float 0xBFA3CF7020000000], [8 x float] [float 0x3FB7104500000000, float 0xBF905814A0000000, float 0xBFA389D6A0000000, float 0xBFA0BDCAE0000000, float 0x3F9BB341E0000000, float 0x3FC8C45020000000, float 0x3FD5CD1420000000, float 0x3FD1963120000000], [8 x float] [float 0xBF9C6FBD20000000, float 0xBFA3726060000000, float 0xBF9B1F6880000000, float 0x3FAF182240000000, float 0x3FCF9578A0000000, float 0x3FD653EB40000000, float 0x3FCCDC0120000000, float 0x3FA7B95A20000000]], [28 x [8 x float]] [[8 x float] [float -0.000000e+00, float 0x3FECB6A620000000, float 0x3FD69A6F80000000, float 0.000000e+00, float 0.000000e+00, float 0x3FF35A35E0000000, float 0x3FD2465620000000, float 0x3FD0FF7160000000], [8 x float] [float 0x3FF0787E00000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FE3DDE380000000, float 0.000000e+00, float 0x3FC82BBEC0000000, float 0x3FCF982020000000], [8 x float] [float 0xBFBBA8F7E0000000, float -0.000000e+00, float -0.000000e+00, float 0x3FEDC150A0000000, float 0xBFC93A57E0000000, float -0.000000e+00, float 0.000000e+00, float 0x3FE041A480000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FD7846620000000, float 0x3FC9539320000000, float 0.000000e+00, float -0.000000e+00, float 0x3FEB7D0D00000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FF3AA64C0000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FE7A43360000000, float 0x3FD15B2D40000000], [8 x float] [float 0.000000e+00, float 0xBFDA3D9240000000, float 0xBFCFA6EFC0000000, float 0xBFB60C06A0000000, float 0x3FDD9270C0000000, float 0xBFD164A160000000, float 0xBFC75FBB60000000, float 0xBFC75CFAA0000000], [8 x float] [float 0.000000e+00, float 0xBFD0D7FD80000000, float 0xBFB965A140000000, float 0xBFB6AED140000000, float 0.000000e+00, float -0.000000e+00, float 0x3FC645C360000000, float 0xBFB89EA9A0000000], [8 x float] [float 0.000000e+00, float 0x3FD1D76680000000, float -0.000000e+00, float 0xBFC1FDB4C0000000, float 0xBFC2B673C0000000, float -0.000000e+00, float -0.000000e+00, float 0xBFBBEDB720000000], [8 x float] [float 0xBFC9CE9E60000000, float -0.000000e+00, float 0.000000e+00, float 0xBFC8BFB9C0000000, float 0xBFD129A1C0000000, float 0xBFC4C0F020000000, float 0x3FE1C49BA0000000, float 0xBFD1B72C60000000], [8 x float] [float 0xBFC3599240000000, float 0x3FD7176580000000, float 0xBFDDD972C0000000, float 0xBFC6D26FA0000000, float 0xBFC7E9E1C0000000, float -0.000000e+00, float 0xBFDE76A720000000, float 0xBFD4E468C0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFD1BAE8A0000000, float 0x3FD7F501A0000000, float -0.000000e+00, float 0xBFCAED7840000000, float 0xBFD0F1A5C0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float 0.000000e+00, float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFC71AD220000000, float 0xBFCEB66300000000], [8 x float] [float 0xBFD956B000000000, float -0.000000e+00, float 0xBFC8F7B180000000, float 0xBFCCB21820000000, float 0xBFDA7B56C0000000, float 0xBFC8774EE0000000, float 0xBFC40F9900000000, float -0.000000e+00], [8 x float] [float 0xBFC2D0F620000000, float 0xBFD24345C0000000, float 0xBFC406D0E0000000, float 0xBFBA753600000000, float 0xBFCF219A80000000, float 0xBFC072A7C0000000, float 0xBFC9110E40000000, float 0xBFD1F9A060000000], [8 x float] [float 0xBFC8515480000000, float 0xBFE79D2C00000000, float 0xBFDD2B5E60000000, float 0xBFD3354C20000000, float 0xBFD87C3500000000, float 0xBFE0C1A8A0000000, float 0xBFE0CB48E0000000, float 0xBFD97470E0000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FD265CF60000000, float 0.000000e+00, float 0x3FC9B6A1E0000000, float 0.000000e+00, float 0x3FD5A68B20000000, float 0x3FD2410300000000], [8 x float] [float 0xBFBA1101C0000000, float 0xBFD31272C0000000, float 0xBFDEAC9F20000000, float 0xBFC7B91700000000, float 0xBFC6647FE0000000, float 0xBFC853EB40000000, float 0xBFDCDEDF20000000, float 0xBFC26AE3A0000000], [8 x float] [float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFC8720860000000, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFCD8AB920000000], [8 x float] [float 0.000000e+00, float 0x3FD2C3A000000000, float 0.000000e+00, float 0.000000e+00, float 0x3FC60F55E0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FCAE66440000000], [8 x float] [float -0.000000e+00, float 0x3FDB89B960000000, float 0x3FD392E620000000, float 0x3FC9A2A4E0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FD7440280000000, float 0x3FD4961800000000], [8 x float] [float 0.000000e+00, float -0.000000e+00, float 0xBFBBD9BA20000000, float 0xBFC26E43A0000000, float 0.000000e+00, float 0.000000e+00, float 0xBFC2A697A0000000, float 0xBFC94F3780000000], [8 x float] [float 0.000000e+00, float 0x3FCA3582A0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FC9B39E20000000, float 0.000000e+00, float 0x3FD15F8D20000000, float 0.000000e+00], [8 x float] [float -0.000000e+00, float 0x3FD54E65C0000000, float 0x3FD25E02E0000000, float 0.000000e+00, float 0x3FC3DD8720000000, float 0.000000e+00, float 0x3FD50F55E0000000, float 0x3FD3376500000000], [8 x float] [float -0.000000e+00, float 0xBFC52CF960000000, float -0.000000e+00, float 0xBFB7B8F580000000, float 0xBFC0748E40000000, float -0.000000e+00, float -0.000000e+00, float 0xBFD1386D20000000], [8 x float] [float 0xBFB8EF1340000000, float -0.000000e+00, float 0xBFCABF09A0000000, float 0xBFC0C0A4A0000000, float 0xBFB5386900000000, float -0.000000e+00, float 0xBFCB33FC80000000, float -0.000000e+00], [8 x float] [float 0xBFBAFEA3E0000000, float 0xBFDF72E280000000, float 0xBFDA43CC00000000, float 0xBFC85375C0000000, float 0xBFCE5C7040000000, float 0xBFD3B5FE60000000, float 0xBFDE8BAC80000000, float 0xBFD24B1240000000], [8 x float] [float 0xBFCBFED200000000, float 0xBFD85AAB40000000, float 0xBFD0BFF8A0000000, float 0xBFC4938DE0000000, float 0xBFD5AF6400000000, float 0xBFD05AC480000000, float 0xBFD1CA6440000000, float 0xBFC4B545C0000000], [8 x float] [float 0.000000e+00, float 0x3FD75A74C0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FCED3F9E0000000, float 0.000000e+00, float 0x3FD308BFC0000000, float 0.000000e+00]], [28 x [8 x float]] [[8 x float] [float 0xC013759700000000, float 0xC01377DEA0000000, float 0xC0134B3420000000, float 0xC012F6A620000000, float 0xC012963700000000, float 0xC0126A1F80000000, float 0xC012A6AB60000000, float 0xC013259EE0000000], [8 x float] [float 0xC00B6C9180000000, float 0xC00BE7BBC0000000, float 0xC00C67F3C0000000, float 0xC00C7B83C0000000, float 0xC00C23C5C0000000, float 0xC00BB50E40000000, float 0xC00B5C4760000000, float 0xC00B3B8A20000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xBFFF51B0C0000000, float 0xC00023A320000000, float 0xC000711BE0000000, float 0xC0007553E0000000, float 0xC0002B1460000000, float 0xBFFF2934A0000000, float 0xBFFE4B1780000000, float 0xBFFE79C300000000], [8 x float] [float 0xC00FD543A0000000, float 0xC00F67E840000000, float 0xC00F04FC20000000, float 0xC00EE2D380000000, float 0xC00EF8BB40000000, float 0xC00F1B38E0000000, float 0xC00F68A720000000, float 0xC00FD463C0000000], [8 x float] [float 0x3FFF2DF1E0000000, float 0x3FFF69E3C0000000, float 0x40001557A0000000, float 0x4000821A80000000, float 0x40009E3FC0000000, float 0x40005C59C0000000, float 0x3FFFEF74C0000000, float 0x3FFF5F04E0000000], [8 x float] [float 0x3FFA140780000000, float 0x3FF94A6980000000, float 0x3FF8EB0960000000, float 0x3FF920B4E0000000, float 0x3FF9C6AC20000000, float 0x3FFA62B8C0000000, float 0x3FFAC7B680000000, float 0x3FFAC180E0000000], [8 x float] [float 0x3FFC8F52C0000000, float 0x3FFC8D6E40000000, float 0x3FFB8CE4E0000000, float 0x3FFA030F40000000, float 0x3FF8E2FF00000000, float 0x3FF8CF5F40000000, float 0x3FF9E0DCC0000000, float 0x3FFB8062A0000000], [8 x float] [float 0x40001899C0000000, float 0x3FFF9B1420000000, float 0x3FFF226F60000000, float 0x3FFEF73180000000, float 0x3FFF0E8C80000000, float 0x3FFF497100000000, float 0x3FFFBC9260000000, float 0x400020D0A0000000], [8 x float] [float 0x400B5AC360000000, float 0x400B9D9120000000, float 0x400B6F4620000000, float 0x400ADD0AE0000000, float 0x400A277DE0000000, float 0x4009B87F80000000, float 0x4009E502E0000000, float 0x400AA23200000000], [8 x float] [float 0x3FFBDDFFC0000000, float 0x3FFC6D5F20000000, float 0x3FFCEF3E40000000, float 0x3FFCD55920000000, float 0x3FFC4241C0000000, float 0x3FFBD272C0000000, float 0x3FFB9B5B80000000, float 0x3FFB963BA0000000], [8 x float] [float 0x3FF96BBDC0000000, float 0x3FFA478000000000, float 0x3FFAA8C9C0000000, float 0x3FFA5F4800000000, float 0x3FF9A70A00000000, float 0x3FF8D881A0000000, float 0x3FF86CBEA0000000, float 0x3FF8A9CEE0000000], [8 x float] [float 0x40091BBB60000000, float 0x400951D820000000, float 0x40094A6F40000000, float 0x40090A50E0000000, float 0x4008BEC460000000, float 0x400891DE60000000, float 0x4008963560000000, float 0x4008CD2AA0000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FF196EF00000000, float 0x3FF2E379C0000000, float 0x3FF2E88060000000, float 0x3FF20826A0000000, float 0.000000e+00, float 0.000000e+00], [8 x float] [float 0x4016288B20000000, float 0x40162D0CC0000000, float 0x4015F11480000000, float 0x4015731220000000, float 0x4014D52B00000000, float 0x40148F61A0000000, float 0x4014F6BC60000000, float 0x4015B738E0000000], [8 x float] [float 0xC010397C00000000, float 0xC01077D740000000, float 0xC01039A340000000, float 0xC00F3DBE40000000, float 0xC00E1A5000000000, float 0xC00DA1C160000000, float 0xC00E0DE900000000, float 0xC00F3C84C0000000], [8 x float] [float 0x40022A9400000000, float 0x4001078100000000, float 0x4000520F20000000, float 0x400089BC00000000, float 0x4001585400000000, float 0x4002101320000000, float 0x40028F7440000000, float 0x4002C05DE0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xC00E409FE0000000, float 0xC00D95F0C0000000, float 0xC00D31F260000000, float 0xC00D2CA140000000, float 0xC00D7F8D20000000, float 0xC00DFB9840000000, float 0xC00E812380000000, float 0xC00EB70600000000], [8 x float] [float 0xC0113C8DA0000000, float 0xC0115FDC60000000, float 0xC011A9A960000000, float 0xC011E90C00000000, float 0xC011D6FF00000000, float 0xC0118956C0000000, float 0xC011463D80000000, float 0xC0113279A0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xC00815C180000000, float 0xC008E1BE20000000, float 0xC00936E2E0000000, float 0xC00919C8C0000000, float 0xC008C6B300000000, float 0xC008529020000000, float 0xC007D15E80000000, float 0xC007959700000000], [8 x float] [float 0xC007A2D280000000, float 0xC006B72DE0000000, float 0xC005924F20000000, float 0xC0054D5E00000000, float 0xC0060AB920000000, float 0xC006DDBEC0000000, float 0xC00777A800000000, float 0xC007D4F8C0000000], [8 x float] [float 0x3FF359EA60000000, float 0x3FF60BA520000000, float 0x3FF6792F20000000, float 0x3FF4390FC0000000, float 0x3FF1C23000000000, float 0x3FF07A4300000000, float 0.000000e+00, float 0.000000e+00], [8 x float] [float 0x4000B721E0000000, float 0x4000432CA0000000, float 0x3FFD79A380000000, float 0x3FFB21F180000000, float 0x3FFA43C9E0000000, float 0x3FFA897100000000, float 0x3FFC34C3C0000000, float 0x3FFF2D43E0000000], [8 x float] [float 0x4011C09600000000, float 0x4011F8D2A0000000, float 0x40126B0700000000, float 0x4012E2A6C0000000, float 0x4012C7D640000000, float 0x40121A00A0000000, float 0x40119EE8E0000000, float 0x40119C93E0000000], [8 x float] [float 0x4010D23EE0000000, float 0x4010312060000000, float 0x400F8B86C0000000, float 0x400F2C9FC0000000, float 0x400F74C980000000, float 0x40105AE100000000, float 0x401123A920000000, float 0x4011534CA0000000], [8 x float] [float 0xC00B82C120000000, float 0xC00B937000000000, float 0xC00B06EA80000000, float 0xC009CA5160000000, float 0xC00815F240000000, float 0xC007543840000000, float 0xC0088ABF80000000, float 0xC00A776700000000]]], align 16
@d_scalingFilt = protected local_unnamed_addr addrspace(4) externally_initialized global [5 x float] [float 0x3FB6A161E0000000, float 0x3FD6A161E0000000, float 0x3FE0F837C0000000, float 0x3FD6A161E0000000, float 0x3FB6A161E0000000], align 16
@d_v1GaussFilt = protected local_unnamed_addr addrspace(4) externally_initialized global [9 x float] [float 0x3F46F00680000000, float 0x3F8FBE76C0000000, float 0x3FB71DE6A0000000, float 0x3FCE0418A0000000, float 0x3FD4587940000000, float 0x3FCE0418A0000000, float 0x3FB71DE6A0000000, float 0x3F8FBE76C0000000, float 0x3F46F00680000000], align 16
@d_complexV1Filt = protected local_unnamed_addr addrspace(4) externally_initialized global [11 x float] [float 0x3F5F212D80000000, float 0x3F86872B00000000, float 0x3FA60418A0000000, float 0x3FBD3C3620000000, float 0x3FCA43FE60000000, float 0x3FCFEF9DC0000000, float 0x3FCA43FE60000000, float 0x3FBD3C3620000000, float 0x3FA60418A0000000, float 0x3F86872B00000000, float 0x3F5F212D80000000], align 16
@d_normV1filt = protected local_unnamed_addr addrspace(4) externally_initialized global [25 x float] [float 0x3F726E9780000000, float 0x3F7D7DBF40000000, float 0x3F8652BD40000000, float 0x3F90624DE0000000, float 0x3F970A3D80000000, float 0x3F9F06F6A0000000, float 0x3FA41F2120000000, float 0x3FA9168720000000, float 0x3FAE0DED20000000, float 0x3FB147AE20000000, float 0x3FB318FC60000000, float 0x3FB4467380000000, float 0x3FB4AF4F00000000, float 0x3FB4467380000000, float 0x3FB318FC60000000, float 0x3FB147AE20000000, float 0x3FAE0DED20000000, float 0x3FA9168720000000, float 0x3FA41F2120000000, float 0x3F9F06F6A0000000, float 0x3F970A3D80000000, float 0x3F90624DE0000000, float 0x3F8652BD40000000, float 0x3F7D7DBF40000000, float 0x3F726E9780000000], align 16
@d_diff1filt = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] [float -5.000000e-01, float 0.000000e+00, float 5.000000e-01], align 4
@d_diff2filt = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] [float 1.000000e+00, float -2.000000e+00, float 1.000000e+00], align 4
@d_diff3filt = protected local_unnamed_addr addrspace(4) externally_initialized global [5 x float] [float -5.000000e-01, float 1.000000e+00, float 0.000000e+00, float -1.000000e+00, float 5.000000e-01], align 16
@_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders = internal unnamed_addr addrspace(3) global [28 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([3 x [28 x float]] addrspace(4)* @d_v1popDirs to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18dev_accumDiffStimsPfS_iiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = shl i32 %16, 8
  %18 = ashr exact i32 %17, 8
  %19 = mul nsw i32 %18, %12
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %21 = add i32 %19, %20
  %22 = udiv i32 %15, %12
  %23 = mul i32 %22, %12
  %24 = icmp ugt i32 %15, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = shl i32 %26, 8
  %28 = ashr exact i32 %27, 8
  %29 = mul nsw i32 %28, %12
  %30 = icmp ult i32 %20, 28
  br i1 %30, label %31, label %66

31:                                               ; preds = %7
  %32 = zext i32 %20 to i64
  %33 = getelementptr inbounds [3 x [28 x float]], [3 x [28 x float]] addrspace(4)* @d_v1popDirs, i64 0, i64 0, i64 %32
  %34 = load float, float addrspace(4)* %33, align 4, !tbaa !16
  %35 = getelementptr inbounds [3 x [28 x float]], [3 x [28 x float]] addrspace(4)* @d_v1popDirs, i64 0, i64 1, i64 %32
  %36 = load float, float addrspace(4)* %35, align 4, !tbaa !16
  %37 = getelementptr inbounds [3 x [28 x float]], [3 x [28 x float]] addrspace(4)* @d_v1popDirs, i64 0, i64 2, i64 %32
  %38 = load float, float addrspace(4)* %37, align 4, !tbaa !16
  switch i32 %4, label %42 [
    i32 0, label %45
    i32 1, label %39
    i32 2, label %40
  ]

39:                                               ; preds = %31
  br label %45

40:                                               ; preds = %31
  %41 = fmul contract float %34, %34
  br label %45

42:                                               ; preds = %31
  %43 = fmul contract float %34, %34
  %44 = fmul contract float %34, %43
  br label %45

45:                                               ; preds = %31, %39, %42, %40
  %46 = phi contract float [ 1.000000e+00, %31 ], [ %34, %39 ], [ %41, %40 ], [ %44, %42 ]
  switch i32 %5, label %50 [
    i32 0, label %53
    i32 1, label %47
    i32 2, label %48
  ]

47:                                               ; preds = %45
  br label %53

48:                                               ; preds = %45
  %49 = fmul contract float %36, %36
  br label %53

50:                                               ; preds = %45
  %51 = fmul contract float %36, %36
  %52 = fmul contract float %36, %51
  br label %53

53:                                               ; preds = %45, %47, %50, %48
  %54 = phi contract float [ 1.000000e+00, %45 ], [ %36, %47 ], [ %49, %48 ], [ %52, %50 ]
  switch i32 %6, label %58 [
    i32 0, label %61
    i32 1, label %55
    i32 2, label %56
  ]

55:                                               ; preds = %53
  br label %61

56:                                               ; preds = %53
  %57 = fmul contract float %38, %38
  br label %61

58:                                               ; preds = %53
  %59 = fmul contract float %38, %38
  %60 = fmul contract float %38, %59
  br label %61

61:                                               ; preds = %53, %55, %58, %56
  %62 = phi contract float [ 1.000000e+00, %53 ], [ %38, %55 ], [ %57, %56 ], [ %60, %58 ]
  %63 = fmul contract float %46, %54
  %64 = fmul contract float %63, %62
  %65 = getelementptr inbounds [28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 %20
  store float %64, float addrspace(3)* %65, align 4, !tbaa !16
  br label %66

66:                                               ; preds = %61, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp slt i32 %21, %2
  br i1 %67, label %68, label %124

68:                                               ; preds = %66
  %69 = sitofp i32 %3 to float
  %70 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 0), align 16, !tbaa !16
  %71 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 1), align 4, !tbaa !16
  %72 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 2), align 8, !tbaa !16
  %73 = shl nsw i32 %2, 1
  %74 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 3), align 4, !tbaa !16
  %75 = mul nsw i32 %2, 3
  %76 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 4), align 16, !tbaa !16
  %77 = shl nsw i32 %2, 2
  %78 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 5), align 4, !tbaa !16
  %79 = mul nsw i32 %2, 5
  %80 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 6), align 8, !tbaa !16
  %81 = mul nsw i32 %2, 6
  %82 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 7), align 4, !tbaa !16
  %83 = mul nsw i32 %2, 7
  %84 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 8), align 16, !tbaa !16
  %85 = shl nsw i32 %2, 3
  %86 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 9), align 4, !tbaa !16
  %87 = mul nsw i32 %2, 9
  %88 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 10), align 8, !tbaa !16
  %89 = mul nsw i32 %2, 10
  %90 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 11), align 4, !tbaa !16
  %91 = mul nsw i32 %2, 11
  %92 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 12), align 16, !tbaa !16
  %93 = mul nsw i32 %2, 12
  %94 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 13), align 4, !tbaa !16
  %95 = mul nsw i32 %2, 13
  %96 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 14), align 8, !tbaa !16
  %97 = mul nsw i32 %2, 14
  %98 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 15), align 4, !tbaa !16
  %99 = mul nsw i32 %2, 15
  %100 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 16), align 16, !tbaa !16
  %101 = shl nsw i32 %2, 4
  %102 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 17), align 4, !tbaa !16
  %103 = mul nsw i32 %2, 17
  %104 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 18), align 8, !tbaa !16
  %105 = mul nsw i32 %2, 18
  %106 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 19), align 4, !tbaa !16
  %107 = mul nsw i32 %2, 19
  %108 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 20), align 16, !tbaa !16
  %109 = mul nsw i32 %2, 20
  %110 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 21), align 4, !tbaa !16
  %111 = mul nsw i32 %2, 21
  %112 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 22), align 8, !tbaa !16
  %113 = mul nsw i32 %2, 22
  %114 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 23), align 4, !tbaa !16
  %115 = mul nsw i32 %2, 23
  %116 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 24), align 16, !tbaa !16
  %117 = mul nsw i32 %2, 24
  %118 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 25), align 4, !tbaa !16
  %119 = mul nsw i32 %2, 25
  %120 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 26), align 8, !tbaa !16
  %121 = mul nsw i32 %2, 26
  %122 = load float, float addrspace(3)* getelementptr inbounds ([28 x float], [28 x float] addrspace(3)* @_ZZ18dev_accumDiffStimsPfS_iiiiiE9dirorders, i32 0, i32 27), align 4, !tbaa !16
  %123 = mul nsw i32 %2, 27
  br label %125

124:                                              ; preds = %125, %66
  ret void

125:                                              ; preds = %68, %125
  %126 = phi i32 [ %21, %68 ], [ %297, %125 ]
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !16
  %130 = fmul contract float %129, %69
  %131 = fmul contract float %130, %70
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !16
  %134 = fadd contract float %133, %131
  store float %134, float addrspace(1)* %132, align 4, !tbaa !16
  %135 = fmul contract float %130, %71
  %136 = add nsw i32 %126, %2
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16
  %140 = fadd contract float %139, %135
  store float %140, float addrspace(1)* %138, align 4, !tbaa !16
  %141 = fmul contract float %130, %72
  %142 = add nsw i32 %73, %126
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !16
  %146 = fadd contract float %145, %141
  store float %146, float addrspace(1)* %144, align 4, !tbaa !16
  %147 = fmul contract float %130, %74
  %148 = add nsw i32 %75, %126
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !16
  %152 = fadd contract float %151, %147
  store float %152, float addrspace(1)* %150, align 4, !tbaa !16
  %153 = fmul contract float %130, %76
  %154 = add nsw i32 %77, %126
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %0, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !16
  %158 = fadd contract float %157, %153
  store float %158, float addrspace(1)* %156, align 4, !tbaa !16
  %159 = fmul contract float %130, %78
  %160 = add nsw i32 %79, %126
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = fadd contract float %163, %159
  store float %164, float addrspace(1)* %162, align 4, !tbaa !16
  %165 = fmul contract float %130, %80
  %166 = add nsw i32 %81, %126
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !16
  %170 = fadd contract float %169, %165
  store float %170, float addrspace(1)* %168, align 4, !tbaa !16
  %171 = fmul contract float %130, %82
  %172 = add nsw i32 %83, %126
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds float, float addrspace(1)* %0, i64 %173
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !16
  %176 = fadd contract float %175, %171
  store float %176, float addrspace(1)* %174, align 4, !tbaa !16
  %177 = fmul contract float %130, %84
  %178 = add nsw i32 %85, %126
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !16
  %182 = fadd contract float %181, %177
  store float %182, float addrspace(1)* %180, align 4, !tbaa !16
  %183 = fmul contract float %130, %86
  %184 = add nsw i32 %87, %126
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %0, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !16
  %188 = fadd contract float %187, %183
  store float %188, float addrspace(1)* %186, align 4, !tbaa !16
  %189 = fmul contract float %130, %88
  %190 = add nsw i32 %89, %126
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %0, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !16
  %194 = fadd contract float %193, %189
  store float %194, float addrspace(1)* %192, align 4, !tbaa !16
  %195 = fmul contract float %130, %90
  %196 = add nsw i32 %91, %126
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !16
  %200 = fadd contract float %199, %195
  store float %200, float addrspace(1)* %198, align 4, !tbaa !16
  %201 = fmul contract float %130, %92
  %202 = add nsw i32 %93, %126
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !16
  %206 = fadd contract float %205, %201
  store float %206, float addrspace(1)* %204, align 4, !tbaa !16
  %207 = fmul contract float %130, %94
  %208 = add nsw i32 %95, %126
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !16
  %212 = fadd contract float %211, %207
  store float %212, float addrspace(1)* %210, align 4, !tbaa !16
  %213 = fmul contract float %130, %96
  %214 = add nsw i32 %97, %126
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !16
  %218 = fadd contract float %217, %213
  store float %218, float addrspace(1)* %216, align 4, !tbaa !16
  %219 = fmul contract float %130, %98
  %220 = add nsw i32 %99, %126
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %0, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !16
  %224 = fadd contract float %223, %219
  store float %224, float addrspace(1)* %222, align 4, !tbaa !16
  %225 = fmul contract float %130, %100
  %226 = add nsw i32 %101, %126
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float addrspace(1)* %0, i64 %227
  %229 = load float, float addrspace(1)* %228, align 4, !tbaa !16
  %230 = fadd contract float %229, %225
  store float %230, float addrspace(1)* %228, align 4, !tbaa !16
  %231 = fmul contract float %130, %102
  %232 = add nsw i32 %103, %126
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !16
  %236 = fadd contract float %235, %231
  store float %236, float addrspace(1)* %234, align 4, !tbaa !16
  %237 = fmul contract float %130, %104
  %238 = add nsw i32 %105, %126
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !16
  %242 = fadd contract float %241, %237
  store float %242, float addrspace(1)* %240, align 4, !tbaa !16
  %243 = fmul contract float %130, %106
  %244 = add nsw i32 %107, %126
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !16
  %248 = fadd contract float %247, %243
  store float %248, float addrspace(1)* %246, align 4, !tbaa !16
  %249 = fmul contract float %130, %108
  %250 = add nsw i32 %109, %126
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %0, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !16
  %254 = fadd contract float %253, %249
  store float %254, float addrspace(1)* %252, align 4, !tbaa !16
  %255 = fmul contract float %130, %110
  %256 = add nsw i32 %111, %126
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %0, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !16
  %260 = fadd contract float %259, %255
  store float %260, float addrspace(1)* %258, align 4, !tbaa !16
  %261 = fmul contract float %130, %112
  %262 = add nsw i32 %113, %126
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %0, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !16
  %266 = fadd contract float %265, %261
  store float %266, float addrspace(1)* %264, align 4, !tbaa !16
  %267 = fmul contract float %130, %114
  %268 = add nsw i32 %115, %126
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds float, float addrspace(1)* %0, i64 %269
  %271 = load float, float addrspace(1)* %270, align 4, !tbaa !16
  %272 = fadd contract float %271, %267
  store float %272, float addrspace(1)* %270, align 4, !tbaa !16
  %273 = fmul contract float %130, %116
  %274 = add nsw i32 %117, %126
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds float, float addrspace(1)* %0, i64 %275
  %277 = load float, float addrspace(1)* %276, align 4, !tbaa !16
  %278 = fadd contract float %277, %273
  store float %278, float addrspace(1)* %276, align 4, !tbaa !16
  %279 = fmul contract float %130, %118
  %280 = add nsw i32 %119, %126
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %0, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !16
  %284 = fadd contract float %283, %279
  store float %284, float addrspace(1)* %282, align 4, !tbaa !16
  %285 = fmul contract float %130, %120
  %286 = add nsw i32 %121, %126
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !16
  %290 = fadd contract float %289, %285
  store float %290, float addrspace(1)* %288, align 4, !tbaa !16
  %291 = fmul contract float %130, %122
  %292 = add nsw i32 %123, %126
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds float, float addrspace(1)* %0, i64 %293
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !16
  %296 = fadd contract float %295, %291
  store float %296, float addrspace(1)* %294, align 4, !tbaa !16
  %297 = add nsw i32 %126, %29
  %298 = icmp slt i32 %297, %2
  br i1 %298, label %125, label %124, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
