; ModuleID = '../data/hip_kernels/16034/77/main.cu'
source_filename = "../data/hip_kernels/16034/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M64_J1 = internal unnamed_addr addrspace(4) constant [120 x double] [double 0.000000e+00, double 5.000000e-01, double 0xBC37ED0E3B828B08, double 0xBFAFFFFFFFFFFFF5, double 0xBCE0293164FB7EB1, double 0x3F65555555561A43, double 0xBD4677D2FF1A71B8, double 0xBF0C71C715CC6962, double 0xBD855CABD8EBF8FC, double 0x3EA6C1780F921557, double 0xBDA2ED5069AAC6FE, double 0xBE383B4470480845, double 0xBDA01864213FB0F9, double 0x3DC4844C536D3A2C, double 0xBD735A9C5CC3AB06, double 0x3FE29EA3D19F035F, double 0xBC59E62CC35EC1BE, double 0xBFCA41115C5DF242, double 0x3F78D1448E6FEE77, double 0x3F8C441A2F9DDF5D, double 0xBF386671C18BFE53, double 0xBF39E2504DD90DCF, double 0x3EE34CCBCAB07EC9, double 0x3EDA4973743766EE, double 0xBE810453841038E8, double 0xBE70FADE42A46CB3, double 0x3E135494D664AEE3, double 0x3DFE5B866C453F65, double 0xBD9EB2970ACB8068, double 0xBD82FAF08AAFB901, double 0.000000e+00, double 0xBFD9C6CF582CBF7F, double 0x3FAAE8A39F51AD04, double 0x3FAB589D1DA13AA3, double 0xBF7537544C331CD2, double 0xBF624B3409976AC2, double 0x3F26E4C2D52DAE44, double 0x3F083A06E62D9F8F, double 0xBEC9799D369B7229, double 0xBEA338283463A4EE, double 0x3E6170516F7C85EE, double 0x3E34584933FDDD86, double 0xBDF026119D7F08AF, double 0xBDBF9000DA3A4471, double 0x3D5F7332C56D63D2, double 0xBFD626EE83500BF2, double 0xBC40432466D6E3F3, double 0x3FC55F6BEC9EF961, double 0xBF83D23336FD10A9, double 0xBF88C77A983A068D, double 0x3F45CDC98DB18C8C, double 0x3F373576FF44EF39, double 0xBEF24614479A1346, double 0xBED7B85342EA7515, double 0x3E90ABFC294C82A1, double 0x3E6EA79EAB269916, double 0xBE235BBE38F3529C, double 0xBDFB5A33186E7193, double 0x3DAEFC264AA83BF3, double 0x3D8145CBB6E8A3A0, double 0.000000e+00, double 0x3FD33518B3874E8A, double 0xBF95E70DC60362BF, double 0xBFA80C83BDEEE593, double 0x3F69A4B292E3DE28, double 0x3F613FBC7D695936, double 0xBF207358BBDBE512, double 0xBF0796A751A29AC8, double 0x3EC4255B013502CF, double 0x3EA3026DB6F0DBC4, double 0xBE5D48DCA8C5FC90, double 0xBE3445E1DA91DBCA, double 0x3DEC62A36E1968D3, double 0x3DBE721272D8248E, double 0xBD739F923D874246, double 0x3FD17DBF09D40D25, double 0x3C44967F4F7FC629, double 0xBFC1404BF647C28F, double 0x3F74F4DF2769F79D, double 0x3F85C6285429B55E, double 0xBF3D68AB7227E79D, double 0xBF356ACB64517694, double 0x3EEC10B47C6794FC, double 0x3ED67EAAE7C19EC8, double 0xBE8BB65280097FDB, double 0xBE6D871DDEB2DB00, double 0x3E20F432B5F8846E, double 0x3DFA96B19CBA8298, double 0xBDAC2077A86562A4, double 0xBD810893DC905EFB, double 0.000000e+00, double 0xBFCFF654544EBCD0, double 0x3F89223FF2C0785A, double 0x3FA4B0C5D5DA65D1, double 0xBF5F91A9EE0D218C, double 0xBF5F51C24898187F, double 0x3F16B4C9CA04065C, double 0x3F063C547294C80D, double 0xBEBE3725C3BED76A, double 0xBEA25C1053590F28, double 0x3E57485BC4AFFD32, double 0x3E33E27187DB1B90, double 0xBDE77B93FF00A8D9, double 0xBDBDB9D1890C1963, double 0x3D69BC7332D23C98, double 0xBFCDDCEB4CE1BF4A, double 0xBC44E6F0FF2BE5DA, double 0x3FBDA52116C0A63F, double 0xBF6A9DA4603B66C1, double 0xBF8331E74EA59A28, double 0x3F33E5CB6EB9D4D2, double 0x3F33885FE9AEE88D, double 0xBEE494C0F422BE24, double 0xBED512B9D2882A32, double 0x3E85A86081766E10, double 0x3E6C323D60D5C85A, double 0xBE1BCC0C4C6C296F, double 0xBDF9BBB359D527C1, double 0x3DA7E38DB953D46D, double 0x3D80C831B59F5952], align 8
@__ocmltbl_M64_Y1 = internal unnamed_addr addrspace(4) constant [270 x double] [double 0xBFC91866143CBC8A, double 0x3FABD3975C75B4A7, double 0xBF6835B97894BE5B, double 0x3F12C7DBFFCDE97D, double 0xBEB0A780AC776EAC, double 0x3E432E5A4DDEEA30, double 0xBDCF0CE34D2066A6, double 0x3D52A4E1AEA45C18, double 0xBCD1474ADE9154AC, double 0x3C4978BA84F218C0, double 0xBBBE9598C0163788, double 0x3B2E7E5FCFC49D52, double 0xBA99A6C125CD4A4B, double 0x3A0273872098881C, double 0xB966E9D99D76D143, double 0xBFF78B26A2B7C4DF, double 0x4003FCC6CC40CDC8, double 0xC012D291E3254D05, double 0x4023F3A228303640, double 0xC0342F25541834D5, double 0x40443F9C12BF4AB6, double 0xC05449BFBBF62991, double 0x40644FB5451116BC, double 0xC0745269AC3FA0DB, double 0x40844BA4401F2779, double 0xC09414D76E7B7997, double 0x40A320F5FE16F70A, double 0xC0B03E4B57E41DF5, double 0x40B4F69E69A4F4FB, double 0xC0AD2DBB0F5B271A, double 0xBFF3797262D3470D, double 0x3FFAB7E1EDEFAFA8, double 0xC0024846FB79F39A, double 0x40101BF3F4FA0318, double 0xC01A594EAB7356D8, double 0x402529F452075247, double 0xC030FAE25FDC4E3B, double 0x403B37934724E423, double 0xC045CC0DE6C9E845, double 0x4051708D1A40185C, double 0xC05BC7F31A7D6E5C, double 0x4065A379BA1401C8, double 0xC06F0B0AD21C1A88, double 0x4071AE75EDD45DEB, double 0xC066A3BB6C3BC030, double 0xBFF099FCBE60FD83, double 0x3FF3F0CA40455E64, double 0xBFF3BFF758706437, double 0x3FFE635F86EB952C, double 0xC00518FB90840D37, double 0x400C3F8901B6B53E, double 0xC012E70C7140D7A2, double 0x401944BBA4AE4A2A, double 0xC020DE9423C41CB2, double 0x40267A063C3E4E1F, double 0xC02DAA214568B0F7, double 0x4032D7AF68B5B7BB, double 0xC03555C5991EB83A, double 0x40325AD3BCD1C212, double 0xC021074C12C09791, double 0xBFEACBF57F2DDCA8, double 0x3FEDCA17107B904E, double 0xBFE1BBD2B0457CDF, double 0x3FE77A8F333CCBB2, double 0xBFEB89C1B814324B, double 0x3FED760AF4FFB08B, double 0xBFEF8CF4A5A36F58, double 0x3FF0E518D641E18F, double 0xBFF20E81208FA7BC, double 0x3FF3376B177DAD58, double 0xBFF41C66D0E0C209, double 0x3FF3E3FED2BA82A1, double 0xBFF1009BEF1C1ED4, double 0x3FE551AD045B2B05, double 0xBFCBF968FB74C1F5, double 0xBFE36E6B6B7643F7, double 0x3FE79C5F275090C0, double 0xBFCA0C195B672E36, double 0x3FCAE3C79B655957, double 0xBFCD944BFBB59E94, double 0x3FC859BA5C97B008, double 0xBFC3E9C794C4910B, double 0x3FC073CBE8A621FB, double 0xBFBB1CF7A1D06A0B, double 0x3FB64331589B8D85, double 0xBFB214CBE1D92F45, double 0x3FAC3017799BA518, double 0xBFA37C91F275A49C, double 0x3F945A0EE3E461F4, double 0xBF76CE6DB619DFCB, double 0xBFD9145D558C1484, double 0x3FE4D465C2CC8BB9, double 0xBFB9A53A6FC4F8D2, double 0x3FA5A04EF5B3BE17, double 0xBFB2870DCA6BBBA8, double 0x3FA959DC1B5CA22F, double 0xBF9FD1701AF4F6C8, double 0x3F94F4669C520714, double 0xBF8B9C51B6264199, double 0x3F821867B6956ED4, double 0xBF7793000339B970, double 0x3F6DF65915265695, double 0xBF6174D53E085260, double 0x3F500D917DBC1489, double 0xBF307F689E7C1FF8, double 0xBFC9482110CE7907, double 0x3FE300298C4BC6DB, double 0xBFB760867541F31A, double 0xBF8C1C01516C919F, double 0xBF99CE754717084F, double 0x3F92149F4F3E4A7D, double 0xBF8141D386A70A68, double 0x3F7298E689470B8F, double 0xBF6493304450D3E1, double 0x3F5678E25A319117, double 0xBF4872DA1BCE2DFB, double 0x3F3A677FB40DBF50, double 0xBF2B726429D57741, double 0x3F188B8A000DDEB3, double 0xBEFB11671433A545, double 0.000000e+00, double 0x3FE0AA48442F014B, double 0xBFBE56F82217B8F1, double 0xBFA0D2AF4E932386, double 0xBF73A6DEC37290AA, double 0x3F7E671C7D1198C2, double 0xBF65429DC5A4571B, double 0x3F517AB4AFA1770F, double 0xBF40B2D877CEC32A, double 0x3F2EEA7BF7A3AF87, double 0xBF1C3FAE660AEEFB, double 0x3F09D11D21C2ECE2, double 0xBEF79526605F9903, double 0x3EE5C5B6BEE7147F, double 0xBED3D818ACF4319F, double 0x3FADED04EB2F8F23, double 0x3FDF7EB2F74619DB, double 0xBFC0A92031647ABD, double 0xBFA17D0AAC12CAF8, double 0xBF501B12268FC3BE, double 0x3F781B3A8783D65C, double 0xBF5F13C3971E1240, double 0x3F46AF0F6BAFEEB3, double 0xBF34DF6F71C51090, double 0x3F227DE227AF4204, double 0xBF0FFDDD56E31177, double 0x3EFB3F437408AF5D, double 0xBEE5AEEF5A8D616E, double 0x3ECC00D34BE2E087, double 0xBEA4C7F0E4847DB1, double 0x3FCEC444C4C077CA, double 0x3FD754D9F5EBEE6E, double 0xBFC5DBC72A6FCD06, double 0xBF9C45318021591E, double 0x3F7F6232AD13A468, double 0x3F6675FB15DD65CC, double 0xBF4B70DC1DFAB822, double 0x3F25178509C8DFFD, double 0xBF10FBA65912DFAD, double 0x3EFB97B9CAB9DD89, double 0xBEE42DF3752F458B, double 0x3ECD263C5A2A0CF3, double 0xBEB419A6ED1F3133, double 0x3E9722448D6C6B4D, double 0xBE6F968C1760EA44, double 0x3FDAABB4011ED330, double 0x3C97623D98C40FBF, double 0xBFC8B45BABE797C1, double 0x3F8E147099A6D924, double 0x3F88C5AF1EEB4695, double 0xBF4133FA47A23C24, double 0xBF3BF8AF944ED4C6, double 0x3F021D6483F67C2F, double 0x3EB44D30D299B6F7, double 0x3EB14C792DD315F1, double 0xBE9B8F5A5B07796D, double 0x3E7A741606128773, double 0xBE5BDE8E4E6A28D8, double 0x3E40CB2C5BA5E6B9, double 0xBE22967744B15F9C, double 0x3FD7843613523E7F, double 0xBFC75654A46B95C5, double 0xBFC368BC54BE4F06, double 0x3FA31BFBC9CB82A3, double 0x3F82CC37920F76A3, double 0xBF5AF2C8815E3FE3, double 0xBF32A7121C69428C, double 0x3F075298ECB8C751, double 0x3EC63DED0744F6F9, double 0xBE8754D788CB6020, double 0xBE8027347B18E32A, double 0x3E597C5ADCDAC214, double 0xBE322680B0FBE186, double 0x3E0E64B283A65579, double 0xBDE02608B566F8D5, double 0.000000e+00, double 0xBFD5C7C556F0C199, double 0x3FA00B9F8571CA1F, double 0x3FAA15D92DFE3DD1, double 0xBF710A329E2C23B2, double 0xBF61BE6DB991A919, double 0x3F2337C7E137E72D, double 0x3F085B940D416677, double 0xBEC806191189D631, double 0xBEA255E5098A01B5, double 0x3E5B62C536F9E018, double 0x3E3808E3D2AC8FCA, double 0xBDFA799F4759A3E7, double 0x3D94EC0A14B5CDF4, double 0xBD95412530847C52, double 0xBFD36732D4B96094, double 0xBC3CEEF52886C58E, double 0x3FC3001C8002CAF7, double 0xBF7BF5A03BAB4931, double 0xBF8751EA028C1873, double 0x3F423874CD8CCDA2, double 0x3F364F6610D5226E, double 0xBEF02978DE052C61, double 0xBED72F07655A8EB0, double 0x3E8F208123BB6540, double 0x3E6DEFD3E8ED0235, double 0xBE2205926B336E7E, double 0xBDFB62D4804FB244, double 0x3DB00C025FDA5D77, double 0x3D800419AC68AAE1, double 0.000000e+00, double 0x3FD15F993FCEAB5C, double 0xBF902B3933CF21B1, double 0xBFA6395DFE49FCBD, double 0x3F63CED2A2E6916F, double 0x3F607A678D5FDF7B, double 0xBF1B50D7E1D2F596, double 0xBF06F7BAB0BC8947, double 0x3EC176E72BD30AF3, double 0x3EA2BECAE04D97FC, double 0xBE5A384EA928E49A, double 0xBE341E2AA12C9A44, double 0x3DE9E2E75967AAC7, double 0x3DBE6FCC09518560, double 0xBD7243FBE2456B83, double 0x3FD00EF3745E0E3C, double 0x3C4354A449398E41, double 0xBFBFCDACDDA138F1, double 0x3F706CC34CD82970, double 0x3F84641BB10C15C9, double 0xBF37FAC943E210BA, double 0xBF34769ED32CC451, double 0x3EE80608EC528CBD, double 0x3ED5CC824132DB1A, double 0xBE888C8EA16EFD07, double 0xBE6CE58E67A63C4A, double 0x3E1ED0D7B94D1E27, double 0x3DFA2F65AC967F11, double 0xBDAA05857D61E344, double 0xBD80DDB4C7A5B2C2, double 0.000000e+00, double 0xBFCDC14EA14E89F9, double 0x3F84429FEF5B5FBD, double 0x3FA367D7D608E4A3, double 0xBF59D6EB2BC49E17, double 0xBF5DC4F991B39911, double 0x3F1315EC04D6BD38, double 0x3F05718149D2AC24, double 0xBEBA2977F9ED10D6, double 0xBEA1E863D8AC307D, double 0x3E54A7B7D8AF34A1, double 0x3E339017071CB777, double 0xBDE549934363D75D, double 0xBDBDDF663C0D3F53, double 0x3D6EA9D18ACB267F], align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_y1(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %723

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fcmp ugt double %35, 1.256250e+01
  br i1 %36, label %519, label %37

37:                                               ; preds = %32
  %38 = fcmp olt double %35, 2.312500e+00
  br i1 %38, label %39, label %64

39:                                               ; preds = %37
  %40 = fcmp olt double %35, 1.218750e+00
  br i1 %40, label %41, label %53

41:                                               ; preds = %39
  %42 = fcmp olt double %35, 5.000000e-01
  br i1 %42, label %90, label %43

43:                                               ; preds = %41
  %44 = fcmp olt double %35, 6.250000e-01
  %45 = fcmp olt double %35, 7.500000e-01
  %46 = fcmp olt double %35, 9.375000e-01
  %47 = select i1 %46, double 7.500000e-01, double 9.375000e-01
  %48 = select i1 %46, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 60)
  %49 = select i1 %45, double 6.250000e-01, double %47
  %50 = select i1 %45, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 30), double addrspace(4)* %48
  %51 = select i1 %44, double 5.000000e-01, double %49
  %52 = select i1 %44, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 15), double addrspace(4)* %50
  br label %90

