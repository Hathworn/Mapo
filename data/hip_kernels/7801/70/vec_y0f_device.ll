; ModuleID = '../data/hip_kernels/7801/70/main.cu'
source_filename = "../data/hip_kernels/7801/70/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M32_J0 = internal unnamed_addr addrspace(4) constant [72 x float] [float 1.000000e+00, float 0x3E6816D220000000, float 0xBFD00002E0000000, float 0x3ED0910BC0000000, float 0x3F8FF9F9A0000000, float 0x3EF38BC460000000, float 0xBF3D965580000000, float 0x3EE3040C20000000, float 0x3ED360EDC0000000, float 0.000000e+00, float 0xBFE09CDB40000000, float 0x3FBBA1DEE0000000, float 0x3FACFAE7A0000000, float 0xBF81BB1C40000000, float 0xBF61F92680000000, float 0x3F31530480000000, float 0x3F069F1460000000, float 0xBED1EAAF60000000, float 0xBFD9C6CF60000000, float 0xBE1704E3C0000000, float 0x3FC9C6CF40000000, float 0xBF91F06B20000000, float 0xBF8B589020000000, float 0x3F50F855C0000000, float 0x3F385F27C0000000, float 0xBEF9BB9700000000, float 0xBED6DA5DE0000000, float 0.000000e+00, float 0x3FD5C6E600000000, float 0xBF9F8F72E0000000, float 0xBFAB214EE0000000, float 0x3F72F7FEA0000000, float 0x3F627D6020000000, float 0xBF26F55C80000000, float 0xBF07F2A640000000, float 0x3ECA684BC0000000, float 0x3FD33518C0000000, float 0x3E186B66E0000000, float 0xBFC33518A0000000, float 0x3F7D340A80000000, float 0x3F880C7CA0000000, float 0xBF44825AE0000000, float 0xBF36FCD020000000, float 0x3EF26BCC40000000, float 0x3ED6C3CD40000000, float 0.000000e+00, float 0xBFD15F7980000000, float 0x3F900F7FC0000000, float 0x3FA68B96C0000000, float 0xBF648E6200000000, float 0xBF60E02280000000, float 0x3F1D783220000000, float 0x3F0717D3C0000000, float 0xBEC2DEE220000000, float 0xBFCFF65460000000, float 0xBE1396A9E0000000, float 0x3FBFF65440000000, float 0xBF70C179C0000000, float 0xBF84B0C180000000, float 0x3F393F1FA0000000, float 0x3F34DF60C0000000, float 0xBEE95D7A20000000, float 0xBED5A7F7A0000000, float 0.000000e+00, float 0x3FCDC13E60000000, float 0xBF842FF0C0000000, float 0xBFA38D1C80000000, float 0x3F5A55E800000000, float 0x3F5E2CD860000000, float 0xBF13DEF6E0000000, float 0xBF056E8D80000000, float 0x3EBB39ADE0000000], align 4
@__ocmltbl_M32_Y0 = internal unnamed_addr addrspace(4) constant [162 x float] [float 0xBFB2E4D6A0000000, float 0x3FC6BBCB40000000, float 0xBF9075B1C0000000, float 0x3F41A62060000000, float 0xBEE3E997A0000000, float 0x3E7BCE4A60000000, float 0xBE0A6EE780000000, float 0x3D92392FA0000000, float 0xBD12F9C860000000, float 0xBFE8EEA0A0000000, float 0x4001B052C0000000, float 0xC0092F7820000000, float 0x401B0CA4E0000000, float 0xC030864B60000000, float 0x4044DC6660000000, float 0xC0595311A0000000, float 0x4068BFD040000000, float 0xC06AA68BE0000000, float 0xBFE15659A0000000, float 0x3FFA6174E0000000, float 0xBFF9D0A540000000, float 0x40031EF460000000, float 0xC011193900000000, float 0x401F503AE0000000, float 0xC02C78A9A0000000, float 0x40364F3B00000000, float 0xC034C8FA80000000, float 0xBFD6DA7300000000, float 0x3FF54DFD40000000, float 0xBFF014AF00000000, float 0x3FF1335EA0000000, float 0xBFF8BED780000000, float 0x4001D355A0000000, float 0xC009C1A580000000, float 0x4010BF0BC0000000, float 0xC00B7C1960000000, float 0xBFCA2F2E20000000, float 0x3FF1EEDDA0000000, float 0xBFE6CFB9A0000000, float 0x3FE1BAB720000000, float 0xBFE5C91B40000000, float 0x3FEA141220000000, float 0xBFEF2823E0000000, float 0x3FF13B6AE0000000, float 0xBFE93195A0000000, float 0.000000e+00, float 0x3FEC243720000000, float 0xBFDF7E38A0000000, float 0x3FCC3B1520000000, float 0xBFCCF190E0000000, float 0x3FCC03F760000000, float 0xBFCA34BAC0000000, float 0x3FCA3DABA0000000, float 0xBFCADC6900000000, float 0x3FB6980220000000, float 0x3FE8FFB200000000, float 0xBFDBD2B220000000, float 0x3FC28C6860000000, float 0xBFC19A2C60000000, float 0x3FBFC0B220000000, float 0xBFB9A82100000000, float 0x3FB2790420000000, float 0xBFA081D660000000, float 0x3FD086A000000000, float 0x3FE2B31C40000000, float 0xBFD738FFC0000000, float 0x3FAF96B5C0000000, float 0xBFA7664060000000, float 0x3FA4AE3160000000, float 0xBF9A526CA0000000, float 0x3F8C6DB9A0000000, float 0xBF72629E00000000, float 0x3FDB7362A0000000, float 0x3FD53A7B40000000, float 0xBFD441D740000000, float 0x3F9F503C60000000, float 0xBF736CEE20000000, float 0x3F85860D60000000, float 0xBF77550C20000000, float 0x3F6391C8C0000000, float 0xBF45FE06C0000000, float 0x3FE0AA4840000000, float 0x3DC162EDC0000000, float 0xBFD0AA4840000000, float 0x3FA439FAA0000000, float 0x3F80D2B8E0000000, float 0x3F4F72CDE0000000, float 0xBF544F2E40000000, float 0x3F385BD280000000, float 0xBF1BB9F460000000, float 0x3FDF922EA0000000, float 0xBFC46AE4C0000000, float 0xBFCB89B5A0000000, float 0x3FA9FE2A40000000, float 0x3F80AA9B00000000, float 0xBF4C429AA0000000, float 0xBF4547FD60000000, float 0x3F23B1DF00000000, float 0xBEF35AD160000000, float 0x3FD81E4F80000000, float 0xBFD4C77740000000, float 0xBFC13127C0000000, float 0x3FB0224F60000000, float 0x3F72400F40000000, float 0xBF613662A0000000, float 0xBF314CBB20000000, float 0x3F16F9C7A0000000, float 0xBED6EBD660000000, float 0.000000e+00, float 0xBFD9C34260000000, float 0x3FAA09C920000000, float 0x3FADF6D260000000, float 0xBF7C1164A0000000, float 0xBF61E12F60000000, float 0x3F2981AA80000000, float 0x3F0970F060000000, float 0xBEC69BDE60000000, float 0xBFD5C7C560000000, float 0xBE1E3E2120000000, float 0x3FC5C7C540000000, float 0xBF8564CFE0000000, float 0xBF8A15CFA0000000, float 0x3F4B41D360000000, float 0x3F37A4E7E0000000, float 0xBEF5824B80000000, float 0xBED75CA060000000, float 0.000000e+00, float 0x3FD334CCA0000000, float 0xBF95AEF620000000, float 0xBFA8969AA0000000, float 0x3F6B2F12C0000000, float 0x3F61D29B00000000, float 0xBF226D16A0000000, float 0xBF07AA0BA0000000, float 0x3EC6449D80000000, float 0x3FD15F9940000000, float 0x3E17E8E1C0000000, float 0xBFC15F9940000000, float 0x3F758EEF60000000, float 0x3F86395820000000, float 0xBF3FAEB600000000, float 0xBF35F635A0000000, float 0x3EEE8933A0000000, float 0x3ED64513E0000000, float 0.000000e+00, float 0xBFCFF635C0000000, float 0x3F89036460000000, float 0x3FA4E66620000000, float 0xBF60325DC0000000, float 0xBF5FE0D880000000, float 0x3F17F74C80000000, float 0x3F0649A000000000, float 0xBEBFF10BA0000000, float 0xBFCDC14EA0000000, float 0xBE10ED55E0000000, float 0x3FBDC14EA0000000, float 0xBF6B037520000000, float 0xBF8367D3E0000000, float 0x3F34AA0660000000, float 0x3F33D6FC40000000, float 0xBEE54E58A0000000, float 0xBED4E5C1E0000000], align 4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_y0f(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %500

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fcmp ugt float %17, 0x4029180000000000
  br i1 %18, label %341, label %19

19:                                               ; preds = %15
  %20 = fcmp olt float %17, 2.000000e+00
  br i1 %20, label %21, label %46

21:                                               ; preds = %19
  %22 = fcmp olt float %17, 8.125000e-01
  br i1 %22, label %23, label %35

23:                                               ; preds = %21
  %24 = fcmp olt float %17, 3.125000e-01
  br i1 %24, label %72, label %25

25:                                               ; preds = %23
  %26 = fcmp olt float %17, 4.375000e-01
  %27 = fcmp olt float %17, 5.625000e-01
  %28 = fcmp olt float %17, 6.875000e-01
  %29 = select i1 %28, float 5.625000e-01, float 6.875000e-01
  %30 = select i1 %28, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 27), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 36)
  %31 = select i1 %27, float 4.375000e-01, float %29
  %32 = select i1 %27, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 18), float addrspace(4)* %30
  %33 = select i1 %26, float 3.125000e-01, float %31
  %34 = select i1 %26, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 9), float addrspace(4)* %32
  br label %72

