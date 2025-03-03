; ModuleID = '../data/hip_kernels/16034/76/main.cu'
source_filename = "../data/hip_kernels/16034/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M64_J0 = internal unnamed_addr addrspace(4) constant [120 x double] [double 1.000000e+00, double 0xBCA4907401F4E73A, double 0xBFCFFFFFFFFFFF20, double 0xBD3E2AEB92C11928, double 0x3F90000000044077, double 0xBD971846E585E8C0, double 0xBF3C71C707FC64A5, double 0xBDC8D2E5CA2E7507, double 0x3EDC71DC58841F48, double 0xBDD9FB942A93AF21, double 0xBE722EA554940614, double 0xBDCC309762886108, double 0x3E00ECE316EB4BD4, double 0xBD99479286F572FD, double 0xBD7CBB10470436C0, double 0.000000e+00, double 0xBFE09CDB36551280, double 0x3FBBA1DEEA029494, double 0x3FACFAE864368D6B, double 0xBF81BB1CBE1A406D, double 0xBF61F992590D0897, double 0x3F315382BA06BF05, double 0x3F06ED3B9EEC933D, double 0xBED232C77D035520, double 0xBEA1CCE2DF6157CA, double 0x3E67FF98D2088A17, double 0x3E3294ED7209404C, double 0xBDF5C278F4188E72, double 0xBDBB9F73114AC14B, double 0x3D7C870190FB4FF7, double 0xBFD9C6CF582CBF7F, double 0xBC2340630BE882E1, double 0x3FC9C6CF582CBF7E, double 0xBF91F06D14E11DF9, double 0xBF8B589D1DA136E9, double 0x3F50F9103CF5A452, double 0x3F3864456219E47E, double 0xBEFA2A033CAECDFC, double 0xBED83A06DF50149A, double 0x3E96A4FD6F3E37BF, double 0x3E6EC03769300BBD, double 0xBE295D7532C9AE75, double 0xBDFB1AA7F95EB2B7, double 0x3DB3D0E8D4F46C36, double 0x3D809643D778859E, double 0.000000e+00, double 0x3FD5C6E60A097823, double 0xBF9F8F72E7A848E0, double 0xBFAB2150CB41E89B, double 0x3F72F7FFE90256AB, double 0x3F627E31FE9A6359, double 0xBF26F641F41949DF, double 0xBF0863F48139D08A, double 0x3ECAD77D74A4EB89, double 0x3EA32E6D3322F526, double 0xBE62DA3821A66401, double 0xBE341D0E8E78F041, double 0x3DF1D089C7B66E54, double 0x3DBDD03E1BC02C21, double 0xBD786CDF5A3F3B8F, double 0x3FD33518B3874E8A, double 0x3C42F912ABC5C301, double 0xBFC33518B3874E8A, double 0x3F7D34125D59D874, double 0x3F880C83BDEEE45B, double 0xBF4483C20F1C66BB, double 0xBF36FFA5FC8AE7CE, double 0x3EF2CCF7B1D72132, double 0x3ED796A74FB77CDA, double 0xBE91E8509B04B9CD, double 0xBE6E6A46B48901DC, double 0x3E254BF2843030AB, double 0x3DFB064CF4B52F16, double 0xBDB14A00318682F1, double 0xBD81036310530753, double 0.000000e+00, double 0xBFD15F7977A772D4, double 0x3F900F7FCF183E0D, double 0x3FA68B984EC64925, double 0xBF648E63600D8406, double 0xBF60E0D60385856B, double 0x3F1D796052772F54, double 0x3F07800BC50775C0, double 0xBEC3324842D019A1, double 0xBEA30E8C77C13527, double 0x3E5CEDA4325E2826, double 0x3E3457DC477E660A, double 0xBDECAD9A4A509C92, double 0xBDBE864D9617E1BC, double 0x3D741351FE093D3D, double 0xBFCFF654544EBCD1, double 0xBC44353ED972A55A, double 0x3FBFF654544EBCD0, double 0xBF70C17FF72AFA55, double 0xBF84B0C5D5DA66C1, double 0x3F394154BE70516B, double 0x3F34E12C3066B4A0, double 0xBEE9F32FC1C76819, double 0xBED63C5473EF99E9, double 0x3E8ADBAF4ECA4D0D, double 0x3E6D601B6216D4A4, double 0xBE20EE907FEE672B, double 0xBDFA83C5BBB08015, double 0x3DACA66D05214D85, double 0x3D810D9EF3F98BE2, double 0.000000e+00, double 0x3FCDC13E66AC2E77, double 0xBF842FF0CDC58463, double 0xBFA38D1DD8992DF2, double 0x3F5A55E9B346EDA9, double 0x3F5E2E16F97CD3DB, double 0xBF13DFC3782ACFE1, double 0xBF05CE7F4928AEAE, double 0x3EBBB178DA527278, double 0x3EA2346D3235A301, double 0xBE5612F29B5796E6, double 0xBE33D74F0F21F0AB, double 0x3DE6DB6FEDBDD2D3, double 0x3DBE380534E5B583, double 0xBD70827A2A754FB8], align 8
@__ocmltbl_M64_Y0 = internal unnamed_addr addrspace(4) constant [270 x double] [double 0xBFB2E4D699CBD01F, double 0x3FC6BBCB41034286, double 0xBF9075B1BBF41364, double 0x3F41A6206B7B973D, double 0xBEE3E99794203BBD, double 0x3E7BCE4A600D3EA5, double 0xBE0A6EE796B871B6, double 0x3D92393D82C6B2E4, double 0xBD131085DA82054C, double 0x3C8F4ED4B492EBCC, double 0xBC04B7AC8A1B15C6, double 0x3B769201941CC7B8, double 0xBAE4987E57338156, double 0x3A4FF18D4705632D, double 0xB9B5416ACD087D02, double 0xBFE8EEA0AE99A033, double 0x4001B052CD42754E, double 0xC0092F7D329697CF, double 0x401B0D7849D94041, double 0xC0308F108854A13F, double 0x4045473065287973, double 0xC05C69A8813D10E8, double 0x40737EC167E18FEC, double 0xC08B44127A0228E4, double 0x40A33A1CF6A241C7, double 0xC0BAAD0C98BDB9B5, double 0x40D134629471039B, double 0xC0E29C65CCF79BA0, double 0x40EC922FBC085C32, double 0xC0E655B619071060, double 0xBFE15659A787357B, double 0x3FFA6174D29845E5, double 0xBFF9D0A5F4831145, double 0x40031F12941F635B, double 0xC0111BB0813976D0, double 0x401F8B042CA17533, double 0xC02E1EB9D27B3826, double 0x403D8CB662FA6DF2, double 0xC04D9175A3310C79, double 0x405DFCEE0E45019E, double 0xC06E7481FB9E5F61, double 0x407DEB3BB4DC60CE, double 0xC08A25FAB23792B8, double 0x4091402BBFBAED82, double 0xC0885DB459E00D9B, double 0xBFD6DA72F31DCA44, double 0x3FF54DFD34C830F7, double 0xBFF014AF25DC721E, double 0x3FF13366C90BEC01, double 0xBFF8C024B43A4764, double 0x4001E294A410A304, double 0xC00A97F320B0EA96, double 0x40144F870B1AC185, double 0xC01FA37C80EA46F7, double 0x402900DA91537E82, double 0xC033E7DBEAB87589, double 0x403F3EC6D4CF71AA, double 0xC046A7ABA5D5442A, double 0x404A0C08542C3074, double 0xC040C45498A8B8A5, double 0xBFCA2F2E18B92A4F, double 0x3FF1EEDD9C1F2BD8, double 0xBFE6CFB9ABA1D4A6, double 0x3FE1BABA8B2960D8, double 0xBFE5C9A23CECFEFA, double 0x3FEA201BB93EBE9B, double 0xBFEFCCEF9C6DB67B, double 0x3FF3E3D322601093, double 0xBFF95E86CAD83531, double 0x40006B019FB826FC, double 0xC005748824585339, double 0x400BE6F54263D628, double 0xC0112AC8AC6925DF, double 0x40116432C5740749, double 0xC0048433915014EF, double 0.000000e+00, double 0x3FEC24371844B88A, double 0xBFDF7E38A46D7102, double 0x3FCC3B1338AF433E, double 0xBFCCF18E6A4B4233, double 0x3FCC068086AD19C8, double 0xBFCA396A800CBB37, double 0x3FC9424BB759C9A8, double 0xBFC8D35C00975F04, double 0x3FC8C0719FB178F7, double 0xBFC8F72DA405DE4E, double 0x3FC976EB13434CF9, double 0xBFCA693E0695B82E, double 0x3FCA39AAEEEE6DCF, double 0xBFC041222B5CF46E, double 0x3FB6980226F358DF, double 0x3FE8FFB207D66B94, double 0xBFDBD2B24CB4D65A, double 0x3FC28C76DDCD8EBF, double 0xBFC19B76C6C2D753, double 0x3FBFE1A296CE781F, double 0xBFBAA16D38B246FE, double 0x3FB6E7C77660784E, double 0xBFB4223FD6F63950, double 0x3FB1EDE638013F16, double 0xBFB00C129CF3FA8E, double 0x3FAC25552887122D, double 0xBFA6828823344907, double 0x3F9C0732C7410916, double 0xBF8330C8D93428FF, double 0x3FD0869FF937FA12, double 0x3FE2B31C35470A4A, double 0xBFD73900273B3659, double 0x3FAF970ACB313F75, double 0xBFA76B24758C6A51, double 0x3FA4D6F05A2F473B, double 0xBF9BE8DF6D1412D3, double 0x3F93098C63847DDA, double 0xBF8AD67D917F84EF, double 0x3F8320B5B7AB98E4, double 0xBF7B39DAFCF12CCD, double 0x3F72AC1299BE4543, double 0xBF66A630582D99DD, double 0x3F5497F4183F528F, double 0xBF33EB6AA5DA7D32, double 0x3FDB7362A42DD8FF, double 0x3FD53A7B3F0DFB71, double 0xBFD441D73E1B39CB, double 0x3F9F505223BE8C30, double 0xBF7371CA702291B7, double 0x3F8599BA9529FF05, double 0xBF7813569BE4AC1D, double 0x3F67E92DAC4148AD, double 0xBF59ED66DC5A6048, double 0x3F4CA8CC8B2B25B1, double 0xBF3FB5D5D524368A, double 0x3F313E17D93243DC, double 0xBF214016505428D9, double 0x3F0B3531E22732F6, double 0xBEE7E3F31E3D1EFF, double 0x3FE0AA48442F014B, double 0xBC42FC44B41B87DF, double 0xBFD0AA48442F014C, double 0x3FA439FAC165269B, double 0x3F80D2AF4E933A41, double 0x3F4F71646BCF7F6C, double 0xBF5444BDA8E8462D, double 0x3F384C22162349FD, double 0xBF217AB499428EEF, double 0x3F0DAFA7E064BEAA, double 0xBEF8BB68BE4D8127, double 0x3EE490083E101288, double 0xBED1512541C86FB3, double 0x3EBC67C5BE2B19CF, double 0xBEA0AEF1EDF4C84C, double 0x3FDF922E9B7FCFF3, double 0xBFC46AE4B2D59FBA, double 0xBFCB89B5949E4E6B, double 0x3FA9FE2B318DC766, double 0x3F80AA736E5F234E, double 0xBF4C32FC82583918, double 0xBF4582F115E796B3, double 0x3F25CA419D5397D0, double 0xBF04CCBF0F49A3CD, double 0x3EEFEB1F3C777328, double 0xBED7D81115E556B5, double 0x3EC0DC1871A64FAA, double 0xBEA690F94672B956, double 0x3E88DE4474FFF121, double 0xBE5FD1F6321A642B, double 0x3FD81E4F8120242A, double 0xBFD4C7773D150462, double 0xBFC13127C21922B4, double 0x3FB0224F7EBCB4E0, double 0x3F7240000575C220, double 0xBF6135AA20D0A769, double 0xBF3161CE7505EB62, double 0x3F17B51BEC1F5E5A, double 0xBEE3290B9A006192, double 0x3EC677BE1FC5D2EA, double 0xBEB15E4F8FA357F4, double 0x3E9505E7DE49AD7F, double 0xBE77D76C65326B71, double 0x3E572BD064DB5810, double 0xBE2AEEAE21C65C13, double 0.000000e+00, double 0xBFD9C34256A12A0C, double 0x3FAA09C9290367EF, double 0x3FADF6D59BF50FE5, double 0xBF7C116FDC598542, double 0xBF61E32BC4F26DBB, double 0x3F299827653EFC95, double 0x3F0AB2C209548FE9, double 0xBED4863787F98471, double 0xBE93B2382F029E6C, double 0xBE57737C6A81E739, double 0x3E545853FA20E785, double 0xBE2FD2A529AAB5E4, double 0x3E0A42DDAD39AD95, double 0xBDE112E48FB82CD5, double 0xBFD5C7C556F0C19A, double 0x3C65B2C3F10BB869, double 0x3FC5C7C556F0C19C, double 0xBF8564D4B1ED0EB7, double 0xBF8A15D92DFE4293, double 0x3F4B43843047ED3C, double 0x3F37A8924CC88CC3, double 0xBEF5F69B4BC9EDFD, double 0xBED85B94153D61E4, double 0x3E955AC235B60413, double 0x3E6D56458C85B80D, double 0xBE23EC1EA0457428, double 0xBE000934B9FDA092, double 0x3DC0AE48DC572273, double 0xBD45950B4CA3EF99, double 0.000000e+00, double 0x3FD334CCA0697A5A, double 0xBF95AEF611FC4D57, double 0xBFA8969C64CBF437, double 0x3F6B2F14A95527B4, double 0x3F61D35E85FDBC6F, double 0xBF226DD71E3904D7, double 0xBF08177E4F94CE0E, double 0x3EC6A92273315BA3, double 0x3EA34AA706E77DBB, double 0xBE60A281377E8B1E, double 0xBE344251968BE3C8, double 0x3DEFA6A0D37C6134, double 0x3DBEC1D47EAB32BB, double 0xBD76FB9A346B2386, double 0x3FD15F993FCEAB5C, double 0x3C474335059E1F4E, double 0xBFC15F993FCEAB5B, double 0x3F758EF6EFBED6F1, double 0x3F86395DFE49FBA8, double 0xBF3FB15104A36E0F, double 0xBF35F88A11D3D03A, double 0x3EEF37D226054DAE, double 0x3ED6F7BAAF1EB952, double 0xBE8F0C45054039D9, double 0xBE6DFE0F689FE34D, double 0x3E23115A93B5A609, double 0x3DFAD1AAE15A8F0E, double 0xBDAF829CBACA6BC1, double 0xBD81191EAEAD7D7C, double 0.000000e+00, double 0xBFCFF635CC72B9F1, double 0x3F89036451FF57C5, double 0x3FA4E667A7155698, double 0xBF60325EE41E90FC, double 0xBF5FE23914FB4DAA, double 0x3F17F84D7C50BFF4, double 0x3F06AFDD5774B982, double 0xBEC04053ABD359B6, double 0xBEA2AEA9A040B3BE, double 0x3E593EB9B7C33886, double 0x3E342852D79837DC, double 0xBDE99D5155505D29, double 0xBDBE747D553E2BE7, double 0x3D723DD8D96219F9, double 0xBFCDC14EA14E89F9, double 0xBC42890A10AF0448, double 0x3FBDC14EA14E89F8, double 0xBF6B037FE9CF2945, double 0xBF8367D7D608E3FF, double 0x3F34ABEF563655FD, double 0x3F33D8A66121994D, double 0xBEE5CFE92992EDFE, double 0xBED5718148DC24EF, double 0x3E87414DAF653481, double 0x3E6CA704F47D3C94, double 0xBE1E0AAEA47F3944, double 0xBDFA14B5AF307E06, double 0x3DA9E7E5CCBE0C5A, double 0x3D80E377F8A6A708], align 8

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_y0(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %712

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = fcmp ugt double %35, 0x4029180000000000
  br i1 %36, label %509, label %37

37:                                               ; preds = %32
  %38 = fcmp olt double %35, 2.000000e+00
  br i1 %38, label %39, label %64

39:                                               ; preds = %37
  %40 = fcmp olt double %35, 8.125000e-01
  br i1 %40, label %41, label %53

41:                                               ; preds = %39
  %42 = fcmp olt double %35, 3.125000e-01
  br i1 %42, label %90, label %43

43:                                               ; preds = %41
  %44 = fcmp olt double %35, 4.375000e-01
  %45 = fcmp olt double %35, 5.625000e-01
  %46 = fcmp olt double %35, 6.875000e-01
  %47 = select i1 %46, double 5.625000e-01, double 6.875000e-01
  %48 = select i1 %46, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 60)
  %49 = select i1 %45, double 4.375000e-01, double %47
  %50 = select i1 %45, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 30), double addrspace(4)* %48
  %51 = select i1 %44, double 3.125000e-01, double %49
  %52 = select i1 %44, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 15), double addrspace(4)* %50
  br label %90