53:                                               ; preds = %39
  %54 = fcmp olt double %35, 1.531250e+00
  br i1 %54, label %90, label %55

55:                                               ; preds = %53
  %56 = fcmp olt double %35, 1.843750e+00
  %57 = fcmp olt double %35, 0x4000A00000000000
  %58 = select i1 %57, double 1.843750e+00, double 0x400193BED4DFF243
  %59 = select i1 %57, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 120)
  %60 = or i1 %56, %57
  %61 = select i1 %60, double 0.000000e+00, double 0xBC8BD1E50D219BFD
  %62 = select i1 %56, double 1.531250e+00, double %58
  %63 = select i1 %56, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 90), double addrspace(4)* %59
  br label %90

64:                                               ; preds = %37
  %65 = fcmp olt double %35, 6.187500e+00
  br i1 %65, label %66, label %79

66:                                               ; preds = %64
  %67 = fcmp olt double %35, 0x4005E00000000000
  br i1 %67, label %90, label %68

68:                                               ; preds = %66
  %69 = fcmp olt double %35, 3.156250e+00
  br i1 %69, label %90, label %70

70:                                               ; preds = %68
  %71 = fcmp olt double %35, 0x4010D00000000000
  %72 = fcmp olt double %35, 4.687500e+00
  %73 = select i1 %72, double 0.000000e+00, double 0x3CBDFE7BAC228E8C
  %74 = select i1 %72, double 0x4010D00000000000, double 0x4015B7FE4E87B02E
  %75 = select i1 %72, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 180), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 195)
  %76 = select i1 %71, double 0x3C53BAC0714E4129, double %73
  %77 = select i1 %71, double 0x400D76D4AFFBA175, double %74
  %78 = select i1 %71, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 165), double addrspace(4)* %75
  br label %90