35:                                               ; preds = %21
  %36 = fcmp olt float %17, 1.000000e+00
  %37 = fcmp olt float %17, 1.250000e+00
  %38 = fcmp olt float %17, 1.625000e+00
  %39 = select i1 %38, float 1.250000e+00, float 1.625000e+00
  %40 = select i1 %38, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 63), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 72)
  %41 = select i1 %37, float 1.000000e+00, float %39
  %42 = select i1 %37, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 54), float addrspace(4)* %40
  %43 = select i1 %36, float 0xBE4CAFA060000000, float 0.000000e+00
  %44 = select i1 %36, float 0x3FEC982EC0000000, float %41
  %45 = select i1 %36, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 45), float addrspace(4)* %42
  br label %72

46:                                               ; preds = %19
  %47 = fcmp olt float %17, 0x4019100000000000
  br i1 %47, label %48, label %61

48:                                               ; preds = %46
  %49 = fcmp olt float %17, 2.531250e+00
  br i1 %49, label %72, label %50

50:                                               ; preds = %48
  %51 = fcmp olt float %17, 3.000000e+00
  br i1 %51, label %72, label %52

52:                                               ; preds = %50
  %53 = fcmp olt float %17, 0x400BE00000000000
  %54 = fcmp olt float %17, 0x4012D00000000000
  %55 = select i1 %54, float 0x3E7B30AD40000000, float 0x3E8D0F6060000000
  %56 = select i1 %54, float 0x400FA95340000000, float 0x4015B7FE40000000
  %57 = select i1 %54, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 108), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 117)
  %58 = select i1 %53, float 0.000000e+00, float %55
  %59 = select i1 %53, float 3.000000e+00, float %56
  %60 = select i1 %53, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 99), float addrspace(4)* %57
  br label %72