53:                                               ; preds = %39
  %54 = fcmp olt double %35, 1.000000e+00
  %55 = fcmp olt double %35, 1.250000e+00
  %56 = fcmp olt double %35, 1.625000e+00
  %57 = select i1 %56, double 1.250000e+00, double 1.625000e+00
  %58 = select i1 %56, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 120)
  %59 = select i1 %55, double 1.000000e+00, double %57
  %60 = select i1 %55, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 90), double addrspace(4)* %58
  %61 = select i1 %54, double 0x3C7EA9D270347F83, double 0.000000e+00
  %62 = select i1 %54, double 0x3FEC982EB8D417EA, double %59
  %63 = select i1 %54, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 75), double addrspace(4)* %60
  br label %90

64:                                               ; preds = %37
  %65 = fcmp olt double %35, 0x4019100000000000
  br i1 %65, label %66, label %79

66:                                               ; preds = %64
  %67 = fcmp olt double %35, 2.531250e+00
  br i1 %67, label %90, label %68

68:                                               ; preds = %66
  %69 = fcmp olt double %35, 3.000000e+00
  br i1 %69, label %90, label %70

70:                                               ; preds = %68
  %71 = fcmp olt double %35, 0x400BE00000000000
  %72 = fcmp olt double %35, 0x4012D00000000000
  %73 = select i1 %72, double 0xBC9F06AE7804384E, double 0x3CBDFE7BAC228E8C
  %74 = select i1 %72, double 0x400FA9534D98569C, double 0x4015B7FE4E87B02E
  %75 = select i1 %72, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 180), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 195)
  %76 = select i1 %71, double 0.000000e+00, double %73
  %77 = select i1 %71, double 3.000000e+00, double %74
  %78 = select i1 %71, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 165), double addrspace(4)* %75
  br label %90