79:                                               ; preds = %64
  %80 = fcmp olt double %35, 0x401F140000000000
  br i1 %80, label %90, label %81

81:                                               ; preds = %79
  %82 = fcmp olt double %35, 0x4022B80000000000
  %83 = fcmp olt double %35, 1.093750e+01
  %84 = select i1 %83, double 0x3CC8F4BA5D68E440, double 0x3C80FC786CE06080
  %85 = select i1 %83, double 0x40243F2EE51E8C7E, double 0x40277F9138D43206
  %86 = select i1 %83, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 240), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 255)
  %87 = select i1 %82, double 0x3CB479CC068D9046, double %84
  %88 = select i1 %82, double 0x40213127AE6169B4, double %85
  %89 = select i1 %82, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 225), double addrspace(4)* %86
  br label %90

90:                                               ; preds = %81, %79, %70, %68, %66, %55, %53, %43, %41
  %91 = phi double [ 0.000000e+00, %41 ], [ 0.000000e+00, %53 ], [ 0.000000e+00, %66 ], [ 0.000000e+00, %68 ], [ 0x3CA7960B6B1C46AC, %79 ], [ %61, %55 ], [ %76, %70 ], [ %87, %81 ], [ 0.000000e+00, %43 ]
  %92 = phi double [ 0.000000e+00, %41 ], [ 1.218750e+00, %53 ], [ 2.312500e+00, %66 ], [ 0x4005E00000000000, %68 ], [ 0x401BC41890588553, %79 ], [ %62, %55 ], [ %77, %70 ], [ %88, %81 ], [ %51, %43 ]
  %93 = phi double addrspace(4)* [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 0), %41 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 75), %53 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 135), %66 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 150), %68 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y1, i64 0, i64 210), %79 ], [ %63, %55 ], [ %78, %70 ], [ %89, %81 ], [ %52, %43 ]
  %94 = fmul double %35, %35
  %95 = fsub double %35, %92
  %96 = fsub double %95, %91
  %97 = fcmp olt double %35, 5.000000e-01
  %98 = select i1 %97, double %94, double %96
  %99 = getelementptr inbounds double, double addrspace(4)* %93, i64 14
  %100 = load double, double addrspace(4)* %99, align 8, !tbaa !20
  %101 = getelementptr inbounds double, double addrspace(4)* %93, i64 13
  %102 = load double, double addrspace(4)* %101, align 8, !tbaa !20
  %103 = tail call double @llvm.fma.f64(double %98, double %100, double %102)
  %104 = getelementptr inbounds double, double addrspace(4)* %93, i64 12
  %105 = load double, double addrspace(4)* %104, align 8, !tbaa !20
  %106 = tail call double @llvm.fma.f64(double %98, double %103, double %105)
  %107 = getelementptr inbounds double, double addrspace(4)* %93, i64 11
  %108 = load double, double addrspace(4)* %107, align 8, !tbaa !20
  %109 = tail call double @llvm.fma.f64(double %98, double %106, double %108)
  %110 = getelementptr inbounds double, double addrspace(4)* %93, i64 10
  %111 = load double, double addrspace(4)* %110, align 8, !tbaa !20
  %112 = tail call double @llvm.fma.f64(double %98, double %109, double %111)
  %113 = getelementptr inbounds double, double addrspace(4)* %93, i64 9
  %114 = load double, double addrspace(4)* %113, align 8, !tbaa !20
  %115 = tail call double @llvm.fma.f64(double %98, double %112, double %114)
  %116 = getelementptr inbounds double, double addrspace(4)* %93, i64 8
  %117 = load double, double addrspace(4)* %116, align 8, !tbaa !20
  %118 = tail call double @llvm.fma.f64(double %98, double %115, double %117)
  %119 = getelementptr inbounds double, double addrspace(4)* %93, i64 7
  %120 = load double, double addrspace(4)* %119, align 8, !tbaa !20
  %121 = tail call double @llvm.fma.f64(double %98, double %118, double %120)
  %122 = getelementptr inbounds double, double addrspace(4)* %93, i64 6
  %123 = load double, double addrspace(4)* %122, align 8, !tbaa !20
  %124 = tail call double @llvm.fma.f64(double %98, double %121, double %123)
  %125 = getelementptr inbounds double, double addrspace(4)* %93, i64 5
  %126 = load double, double addrspace(4)* %125, align 8, !tbaa !20
  %127 = tail call double @llvm.fma.f64(double %98, double %124, double %126)
  %128 = getelementptr inbounds double, double addrspace(4)* %93, i64 4
  %129 = load double, double addrspace(4)* %128, align 8, !tbaa !20
  %130 = tail call double @llvm.fma.f64(double %98, double %127, double %129)
  %131 = getelementptr inbounds double, double addrspace(4)* %93, i64 3
  %132 = load double, double addrspace(4)* %131, align 8, !tbaa !20
  %133 = tail call double @llvm.fma.f64(double %98, double %130, double %132)
  %134 = getelementptr inbounds double, double addrspace(4)* %93, i64 2
  %135 = load double, double addrspace(4)* %134, align 8, !tbaa !20
  %136 = tail call double @llvm.fma.f64(double %98, double %133, double %135)
  %137 = getelementptr inbounds double, double addrspace(4)* %93, i64 1
  %138 = load double, double addrspace(4)* %137, align 8, !tbaa !20
  %139 = tail call double @llvm.fma.f64(double %98, double %136, double %138)
  %140 = load double, double addrspace(4)* %93, align 8, !tbaa !20
  %141 = tail call double @llvm.fma.f64(double %98, double %139, double %140)
  br i1 %97, label %142, label %720