61:                                               ; preds = %46
  %62 = fcmp olt float %17, 7.843750e+00
  br i1 %62, label %72, label %63

63:                                               ; preds = %61
  %64 = fcmp olt float %17, 0x4022D80000000000
  %65 = fcmp olt float %17, 0x4025F80000000000
  %66 = select i1 %65, float 0xBE94B70560000000, float 0xBE8CAF37E0000000
  %67 = select i1 %65, float 0x402471D740000000, float 0x40277F9140000000
  %68 = select i1 %65, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 144), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 153)
  %69 = select i1 %64, float 0x3E9CC2D360000000, float %66
  %70 = select i1 %64, float 0x40213127A0000000, float %67
  %71 = select i1 %64, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 135), float addrspace(4)* %68
  br label %72

72:                                               ; preds = %63, %61, %52, %50, %48, %35, %25, %23
  %73 = phi float [ 0.000000e+00, %23 ], [ 0xBE76401B80000000, %48 ], [ 0.000000e+00, %50 ], [ 0x3E739C8400000000, %61 ], [ %58, %52 ], [ %69, %63 ], [ 0.000000e+00, %25 ], [ %43, %35 ]
  %74 = phi float [ 0.000000e+00, %23 ], [ 0x400193BEE0000000, %48 ], [ 2.531250e+00, %50 ], [ 0x401C581DC0000000, %61 ], [ %59, %52 ], [ %70, %63 ], [ %33, %25 ], [ %44, %35 ]
  %75 = phi float addrspace(4)* [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 0), %23 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 81), %48 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 90), %50 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y0, i64 0, i64 126), %61 ], [ %60, %52 ], [ %71, %63 ], [ %34, %25 ], [ %45, %35 ]
  %76 = fcmp olt float %17, 3.125000e-01
  br i1 %76, label %77, label %310

77:                                               ; preds = %72
  %78 = tail call float @llvm.fabs.f32(float %17)
  %79 = fcmp ugt float %78, 0x4029280000000000
  br i1 %79, label %135, label %80

80:                                               ; preds = %77
  %81 = fcmp ugt float %78, 0x4019100000000000
  br i1 %81, label %93, label %82

82:                                               ; preds = %80
  %83 = fcmp ugt float %78, 1.656250e+00
  br i1 %83, label %84, label %104

84:                                               ; preds = %82
  %85 = fcmp ugt float %78, 3.125000e+00
  %86 = fcmp ugt float %78, 4.687500e+00
  %87 = select i1 %86, float 0xBE734F46E0000000, float 0xBE74A121E0000000
  %88 = select i1 %86, float 0x4016148F60000000, float 0x400EA75580000000
  %89 = select i1 %86, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 27), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 18)
  %90 = select i1 %85, float %87, float 0x3E7D2E3680000000
  %91 = select i1 %85, float %88, float 0x40033D1520000000
  %92 = select i1 %85, float addrspace(4)* %89, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 9)
  br label %104

93:                                               ; preds = %80
  %94 = fcmp ugt float %78, 7.843750e+00
  br i1 %94, label %95, label %104

95:                                               ; preds = %93
  %96 = fcmp ugt float %78, 0x4022D80000000000
  %97 = fcmp ugt float %78, 0x4025F80000000000
  %98 = select i1 %97, float 0x3E504E56C0000000, float 0xBE9E8407A0000000
  %99 = select i1 %97, float 0x4027954400000000, float 0x402458D0E0000000
  %100 = select i1 %97, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 63), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 54)
  %101 = select i1 %96, float %98, float 0x3E9999BDA0000000
  %102 = select i1 %96, float %99, float 0x40214EB560000000
  %103 = select i1 %96, float addrspace(4)* %100, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 45)
  br label %104