79:                                               ; preds = %64
  %80 = fcmp olt double %35, 7.843750e+00
  br i1 %80, label %90, label %81

81:                                               ; preds = %79
  %82 = fcmp olt double %35, 0x4022D80000000000
  %83 = fcmp olt double %35, 0x4025F80000000000
  %84 = select i1 %83, double 0xBCCCB49FF791C495, double 0x3C80FC786CE06080
  %85 = select i1 %83, double 0x402471D735A47D58, double 0x40277F9138D43206
  %86 = select i1 %83, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 240), double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 255)
  %87 = select i1 %82, double 0x3CB479CC068D9046, double %84
  %88 = select i1 %82, double 0x40213127AE6169B4, double %85
  %89 = select i1 %82, double addrspace(4)* getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 225), double addrspace(4)* %86
  br label %90

90:                                               ; preds = %81, %79, %70, %68, %66, %53, %43, %41
  %91 = phi double [ 0.000000e+00, %41 ], [ 0xBC8BD1E50D219BFD, %66 ], [ 0.000000e+00, %68 ], [ 0xBC99774A495F56CF, %79 ], [ %76, %70 ], [ %87, %81 ], [ 0.000000e+00, %43 ], [ %61, %53 ]
  %92 = phi double [ 0.000000e+00, %41 ], [ 0x400193BED4DFF243, %66 ], [ 2.531250e+00, %68 ], [ 0x401C581DC4E72103, %79 ], [ %77, %70 ], [ %88, %81 ], [ %51, %43 ], [ %62, %53 ]
  %93 = phi double addrspace(4)* [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 0), %41 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 135), %66 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 150), %68 ], [ getelementptr inbounds ([270 x double], [270 x double] addrspace(4)* @__ocmltbl_M64_Y0, i64 0, i64 210), %79 ], [ %78, %70 ], [ %89, %81 ], [ %52, %43 ], [ %63, %53 ]
  %94 = fcmp olt double %35, 3.125000e-01
  br i1 %94, label %95, label %460

95:                                               ; preds = %90
  %96 = tail call double @llvm.fabs.f64(double %35)
  %97 = fcmp ugt double %96, 0x4029280000000000
  br i1 %97, label %171, label %98

98:                                               ; preds = %95
  %99 = fcmp ugt double %96, 0x4019100000000000
  br i1 %99, label %111, label %100

100:                                              ; preds = %98
  %101 = fcmp ugt double %96, 1.656250e+00
  br i1 %101, label %102, label %122

102:                                              ; preds = %100
  %103 = fcmp ugt double %96, 3.125000e+00
  %104 = fcmp ugt double %96, 4.687500e+00
  %105 = select i1 %104, double 0x3C975054CD60A517, double 0xBCA60155A9D1B256
  %106 = select i1 %104, double 0x4016148F5B2C2E45, double 0x400EA75575AF6F09
  %107 = select i1 %104, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 45), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 30)
  %108 = select i1 %103, double %105, double 0xBCA0F539D7DA258E
  %109 = select i1 %103, double %106, double 0x40033D152E971B40
  %110 = select i1 %103, double addrspace(4)* %107, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 15)
  br label %122

111:                                              ; preds = %98
  %112 = fcmp ugt double %96, 7.843750e+00
  br i1 %112, label %113, label %122