142:                                              ; preds = %90
  %143 = fcmp olt double %35, 0x3DE0000000000000
  %144 = tail call double @llvm.fabs.f64(double %35)
  br i1 %143, label %145, label %147

145:                                              ; preds = %142
  %146 = fdiv double 0xBFE45F306DC9C883, %144
  br label %515

147:                                              ; preds = %142
  %148 = fcmp ugt double %144, 0x4029080000000000
  br i1 %148, label %222, label %149

149:                                              ; preds = %147
  %150 = fcmp ugt double %144, 0x4018B00000000000
  br i1 %150, label %162, label %151

151:                                              ; preds = %149
  %152 = fcmp ugt double %144, 1.093750e+00
  br i1 %152, label %153, label %173

153:                                              ; preds = %151
  %154 = fcmp ugt double %144, 2.843750e+00
  %155 = fcmp ugt double %144, 0x4012500000000000
  %156 = select i1 %155, double 0x3CA5C646A75D7539, double 0xBCA60155A9D1B256
  %157 = select i1 %155, double 0x40155365BC032467, double 0x400EA75575AF6F09
  %158 = select i1 %155, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 30)
  %159 = select i1 %154, double %156, double 0x3C5616D820CFDAEB
  %160 = select i1 %154, double %157, double 0x3FFD757D1FEC8A3A
  %161 = select i1 %154, double addrspace(4)* %158, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 15)
  br label %173

162:                                              ; preds = %149
  %163 = fcmp ugt double %144, 7.781250e+00
  br i1 %163, label %164, label %173

164:                                              ; preds = %162
  %165 = fcmp ugt double %144, 0x4022B80000000000
  %166 = fcmp ugt double %144, 0x4025E80000000000
  %167 = select i1 %166, double 0x3CC9A84D3A5FEDC2, double 0x3CC02610A51562B6
  %168 = select i1 %166, double 0x40276979797EE5AC, double 0x402458D0D0BDFC29
  %169 = select i1 %166, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 90)
  %170 = select i1 %165, double %167, double 0xBCA63E17EC20A31D
  %171 = select i1 %165, double %168, double 0x402112980F0B88A1
  %172 = select i1 %165, double addrspace(4)* %169, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 75)
  br label %173

173:                                              ; preds = %164, %162, %153, %151
  %174 = phi double [ 0.000000e+00, %151 ], [ 0xBC9B226D9D243827, %162 ], [ %159, %153 ], [ %170, %164 ]
  %175 = phi double [ 0.000000e+00, %151 ], [ 0x401C0FF5F3B47250, %162 ], [ %160, %153 ], [ %171, %164 ]
  %176 = phi double addrspace(4)* [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 0), %151 ], [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J1, i64 0, i64 60), %162 ], [ %161, %153 ], [ %172, %164 ]
  %177 = fsub double %144, %175
  %178 = fsub double %177, %174
  %179 = getelementptr inbounds double, double addrspace(4)* %176, i64 14
  %180 = load double, double addrspace(4)* %179, align 8, !tbaa !20
  %181 = getelementptr inbounds double, double addrspace(4)* %176, i64 13
  %182 = load double, double addrspace(4)* %181, align 8, !tbaa !20
  %183 = tail call double @llvm.fma.f64(double %178, double %180, double %182)
  %184 = getelementptr inbounds double, double addrspace(4)* %176, i64 12
  %185 = load double, double addrspace(4)* %184, align 8, !tbaa !20
  %186 = tail call double @llvm.fma.f64(double %178, double %183, double %185)
  %187 = getelementptr inbounds double, double addrspace(4)* %176, i64 11
  %188 = load double, double addrspace(4)* %187, align 8, !tbaa !20
  %189 = tail call double @llvm.fma.f64(double %178, double %186, double %188)
  %190 = getelementptr inbounds double, double addrspace(4)* %176, i64 10
  %191 = load double, double addrspace(4)* %190, align 8, !tbaa !20
  %192 = tail call double @llvm.fma.f64(double %178, double %189, double %191)
  %193 = getelementptr inbounds double, double addrspace(4)* %176, i64 9
  %194 = load double, double addrspace(4)* %193, align 8, !tbaa !20
  %195 = tail call double @llvm.fma.f64(double %178, double %192, double %194)
  %196 = getelementptr inbounds double, double addrspace(4)* %176, i64 8
  %197 = load double, double addrspace(4)* %196, align 8, !tbaa !20
  %198 = tail call double @llvm.fma.f64(double %178, double %195, double %197)
  %199 = getelementptr inbounds double, double addrspace(4)* %176, i64 7
  %200 = load double, double addrspace(4)* %199, align 8, !tbaa !20
  %201 = tail call double @llvm.fma.f64(double %178, double %198, double %200)
  %202 = getelementptr inbounds double, double addrspace(4)* %176, i64 6
  %203 = load double, double addrspace(4)* %202, align 8, !tbaa !20
  %204 = tail call double @llvm.fma.f64(double %178, double %201, double %203)
  %205 = getelementptr inbounds double, double addrspace(4)* %176, i64 5
  %206 = load double, double addrspace(4)* %205, align 8, !tbaa !20
  %207 = tail call double @llvm.fma.f64(double %178, double %204, double %206)
  %208 = getelementptr inbounds double, double addrspace(4)* %176, i64 4
  %209 = load double, double addrspace(4)* %208, align 8, !tbaa !20
  %210 = tail call double @llvm.fma.f64(double %178, double %207, double %209)
  %211 = getelementptr inbounds double, double addrspace(4)* %176, i64 3
  %212 = load double, double addrspace(4)* %211, align 8, !tbaa !20
  %213 = tail call double @llvm.fma.f64(double %178, double %210, double %212)
  %214 = getelementptr inbounds double, double addrspace(4)* %176, i64 2
  %215 = load double, double addrspace(4)* %214, align 8, !tbaa !20
  %216 = tail call double @llvm.fma.f64(double %178, double %213, double %215)
  %217 = getelementptr inbounds double, double addrspace(4)* %176, i64 1
  %218 = load double, double addrspace(4)* %217, align 8, !tbaa !20
  %219 = tail call double @llvm.fma.f64(double %178, double %216, double %218)
  %220 = load double, double addrspace(4)* %176, align 8, !tbaa !20
  %221 = tail call double @llvm.fma.f64(double %178, double %219, double %220)
  br label %424