104:                                              ; preds = %95, %93, %84, %82
  %105 = phi float [ 0.000000e+00, %82 ], [ 0xBE88971B60000000, %93 ], [ %90, %84 ], [ %101, %95 ]
  %106 = phi float [ 0.000000e+00, %82 ], [ 0x401C0FF600000000, %93 ], [ %91, %84 ], [ %102, %95 ]
  %107 = phi float addrspace(4)* [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 0), %82 ], [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J0, i64 0, i64 36), %93 ], [ %92, %84 ], [ %103, %95 ]
  %108 = fsub float %78, %106
  %109 = fsub float %108, %105
  %110 = getelementptr inbounds float, float addrspace(4)* %107, i64 8
  %111 = load float, float addrspace(4)* %110, align 4, !tbaa !11
  %112 = getelementptr inbounds float, float addrspace(4)* %107, i64 7
  %113 = load float, float addrspace(4)* %112, align 4, !tbaa !11
  %114 = tail call float @llvm.fmuladd.f32(float %109, float %111, float %113)
  %115 = getelementptr inbounds float, float addrspace(4)* %107, i64 6
  %116 = load float, float addrspace(4)* %115, align 4, !tbaa !11
  %117 = tail call float @llvm.fmuladd.f32(float %109, float %114, float %116)
  %118 = getelementptr inbounds float, float addrspace(4)* %107, i64 5
  %119 = load float, float addrspace(4)* %118, align 4, !tbaa !11
  %120 = tail call float @llvm.fmuladd.f32(float %109, float %117, float %119)
  %121 = getelementptr inbounds float, float addrspace(4)* %107, i64 4
  %122 = load float, float addrspace(4)* %121, align 4, !tbaa !11
  %123 = tail call float @llvm.fmuladd.f32(float %109, float %120, float %122)
  %124 = getelementptr inbounds float, float addrspace(4)* %107, i64 3
  %125 = load float, float addrspace(4)* %124, align 4, !tbaa !11
  %126 = tail call float @llvm.fmuladd.f32(float %109, float %123, float %125)
  %127 = getelementptr inbounds float, float addrspace(4)* %107, i64 2
  %128 = load float, float addrspace(4)* %127, align 4, !tbaa !11
  %129 = tail call float @llvm.fmuladd.f32(float %109, float %126, float %128)
  %130 = getelementptr inbounds float, float addrspace(4)* %107, i64 1
  %131 = load float, float addrspace(4)* %130, align 4, !tbaa !11
  %132 = tail call float @llvm.fmuladd.f32(float %109, float %129, float %131)
  %133 = load float, float addrspace(4)* %107, align 4, !tbaa !11
  %134 = tail call float @llvm.fmuladd.f32(float %109, float %132, float %133)
  br label %292

135:                                              ; preds = %77
  %136 = fdiv float 1.000000e+00, %78, !fpmath !15
  %137 = fmul float %136, %136
  %138 = tail call float @llvm.fmuladd.f32(float %137, float 0xBFF5EC5E60000000, float 0x3FCAAFB080000000)
  %139 = tail call float @llvm.fmuladd.f32(float %137, float %138, float 0xBFB0AA9260000000)
  %140 = tail call float @llvm.fmuladd.f32(float %137, float %139, float 1.250000e-01)
  %141 = fmul float %136, %140
  %142 = tail call float @llvm.amdgcn.rsq.f32(float %78)
  %143 = fmul float %142, 0x3FE9884540000000
  %144 = tail call float @llvm.fmuladd.f32(float %137, float 0x3FB92AECC0000000, float 0xBFAFFE4720000000)
  %145 = tail call float @llvm.fmuladd.f32(float %137, float %144, float 1.000000e+00)
  %146 = fmul float %143, %145
  %147 = fcmp olt float %78, 1.310720e+05
  br i1 %147, label %148, label %155

148:                                              ; preds = %135
  %149 = fmul float %78, 0x3FE45F3060000000
  %150 = tail call float @llvm.rint.f32(float %149)
  %151 = tail call float @llvm.fma.f32(float %150, float 0xBFF921FB40000000, float %78)
  %152 = tail call float @llvm.fma.f32(float %150, float 0xBE74442D00000000, float %151)
  %153 = tail call float @llvm.fma.f32(float %150, float 0xBCF8469880000000, float %152)
  %154 = fptosi float %150 to i32
  br label %261