113:                                              ; preds = %111
  %114 = fcmp ugt double %96, 0x4022D80000000000
  %115 = fcmp ugt double %96, 0x4025F80000000000
  %116 = select i1 %115, double 0x3CB444FD5821D5B1, double 0x3CC02610A51562B6
  %117 = select i1 %115, double 0x40279544008272B6, double 0x402458D0D0BDFC29
  %118 = select i1 %115, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 105), double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 90)
  %119 = select i1 %114, double %116, double 0xBCB51970714C7C25
  %120 = select i1 %114, double %117, double 0x40214EB56CCCDECA
  %121 = select i1 %114, double addrspace(4)* %118, double addrspace(4)* getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 75)
  br label %122

122:                                              ; preds = %113, %111, %102, %100
  %123 = phi double [ 0.000000e+00, %100 ], [ 0xBC9B226D9D243827, %111 ], [ %108, %102 ], [ %119, %113 ]
  %124 = phi double [ 0.000000e+00, %100 ], [ 0x401C0FF5F3B47250, %111 ], [ %109, %102 ], [ %120, %113 ]
  %125 = phi double addrspace(4)* [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 0), %100 ], [ getelementptr inbounds ([120 x double], [120 x double] addrspace(4)* @__ocmltbl_M64_J0, i64 0, i64 60), %111 ], [ %110, %102 ], [ %121, %113 ]
  %126 = fsub double %96, %124
  %127 = fsub double %126, %123
  %128 = getelementptr inbounds double, double addrspace(4)* %125, i64 14
  %129 = load double, double addrspace(4)* %128, align 8, !tbaa !20
  %130 = getelementptr inbounds double, double addrspace(4)* %125, i64 13
  %131 = load double, double addrspace(4)* %130, align 8, !tbaa !20
  %132 = tail call double @llvm.fma.f64(double %127, double %129, double %131)
  %133 = getelementptr inbounds double, double addrspace(4)* %125, i64 12
  %134 = load double, double addrspace(4)* %133, align 8, !tbaa !20
  %135 = tail call double @llvm.fma.f64(double %127, double %132, double %134)
  %136 = getelementptr inbounds double, double addrspace(4)* %125, i64 11
  %137 = load double, double addrspace(4)* %136, align 8, !tbaa !20
  %138 = tail call double @llvm.fma.f64(double %127, double %135, double %137)
  %139 = getelementptr inbounds double, double addrspace(4)* %125, i64 10
  %140 = load double, double addrspace(4)* %139, align 8, !tbaa !20
  %141 = tail call double @llvm.fma.f64(double %127, double %138, double %140)
  %142 = getelementptr inbounds double, double addrspace(4)* %125, i64 9
  %143 = load double, double addrspace(4)* %142, align 8, !tbaa !20
  %144 = tail call double @llvm.fma.f64(double %127, double %141, double %143)
  %145 = getelementptr inbounds double, double addrspace(4)* %125, i64 8
  %146 = load double, double addrspace(4)* %145, align 8, !tbaa !20
  %147 = tail call double @llvm.fma.f64(double %127, double %144, double %146)
  %148 = getelementptr inbounds double, double addrspace(4)* %125, i64 7
  %149 = load double, double addrspace(4)* %148, align 8, !tbaa !20
  %150 = tail call double @llvm.fma.f64(double %127, double %147, double %149)
  %151 = getelementptr inbounds double, double addrspace(4)* %125, i64 6
  %152 = load double, double addrspace(4)* %151, align 8, !tbaa !20
  %153 = tail call double @llvm.fma.f64(double %127, double %150, double %152)
  %154 = getelementptr inbounds double, double addrspace(4)* %125, i64 5
  %155 = load double, double addrspace(4)* %154, align 8, !tbaa !20
  %156 = tail call double @llvm.fma.f64(double %127, double %153, double %155)
  %157 = getelementptr inbounds double, double addrspace(4)* %125, i64 4
  %158 = load double, double addrspace(4)* %157, align 8, !tbaa !20
  %159 = tail call double @llvm.fma.f64(double %127, double %156, double %158)
  %160 = getelementptr inbounds double, double addrspace(4)* %125, i64 3
  %161 = load double, double addrspace(4)* %160, align 8, !tbaa !20
  %162 = tail call double @llvm.fma.f64(double %127, double %159, double %161)
  %163 = getelementptr inbounds double, double addrspace(4)* %125, i64 2
  %164 = load double, double addrspace(4)* %163, align 8, !tbaa !20
  %165 = tail call double @llvm.fma.f64(double %127, double %162, double %164)
  %166 = getelementptr inbounds double, double addrspace(4)* %125, i64 1
  %167 = load double, double addrspace(4)* %166, align 8, !tbaa !20
  %168 = tail call double @llvm.fma.f64(double %127, double %165, double %167)
  %169 = load double, double addrspace(4)* %125, align 8, !tbaa !20
  %170 = tail call double @llvm.fma.f64(double %127, double %168, double %169)
  br label %372

171:                                              ; preds = %95
  %172 = fdiv double 1.000000e+00, %96
  %173 = fmul double %172, %172
  %174 = tail call double @llvm.fma.f64(double %173, double 0xC1B91F780A4A989B, double 0x41752A41923B70A7)
  %175 = tail call double @llvm.fma.f64(double %173, double %174, double 0xC1240A5E31612A8D)
  %176 = tail call double @llvm.fma.f64(double %173, double %175, double 0x40D0C9A0CBE3B3B8)
  %177 = tail call double @llvm.fma.f64(double %173, double %176, double 0xC080AF76167FE583)
  %178 = tail call double @llvm.fma.f64(double %173, double %177, double 0x403778EA61B94139)
  %179 = tail call double @llvm.fma.f64(double %173, double %178, double 0xBFFA3581D1A82662)
  %180 = tail call double @llvm.fma.f64(double %173, double %179, double 0x3FCAD33330A1DAF2)
  %181 = tail call double @llvm.fma.f64(double %173, double %180, double 0xBFB0AAAAAAAA7909)
  %182 = tail call double @llvm.fma.f64(double %173, double %181, double 1.250000e-01)
  %183 = fmul double %172, %182
  %184 = tail call double @llvm.amdgcn.rsq.f64(double %172)
  %185 = fmul double %172, %184
  %186 = fmul double %184, 5.000000e-01
  %187 = fneg double %186
  %188 = tail call double @llvm.fma.f64(double %187, double %185, double 5.000000e-01)
  %189 = tail call double @llvm.fma.f64(double %186, double %188, double %186)
  %190 = tail call double @llvm.fma.f64(double %185, double %188, double %185)
  %191 = fneg double %190
  %192 = tail call double @llvm.fma.f64(double %191, double %190, double %172)
  %193 = tail call double @llvm.fma.f64(double %192, double %189, double %190)
  %194 = fcmp oeq double %172, 0.000000e+00
  %195 = select i1 %194, double %172, double %193
  %196 = fmul double %195, 0x3FE9884533D43651
  %197 = tail call double @llvm.fma.f64(double %173, double 0x41344395CD7AC32C, double 0xC0F25BF3ABBEE803)
  %198 = tail call double @llvm.fma.f64(double %173, double %197, double 0x40A55A4A78625B0F)
  %199 = tail call double @llvm.fma.f64(double %173, double %198, double 0xC05A826C7EA56321)
  %200 = tail call double @llvm.fma.f64(double %173, double %199, double 0x401763253BBF53B6)
  %201 = tail call double @llvm.fma.f64(double %173, double %200, double 0xBFE15EFAFF948953)
  %202 = tail call double @llvm.fma.f64(double %173, double %201, double 0x3FBA7FFFF967A1D4)
  %203 = tail call double @llvm.fma.f64(double %173, double %202, double 0xBFAFFFFFFFFF2868)
  %204 = tail call double @llvm.fma.f64(double %173, double %203, double 1.000000e+00)
  %205 = fmul double %196, %204
  %206 = fcmp olt double %96, 0x41D0000000000000
  br i1 %206, label %207, label %226