222:                                              ; preds = %147
  %223 = fdiv double 1.000000e+00, %144
  %224 = fmul double %223, %223
  %225 = tail call double @llvm.fma.f64(double %224, double 0x41BC22F653D3A76E, double 0xC1780A4D95ED3E8E)
  %226 = tail call double @llvm.fma.f64(double %224, double %225, double 0x41272F1D1F8CDD76)
  %227 = tail call double @llvm.fma.f64(double %224, double %226, double 0xC0D3EA4E96460AD7)
  %228 = tail call double @llvm.fma.f64(double %224, double %227, double 0x408488DD98D9AB3A)
  %229 = tail call double @llvm.fma.f64(double %224, double %228, double 0xC03E9ED612FA3B38)
  %230 = tail call double @llvm.fma.f64(double %224, double %229, double 0x4002F484FCAB9DDA)
  %231 = tail call double @llvm.fma.f64(double %224, double %230, double 0xBFD7BCCCCAD443C0)
  %232 = tail call double @llvm.fma.f64(double %224, double %231, double 0x3FC4FFFFFFFFCBFA)
  %233 = tail call double @llvm.fma.f64(double %224, double %232, double -3.750000e-01)
  %234 = fmul double %223, %233
  %235 = tail call double @llvm.amdgcn.rsq.f64(double %223)
  %236 = fmul double %223, %235
  %237 = fmul double %235, 5.000000e-01
  %238 = fneg double %237
  %239 = tail call double @llvm.fma.f64(double %238, double %236, double 5.000000e-01)
  %240 = tail call double @llvm.fma.f64(double %237, double %239, double %237)
  %241 = tail call double @llvm.fma.f64(double %236, double %239, double %236)
  %242 = fneg double %241
  %243 = tail call double @llvm.fma.f64(double %242, double %241, double %223)
  %244 = tail call double @llvm.fma.f64(double %243, double %240, double %241)
  %245 = fcmp oeq double %223, 0.000000e+00
  %246 = select i1 %245, double %223, double %244
  %247 = fmul double %246, 0x3FE9884533D43651
  %248 = tail call double @llvm.fma.f64(double %224, double 0xC137940A06621145, double 0x40F591FB68428BAF)
  %249 = tail call double @llvm.fma.f64(double %224, double %248, double 0xC0A996552A8BAFB0)
  %250 = tail call double @llvm.fma.f64(double %224, double %249, double 0x4060795578CD8C93)
  %251 = tail call double @llvm.fma.f64(double %224, double %250, double 0xC01EF38364596B5A)
  %252 = tail call double @llvm.fma.f64(double %224, double %251, double 0x3FE9C4FA465744C7)
  %253 = tail call double @llvm.fma.f64(double %224, double %252, double 0xBFC8BFFFFC3937C1)
  %254 = tail call double @llvm.fma.f64(double %224, double %253, double 0x3FC7FFFFFFFFC240)
  %255 = tail call double @llvm.fma.f64(double %224, double %254, double 1.000000e+00)
  %256 = fmul double %247, %255
  %257 = fcmp olt double %144, 0x41D0000000000000
  br i1 %257, label %258, label %277

258:                                              ; preds = %222
  %259 = fmul double %144, 0x3FE45F306DC9C883
  %260 = tail call double @llvm.rint.f64(double %259)
  %261 = tail call double @llvm.fma.f64(double %260, double 0xBFF921FB54442D18, double %144)
  %262 = tail call double @llvm.fma.f64(double %260, double 0xBC91A62633145C00, double %261)
  %263 = fmul double %260, 0x3C91A62633145C00
  %264 = fneg double %263
  %265 = tail call double @llvm.fma.f64(double %260, double 0x3C91A62633145C00, double %264)
  %266 = fsub double %261, %263
  %267 = fsub double %261, %266
  %268 = fsub double %267, %263
  %269 = fsub double %266, %262
  %270 = fadd double %269, %268
  %271 = fsub double %270, %265
  %272 = tail call double @llvm.fma.f64(double %260, double 0xB97B839A252049C0, double %271)
  %273 = fadd double %262, %272
  %274 = fsub double %273, %262
  %275 = fsub double %272, %274
  %276 = fptosi double %260 to i32
  br label %353

277:                                              ; preds = %222
  %278 = tail call double @llvm.amdgcn.trig.preop.f64(double %144, i32 0)
  %279 = tail call double @llvm.amdgcn.trig.preop.f64(double %144, i32 1)
  %280 = tail call double @llvm.amdgcn.trig.preop.f64(double %144, i32 2)
  %281 = fcmp oge double %144, 0x7B00000000000000
  %282 = tail call double @llvm.amdgcn.ldexp.f64(double %144, i32 -128)
  %283 = select i1 %281, double %282, double %144
  %284 = fmul double %280, %283
  %285 = fneg double %284
  %286 = tail call double @llvm.fma.f64(double %280, double %283, double %285)
  %287 = fmul double %279, %283
  %288 = fneg double %287
  %289 = tail call double @llvm.fma.f64(double %279, double %283, double %288)
  %290 = fmul double %278, %283
  %291 = fneg double %290
  %292 = tail call double @llvm.fma.f64(double %278, double %283, double %291)
  %293 = fadd double %287, %292
  %294 = fsub double %293, %287
  %295 = fsub double %293, %294
  %296 = fsub double %292, %294
  %297 = fsub double %287, %295
  %298 = fadd double %296, %297
  %299 = fadd double %284, %289
  %300 = fsub double %299, %284
  %301 = fsub double %299, %300
  %302 = fsub double %289, %300
  %303 = fsub double %284, %301
  %304 = fadd double %302, %303
  %305 = fadd double %299, %298
  %306 = fsub double %305, %299
  %307 = fsub double %305, %306
  %308 = fsub double %298, %306
  %309 = fsub double %299, %307
  %310 = fadd double %308, %309
  %311 = fadd double %304, %310
  %312 = fadd double %286, %311
  %313 = fadd double %290, %293
  %314 = fsub double %313, %290
  %315 = fsub double %293, %314
  %316 = fadd double %315, %305
  %317 = fsub double %316, %315
  %318 = fsub double %305, %317
  %319 = fadd double %318, %312
  %320 = tail call double @llvm.amdgcn.ldexp.f64(double %313, i32 -2)
  %321 = tail call double @llvm.amdgcn.fract.f64(double %320)
  %322 = tail call i1 @llvm.amdgcn.class.f64(double %320, i32 516)
  %323 = select i1 %322, double 0.000000e+00, double %321
  %324 = tail call double @llvm.amdgcn.ldexp.f64(double %323, i32 2)
  %325 = fadd double %324, %316
  %326 = fcmp olt double %325, 0.000000e+00
  %327 = select i1 %326, double 4.000000e+00, double 0.000000e+00
  %328 = fadd double %324, %327
  %329 = fadd double %316, %328
  %330 = fptosi double %329 to i32
  %331 = sitofp i32 %330 to double
  %332 = fsub double %328, %331
  %333 = fadd double %316, %332
  %334 = fsub double %333, %332
  %335 = fsub double %316, %334
  %336 = fadd double %319, %335
  %337 = fcmp oge double %333, 5.000000e-01
  %338 = zext i1 %337 to i32
  %339 = add nsw i32 %338, %330
  %340 = select i1 %337, double 1.000000e+00, double 0.000000e+00
  %341 = fsub double %333, %340
  %342 = fadd double %341, %336
  %343 = fsub double %342, %341
  %344 = fsub double %336, %343
  %345 = fmul double %342, 0x3FF921FB54442D18
  %346 = fneg double %345
  %347 = tail call double @llvm.fma.f64(double %342, double 0x3FF921FB54442D18, double %346)
  %348 = tail call double @llvm.fma.f64(double %342, double 0x3C91A62633145C07, double %347)
  %349 = tail call double @llvm.fma.f64(double %344, double 0x3FF921FB54442D18, double %348)
  %350 = fadd double %345, %349
  %351 = fsub double %350, %345
  %352 = fsub double %349, %351
  br label %353