155:                                              ; preds = %135
  %156 = bitcast float %78 to i32
  %157 = lshr i32 %156, 23
  %158 = and i32 %156, 8388607
  %159 = or i32 %158, 8388608
  %160 = zext i32 %159 to i64
  %161 = mul nuw nsw i64 %160, 4266746795
  %162 = trunc i64 %161 to i32
  %163 = lshr i64 %161, 32
  %164 = mul nuw nsw i64 %160, 1011060801
  %165 = add nuw nsw i64 %163, %164
  %166 = trunc i64 %165 to i32
  %167 = lshr i64 %165, 32
  %168 = mul nuw nsw i64 %160, 3680671129
  %169 = add nuw nsw i64 %167, %168
  %170 = trunc i64 %169 to i32
  %171 = lshr i64 %169, 32
  %172 = mul nuw nsw i64 %160, 4113882560
  %173 = add nuw nsw i64 %171, %172
  %174 = trunc i64 %173 to i32
  %175 = lshr i64 %173, 32
  %176 = mul nuw nsw i64 %160, 4230436817
  %177 = add nuw nsw i64 %175, %176
  %178 = trunc i64 %177 to i32
  %179 = lshr i64 %177, 32
  %180 = mul nuw nsw i64 %160, 1313084713
  %181 = add nuw nsw i64 %179, %180
  %182 = trunc i64 %181 to i32
  %183 = lshr i64 %181, 32
  %184 = mul nuw nsw i64 %160, 2734261102
  %185 = add nuw nsw i64 %183, %184
  %186 = trunc i64 %185 to i32
  %187 = lshr i64 %185, 32
  %188 = trunc i64 %187 to i32
  %189 = add nsw i32 %157, -120
  %190 = icmp ugt i32 %189, 63
  %191 = select i1 %190, i32 %182, i32 %188
  %192 = select i1 %190, i32 %178, i32 %186
  %193 = select i1 %190, i32 %174, i32 %182
  %194 = select i1 %190, i32 %170, i32 %178
  %195 = select i1 %190, i32 %166, i32 %174
  %196 = select i1 %190, i32 %162, i32 %170
  %197 = select i1 %190, i32 -64, i32 0
  %198 = add nsw i32 %197, %189
  %199 = icmp ugt i32 %198, 31
  %200 = select i1 %199, i32 %192, i32 %191
  %201 = select i1 %199, i32 %193, i32 %192
  %202 = select i1 %199, i32 %194, i32 %193
  %203 = select i1 %199, i32 %195, i32 %194
  %204 = select i1 %199, i32 %196, i32 %195
  %205 = select i1 %199, i32 -32, i32 0
  %206 = add nsw i32 %205, %198
  %207 = icmp ugt i32 %206, 31
  %208 = select i1 %207, i32 %201, i32 %200
  %209 = select i1 %207, i32 %202, i32 %201
  %210 = select i1 %207, i32 %203, i32 %202
  %211 = select i1 %207, i32 %204, i32 %203
  %212 = select i1 %207, i32 -32, i32 0
  %213 = add nsw i32 %212, %206
  %214 = icmp eq i32 %213, 0
  %215 = sub nsw i32 32, %213
  %216 = tail call i32 @llvm.fshr.i32(i32 %208, i32 %209, i32 %215)
  %217 = tail call i32 @llvm.fshr.i32(i32 %209, i32 %210, i32 %215)
  %218 = tail call i32 @llvm.fshr.i32(i32 %210, i32 %211, i32 %215)
  %219 = select i1 %214, i32 %208, i32 %216
  %220 = select i1 %214, i32 %209, i32 %217
  %221 = select i1 %214, i32 %210, i32 %218
  %222 = lshr i32 %219, 29
  %223 = tail call i32 @llvm.fshl.i32(i32 %219, i32 %220, i32 2)
  %224 = tail call i32 @llvm.fshl.i32(i32 %220, i32 %221, i32 2)
  %225 = tail call i32 @llvm.fshl.i32(i32 %221, i32 %211, i32 2)
  %226 = and i32 %222, 1
  %227 = sub nsw i32 0, %226
  %228 = shl i32 %222, 31
  %229 = xor i32 %223, %227
  %230 = xor i32 %224, %227
  %231 = xor i32 %225, %227
  %232 = tail call i32 @llvm.ctlz.i32(i32 %229, i1 false), !range !16
  %233 = sub nsw i32 31, %232
  %234 = tail call i32 @llvm.fshr.i32(i32 %229, i32 %230, i32 %233)
  %235 = tail call i32 @llvm.fshr.i32(i32 %230, i32 %231, i32 %233)
  %236 = shl nuw nsw i32 %232, 23
  %237 = sub nuw nsw i32 1056964608, %236
  %238 = lshr i32 %234, 9
  %239 = or i32 %238, %237
  %240 = or i32 %239, %228
  %241 = bitcast i32 %240 to float
  %242 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %235, i32 23)
  %243 = tail call i32 @llvm.ctlz.i32(i32 %242, i1 false), !range !16
  %244 = fmul float %241, 0x3FF921FB40000000
  %245 = add nuw nsw i32 %243, %232
  %246 = shl nuw nsw i32 %245, 23
  %247 = sub nuw nsw i32 855638016, %246
  %248 = sub nsw i32 31, %243
  %249 = tail call i32 @llvm.fshr.i32(i32 %242, i32 %235, i32 %248)
  %250 = lshr i32 %249, 9
  %251 = or i32 %247, %250
  %252 = or i32 %251, %228
  %253 = bitcast i32 %252 to float
  %254 = fneg float %244
  %255 = tail call float @llvm.fma.f32(float %241, float 0x3FF921FB40000000, float %254)
  %256 = tail call float @llvm.fma.f32(float %241, float 0x3E74442D00000000, float %255)
  %257 = tail call float @llvm.fma.f32(float %253, float 0x3FF921FB40000000, float %256)
  %258 = fadd float %244, %257
  %259 = lshr i32 %219, 30
  %260 = add nuw nsw i32 %226, %259
  br label %261