207:                                              ; preds = %171
  %208 = fmul double %96, 0x3FE45F306DC9C883
  %209 = tail call double @llvm.rint.f64(double %208)
  %210 = tail call double @llvm.fma.f64(double %209, double 0xBFF921FB54442D18, double %96)
  %211 = tail call double @llvm.fma.f64(double %209, double 0xBC91A62633145C00, double %210)
  %212 = fmul double %209, 0x3C91A62633145C00
  %213 = fneg double %212
  %214 = tail call double @llvm.fma.f64(double %209, double 0x3C91A62633145C00, double %213)
  %215 = fsub double %210, %212
  %216 = fsub double %210, %215
  %217 = fsub double %216, %212
  %218 = fsub double %215, %211
  %219 = fadd double %218, %217
  %220 = fsub double %219, %214
  %221 = tail call double @llvm.fma.f64(double %209, double 0xB97B839A252049C0, double %220)
  %222 = fadd double %211, %221
  %223 = fsub double %222, %211
  %224 = fsub double %221, %223
  %225 = fptosi double %209 to i32
  br label %302

226:                                              ; preds = %171
  %227 = tail call double @llvm.amdgcn.trig.preop.f64(double %96, i32 0)
  %228 = tail call double @llvm.amdgcn.trig.preop.f64(double %96, i32 1)
  %229 = tail call double @llvm.amdgcn.trig.preop.f64(double %96, i32 2)
  %230 = fcmp oge double %96, 0x7B00000000000000
  %231 = tail call double @llvm.amdgcn.ldexp.f64(double %96, i32 -128)
  %232 = select i1 %230, double %231, double %96
  %233 = fmul double %229, %232
  %234 = fneg double %233
  %235 = tail call double @llvm.fma.f64(double %229, double %232, double %234)
  %236 = fmul double %228, %232
  %237 = fneg double %236
  %238 = tail call double @llvm.fma.f64(double %228, double %232, double %237)
  %239 = fmul double %227, %232
  %240 = fneg double %239
  %241 = tail call double @llvm.fma.f64(double %227, double %232, double %240)
  %242 = fadd double %236, %241
  %243 = fsub double %242, %236
  %244 = fsub double %242, %243
  %245 = fsub double %241, %243
  %246 = fsub double %236, %244
  %247 = fadd double %245, %246
  %248 = fadd double %233, %238
  %249 = fsub double %248, %233
  %250 = fsub double %248, %249
  %251 = fsub double %238, %249
  %252 = fsub double %233, %250
  %253 = fadd double %251, %252
  %254 = fadd double %248, %247
  %255 = fsub double %254, %248
  %256 = fsub double %254, %255
  %257 = fsub double %247, %255
  %258 = fsub double %248, %256
  %259 = fadd double %257, %258
  %260 = fadd double %253, %259
  %261 = fadd double %235, %260
  %262 = fadd double %239, %242
  %263 = fsub double %262, %239
  %264 = fsub double %242, %263
  %265 = fadd double %264, %254
  %266 = fsub double %265, %264
  %267 = fsub double %254, %266
  %268 = fadd double %267, %261
  %269 = tail call double @llvm.amdgcn.ldexp.f64(double %262, i32 -2)
  %270 = tail call double @llvm.amdgcn.fract.f64(double %269)
  %271 = tail call i1 @llvm.amdgcn.class.f64(double %269, i32 516)
  %272 = select i1 %271, double 0.000000e+00, double %270
  %273 = tail call double @llvm.amdgcn.ldexp.f64(double %272, i32 2)
  %274 = fadd double %273, %265
  %275 = fcmp olt double %274, 0.000000e+00
  %276 = select i1 %275, double 4.000000e+00, double 0.000000e+00
  %277 = fadd double %273, %276
  %278 = fadd double %265, %277
  %279 = fptosi double %278 to i32
  %280 = sitofp i32 %279 to double
  %281 = fsub double %277, %280
  %282 = fadd double %265, %281
  %283 = fsub double %282, %281
  %284 = fsub double %265, %283
  %285 = fadd double %268, %284
  %286 = fcmp oge double %282, 5.000000e-01
  %287 = zext i1 %286 to i32
  %288 = add nsw i32 %287, %279
  %289 = select i1 %286, double 1.000000e+00, double 0.000000e+00
  %290 = fsub double %282, %289
  %291 = fadd double %290, %285
  %292 = fsub double %291, %290
  %293 = fsub double %285, %292
  %294 = fmul double %291, 0x3FF921FB54442D18
  %295 = fneg double %294
  %296 = tail call double @llvm.fma.f64(double %291, double 0x3FF921FB54442D18, double %295)
  %297 = tail call double @llvm.fma.f64(double %291, double 0x3C91A62633145C07, double %296)
  %298 = tail call double @llvm.fma.f64(double %293, double 0x3FF921FB54442D18, double %297)
  %299 = fadd double %294, %298
  %300 = fsub double %299, %294
  %301 = fsub double %298, %300
  br label %302

