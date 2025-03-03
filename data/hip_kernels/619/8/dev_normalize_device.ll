; ModuleID = '../data/hip_kernels/619/8/main.cu'
source_filename = "../data/hip_kernels/619/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_v1popDirs = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x [28 x float]] [[28 x float] [float 0x3FE72FEC60000000, float 0xBFEF18FC60000000, float 0x3FE7FCB920000000, float 0xBFE2ADABA0000000, float 0xBFB4BC6A80000000, float 0x3FEE346DC0000000, float 0x3FD47FCBA0000000, float 0xBFEBE0DEE0000000, float 0xBFC463F140000000, float 0xBFE0745380000000, float 0x3FEDC5D640000000, float 0x3FD7EAB360000000, float 0xBFE9B2FEC0000000, float 0xBFEA00D1C0000000, float 0x3FE3367A00000000, float 0xBFE25C91E0000000, float 0x3F63A92A40000000, float 0x3FE319CE00000000, float 0x3FC2617C20000000, float 0x3FE8D288C0000000, float 0xBFD9A02760000000, float 0xBFE0587940000000, float 0x3FCE666660000000, float 0xBFCC6DC5E0000000, float 0xBFE072B020000000, float 0x3FE09EECC0000000, float 0xBFB645A1C0000000, float 0x3FD8902DE0000000], [28 x float] [float 0xBFE4FD2200000000, float 0xBFBA161E40000000, float 0x3FE3F7CEE0000000, float 0xBFE8F34D60000000, float 0x3FEF03AFC0000000, float 0xBFCD97F620000000, float 0xBFED487FC0000000, float 0x3FDAECBFC0000000, float 0xBFEE816F00000000, float 0x3FEA28F5C0000000, float 0x3FCEB1C440000000, float 0x3FEC3126E0000000, float 0xBFDC5A1CA0000000, float 0x3FAE1B08A0000000, float 0xBFE13A92A0000000, float 0x3FE20F90A0000000, float 0x3FE9611340000000, float 0x3FE0745380000000, float 0xBFE89374C0000000, float 0xBFB1205BC0000000, float 0xBFE5581060000000, float 0xBFD194AF40000000, float 0x3FE01BDA60000000, float 0x3FE0226800000000, float 0x3FC4395820000000, float 0x3FC10CB2A0000000, float 0xBFE08240C0000000, float 0xBFD6B6AE80000000], [28 x float] [float 0x3FCB0BE0E0000000, float 0x3FCB367A00000000, float 0x3FCC49BA60000000, float 0x3FCD013AA0000000, float 0x3FCDC91D20000000, float 0x3FCE31F8A0000000, float 0x3FCF5F6FE0000000, float 0x3FD02F8380000000, float 0x3FD06DC5E0000000, float 0x3FD0985F00000000, float 0x3FD1BDA520000000, float 0x3FD292A300000000, float 0x3FD97F62C0000000, float 0x3FE28E8A80000000, float 0x3FE2EBEE00000000, float 0x3FE2FDF3C0000000, float 0x3FE37DBF40000000, float 0x3FE3B645A0000000, float 0x3FE3F8A0A0000000, float 0x3FE4147AE0000000, float 0x3FE41B08A0000000, float 0x3FEA113400000000, float 0x3FEA95E9E0000000, float 0x3FEAB43960000000, float 0x3FEAFAACE0000000, float 0x3FEB02DE00000000, float 0x3FEB4538E0000000, float 0x3FEB47AE20000000]], align 16
@motionProj = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x [28 x [8 x float]]] [[28 x [8 x float]] [[8 x float] [float 0x3F66462800000000, float 0x3F87D8CF40000000, float 0xBF62902580000000, float 0xBFB821E1E0000000, float 0xBFB6937D20000000, float 0xBF95B18540000000, float 0xBFB8E86400000000, float 0xBFB4CB18A0000000], [8 x float] [float 0xBF97E5A780000000, float 0xBFBB51EFC0000000, float 0xBFB3DF3B60000000, float 0x3F7ECC3E40000000, float 0x3F902AFDE0000000, float 0xBF79103C80000000, float 0xBFB9B402E0000000, float 0xBFB48BB900000000], [8 x float] [float 0x3F65F45E00000000, float 0xBFB4D36B40000000, float 0xBFB9DFA880000000, float 0xBF91A3B140000000, float 0xBFB4B263A0000000, float 0xBFBA0C3900000000, float 0xBF7F16B120000000, float 0x3F8BA55D20000000], [8 x float] [float 0xBFBB06E5C0000000, float 0xBFB342AAA0000000, float 0x3F736C58E0000000, float 0x3F8A932940000000, float 0xBF8CC6C540000000, float 0xBFBB8AD260000000, float 0xBFB330A4E0000000, float 0xBF947A9E20000000], [8 x float] [float 0xBFBA199780000000, float 0xBFB3FD1DC0000000, float 0xBF871DA380000000, float 0xBFB923E5C0000000, float 0xBFB5BB59E0000000, float 0x3F2B866E40000000, float 0x3F848ECD80000000, float 0xBF889BD840000000], [8 x float] [float 0x3F8B688BE0000000, float 0x3F7C0EBEE0000000, float 0xBFB0E1A400000000, float 0xBFBC7C73E0000000, float 0xBF93B42CC0000000, float 0xBFAD4280A0000000, float 0xBFBD50B960000000, float 0xBF99567DC0000000], [8 x float] [float 0xBFAF4DBE00000000, float 0x3F74E6E220000000, float 0x3F84384BA0000000, float 0xBFA4EC8500000000, float 0xBFBE7BD480000000, float 0xBFA4C96460000000, float 0xBF993D5340000000, float 0xBFBE5E8920000000], [8 x float] [float 0xBFA6920C00000000, float 0xBF99342680000000, float 0xBFBE0FF540000000, float 0xBFADD4A5E0000000, float 0x3F80C026C0000000, float 0x3F86E47DC0000000, float 0xBFA54FBDA0000000, float 0xBFBF8DF7A0000000], [8 x float] [float 0xBFBE23E180000000, float 0xBF98EDE540000000, float 0x3F824851A0000000, float 0xBF55592DA0000000, float 0xBFB4DC9820000000, float 0xBFBAC53B00000000, float 0xBF7CD91EE0000000, float 0xBFB12EF920000000], [8 x float] [float 0xBFBCBFA0A0000000, float 0xBF803D1460000000, float 0xBFAADFB500000000, float 0xBFBDEDAEC0000000, float 0xBF9EFBB0E0000000, float 0x3F84395820000000, float 0x3F0040BFE0000000, float 0xBFB47E2820000000], [8 x float] [float 0x3F772DE440000000, float 0xBFA3BADC00000000, float 0xBFBE6BA4A0000000, float 0xBFA547E060000000, float 0xBF695EE140000000, float 0xBFBC017120000000, float 0xBFB30EA180000000, float 0xBF53DFB0E0000000], [8 x float] [float 0xBFAE0AA640000000, float 0xBFBE32C200000000, float 0xBF8DC37A40000000, float 0xBF89913620000000, float 0xBFBE1A71A0000000, float 0xBFAFD3D420000000, float 0x3F3A155500000000, float 0x3F62168300000000], [8 x float] [float 0x3F93358F20000000, float 0xBFBD61E500000000, float 0xBFB28A1E00000000, float 0xBF902CD3A0000000, float 0xBF99746020000000, float 0xBFB8AF2D80000000, float 0xBFB7B2EE00000000, float 0x3FAC9F2FE0000000], [8 x float] [float 0x3FC7D59920000000, float 0x3FB11105E0000000, float 0xBFB809E560000000, float 0xBFB559B3E0000000, float 0xBFA9A719C0000000, float 0xBFB2CE67E0000000, float 0xBFB943F1C0000000, float 0x3FA141C820000000], [8 x float] [float 0xBFB4829D00000000, float 0xBFAC1D8E80000000, float 0xBFB55D91A0000000, float 0xBFB6E136E0000000, float 0x3FB2D26740000000, float 0x3FC92D01C0000000, float 0x3FA5EC80C0000000, float 0xBFB9818C60000000], [8 x float] [float 0x3FAC0A2880000000, float 0x3FC9173760000000, float 0x3FABA493C0000000, float 0xBFB8BD33E0000000, float 0xBFB46DF820000000, float 0xBFAACABC60000000, float 0xBFB45F4A20000000, float 0xBFB901C0C0000000], [8 x float] [float 0xBFB7C968A0000000, float 0x3FB0DCEC00000000, float 0x3FCAC33300000000, float 0x3FB1AEB3E0000000, float 0xBFB75B0BC0000000, float 0xBFB549E880000000, float 0xBFAD7B84E0000000, float 0xBFB59D8840000000], [8 x float] [float 0xBFB4862700000000, float 0xBFB82656A0000000, float 0x3FAA8587A0000000, float 0x3FCB2EF920000000, float 0x3FB7FBDF00000000, float 0xBFB49331A0000000, float 0xBFB61A9320000000, float 0xBFAE0D23E0000000], [8 x float] [float 0xBFB957EEE0000000, float 0xBFB2975B00000000, float 0xBFAE35E740000000, float 0xBFB746DC60000000, float 0xBFB0371DA0000000, float 0x3FC07839C0000000, float 0x3FCABDA940000000, float 0x3F96FC1580000000], [8 x float] [float 0xBFAEBDD340000000, float 0xBFB447E4A0000000, float 0xBFB76BD2C0000000, float 0x3FAD19BD40000000, float 0x3FCC766C60000000, float 0x3FBB166E00000000, float 0xBFB3215FC0000000, float 0xBFB65AAB40000000], [8 x float] [float 0x3F91A75CE0000000, float 0xBFB7F20A80000000, float 0xBFB2043A20000000, float 0xBFAF585BE0000000, float 0xBFB7E707E0000000, float 0xBFAAA5A460000000, float 0x3FC29003E0000000, float 0x3FCA47D3E0000000], [8 x float] [float 0x3FD2528280000000, float 0x3FB4F722E0000000, float 0xBFA2BECEE0000000, float 0xBFAAF251C0000000, float 0xBFAA50D6C0000000, float 0xBF93083560000000, float 0x3FC114DB60000000, float 0x3FD48C0060000000], [8 x float] [float 0xBF97768160000000, float 0x3FBAAF89C0000000, float 0x3FD2F1CB80000000, float 0x3FD4021080000000, float 0x3FC0B55680000000, float 0xBF89557140000000, float 0xBFA794EA00000000, float 0xBFA8068DC0000000], [8 x float] [float 0x3FC00357A0000000, float 0x3FD3B6A620000000, float 0x3FD346E4C0000000, float 0x3FBD4A2BA0000000, float 0xBF91D32400000000, float 0xBFA6D50660000000, float 0xBFA5FF8220000000, float 0xBF8863BEE0000000], [8 x float] [float 0x3FD4E4D1A0000000, float 0x3FD2B6D000000000, float 0x3FBA80BEE0000000, float 0xBF921F29A0000000, float 0xBFA50A45E0000000, float 0xBFA3C44C00000000, float 0x3F779BFE00000000, float 0x3FC44BA0E0000000], [8 x float] [float 0xBFA5508700000000, float 0xBF95193700000000, float 0x3FB81FB820000000, float 0x3FD250F400000000, float 0x3FD5576CC0000000, float 0x3FC5763E40000000, float 0x3F8168F8E0000000, float 0xBFA3CF7020000000], [8 x float] [float 0x3FB7104500000000, float 0xBF905814A0000000, float 0xBFA389D6A0000000, float 0xBFA0BDCAE0000000, float 0x3F9BB341E0000000, float 0x3FC8C45020000000, float 0x3FD5CD1420000000, float 0x3FD1963120000000], [8 x float] [float 0xBF9C6FBD20000000, float 0xBFA3726060000000, float 0xBF9B1F6880000000, float 0x3FAF182240000000, float 0x3FCF9578A0000000, float 0x3FD653EB40000000, float 0x3FCCDC0120000000, float 0x3FA7B95A20000000]], [28 x [8 x float]] [[8 x float] [float -0.000000e+00, float 0x3FECB6A620000000, float 0x3FD69A6F80000000, float 0.000000e+00, float 0.000000e+00, float 0x3FF35A35E0000000, float 0x3FD2465620000000, float 0x3FD0FF7160000000], [8 x float] [float 0x3FF0787E00000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FE3DDE380000000, float 0.000000e+00, float 0x3FC82BBEC0000000, float 0x3FCF982020000000], [8 x float] [float 0xBFBBA8F7E0000000, float -0.000000e+00, float -0.000000e+00, float 0x3FEDC150A0000000, float 0xBFC93A57E0000000, float -0.000000e+00, float 0.000000e+00, float 0x3FE041A480000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FD7846620000000, float 0x3FC9539320000000, float 0.000000e+00, float -0.000000e+00, float 0x3FEB7D0D00000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FF3AA64C0000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FE7A43360000000, float 0x3FD15B2D40000000], [8 x float] [float 0.000000e+00, float 0xBFDA3D9240000000, float 0xBFCFA6EFC0000000, float 0xBFB60C06A0000000, float 0x3FDD9270C0000000, float 0xBFD164A160000000, float 0xBFC75FBB60000000, float 0xBFC75CFAA0000000], [8 x float] [float 0.000000e+00, float 0xBFD0D7FD80000000, float 0xBFB965A140000000, float 0xBFB6AED140000000, float 0.000000e+00, float -0.000000e+00, float 0x3FC645C360000000, float 0xBFB89EA9A0000000], [8 x float] [float 0.000000e+00, float 0x3FD1D76680000000, float -0.000000e+00, float 0xBFC1FDB4C0000000, float 0xBFC2B673C0000000, float -0.000000e+00, float -0.000000e+00, float 0xBFBBEDB720000000], [8 x float] [float 0xBFC9CE9E60000000, float -0.000000e+00, float 0.000000e+00, float 0xBFC8BFB9C0000000, float 0xBFD129A1C0000000, float 0xBFC4C0F020000000, float 0x3FE1C49BA0000000, float 0xBFD1B72C60000000], [8 x float] [float 0xBFC3599240000000, float 0x3FD7176580000000, float 0xBFDDD972C0000000, float 0xBFC6D26FA0000000, float 0xBFC7E9E1C0000000, float -0.000000e+00, float 0xBFDE76A720000000, float 0xBFD4E468C0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFD1BAE8A0000000, float 0x3FD7F501A0000000, float -0.000000e+00, float 0xBFCAED7840000000, float 0xBFD0F1A5C0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float 0.000000e+00, float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFC71AD220000000, float 0xBFCEB66300000000], [8 x float] [float 0xBFD956B000000000, float -0.000000e+00, float 0xBFC8F7B180000000, float 0xBFCCB21820000000, float 0xBFDA7B56C0000000, float 0xBFC8774EE0000000, float 0xBFC40F9900000000, float -0.000000e+00], [8 x float] [float 0xBFC2D0F620000000, float 0xBFD24345C0000000, float 0xBFC406D0E0000000, float 0xBFBA753600000000, float 0xBFCF219A80000000, float 0xBFC072A7C0000000, float 0xBFC9110E40000000, float 0xBFD1F9A060000000], [8 x float] [float 0xBFC8515480000000, float 0xBFE79D2C00000000, float 0xBFDD2B5E60000000, float 0xBFD3354C20000000, float 0xBFD87C3500000000, float 0xBFE0C1A8A0000000, float 0xBFE0CB48E0000000, float 0xBFD97470E0000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FD265CF60000000, float 0.000000e+00, float 0x3FC9B6A1E0000000, float 0.000000e+00, float 0x3FD5A68B20000000, float 0x3FD2410300000000], [8 x float] [float 0xBFBA1101C0000000, float 0xBFD31272C0000000, float 0xBFDEAC9F20000000, float 0xBFC7B91700000000, float 0xBFC6647FE0000000, float 0xBFC853EB40000000, float 0xBFDCDEDF20000000, float 0xBFC26AE3A0000000], [8 x float] [float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFC8720860000000, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float 0xBFCD8AB920000000], [8 x float] [float 0.000000e+00, float 0x3FD2C3A000000000, float 0.000000e+00, float 0.000000e+00, float 0x3FC60F55E0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FCAE66440000000], [8 x float] [float -0.000000e+00, float 0x3FDB89B960000000, float 0x3FD392E620000000, float 0x3FC9A2A4E0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FD7440280000000, float 0x3FD4961800000000], [8 x float] [float 0.000000e+00, float -0.000000e+00, float 0xBFBBD9BA20000000, float 0xBFC26E43A0000000, float 0.000000e+00, float 0.000000e+00, float 0xBFC2A697A0000000, float 0xBFC94F3780000000], [8 x float] [float 0.000000e+00, float 0x3FCA3582A0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FC9B39E20000000, float 0.000000e+00, float 0x3FD15F8D20000000, float 0.000000e+00], [8 x float] [float -0.000000e+00, float 0x3FD54E65C0000000, float 0x3FD25E02E0000000, float 0.000000e+00, float 0x3FC3DD8720000000, float 0.000000e+00, float 0x3FD50F55E0000000, float 0x3FD3376500000000], [8 x float] [float -0.000000e+00, float 0xBFC52CF960000000, float -0.000000e+00, float 0xBFB7B8F580000000, float 0xBFC0748E40000000, float -0.000000e+00, float -0.000000e+00, float 0xBFD1386D20000000], [8 x float] [float 0xBFB8EF1340000000, float -0.000000e+00, float 0xBFCABF09A0000000, float 0xBFC0C0A4A0000000, float 0xBFB5386900000000, float -0.000000e+00, float 0xBFCB33FC80000000, float -0.000000e+00], [8 x float] [float 0xBFBAFEA3E0000000, float 0xBFDF72E280000000, float 0xBFDA43CC00000000, float 0xBFC85375C0000000, float 0xBFCE5C7040000000, float 0xBFD3B5FE60000000, float 0xBFDE8BAC80000000, float 0xBFD24B1240000000], [8 x float] [float 0xBFCBFED200000000, float 0xBFD85AAB40000000, float 0xBFD0BFF8A0000000, float 0xBFC4938DE0000000, float 0xBFD5AF6400000000, float 0xBFD05AC480000000, float 0xBFD1CA6440000000, float 0xBFC4B545C0000000], [8 x float] [float 0.000000e+00, float 0x3FD75A74C0000000, float 0.000000e+00, float 0.000000e+00, float 0x3FCED3F9E0000000, float 0.000000e+00, float 0x3FD308BFC0000000, float 0.000000e+00]], [28 x [8 x float]] [[8 x float] [float 0xC013759700000000, float 0xC01377DEA0000000, float 0xC0134B3420000000, float 0xC012F6A620000000, float 0xC012963700000000, float 0xC0126A1F80000000, float 0xC012A6AB60000000, float 0xC013259EE0000000], [8 x float] [float 0xC00B6C9180000000, float 0xC00BE7BBC0000000, float 0xC00C67F3C0000000, float 0xC00C7B83C0000000, float 0xC00C23C5C0000000, float 0xC00BB50E40000000, float 0xC00B5C4760000000, float 0xC00B3B8A20000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xBFFF51B0C0000000, float 0xC00023A320000000, float 0xC000711BE0000000, float 0xC0007553E0000000, float 0xC0002B1460000000, float 0xBFFF2934A0000000, float 0xBFFE4B1780000000, float 0xBFFE79C300000000], [8 x float] [float 0xC00FD543A0000000, float 0xC00F67E840000000, float 0xC00F04FC20000000, float 0xC00EE2D380000000, float 0xC00EF8BB40000000, float 0xC00F1B38E0000000, float 0xC00F68A720000000, float 0xC00FD463C0000000], [8 x float] [float 0x3FFF2DF1E0000000, float 0x3FFF69E3C0000000, float 0x40001557A0000000, float 0x4000821A80000000, float 0x40009E3FC0000000, float 0x40005C59C0000000, float 0x3FFFEF74C0000000, float 0x3FFF5F04E0000000], [8 x float] [float 0x3FFA140780000000, float 0x3FF94A6980000000, float 0x3FF8EB0960000000, float 0x3FF920B4E0000000, float 0x3FF9C6AC20000000, float 0x3FFA62B8C0000000, float 0x3FFAC7B680000000, float 0x3FFAC180E0000000], [8 x float] [float 0x3FFC8F52C0000000, float 0x3FFC8D6E40000000, float 0x3FFB8CE4E0000000, float 0x3FFA030F40000000, float 0x3FF8E2FF00000000, float 0x3FF8CF5F40000000, float 0x3FF9E0DCC0000000, float 0x3FFB8062A0000000], [8 x float] [float 0x40001899C0000000, float 0x3FFF9B1420000000, float 0x3FFF226F60000000, float 0x3FFEF73180000000, float 0x3FFF0E8C80000000, float 0x3FFF497100000000, float 0x3FFFBC9260000000, float 0x400020D0A0000000], [8 x float] [float 0x400B5AC360000000, float 0x400B9D9120000000, float 0x400B6F4620000000, float 0x400ADD0AE0000000, float 0x400A277DE0000000, float 0x4009B87F80000000, float 0x4009E502E0000000, float 0x400AA23200000000], [8 x float] [float 0x3FFBDDFFC0000000, float 0x3FFC6D5F20000000, float 0x3FFCEF3E40000000, float 0x3FFCD55920000000, float 0x3FFC4241C0000000, float 0x3FFBD272C0000000, float 0x3FFB9B5B80000000, float 0x3FFB963BA0000000], [8 x float] [float 0x3FF96BBDC0000000, float 0x3FFA478000000000, float 0x3FFAA8C9C0000000, float 0x3FFA5F4800000000, float 0x3FF9A70A00000000, float 0x3FF8D881A0000000, float 0x3FF86CBEA0000000, float 0x3FF8A9CEE0000000], [8 x float] [float 0x40091BBB60000000, float 0x400951D820000000, float 0x40094A6F40000000, float 0x40090A50E0000000, float 0x4008BEC460000000, float 0x400891DE60000000, float 0x4008963560000000, float 0x4008CD2AA0000000], [8 x float] [float 0.000000e+00, float 0.000000e+00, float 0x3FF196EF00000000, float 0x3FF2E379C0000000, float 0x3FF2E88060000000, float 0x3FF20826A0000000, float 0.000000e+00, float 0.000000e+00], [8 x float] [float 0x4016288B20000000, float 0x40162D0CC0000000, float 0x4015F11480000000, float 0x4015731220000000, float 0x4014D52B00000000, float 0x40148F61A0000000, float 0x4014F6BC60000000, float 0x4015B738E0000000], [8 x float] [float 0xC010397C00000000, float 0xC01077D740000000, float 0xC01039A340000000, float 0xC00F3DBE40000000, float 0xC00E1A5000000000, float 0xC00DA1C160000000, float 0xC00E0DE900000000, float 0xC00F3C84C0000000], [8 x float] [float 0x40022A9400000000, float 0x4001078100000000, float 0x4000520F20000000, float 0x400089BC00000000, float 0x4001585400000000, float 0x4002101320000000, float 0x40028F7440000000, float 0x4002C05DE0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xC00E409FE0000000, float 0xC00D95F0C0000000, float 0xC00D31F260000000, float 0xC00D2CA140000000, float 0xC00D7F8D20000000, float 0xC00DFB9840000000, float 0xC00E812380000000, float 0xC00EB70600000000], [8 x float] [float 0xC0113C8DA0000000, float 0xC0115FDC60000000, float 0xC011A9A960000000, float 0xC011E90C00000000, float 0xC011D6FF00000000, float 0xC0118956C0000000, float 0xC011463D80000000, float 0xC0113279A0000000], [8 x float] [float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00], [8 x float] [float 0xC00815C180000000, float 0xC008E1BE20000000, float 0xC00936E2E0000000, float 0xC00919C8C0000000, float 0xC008C6B300000000, float 0xC008529020000000, float 0xC007D15E80000000, float 0xC007959700000000], [8 x float] [float 0xC007A2D280000000, float 0xC006B72DE0000000, float 0xC005924F20000000, float 0xC0054D5E00000000, float 0xC0060AB920000000, float 0xC006DDBEC0000000, float 0xC00777A800000000, float 0xC007D4F8C0000000], [8 x float] [float 0x3FF359EA60000000, float 0x3FF60BA520000000, float 0x3FF6792F20000000, float 0x3FF4390FC0000000, float 0x3FF1C23000000000, float 0x3FF07A4300000000, float 0.000000e+00, float 0.000000e+00], [8 x float] [float 0x4000B721E0000000, float 0x4000432CA0000000, float 0x3FFD79A380000000, float 0x3FFB21F180000000, float 0x3FFA43C9E0000000, float 0x3FFA897100000000, float 0x3FFC34C3C0000000, float 0x3FFF2D43E0000000], [8 x float] [float 0x4011C09600000000, float 0x4011F8D2A0000000, float 0x40126B0700000000, float 0x4012E2A6C0000000, float 0x4012C7D640000000, float 0x40121A00A0000000, float 0x40119EE8E0000000, float 0x40119C93E0000000], [8 x float] [float 0x4010D23EE0000000, float 0x4010312060000000, float 0x400F8B86C0000000, float 0x400F2C9FC0000000, float 0x400F74C980000000, float 0x40105AE100000000, float 0x401123A920000000, float 0x4011534CA0000000], [8 x float] [float 0xC00B82C120000000, float 0xC00B937000000000, float 0xC00B06EA80000000, float 0xC009CA5160000000, float 0xC00815F240000000, float 0xC007543840000000, float 0xC0088ABF80000000, float 0xC00A776700000000]]], align 16
@d_scalingFilt = protected local_unnamed_addr addrspace(4) externally_initialized global [5 x float] [float 0x3FB6A161E0000000, float 0x3FD6A161E0000000, float 0x3FE0F837C0000000, float 0x3FD6A161E0000000, float 0x3FB6A161E0000000], align 16
@d_v1GaussFilt = protected local_unnamed_addr addrspace(4) externally_initialized global [9 x float] [float 0x3F46F00680000000, float 0x3F8FBE76C0000000, float 0x3FB71DE6A0000000, float 0x3FCE0418A0000000, float 0x3FD4587940000000, float 0x3FCE0418A0000000, float 0x3FB71DE6A0000000, float 0x3F8FBE76C0000000, float 0x3F46F00680000000], align 16
@d_complexV1Filt = protected local_unnamed_addr addrspace(4) externally_initialized global [11 x float] [float 0x3F5F212D80000000, float 0x3F86872B00000000, float 0x3FA60418A0000000, float 0x3FBD3C3620000000, float 0x3FCA43FE60000000, float 0x3FCFEF9DC0000000, float 0x3FCA43FE60000000, float 0x3FBD3C3620000000, float 0x3FA60418A0000000, float 0x3F86872B00000000, float 0x3F5F212D80000000], align 16
@d_normV1filt = protected local_unnamed_addr addrspace(4) externally_initialized global [25 x float] [float 0x3F726E9780000000, float 0x3F7D7DBF40000000, float 0x3F8652BD40000000, float 0x3F90624DE0000000, float 0x3F970A3D80000000, float 0x3F9F06F6A0000000, float 0x3FA41F2120000000, float 0x3FA9168720000000, float 0x3FAE0DED20000000, float 0x3FB147AE20000000, float 0x3FB318FC60000000, float 0x3FB4467380000000, float 0x3FB4AF4F00000000, float 0x3FB4467380000000, float 0x3FB318FC60000000, float 0x3FB147AE20000000, float 0x3FAE0DED20000000, float 0x3FA9168720000000, float 0x3FA41F2120000000, float 0x3F9F06F6A0000000, float 0x3F970A3D80000000, float 0x3F90624DE0000000, float 0x3F8652BD40000000, float 0x3F7D7DBF40000000, float 0x3F726E9780000000], align 16
@d_diff1filt = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] [float -5.000000e-01, float 0.000000e+00, float 5.000000e-01], align 4
@d_diff2filt = protected local_unnamed_addr addrspace(4) externally_initialized global [3 x float] [float 1.000000e+00, float -2.000000e+00, float 1.000000e+00], align 4
@d_diff3filt = protected local_unnamed_addr addrspace(4) externally_initialized global [5 x float] [float -5.000000e-01, float 1.000000e+00, float 0.000000e+00, float -1.000000e+00, float 5.000000e-01], align 16

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13dev_normalizePfS_id(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, double %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = shl i32 %13, 8
  %15 = ashr exact i32 %14, 8
  %16 = mul nsw i32 %15, %9
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = shl i32 %23, 8
  %25 = ashr exact i32 %24, 8
  %26 = mul nsw i32 %25, %9
  %27 = icmp slt i32 %18, %2
  br i1 %27, label %28, label %88

28:                                               ; preds = %4
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %30 = mul i32 %29, %2
  %31 = mul i32 %29, 28
  %32 = fmul contract double %3, %3
  %33 = mul i32 %31, %2
  %34 = or i32 %31, 1
  %35 = mul i32 %34, %2
  %36 = or i32 %31, 2
  %37 = mul i32 %36, %2
  %38 = or i32 %31, 3
  %39 = mul i32 %38, %2
  %40 = add i32 %31, 4
  %41 = mul i32 %40, %2
  %42 = add i32 %31, 5
  %43 = mul i32 %42, %2
  %44 = add i32 %31, 6
  %45 = mul i32 %44, %2
  %46 = add i32 %31, 7
  %47 = mul i32 %46, %2
  %48 = add i32 %31, 8
  %49 = mul i32 %48, %2
  %50 = add i32 %31, 9
  %51 = mul i32 %50, %2
  %52 = add i32 %31, 10
  %53 = mul i32 %52, %2
  %54 = add i32 %31, 11
  %55 = mul i32 %54, %2
  %56 = add i32 %31, 12
  %57 = mul i32 %56, %2
  %58 = add i32 %31, 13
  %59 = mul i32 %58, %2
  %60 = add i32 %31, 14
  %61 = mul i32 %60, %2
  %62 = add i32 %31, 15
  %63 = mul i32 %62, %2
  %64 = add i32 %31, 16
  %65 = mul i32 %64, %2
  %66 = add i32 %31, 17
  %67 = mul i32 %66, %2
  %68 = add i32 %31, 18
  %69 = mul i32 %68, %2
  %70 = add i32 %31, 19
  %71 = mul i32 %70, %2
  %72 = add i32 %31, 20
  %73 = mul i32 %72, %2
  %74 = add i32 %31, 21
  %75 = mul i32 %74, %2
  %76 = add i32 %31, 22
  %77 = mul i32 %76, %2
  %78 = add i32 %31, 23
  %79 = mul i32 %78, %2
  %80 = add i32 %31, 24
  %81 = mul i32 %80, %2
  %82 = add i32 %31, 25
  %83 = mul i32 %82, %2
  %84 = add i32 %31, 26
  %85 = mul i32 %84, %2
  %86 = add i32 %31, 27
  %87 = mul i32 %86, %2
  br label %89

88:                                               ; preds = %89, %4
  ret void

89:                                               ; preds = %28, %89
  %90 = phi i32 [ %18, %28 ], [ %293, %89 ]
  %91 = add i32 %90, %30
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fpext float %94 to double
  %96 = fadd contract double %32, %95
  %97 = add i32 %33, %90
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fpext float %100 to double
  %102 = fdiv contract double %101, %96
  %103 = fptrunc double %102 to float
  store float %103, float addrspace(1)* %99, align 4, !tbaa !16
  %104 = add i32 %35, %90
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fpext float %107 to double
  %109 = fdiv contract double %108, %96
  %110 = fptrunc double %109 to float
  store float %110, float addrspace(1)* %106, align 4, !tbaa !16
  %111 = add i32 %37, %90
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fpext float %114 to double
  %116 = fdiv contract double %115, %96
  %117 = fptrunc double %116 to float
  store float %117, float addrspace(1)* %113, align 4, !tbaa !16
  %118 = add i32 %39, %90
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = fpext float %121 to double
  %123 = fdiv contract double %122, %96
  %124 = fptrunc double %123 to float
  store float %124, float addrspace(1)* %120, align 4, !tbaa !16
  %125 = add i32 %41, %90
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !16
  %129 = fpext float %128 to double
  %130 = fdiv contract double %129, %96
  %131 = fptrunc double %130 to float
  store float %131, float addrspace(1)* %127, align 4, !tbaa !16
  %132 = add i32 %43, %90
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !16
  %136 = fpext float %135 to double
  %137 = fdiv contract double %136, %96
  %138 = fptrunc double %137 to float
  store float %138, float addrspace(1)* %134, align 4, !tbaa !16
  %139 = add i32 %45, %90
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !16
  %143 = fpext float %142 to double
  %144 = fdiv contract double %143, %96
  %145 = fptrunc double %144 to float
  store float %145, float addrspace(1)* %141, align 4, !tbaa !16
  %146 = add i32 %47, %90
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !16
  %150 = fpext float %149 to double
  %151 = fdiv contract double %150, %96
  %152 = fptrunc double %151 to float
  store float %152, float addrspace(1)* %148, align 4, !tbaa !16
  %153 = add i32 %49, %90
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !16
  %157 = fpext float %156 to double
  %158 = fdiv contract double %157, %96
  %159 = fptrunc double %158 to float
  store float %159, float addrspace(1)* %155, align 4, !tbaa !16
  %160 = add i32 %51, %90
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !16
  %164 = fpext float %163 to double
  %165 = fdiv contract double %164, %96
  %166 = fptrunc double %165 to float
  store float %166, float addrspace(1)* %162, align 4, !tbaa !16
  %167 = add i32 %53, %90
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %0, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !16
  %171 = fpext float %170 to double
  %172 = fdiv contract double %171, %96
  %173 = fptrunc double %172 to float
  store float %173, float addrspace(1)* %169, align 4, !tbaa !16
  %174 = add i32 %55, %90
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !16
  %178 = fpext float %177 to double
  %179 = fdiv contract double %178, %96
  %180 = fptrunc double %179 to float
  store float %180, float addrspace(1)* %176, align 4, !tbaa !16
  %181 = add i32 %57, %90
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %0, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !16
  %185 = fpext float %184 to double
  %186 = fdiv contract double %185, %96
  %187 = fptrunc double %186 to float
  store float %187, float addrspace(1)* %183, align 4, !tbaa !16
  %188 = add i32 %59, %90
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !16
  %192 = fpext float %191 to double
  %193 = fdiv contract double %192, %96
  %194 = fptrunc double %193 to float
  store float %194, float addrspace(1)* %190, align 4, !tbaa !16
  %195 = add i32 %61, %90
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %0, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !16
  %199 = fpext float %198 to double
  %200 = fdiv contract double %199, %96
  %201 = fptrunc double %200 to float
  store float %201, float addrspace(1)* %197, align 4, !tbaa !16
  %202 = add i32 %63, %90
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %0, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !16
  %206 = fpext float %205 to double
  %207 = fdiv contract double %206, %96
  %208 = fptrunc double %207 to float
  store float %208, float addrspace(1)* %204, align 4, !tbaa !16
  %209 = add i32 %65, %90
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %0, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !16
  %213 = fpext float %212 to double
  %214 = fdiv contract double %213, %96
  %215 = fptrunc double %214 to float
  store float %215, float addrspace(1)* %211, align 4, !tbaa !16
  %216 = add i32 %67, %90
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %0, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !16
  %220 = fpext float %219 to double
  %221 = fdiv contract double %220, %96
  %222 = fptrunc double %221 to float
  store float %222, float addrspace(1)* %218, align 4, !tbaa !16
  %223 = add i32 %69, %90
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %0, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !16
  %227 = fpext float %226 to double
  %228 = fdiv contract double %227, %96
  %229 = fptrunc double %228 to float
  store float %229, float addrspace(1)* %225, align 4, !tbaa !16
  %230 = add i32 %71, %90
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %0, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !16
  %234 = fpext float %233 to double
  %235 = fdiv contract double %234, %96
  %236 = fptrunc double %235 to float
  store float %236, float addrspace(1)* %232, align 4, !tbaa !16
  %237 = add i32 %73, %90
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %0, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !16
  %241 = fpext float %240 to double
  %242 = fdiv contract double %241, %96
  %243 = fptrunc double %242 to float
  store float %243, float addrspace(1)* %239, align 4, !tbaa !16
  %244 = add i32 %75, %90
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !16
  %248 = fpext float %247 to double
  %249 = fdiv contract double %248, %96
  %250 = fptrunc double %249 to float
  store float %250, float addrspace(1)* %246, align 4, !tbaa !16
  %251 = add i32 %77, %90
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %0, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !16
  %255 = fpext float %254 to double
  %256 = fdiv contract double %255, %96
  %257 = fptrunc double %256 to float
  store float %257, float addrspace(1)* %253, align 4, !tbaa !16
  %258 = add i32 %79, %90
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds float, float addrspace(1)* %0, i64 %259
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !16
  %262 = fpext float %261 to double
  %263 = fdiv contract double %262, %96
  %264 = fptrunc double %263 to float
  store float %264, float addrspace(1)* %260, align 4, !tbaa !16
  %265 = add i32 %81, %90
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %0, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !16
  %269 = fpext float %268 to double
  %270 = fdiv contract double %269, %96
  %271 = fptrunc double %270 to float
  store float %271, float addrspace(1)* %267, align 4, !tbaa !16
  %272 = add i32 %83, %90
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds float, float addrspace(1)* %0, i64 %273
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !16
  %276 = fpext float %275 to double
  %277 = fdiv contract double %276, %96
  %278 = fptrunc double %277 to float
  store float %278, float addrspace(1)* %274, align 4, !tbaa !16
  %279 = add i32 %85, %90
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %0, i64 %280
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !16
  %283 = fpext float %282 to double
  %284 = fdiv contract double %283, %96
  %285 = fptrunc double %284 to float
  store float %285, float addrspace(1)* %281, align 4, !tbaa !16
  %286 = add i32 %87, %90
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds float, float addrspace(1)* %0, i64 %287
  %289 = load float, float addrspace(1)* %288, align 4, !tbaa !16
  %290 = fpext float %289 to double
  %291 = fdiv contract double %290, %96
  %292 = fptrunc double %291 to float
  store float %292, float addrspace(1)* %288, align 4, !tbaa !16
  %293 = add nsw i32 %90, %26
  %294 = icmp slt i32 %293, %2
  br i1 %294, label %89, label %88, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