261:                                              ; preds = %155, %148
  %262 = phi float [ %153, %148 ], [ %258, %155 ]
  %263 = phi i32 [ %154, %148 ], [ %260, %155 ]
  %264 = and i32 %263, 3
  %265 = fcmp olt float %262, %141
  %266 = sext i1 %265 to i32
  %267 = add nsw i32 %264, %266
  %268 = fsub float %262, %141
  %269 = select i1 %265, float 0x3FE921FB60000000, float 0xBFE921FB60000000
  %270 = fadd float %268, %269
  %271 = fmul float %270, %270
  %272 = tail call float @llvm.fmuladd.f32(float %271, float 0xBF29833040000000, float 0x3F81103880000000)
  %273 = tail call float @llvm.fmuladd.f32(float %271, float %272, float 0xBFC55553A0000000)
  %274 = fmul float %271, %273
  %275 = tail call float @llvm.fmuladd.f32(float %270, float %274, float %270)
  %276 = tail call float @llvm.fmuladd.f32(float %271, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %277 = tail call float @llvm.fmuladd.f32(float %271, float %276, float 0x3FA5557EE0000000)
  %278 = tail call float @llvm.fmuladd.f32(float %271, float %277, float 0xBFE0000080000000)
  %279 = tail call float @llvm.fmuladd.f32(float %271, float %278, float 1.000000e+00)
  %280 = fneg float %275
  %281 = and i32 %267, 1
  %282 = icmp eq i32 %281, 0
  %283 = select i1 %282, float %279, float %280
  %284 = bitcast float %283 to i32
  %285 = shl i32 %267, 30
  %286 = and i32 %285, -2147483648
  %287 = xor i32 %286, %284
  %288 = bitcast i32 %287 to float
  %289 = fmul float %146, %288
  %290 = tail call i1 @llvm.amdgcn.class.f32(float %78, i32 512)
  %291 = select i1 %290, float 0.000000e+00, float %289
  br label %292

292:                                              ; preds = %261, %104
  %293 = phi float [ %134, %104 ], [ %291, %261 ]
  %294 = fmul float %293, 0x3FE45F3060000000
  %295 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 144)
  %296 = select i1 %295, float 0x41F0000000000000, float 1.000000e+00
  %297 = fmul float %17, %296
  %298 = tail call float @llvm.log2.f32(float %297)
  %299 = fmul float %298, 0x3FE62E42E0000000
  %300 = tail call i1 @llvm.amdgcn.class.f32(float %298, i32 519)
  %301 = fneg float %299
  %302 = tail call float @llvm.fma.f32(float %298, float 0x3FE62E42E0000000, float %301)
  %303 = tail call float @llvm.fma.f32(float %298, float 0x3E6EFA39E0000000, float %302)
  %304 = fadd float %299, %303
  %305 = select i1 %300, float %298, float %304
  %306 = select i1 %295, float 0x40362E4300000000, float 0.000000e+00
  %307 = fsub float %305, %306
  %308 = fmul float %307, %294
  %309 = fmul float %17, %17
  br label %310

310:                                              ; preds = %292, %72
  %311 = phi float [ %308, %292 ], [ 0.000000e+00, %72 ]
  %312 = phi float [ %309, %292 ], [ %17, %72 ]
  %313 = fsub float %312, %74
  %314 = fsub float %313, %73
  %315 = getelementptr inbounds float, float addrspace(4)* %75, i64 8
  %316 = load float, float addrspace(4)* %315, align 4, !tbaa !11
  %317 = getelementptr inbounds float, float addrspace(4)* %75, i64 7
  %318 = load float, float addrspace(4)* %317, align 4, !tbaa !11
  %319 = tail call float @llvm.fmuladd.f32(float %314, float %316, float %318)
  %320 = getelementptr inbounds float, float addrspace(4)* %75, i64 6
  %321 = load float, float addrspace(4)* %320, align 4, !tbaa !11
  %322 = tail call float @llvm.fmuladd.f32(float %314, float %319, float %321)
  %323 = getelementptr inbounds float, float addrspace(4)* %75, i64 5
  %324 = load float, float addrspace(4)* %323, align 4, !tbaa !11
  %325 = tail call float @llvm.fmuladd.f32(float %314, float %322, float %324)
  %326 = getelementptr inbounds float, float addrspace(4)* %75, i64 4
  %327 = load float, float addrspace(4)* %326, align 4, !tbaa !11
  %328 = tail call float @llvm.fmuladd.f32(float %314, float %325, float %327)
  %329 = getelementptr inbounds float, float addrspace(4)* %75, i64 3
  %330 = load float, float addrspace(4)* %329, align 4, !tbaa !11
  %331 = tail call float @llvm.fmuladd.f32(float %314, float %328, float %330)
  %332 = getelementptr inbounds float, float addrspace(4)* %75, i64 2
  %333 = load float, float addrspace(4)* %332, align 4, !tbaa !11
  %334 = tail call float @llvm.fmuladd.f32(float %314, float %331, float %333)
  %335 = getelementptr inbounds float, float addrspace(4)* %75, i64 1
  %336 = load float, float addrspace(4)* %335, align 4, !tbaa !11
  %337 = tail call float @llvm.fmuladd.f32(float %314, float %334, float %336)
  %338 = load float, float addrspace(4)* %75, align 4, !tbaa !11
  %339 = tail call float @llvm.fmuladd.f32(float %314, float %337, float %338)
  %340 = fadd float %311, %339
  br label %497