302:                                              ; preds = %226, %207
  %303 = phi double [ %224, %207 ], [ %301, %226 ]
  %304 = phi double [ %222, %207 ], [ %299, %226 ]
  %305 = phi i32 [ %225, %207 ], [ %288, %226 ]
  %306 = and i32 %305, 3
  %307 = fcmp olt double %304, %183
  %308 = sext i1 %307 to i32
  %309 = add nsw i32 %306, %308
  %310 = select i1 %307, i32 -2147483648, i32 0
  %311 = xor i32 %310, -1075240453
  %312 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %311, i64 1
  %313 = bitcast <2 x i32> %312 to double
  %314 = xor i32 %310, -1132354010
  %315 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %314, i64 1
  %316 = bitcast <2 x i32> %315 to double
  %317 = fsub double %313, %183
  %318 = fsub double %313, %317
  %319 = fsub double %318, %183
  %320 = fadd double %319, %316
  %321 = fadd double %317, %320
  %322 = fsub double %321, %317
  %323 = fsub double %320, %322
  %324 = fadd double %304, %321
  %325 = fsub double %324, %321
  %326 = fsub double %304, %325
  %327 = fadd double %303, %323
  %328 = fadd double %326, %327
  %329 = fadd double %324, %328
  %330 = fsub double %329, %324
  %331 = fsub double %328, %330
  %332 = fmul double %329, %329
  %333 = fmul double %332, 5.000000e-01
  %334 = fsub double 1.000000e+00, %333
  %335 = fsub double 1.000000e+00, %334
  %336 = fsub double %335, %333
  %337 = fmul double %332, %332
  %338 = tail call double @llvm.fma.f64(double %332, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %339 = tail call double @llvm.fma.f64(double %332, double %338, double 0xBE927E4FA17F65F6)
  %340 = tail call double @llvm.fma.f64(double %332, double %339, double 0x3EFA01A019F4EC90)
  %341 = tail call double @llvm.fma.f64(double %332, double %340, double 0xBF56C16C16C16967)
  %342 = tail call double @llvm.fma.f64(double %332, double %341, double 0x3FA5555555555555)
  %343 = fneg double %331
  %344 = tail call double @llvm.fma.f64(double %329, double %343, double %336)
  %345 = tail call double @llvm.fma.f64(double %337, double %342, double %344)
  %346 = fadd double %334, %345
  %347 = tail call double @llvm.fma.f64(double %332, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %348 = tail call double @llvm.fma.f64(double %332, double %347, double 0x3EC71DE3796CDE01)
  %349 = tail call double @llvm.fma.f64(double %332, double %348, double 0xBF2A01A019E83E5C)
  %350 = tail call double @llvm.fma.f64(double %332, double %349, double 0x3F81111111110BB3)
  %351 = fneg double %332
  %352 = fmul double %329, %351
  %353 = fmul double %331, 5.000000e-01
  %354 = tail call double @llvm.fma.f64(double %352, double %350, double %353)
  %355 = tail call double @llvm.fma.f64(double %332, double %354, double %343)
  %356 = tail call double @llvm.fma.f64(double %352, double 0xBFC5555555555555, double %355)
  %357 = fsub double %329, %356
  %358 = fneg double %357
  %359 = and i32 %309, 1
  %360 = icmp eq i32 %359, 0
  %361 = select i1 %360, double %346, double %358
  %362 = bitcast double %361 to <2 x i32>
  %363 = shl i32 %309, 30
  %364 = and i32 %363, -2147483648
  %365 = extractelement <2 x i32> %362, i64 1
  %366 = xor i32 %365, %364
  %367 = insertelement <2 x i32> %362, i32 %366, i64 1
  %368 = bitcast <2 x i32> %367 to double
  %369 = fmul double %205, %368
  %370 = tail call i1 @llvm.amdgcn.class.f64(double %96, i32 512)
  %371 = select i1 %370, double 0.000000e+00, double %369
  br label %372

372:                                              ; preds = %302, %122
  %373 = phi double [ %170, %122 ], [ %371, %302 ]
  %374 = fmul double %373, 0x3FE45F306DC9C883
  %375 = tail call double @llvm.amdgcn.frexp.mant.f64(double %35)
  %376 = fcmp olt double %375, 0x3FE5555555555555
  %377 = zext i1 %376 to i32
  %378 = tail call double @llvm.amdgcn.ldexp.f64(double %375, i32 %377)
  %379 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %35)
  %380 = sub nsw i32 %379, %377
  %381 = fadd double %378, -1.000000e+00
  %382 = fadd double %378, 1.000000e+00
  %383 = fadd double %382, -1.000000e+00
  %384 = fsub double %378, %383
  %385 = tail call double @llvm.amdgcn.rcp.f64(double %382)
  %386 = fneg double %382
  %387 = tail call double @llvm.fma.f64(double %386, double %385, double 1.000000e+00)
  %388 = tail call double @llvm.fma.f64(double %387, double %385, double %385)
  %389 = tail call double @llvm.fma.f64(double %386, double %388, double 1.000000e+00)
  %390 = tail call double @llvm.fma.f64(double %389, double %388, double %388)
  %391 = fmul double %381, %390
  %392 = fmul double %382, %391
  %393 = fneg double %392
  %394 = tail call double @llvm.fma.f64(double %391, double %382, double %393)
  %395 = tail call double @llvm.fma.f64(double %391, double %384, double %394)
  %396 = fadd double %392, %395
  %397 = fsub double %396, %392
  %398 = fsub double %395, %397
  %399 = fsub double %381, %396
  %400 = fsub double %381, %399
  %401 = fsub double %400, %396
  %402 = fsub double %401, %398
  %403 = fadd double %399, %402
  %404 = fmul double %390, %403
  %405 = fadd double %391, %404
  %406 = fsub double %405, %391
  %407 = fsub double %404, %406
  %408 = fmul double %405, %405
  %409 = tail call double @llvm.fma.f64(double %408, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %410 = tail call double @llvm.fma.f64(double %408, double %409, double 0x3FC7474DD7F4DF2E)
  %411 = tail call double @llvm.fma.f64(double %408, double %410, double 0x3FCC71C016291751)
  %412 = tail call double @llvm.fma.f64(double %408, double %411, double 0x3FD249249B27ACF1)
  %413 = tail call double @llvm.fma.f64(double %408, double %412, double 0x3FD99999998EF7B6)
  %414 = tail call double @llvm.fma.f64(double %408, double %413, double 0x3FE5555555555780)
  %415 = tail call double @llvm.amdgcn.ldexp.f64(double %405, i32 1)
  %416 = tail call double @llvm.amdgcn.ldexp.f64(double %407, i32 1)
  %417 = fmul double %405, %408
  %418 = fmul double %417, %414
  %419 = fadd double %415, %418
  %420 = fsub double %419, %415
  %421 = fsub double %418, %420
  %422 = fadd double %416, %421
  %423 = fadd double %419, %422
  %424 = fsub double %423, %419
  %425 = fsub double %422, %424
  %426 = sitofp i32 %380 to double
  %427 = fmul double %426, 0x3FE62E42FEFA39EF
  %428 = fneg double %427
  %429 = tail call double @llvm.fma.f64(double %426, double 0x3FE62E42FEFA39EF, double %428)
  %430 = tail call double @llvm.fma.f64(double %426, double 0x3C7ABC9E3B39803F, double %429)
  %431 = fadd double %427, %430
  %432 = fsub double %431, %427
  %433 = fsub double %430, %432
  %434 = fadd double %431, %423
  %435 = fsub double %434, %431
  %436 = fsub double %434, %435
  %437 = fsub double %431, %436
  %438 = fsub double %423, %435
  %439 = fadd double %438, %437
  %440 = fadd double %433, %425
  %441 = fsub double %440, %433
  %442 = fsub double %440, %441
  %443 = fsub double %433, %442
  %444 = fsub double %425, %441
  %445 = fadd double %444, %443
  %446 = fadd double %440, %439
  %447 = fadd double %434, %446
  %448 = fsub double %447, %434
  %449 = fsub double %446, %448
  %450 = fadd double %445, %449
  %451 = fadd double %447, %450
  %452 = fcmp oeq double %96, 0x7FF0000000000000
  %453 = select i1 %452, double %35, double %451
  %454 = fcmp olt double %35, 0.000000e+00
  %455 = select i1 %454, double 0x7FF8000000000000, double %453
  %456 = fcmp oeq double %35, 0.000000e+00
  %457 = select i1 %456, double 0xFFF0000000000000, double %455
  %458 = fmul double %457, %374
  %459 = fmul double %35, %35
  br label %460

460:                                              ; preds = %372, %90
  %461 = phi double [ %458, %372 ], [ 0.000000e+00, %90 ]
  %462 = phi double [ %459, %372 ], [ %35, %90 ]
  %463 = fsub double %462, %92
  %464 = fsub double %463, %91
  %465 = getelementptr inbounds double, double addrspace(4)* %93, i64 14
  %466 = load double, double addrspace(4)* %465, align 8, !tbaa !20
  %467 = getelementptr inbounds double, double addrspace(4)* %93, i64 13
  %468 = load double, double addrspace(4)* %467, align 8, !tbaa !20
  %469 = tail call double @llvm.fma.f64(double %464, double %466, double %468)
  %470 = getelementptr inbounds double, double addrspace(4)* %93, i64 12
  %471 = load double, double addrspace(4)* %470, align 8, !tbaa !20
  %472 = tail call double @llvm.fma.f64(double %464, double %469, double %471)
  %473 = getelementptr inbounds double, double addrspace(4)* %93, i64 11
  %474 = load double, double addrspace(4)* %473, align 8, !tbaa !20
  %475 = tail call double @llvm.fma.f64(double %464, double %472, double %474)
  %476 = getelementptr inbounds double, double addrspace(4)* %93, i64 10
  %477 = load double, double addrspace(4)* %476, align 8, !tbaa !20
  %478 = tail call double @llvm.fma.f64(double %464, double %475, double %477)
  %479 = getelementptr inbounds double, double addrspace(4)* %93, i64 9
  %480 = load double, double addrspace(4)* %479, align 8, !tbaa !20
  %481 = tail call double @llvm.fma.f64(double %464, double %478, double %480)
  %482 = getelementptr inbounds double, double addrspace(4)* %93, i64 8
  %483 = load double, double addrspace(4)* %482, align 8, !tbaa !20
  %484 = tail call double @llvm.fma.f64(double %464, double %481, double %483)
  %485 = getelementptr inbounds double, double addrspace(4)* %93, i64 7
  %486 = load double, double addrspace(4)* %485, align 8, !tbaa !20
  %487 = tail call double @llvm.fma.f64(double %464, double %484, double %486)
  %488 = getelementptr inbounds double, double addrspace(4)* %93, i64 6
  %489 = load double, double addrspace(4)* %488, align 8, !tbaa !20
  %490 = tail call double @llvm.fma.f64(double %464, double %487, double %489)
  %491 = getelementptr inbounds double, double addrspace(4)* %93, i64 5
  %492 = load double, double addrspace(4)* %491, align 8, !tbaa !20
  %493 = tail call double @llvm.fma.f64(double %464, double %490, double %492)
  %494 = getelementptr inbounds double, double addrspace(4)* %93, i64 4
  %495 = load double, double addrspace(4)* %494, align 8, !tbaa !20
  %496 = tail call double @llvm.fma.f64(double %464, double %493, double %495)
  %497 = getelementptr inbounds double, double addrspace(4)* %93, i64 3
  %498 = load double, double addrspace(4)* %497, align 8, !tbaa !20
  %499 = tail call double @llvm.fma.f64(double %464, double %496, double %498)
  %500 = getelementptr inbounds double, double addrspace(4)* %93, i64 2
  %501 = load double, double addrspace(4)* %500, align 8, !tbaa !20
  %502 = tail call double @llvm.fma.f64(double %464, double %499, double %501)
  %503 = getelementptr inbounds double, double addrspace(4)* %93, i64 1
  %504 = load double, double addrspace(4)* %503, align 8, !tbaa !20
  %505 = tail call double @llvm.fma.f64(double %464, double %502, double %504)
  %506 = load double, double addrspace(4)* %93, align 8, !tbaa !20
  %507 = tail call double @llvm.fma.f64(double %464, double %505, double %506)
  %508 = fadd double %461, %507
  br label %709

509:                                              ; preds = %32
  %510 = fdiv double 1.000000e+00, %35
  %511 = fmul double %510, %510
  %512 = tail call double @llvm.fma.f64(double %511, double 0xC1B91F780A4A989B, double 0x41752A41923B70A7)
  %513 = tail call double @llvm.fma.f64(double %511, double %512, double 0xC1240A5E31612A8D)
  %514 = tail call double @llvm.fma.f64(double %511, double %513, double 0x40D0C9A0CBE3B3B8)
  %515 = tail call double @llvm.fma.f64(double %511, double %514, double 0xC080AF76167FE583)
  %516 = tail call double @llvm.fma.f64(double %511, double %515, double 0x403778EA61B94139)
  %517 = tail call double @llvm.fma.f64(double %511, double %516, double 0xBFFA3581D1A82662)
  %518 = tail call double @llvm.fma.f64(double %511, double %517, double 0x3FCAD33330A1DAF2)
  %519 = tail call double @llvm.fma.f64(double %511, double %518, double 0xBFB0AAAAAAAA7909)
  %520 = tail call double @llvm.fma.f64(double %511, double %519, double 1.250000e-01)
  %521 = fmul double %510, %520
  %522 = tail call double @llvm.amdgcn.rsq.f64(double %510)
  %523 = fmul double %510, %522
  %524 = fmul double %522, 5.000000e-01
  %525 = fneg double %524
  %526 = tail call double @llvm.fma.f64(double %525, double %523, double 5.000000e-01)
  %527 = tail call double @llvm.fma.f64(double %524, double %526, double %524)
  %528 = tail call double @llvm.fma.f64(double %523, double %526, double %523)
  %529 = fneg double %528
  %530 = tail call double @llvm.fma.f64(double %529, double %528, double %510)
  %531 = tail call double @llvm.fma.f64(double %530, double %527, double %528)
  %532 = fcmp oeq double %510, 0.000000e+00
  %533 = select i1 %532, double %510, double %531
  %534 = fmul double %533, 0x3FE9884533D43651
  %535 = tail call double @llvm.fma.f64(double %511, double 0x41344395CD7AC32C, double 0xC0F25BF3ABBEE803)
  %536 = tail call double @llvm.fma.f64(double %511, double %535, double 0x40A55A4A78625B0F)
  %537 = tail call double @llvm.fma.f64(double %511, double %536, double 0xC05A826C7EA56321)
  %538 = tail call double @llvm.fma.f64(double %511, double %537, double 0x401763253BBF53B6)
  %539 = tail call double @llvm.fma.f64(double %511, double %538, double 0xBFE15EFAFF948953)
  %540 = tail call double @llvm.fma.f64(double %511, double %539, double 0x3FBA7FFFF967A1D4)
  %541 = tail call double @llvm.fma.f64(double %511, double %540, double 0xBFAFFFFFFFFF2868)
  %542 = tail call double @llvm.fma.f64(double %511, double %541, double 1.000000e+00)
  %543 = fmul double %534, %542
  %544 = fcmp olt double %35, 0x41D0000000000000
  br i1 %544, label %545, label %564

545:                                              ; preds = %509
  %546 = fmul double %35, 0x3FE45F306DC9C883
  %547 = tail call double @llvm.rint.f64(double %546)
  %548 = tail call double @llvm.fma.f64(double %547, double 0xBFF921FB54442D18, double %35)
  %549 = tail call double @llvm.fma.f64(double %547, double 0xBC91A62633145C00, double %548)
  %550 = fmul double %547, 0x3C91A62633145C00
  %551 = fneg double %550
  %552 = tail call double @llvm.fma.f64(double %547, double 0x3C91A62633145C00, double %551)
  %553 = fsub double %548, %550
  %554 = fsub double %548, %553
  %555 = fsub double %554, %550
  %556 = fsub double %553, %549
  %557 = fadd double %556, %555
  %558 = fsub double %557, %552
  %559 = tail call double @llvm.fma.f64(double %547, double 0xB97B839A252049C0, double %558)
  %560 = fadd double %549, %559
  %561 = fsub double %560, %549
  %562 = fsub double %559, %561
  %563 = fptosi double %547 to i32
  br label %640

564:                                              ; preds = %509
  %565 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 0)
  %566 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 1)
  %567 = tail call double @llvm.amdgcn.trig.preop.f64(double %35, i32 2)
  %568 = fcmp oge double %35, 0x7B00000000000000
  %569 = tail call double @llvm.amdgcn.ldexp.f64(double %35, i32 -128)
  %570 = select i1 %568, double %569, double %35
  %571 = fmul double %567, %570
  %572 = fneg double %571
  %573 = tail call double @llvm.fma.f64(double %567, double %570, double %572)
  %574 = fmul double %566, %570
  %575 = fneg double %574
  %576 = tail call double @llvm.fma.f64(double %566, double %570, double %575)
  %577 = fmul double %565, %570
  %578 = fneg double %577
  %579 = tail call double @llvm.fma.f64(double %565, double %570, double %578)
  %580 = fadd double %574, %579
  %581 = fsub double %580, %574
  %582 = fsub double %580, %581
  %583 = fsub double %579, %581
  %584 = fsub double %574, %582
  %585 = fadd double %583, %584
  %586 = fadd double %571, %576
  %587 = fsub double %586, %571
  %588 = fsub double %586, %587
  %589 = fsub double %576, %587
  %590 = fsub double %571, %588
  %591 = fadd double %589, %590
  %592 = fadd double %586, %585
  %593 = fsub double %592, %586
  %594 = fsub double %592, %593
  %595 = fsub double %585, %593
  %596 = fsub double %586, %594
  %597 = fadd double %595, %596
  %598 = fadd double %591, %597
  %599 = fadd double %573, %598
  %600 = fadd double %577, %580
  %601 = fsub double %600, %577
  %602 = fsub double %580, %601
  %603 = fadd double %602, %592
  %604 = fsub double %603, %602
  %605 = fsub double %592, %604
  %606 = fadd double %605, %599
  %607 = tail call double @llvm.amdgcn.ldexp.f64(double %600, i32 -2)
  %608 = tail call double @llvm.amdgcn.fract.f64(double %607)
  %609 = tail call i1 @llvm.amdgcn.class.f64(double %607, i32 516)
  %610 = select i1 %609, double 0.000000e+00, double %608
  %611 = tail call double @llvm.amdgcn.ldexp.f64(double %610, i32 2)
  %612 = fadd double %611, %603
  %613 = fcmp olt double %612, 0.000000e+00
  %614 = select i1 %613, double 4.000000e+00, double 0.000000e+00
  %615 = fadd double %611, %614
  %616 = fadd double %603, %615
  %617 = fptosi double %616 to i32
  %618 = sitofp i32 %617 to double
  %619 = fsub double %615, %618
  %620 = fadd double %603, %619
  %621 = fsub double %620, %619
  %622 = fsub double %603, %621
  %623 = fadd double %606, %622
  %624 = fcmp oge double %620, 5.000000e-01
  %625 = zext i1 %624 to i32
  %626 = add nsw i32 %625, %617
  %627 = select i1 %624, double 1.000000e+00, double 0.000000e+00
  %628 = fsub double %620, %627
  %629 = fadd double %628, %623
  %630 = fsub double %629, %628
  %631 = fsub double %623, %630
  %632 = fmul double %629, 0x3FF921FB54442D18
  %633 = fneg double %632
  %634 = tail call double @llvm.fma.f64(double %629, double 0x3FF921FB54442D18, double %633)
  %635 = tail call double @llvm.fma.f64(double %629, double 0x3C91A62633145C07, double %634)
  %636 = tail call double @llvm.fma.f64(double %631, double 0x3FF921FB54442D18, double %635)
  %637 = fadd double %632, %636
  %638 = fsub double %637, %632
  %639 = fsub double %636, %638
  br label %640