353:                                              ; preds = %277, %258
  %354 = phi double [ %275, %258 ], [ %352, %277 ]
  %355 = phi double [ %273, %258 ], [ %350, %277 ]
  %356 = phi i32 [ %276, %258 ], [ %339, %277 ]
  %357 = and i32 %356, 3
  %358 = fcmp olt double %355, %234
  %359 = sext i1 %358 to i32
  %360 = add nsw i32 %357, -1
  %361 = add nsw i32 %360, %359
  %362 = select i1 %358, i32 -2147483648, i32 0
  %363 = xor i32 %362, -1075240453
  %364 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %363, i64 1
  %365 = bitcast <2 x i32> %364 to double
  %366 = xor i32 %362, -1132354010
  %367 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %366, i64 1
  %368 = bitcast <2 x i32> %367 to double
  %369 = fsub double %365, %234
  %370 = fsub double %365, %369
  %371 = fsub double %370, %234
  %372 = fadd double %371, %368
  %373 = fadd double %369, %372
  %374 = fsub double %373, %369
  %375 = fsub double %372, %374
  %376 = fadd double %355, %373
  %377 = fsub double %376, %373
  %378 = fsub double %355, %377
  %379 = fadd double %354, %375
  %380 = fadd double %378, %379
  %381 = fadd double %376, %380
  %382 = fsub double %381, %376
  %383 = fsub double %380, %382
  %384 = fmul double %381, %381
  %385 = fmul double %384, 5.000000e-01
  %386 = fsub double 1.000000e+00, %385
  %387 = fsub double 1.000000e+00, %386
  %388 = fsub double %387, %385
  %389 = fmul double %384, %384
  %390 = tail call double @llvm.fma.f64(double %384, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %391 = tail call double @llvm.fma.f64(double %384, double %390, double 0xBE927E4FA17F65F6)
  %392 = tail call double @llvm.fma.f64(double %384, double %391, double 0x3EFA01A019F4EC90)
  %393 = tail call double @llvm.fma.f64(double %384, double %392, double 0xBF56C16C16C16967)
  %394 = tail call double @llvm.fma.f64(double %384, double %393, double 0x3FA5555555555555)
  %395 = fneg double %383
  %396 = tail call double @llvm.fma.f64(double %381, double %395, double %388)
  %397 = tail call double @llvm.fma.f64(double %389, double %394, double %396)
  %398 = fadd double %386, %397
  %399 = tail call double @llvm.fma.f64(double %384, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %400 = tail call double @llvm.fma.f64(double %384, double %399, double 0x3EC71DE3796CDE01)
  %401 = tail call double @llvm.fma.f64(double %384, double %400, double 0xBF2A01A019E83E5C)
  %402 = tail call double @llvm.fma.f64(double %384, double %401, double 0x3F81111111110BB3)
  %403 = fneg double %384
  %404 = fmul double %381, %403
  %405 = fmul double %383, 5.000000e-01
  %406 = tail call double @llvm.fma.f64(double %404, double %402, double %405)
  %407 = tail call double @llvm.fma.f64(double %384, double %406, double %395)
  %408 = tail call double @llvm.fma.f64(double %404, double 0xBFC5555555555555, double %407)
  %409 = fsub double %381, %408
  %410 = fneg double %409
  %411 = and i32 %361, 1
  %412 = icmp eq i32 %411, 0
  %413 = select i1 %412, double %398, double %410
  %414 = bitcast double %413 to <2 x i32>
  %415 = shl i32 %361, 30
  %416 = and i32 %415, -2147483648
  %417 = extractelement <2 x i32> %414, i64 1
  %418 = xor i32 %417, %416
  %419 = insertelement <2 x i32> %414, i32 %418, i64 1
  %420 = bitcast <2 x i32> %419 to double
  %421 = fmul double %256, %420
  %422 = tail call i1 @llvm.amdgcn.class.f64(double %144, i32 512)
  %423 = select i1 %422, double 0.000000e+00, double %421
  br label %424

424:                                              ; preds = %353, %173
  %425 = phi double [ %221, %173 ], [ %423, %353 ]
  %426 = fcmp olt double %35, 0.000000e+00
  %427 = fneg double %425
  %428 = select i1 %426, double %427, double %425
  %429 = tail call double @llvm.amdgcn.frexp.mant.f64(double %35)
  %430 = fcmp olt double %429, 0x3FE5555555555555
  %431 = zext i1 %430 to i32
  %432 = tail call double @llvm.amdgcn.ldexp.f64(double %429, i32 %431)
  %433 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %35)
  %434 = sub nsw i32 %433, %431
  %435 = fadd double %432, -1.000000e+00
  %436 = fadd double %432, 1.000000e+00
  %437 = fadd double %436, -1.000000e+00
  %438 = fsub double %432, %437
  %439 = tail call double @llvm.amdgcn.rcp.f64(double %436)
  %440 = fneg double %436
  %441 = tail call double @llvm.fma.f64(double %440, double %439, double 1.000000e+00)
  %442 = tail call double @llvm.fma.f64(double %441, double %439, double %439)
  %443 = tail call double @llvm.fma.f64(double %440, double %442, double 1.000000e+00)
  %444 = tail call double @llvm.fma.f64(double %443, double %442, double %442)
  %445 = fmul double %435, %444
  %446 = fmul double %436, %445
  %447 = fneg double %446
  %448 = tail call double @llvm.fma.f64(double %445, double %436, double %447)
  %449 = tail call double @llvm.fma.f64(double %445, double %438, double %448)
  %450 = fadd double %446, %449
  %451 = fsub double %450, %446
  %452 = fsub double %449, %451
  %453 = fsub double %435, %450
  %454 = fsub double %435, %453
  %455 = fsub double %454, %450
  %456 = fsub double %455, %452
  %457 = fadd double %453, %456
  %458 = fmul double %444, %457
  %459 = fadd double %445, %458
  %460 = fsub double %459, %445
  %461 = fsub double %458, %460
  %462 = fmul double %459, %459
  %463 = tail call double @llvm.fma.f64(double %462, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %464 = tail call double @llvm.fma.f64(double %462, double %463, double 0x3FC7474DD7F4DF2E)
  %465 = tail call double @llvm.fma.f64(double %462, double %464, double 0x3FCC71C016291751)
  %466 = tail call double @llvm.fma.f64(double %462, double %465, double 0x3FD249249B27ACF1)
  %467 = tail call double @llvm.fma.f64(double %462, double %466, double 0x3FD99999998EF7B6)
  %468 = tail call double @llvm.fma.f64(double %462, double %467, double 0x3FE5555555555780)
  %469 = tail call double @llvm.amdgcn.ldexp.f64(double %459, i32 1)
  %470 = tail call double @llvm.amdgcn.ldexp.f64(double %461, i32 1)
  %471 = fmul double %459, %462
  %472 = fmul double %471, %468
  %473 = fadd double %469, %472
  %474 = fsub double %473, %469
  %475 = fsub double %472, %474
  %476 = fadd double %470, %475
  %477 = fadd double %473, %476
  %478 = fsub double %477, %473
  %479 = fsub double %476, %478
  %480 = sitofp i32 %434 to double
  %481 = fmul double %480, 0x3FE62E42FEFA39EF
  %482 = fneg double %481
  %483 = tail call double @llvm.fma.f64(double %480, double 0x3FE62E42FEFA39EF, double %482)
  %484 = tail call double @llvm.fma.f64(double %480, double 0x3C7ABC9E3B39803F, double %483)
  %485 = fadd double %481, %484
  %486 = fsub double %485, %481
  %487 = fsub double %484, %486
  %488 = fadd double %485, %477
  %489 = fsub double %488, %485
  %490 = fsub double %488, %489
  %491 = fsub double %485, %490
  %492 = fsub double %477, %489
  %493 = fadd double %492, %491
  %494 = fadd double %487, %479
  %495 = fsub double %494, %487
  %496 = fsub double %494, %495
  %497 = fsub double %487, %496
  %498 = fsub double %479, %495
  %499 = fadd double %498, %497
  %500 = fadd double %494, %493
  %501 = fadd double %488, %500
  %502 = fsub double %501, %488
  %503 = fsub double %500, %502
  %504 = fadd double %499, %503
  %505 = fadd double %501, %504
  %506 = fcmp oeq double %144, 0x7FF0000000000000
  %507 = select i1 %506, double %35, double %505
  %508 = select i1 %426, double 0x7FF8000000000000, double %507
  %509 = fcmp oeq double %35, 0.000000e+00
  %510 = select i1 %509, double 0xFFF0000000000000, double %508
  %511 = fdiv double -1.000000e+00, %35
  %512 = tail call double @llvm.fmuladd.f64(double %428, double %510, double %511)
  %513 = fmul double %512, 0x3FE45F306DC9C883
  %514 = tail call double @llvm.fma.f64(double %141, double %35, double %513)
  br label %515

515:                                              ; preds = %424, %145
  %516 = phi double [ %146, %145 ], [ %514, %424 ]
  %517 = fcmp olt double %35, 0.000000e+00
  %518 = select i1 %517, double 0x7FF8000000000000, double %516
  br label %720

519:                                              ; preds = %32
  %520 = fdiv double 1.000000e+00, %35
  %521 = fmul double %520, %520
  %522 = tail call double @llvm.fma.f64(double %521, double 0x41BC22F653D3A76E, double 0xC1780A4D95ED3E8E)
  %523 = tail call double @llvm.fma.f64(double %521, double %522, double 0x41272F1D1F8CDD76)
  %524 = tail call double @llvm.fma.f64(double %521, double %523, double 0xC0D3EA4E96460AD7)
  %525 = tail call double @llvm.fma.f64(double %521, double %524, double 0x408488DD98D9AB3A)
  %526 = tail call double @llvm.fma.f64(double %521, double %525, double 0xC03E9ED612FA3B38)
  %527 = tail call double @llvm.fma.f64(double %521, double %526, double 0x4002F484FCAB9DDA)
  %528 = tail call double @llvm.fma.f64(double %521, double %527, double 0xBFD7BCCCCAD443C0)
  %529 = tail call double @llvm.fma.f64(double %521, double %528, double 0x3FC4FFFFFFFFCBFA)
  %530 = tail call double @llvm.fma.f64(double %521, double %529, double -3.750000e-01)
  %531 = fmul double %520, %530
  %532 = tail call double @llvm.amdgcn.rsq.f64(double %520)
  %533 = fmul double %520, %532
  %534 = fmul double %532, 5.000000e-01
  %535 = fneg double %534
  %536 = tail call double @llvm.fma.f64(double %535, double %533, double 5.000000e-01)
  %537 = tail call double @llvm.fma.f64(double %534, double %536, double %534)
  %538 = tail call double @llvm.fma.f64(double %533, double %536, double %533)
  %539 = fneg double %538
  %540 = tail call double @llvm.fma.f64(double %539, double %538, double %520)
  %541 = tail call double @llvm.fma.f64(double %540, double %537, double %538)
  %542 = fcmp oeq double %520, 0.000000e+00
  %543 = select i1 %542, double %520, double %541
  %544 = fmul double %543, 0x3FE9884533D43651
  %545 = tail call double @llvm.fma.f64(double %521, double 0xC137940A06621145, double 0x40F591FB68428BAF)
  %546 = tail call double @llvm.fma.f64(double %521, double %545, double 0xC0A996552A8BAFB0)
  %547 = tail call double @llvm.fma.f64(double %521, double %546, double 0x4060795578CD8C93)
  %548 = tail call double @llvm.fma.f64(double %521, double %547, double 0xC01EF38364596B5A)
  %549 = tail call double @llvm.fma.f64(double %521, double %548, double 0x3FE9C4FA465744C7)
  %550 = tail call double @llvm.fma.f64(double %521, double %549, double 0xBFC8BFFFFC3937C1)
  %551 = tail call double @llvm.fma.f64(double %521, double %550, double 0x3FC7FFFFFFFFC240)
  %552 = tail call double @llvm.fma.f64(double %521, double %551, double 1.000000e+00)
  %553 = fmul double %544, %552
  %554 = fcmp olt double %35, 0x41D0000000000000
  br i1 %554, label %555, label %574

555:                                              ; preds = %519
  %556 = fmul double %35, 0x3FE45F306DC9C883
  %557 = tail call double @llvm.rint.f64(double %556)
  %558 = tail call double @llvm.fma.f64(double %557, double 0xBFF921FB54442D18, double %35)
  %559 = tail call double @llvm.fma.f64(double %557, double 0xBC91A62633145C00, double %558)
  %560 = fmul double %557, 0x3C91A62633145C00
  %561 = fneg double %560
  %562 = tail call double @llvm.fma.f64(double %557, double 0x3C91A62633145C00, double %561)
  %563 = fsub double %558, %560
  %564 = fsub double %558, %563
  %565 = fsub double %564, %560
  %566 = fsub double %563, %559
  %567 = fadd double %566, %565
  %568 = fsub double %567, %562
  %569 = tail call double @llvm.fma.f64(double %557, double 0xB97B839A252049C0, double %568)
  %570 = fadd double %559, %569
  %571 = fsub double %570, %559
  %572 = fsub double %569, %571
  %573 = fptosi double %557 to i32
  br label %650

574:                                              ; preds = %519
  %575 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 0)
  %576 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 1)
  %577 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 2)
  %578 = fcmp oge double %35, 0x7B00000000000000
  %579 = tail call double @llvm.amdgcn.ldexp.f64(double %35, i32 -128)
  %580 = select i1 %578, double %579, double %35
  %581 = fmul double %577, %580
  %582 = fneg double %581
  %583 = tail call double @llvm.fma.f64(double %577, double %580, double %582)
  %584 = fmul double %576, %580
  %585 = fneg double %584
  %586 = tail call double @llvm.fma.f64(double %576, double %580, double %585)
  %587 = fmul double %575, %580
  %588 = fneg double %587
  %589 = tail call double @llvm.fma.f64(double %575, double %580, double %588)
  %590 = fadd double %584, %589
  %591 = fsub double %590, %584
  %592 = fsub double %590, %591
  %593 = fsub double %589, %591
  %594 = fsub double %584, %592
  %595 = fadd double %593, %594
  %596 = fadd double %581, %586
  %597 = fsub double %596, %581
  %598 = fsub double %596, %597
  %599 = fsub double %586, %597
  %600 = fsub double %581, %598
  %601 = fadd double %599, %600
  %602 = fadd double %596, %595
  %603 = fsub double %602, %596
  %604 = fsub double %602, %603
  %605 = fsub double %595, %603
  %606 = fsub double %596, %604
  %607 = fadd double %605, %606
  %608 = fadd double %601, %607
  %609 = fadd double %583, %608
  %610 = fadd double %587, %590
  %611 = fsub double %610, %587
  %612 = fsub double %590, %611
  %613 = fadd double %612, %602
  %614 = fsub double %613, %612
  %615 = fsub double %602, %614
  %616 = fadd double %615, %609
  %617 = tail call double @llvm.amdgcn.ldexp.f64(double %610, i32 -2)
  %618 = tail call double @llvm.amdgcn.fract.f64(double %617)
  %619 = tail call i1 @llvm.amdgcn.class.f64(double %617, i32 516)
  %620 = select i1 %619, double 0.000000e+00, double %618
  %621 = tail call double @llvm.amdgcn.ldexp.f64(double %620, i32 2)
  %622 = fadd double %621, %613
  %623 = fcmp olt double %622, 0.000000e+00
  %624 = select i1 %623, double 4.000000e+00, double 0.000000e+00
  %625 = fadd double %621, %624
  %626 = fadd double %613, %625
  %627 = fptosi double %626 to i32
  %628 = sitofp i32 %627 to double
  %629 = fsub double %625, %628
  %630 = fadd double %613, %629
  %631 = fsub double %630, %629
  %632 = fsub double %613, %631
  %633 = fadd double %616, %632
  %634 = fcmp oge double %630, 5.000000e-01
  %635 = zext i1 %634 to i32
  %636 = add nsw i32 %635, %627
  %637 = select i1 %634, double 1.000000e+00, double 0.000000e+00
  %638 = fsub double %630, %637
  %639 = fadd double %638, %633
  %640 = fsub double %639, %638
  %641 = fsub double %633, %640
  %642 = fmul double %639, 0x3FF921FB54442D18
  %643 = fneg double %642
  %644 = tail call double @llvm.fma.f64(double %639, double 0x3FF921FB54442D18, double %643)
  %645 = tail call double @llvm.fma.f64(double %639, double 0x3C91A62633145C07, double %644)
  %646 = tail call double @llvm.fma.f64(double %641, double 0x3FF921FB54442D18, double %645)
  %647 = fadd double %642, %646
  %648 = fsub double %647, %642
  %649 = fsub double %646, %648
  br label %650