341:                                              ; preds = %15
  %342 = fdiv float 1.000000e+00, %17, !fpmath !15
  %343 = fmul float %342, %342
  %344 = tail call float @llvm.fmuladd.f32(float %343, float 0xBFF5EC5E60000000, float 0x3FCAAFB080000000)
  %345 = tail call float @llvm.fmuladd.f32(float %343, float %344, float 0xBFB0AA9260000000)
  %346 = tail call float @llvm.fmuladd.f32(float %343, float %345, float 1.250000e-01)
  %347 = fmul float %342, %346
  %348 = tail call float @llvm.amdgcn.rsq.f32(float %17)
  %349 = fmul float %348, 0x3FE9884540000000
  %350 = tail call float @llvm.fmuladd.f32(float %343, float 0x3FB92AECC0000000, float 0xBFAFFE4720000000)
  %351 = tail call float @llvm.fmuladd.f32(float %343, float %350, float 1.000000e+00)
  %352 = fmul float %349, %351
  %353 = fcmp olt float %17, 1.310720e+05
  br i1 %353, label %354, label %361

354:                                              ; preds = %341
  %355 = fmul float %17, 0x3FE45F3060000000
  %356 = tail call float @llvm.rint.f32(float %355)
  %357 = tail call float @llvm.fma.f32(float %356, float 0xBFF921FB40000000, float %17)
  %358 = tail call float @llvm.fma.f32(float %356, float 0xBE74442D00000000, float %357)
  %359 = tail call float @llvm.fma.f32(float %356, float 0xBCF8469880000000, float %358)
  %360 = fptosi float %356 to i32
  br label %467

361:                                              ; preds = %341
  %362 = bitcast float %17 to i32
  %363 = lshr i32 %362, 23
  %364 = and i32 %362, 8388607
  %365 = or i32 %364, 8388608
  %366 = zext i32 %365 to i64
  %367 = mul nuw nsw i64 %366, 4266746795
  %368 = trunc i64 %367 to i32
  %369 = lshr i64 %367, 32
  %370 = mul nuw nsw i64 %366, 1011060801
  %371 = add nuw nsw i64 %369, %370
  %372 = trunc i64 %371 to i32
  %373 = lshr i64 %371, 32
  %374 = mul nuw nsw i64 %366, 3680671129
  %375 = add nuw nsw i64 %373, %374
  %376 = trunc i64 %375 to i32
  %377 = lshr i64 %375, 32
  %378 = mul nuw nsw i64 %366, 4113882560
  %379 = add nuw nsw i64 %377, %378
  %380 = trunc i64 %379 to i32
  %381 = lshr i64 %379, 32
  %382 = mul nuw nsw i64 %366, 4230436817
  %383 = add nuw nsw i64 %381, %382
  %384 = trunc i64 %383 to i32
  %385 = lshr i64 %383, 32
  %386 = mul nuw nsw i64 %366, 1313084713
  %387 = add nuw nsw i64 %385, %386
  %388 = trunc i64 %387 to i32
  %389 = lshr i64 %387, 32
  %390 = mul nuw nsw i64 %366, 2734261102
  %391 = add nuw nsw i64 %389, %390
  %392 = trunc i64 %391 to i32
  %393 = lshr i64 %391, 32
  %394 = trunc i64 %393 to i32
  %395 = add nsw i32 %363, -120
  %396 = icmp ugt i32 %395, 63
  %397 = select i1 %396, i32 %388, i32 %394
  %398 = select i1 %396, i32 %384, i32 %392
  %399 = select i1 %396, i32 %380, i32 %388
  %400 = select i1 %396, i32 %376, i32 %384
  %401 = select i1 %396, i32 %372, i32 %380
  %402 = select i1 %396, i32 %368, i32 %376
  %403 = select i1 %396, i32 -64, i32 0
  %404 = add nsw i32 %403, %395
  %405 = icmp ugt i32 %404, 31
  %406 = select i1 %405, i32 %398, i32 %397
  %407 = select i1 %405, i32 %399, i32 %398
  %408 = select i1 %405, i32 %400, i32 %399
  %409 = select i1 %405, i32 %401, i32 %400
  %410 = select i1 %405, i32 %402, i32 %401
  %411 = select i1 %405, i32 -32, i32 0
  %412 = add nsw i32 %411, %404
  %413 = icmp ugt i32 %412, 31
  %414 = select i1 %413, i32 %407, i32 %406
  %415 = select i1 %413, i32 %408, i32 %407
  %416 = select i1 %413, i32 %409, i32 %408
  %417 = select i1 %413, i32 %410, i32 %409
  %418 = select i1 %413, i32 -32, i32 0
  %419 = add nsw i32 %418, %412
  %420 = icmp eq i32 %419, 0
  %421 = sub nsw i32 32, %419
  %422 = tail call i32 @llvm.fshr.i32(i32 %414, i32 %415, i32 %421)
  %423 = tail call i32 @llvm.fshr.i32(i32 %415, i32 %416, i32 %421)
  %424 = tail call i32 @llvm.fshr.i32(i32 %416, i32 %417, i32 %421)
  %425 = select i1 %420, i32 %414, i32 %422
  %426 = select i1 %420, i32 %415, i32 %423
  %427 = select i1 %420, i32 %416, i32 %424
  %428 = lshr i32 %425, 29
  %429 = tail call i32 @llvm.fshl.i32(i32 %425, i32 %426, i32 2)
  %430 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %427, i32 2)
  %431 = tail call i32 @llvm.fshl.i32(i32 %427, i32 %417, i32 2)
  %432 = and i32 %428, 1
  %433 = sub nsw i32 0, %432
  %434 = shl i32 %428, 31
  %435 = xor i32 %429, %433
  %436 = xor i32 %430, %433
  %437 = xor i32 %431, %433
  %438 = tail call i32 @llvm.ctlz.i32(i32 %435, i1 false), !range !16
  %439 = sub nsw i32 31, %438
  %440 = tail call i32 @llvm.fshr.i32(i32 %435, i32 %436, i32 %439)
  %441 = tail call i32 @llvm.fshr.i32(i32 %436, i32 %437, i32 %439)
  %442 = shl nuw nsw i32 %438, 23
  %443 = sub nuw nsw i32 1056964608, %442
  %444 = lshr i32 %440, 9
  %445 = or i32 %444, %443
  %446 = or i32 %445, %434
  %447 = bitcast i32 %446 to float
  %448 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %441, i32 23)
  %449 = tail call i32 @llvm.ctlz.i32(i32 %448, i1 false), !range !16
  %450 = fmul float %447, 0x3FF921FB40000000
  %451 = add nuw nsw i32 %449, %438
  %452 = shl nuw nsw i32 %451, 23
  %453 = sub nuw nsw i32 855638016, %452
  %454 = sub nsw i32 31, %449
  %455 = tail call i32 @llvm.fshr.i32(i32 %448, i32 %441, i32 %454)
  %456 = lshr i32 %455, 9
  %457 = or i32 %453, %456
  %458 = or i32 %457, %434
  %459 = bitcast i32 %458 to float
  %460 = fneg float %450
  %461 = tail call float @llvm.fma.f32(float %447, float 0x3FF921FB40000000, float %460)
  %462 = tail call float @llvm.fma.f32(float %447, float 0x3E74442D00000000, float %461)
  %463 = tail call float @llvm.fma.f32(float %459, float 0x3FF921FB40000000, float %462)
  %464 = fadd float %450, %463
  %465 = lshr i32 %425, 30
  %466 = add nuw nsw i32 %432, %465
  br label %467