640:                                              ; preds = %564, %545
  %641 = phi double [ %562, %545 ], [ %639, %564 ]
  %642 = phi double [ %560, %545 ], [ %637, %564 ]
  %643 = phi i32 [ %563, %545 ], [ %626, %564 ]
  %644 = and i32 %643, 3
  %645 = fcmp olt double %642, %521
  %646 = sext i1 %645 to i32
  %647 = add nsw i32 %644, %646
  %648 = select i1 %645, i32 -2147483648, i32 0
  %649 = xor i32 %648, -1075240453
  %650 = insertelement <2 x i32> <i32 1413754136, i32 poison>, i32 %649, i64 1
  %651 = bitcast <2 x i32> %650 to double
  %652 = xor i32 %648, -1132354010
  %653 = insertelement <2 x i32> <i32 856972295, i32 poison>, i32 %652, i64 1
  %654 = bitcast <2 x i32> %653 to double
  %655 = fsub double %651, %521
  %656 = fsub double %651, %655
  %657 = fsub double %656, %521
  %658 = fadd double %657, %654
  %659 = fadd double %655, %658
  %660 = fsub double %659, %655
  %661 = fsub double %658, %660
  %662 = fadd double %642, %659
  %663 = fsub double %662, %659
  %664 = fsub double %642, %663
  %665 = fadd double %641, %661
  %666 = fadd double %664, %665
  %667 = fadd double %662, %666
  %668 = fsub double %667, %662
  %669 = fsub double %666, %668
  %670 = fmul double %667, %667
  %671 = fmul double %670, 5.000000e-01
  %672 = fsub double 1.000000e+00, %671
  %673 = fsub double 1.000000e+00, %672
  %674 = fsub double %673, %671
  %675 = fmul double %670, %670
  %676 = tail call double @llvm.fma.f64(double %670, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %677 = tail call double @llvm.fma.f64(double %670, double %676, double 0xBE927E4FA17F65F6)
  %678 = tail call double @llvm.fma.f64(double %670, double %677, double 0x3EFA01A019F4EC90)
  %679 = tail call double @llvm.fma.f64(double %670, double %678, double 0xBF56C16C16C16967)
  %680 = tail call double @llvm.fma.f64(double %670, double %679, double 0x3FA5555555555555)
  %681 = fneg double %669
  %682 = tail call double @llvm.fma.f64(double %667, double %681, double %674)
  %683 = tail call double @llvm.fma.f64(double %675, double %680, double %682)
  %684 = fadd double %672, %683
  %685 = tail call double @llvm.fma.f64(double %670, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %686 = tail call double @llvm.fma.f64(double %670, double %685, double 0x3EC71DE3796CDE01)
  %687 = tail call double @llvm.fma.f64(double %670, double %686, double 0xBF2A01A019E83E5C)
  %688 = tail call double @llvm.fma.f64(double %670, double %687, double 0x3F81111111110BB3)
  %689 = fneg double %670
  %690 = fmul double %667, %689
  %691 = fmul double %669, 5.000000e-01
  %692 = tail call double @llvm.fma.f64(double %690, double %688, double %691)
  %693 = tail call double @llvm.fma.f64(double %670, double %692, double %681)
  %694 = tail call double @llvm.fma.f64(double %690, double 0xBFC5555555555555, double %693)
  %695 = fsub double %667, %694
  %696 = and i32 %647, 1
  %697 = icmp eq i32 %696, 0
  %698 = select i1 %697, double %695, double %684
  %699 = bitcast double %698 to <2 x i32>
  %700 = shl i32 %647, 30
  %701 = and i32 %700, -2147483648
  %702 = extractelement <2 x i32> %699, i64 1
  %703 = xor i32 %702, %701
  %704 = insertelement <2 x i32> %699, i32 %703, i64 1
  %705 = bitcast <2 x i32> %704 to double
  %706 = fmul double %543, %705
  %707 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 512)
  %708 = select i1 %707, double 0.000000e+00, double %706
  br label %709

709:                                              ; preds = %460, %640
  %710 = phi double [ %508, %460 ], [ %708, %640 ]
  %711 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %710, double addrspace(1)* %711, align 8, !tbaa !16
  br label %712

712:                                              ; preds = %709, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

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