650:                                              ; preds = %574, %555
  %651 = phi double [ %572, %555 ], [ %649, %574 ]
  %652 = phi double [ %570, %555 ], [ %647, %574 ]
  %653 = phi i32 [ %573, %555 ], [ %636, %574 ]
  %654 = and i32 %653, 3
  %655 = fcmp olt double %652, %531
  %656 = sext i1 %655 to i32
  %657 = add nsw i32 %654, -1
  %658 = add nsw i32 %657, %656
  %659 = select i1 %655, i32 -2147483648, i32 0
  %660 = xor i32 %659, -1075240453
  %661 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %660, i64 1
  %662 = bitcast <2 x i32> %661 to double
  %663 = xor i32 %659, -1132354010
  %664 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %663, i64 1
  %665 = bitcast <2 x i32> %664 to double
  %666 = fsub double %662, %531
  %667 = fsub double %662, %666
  %668 = fsub double %667, %531
  %669 = fadd double %668, %665
  %670 = fadd double %666, %669
  %671 = fsub double %670, %666
  %672 = fsub double %669, %671
  %673 = fadd double %652, %670
  %674 = fsub double %673, %670
  %675 = fsub double %652, %674
  %676 = fadd double %651, %672
  %677 = fadd double %675, %676
  %678 = fadd double %673, %677
  %679 = fsub double %678, %673
  %680 = fsub double %677, %679
  %681 = fmul double %678, %678
  %682 = fmul double %681, 5.000000e-01
  %683 = fsub double 1.000000e+00, %682
  %684 = fsub double 1.000000e+00, %683
  %685 = fsub double %684, %682
  %686 = fmul double %681, %681
  %687 = tail call double @llvm.fma.f64(double %681, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %688 = tail call double @llvm.fma.f64(double %681, double %687, double 0xBE927E4FA17F65F6)
  %689 = tail call double @llvm.fma.f64(double %681, double %688, double 0x3EFA01A019F4EC90)
  %690 = tail call double @llvm.fma.f64(double %681, double %689, double 0xBF56C16C16C16967)
  %691 = tail call double @llvm.fma.f64(double %681, double %690, double 0x3FA5555555555555)
  %692 = fneg double %680
  %693 = tail call double @llvm.fma.f64(double %678, double %692, double %685)
  %694 = tail call double @llvm.fma.f64(double %686, double %691, double %693)
  %695 = fadd double %683, %694
  %696 = tail call double @llvm.fma.f64(double %681, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %697 = tail call double @llvm.fma.f64(double %681, double %696, double 0x3EC71DE3796CDE01)
  %698 = tail call double @llvm.fma.f64(double %681, double %697, double 0xBF2A01A019E83E5C)
  %699 = tail call double @llvm.fma.f64(double %681, double %698, double 0x3F81111111110BB3)
  %700 = fneg double %681
  %701 = fmul double %678, %700
  %702 = fmul double %680, 5.000000e-01
  %703 = tail call double @llvm.fma.f64(double %701, double %699, double %702)
  %704 = tail call double @llvm.fma.f64(double %681, double %703, double %692)
  %705 = tail call double @llvm.fma.f64(double %701, double 0xBFC5555555555555, double %704)
  %706 = fsub double %678, %705
  %707 = and i32 %658, 1
  %708 = icmp eq i32 %707, 0
  %709 = select i1 %708, double %706, double %695
  %710 = bitcast double %709 to <2 x i32>
  %711 = shl i32 %658, 30
  %712 = and i32 %711, -2147483648
  %713 = extractelement <2 x i32> %710, i64 1
  %714 = xor i32 %713, %712
  %715 = insertelement <2 x i32> %710, i32 %714, i64 1
  %716 = bitcast <2 x i32> %715 to double
  %717 = fmul double %553, %716
  %718 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 512)
  %719 = select i1 %718, double 0.000000e+00, double %717
  br label %720

720:                                              ; preds = %90, %515, %650
  %721 = phi double [ %719, %650 ], [ %518, %515 ], [ %141, %90 ]
  %722 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %721, double addrspace(1)* %722, align 8, !tbaa !16
  br label %723

723:                                              ; preds = %720, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"double", !10, i64 0}