467:                                              ; preds = %361, %354
  %468 = phi float [ %359, %354 ], [ %464, %361 ]
  %469 = phi i32 [ %360, %354 ], [ %466, %361 ]
  %470 = and i32 %469, 3
  %471 = fcmp olt float %468, %347
  %472 = sext i1 %471 to i32
  %473 = add nsw i32 %470, %472
  %474 = fsub float %468, %347
  %475 = select i1 %471, float 0x3FE921FB60000000, float 0xBFE921FB60000000
  %476 = fadd float %474, %475
  %477 = fmul float %476, %476
  %478 = tail call float @llvm.fmuladd.f32(float %477, float 0xBF29833040000000, float 0x3F81103880000000)
  %479 = tail call float @llvm.fmuladd.f32(float %477, float %478, float 0xBFC55553A0000000)
  %480 = fmul float %477, %479
  %481 = tail call float @llvm.fmuladd.f32(float %476, float %480, float %476)
  %482 = tail call float @llvm.fmuladd.f32(float %477, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %483 = tail call float @llvm.fmuladd.f32(float %477, float %482, float 0x3FA5557EE0000000)
  %484 = tail call float @llvm.fmuladd.f32(float %477, float %483, float 0xBFE0000080000000)
  %485 = tail call float @llvm.fmuladd.f32(float %477, float %484, float 1.000000e+00)
  %486 = and i32 %473, 1
  %487 = icmp eq i32 %486, 0
  %488 = select i1 %487, float %481, float %485
  %489 = bitcast float %488 to i32
  %490 = shl i32 %473, 30
  %491 = and i32 %490, -2147483648
  %492 = xor i32 %491, %489
  %493 = bitcast i32 %492 to float
  %494 = fmul float %352, %493
  %495 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 512)
  %496 = select i1 %495, float 0.000000e+00, float %494
  br label %497

497:                                              ; preds = %310, %467
  %498 = phi float [ %340, %310 ], [ %496, %467 ]
  %499 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %498, float addrspace(1)* %499, align 4, !tbaa !7
  br label %500

500:                                              ; preds = %497, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rsq.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{float 2.500000e+00}
!16 = !{i32 0, i32 33}
