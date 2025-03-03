; ModuleID = '../data/hip_kernels/7801/71/main.cu'
source_filename = "../data/hip_kernels/7801/71/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M32_J1 = internal unnamed_addr addrspace(4) constant [72 x float] [float 0.000000e+00, float 5.000000e-01, float 0x3E33DE0600000000, float 0xBFB0000180000000, float 0x3EA5B4D700000000, float 0x3F655074C0000000, float 0x3ED31A9A00000000, float 0xBF0F0C7740000000, float 0x3EC7E36D80000000, float 0x3FE29EA3E0000000, float 0xBDC7CA19E0000000, float 0xBFCA411140000000, float 0x3F78D14440000000, float 0x3F8C440A40000000, float 0xBF3865F680000000, float 0xBF39DCCE40000000, float 0x3EE30E4EE0000000, float 0x3ED8EE7240000000, float 0.000000e+00, float 0xBFD9C6CF60000000, float 0x3FAAE8A3A0000000, float 0x3FAB589780000000, float 0xBF75375280000000, float 0xBF62496BA0000000, float 0x3F26E5D980000000, float 0x3F0786BC40000000, float 0xBECA3971C0000000, float 0xBFD626EE80000000, float 0xBE175C9380000000, float 0x3FC55F6BE0000000, float 0xBF83D22F80000000, float 0xBF88C772A0000000, float 0x3F45CC7980000000, float 0x3F37325140000000, float 0xBEF1EB9180000000, float 0xBED6D4DDC0000000, float 0.000000e+00, float 0x3FD33518C0000000, float 0xBF95E70DC0000000, float 0xBFA80C8200000000, float 0x3F69A4B0C0000000, float 0x3F613EFC60000000, float 0xBF2072A300000000, float 0xBF072AFE60000000, float 0x3EC3C96C00000000, float 0x3FD17DBF00000000, float 0x3E1547ECC0000000, float 0xBFC1404BE0000000, float 0x3F74F4D880000000, float 0x3F85C62300000000, float 0xBF3D6658C0000000, float 0xBF35689DE0000000, float 0x3EEB74E880000000, float 0x3ED5D54FC0000000, float 0.000000e+00, float 0xBFCFF65440000000, float 0x3F89223FE0000000, float 0x3FA4B0C0E0000000, float 0xBF5F919F20000000, float 0xBF5F4EAD00000000, float 0x3F16B0C580000000, float 0x3F05A23A00000000, float 0xBEBCB23DA0000000, float 0xBFCDDCEB40000000, float 0xBE1169AB80000000, float 0x3FBDA52100000000, float 0xBF6A9D9980000000, float 0xBF8331E400000000, float 0x3F33E3EAE0000000, float 0x3F3386F480000000, float 0xBEE418A9C0000000, float 0xBED4969A60000000], align 4
@__ocmltbl_M32_Y1 = internal unnamed_addr addrspace(4) constant [162 x float] [float 0xBFC9186620000000, float 0x3FABD39760000000, float 0xBF6835B980000000, float 0x3F12C7DC00000000, float 0xBEB0A780A0000000, float 0x3E432E5A40000000, float 0xBDCF0CE340000000, float 0x3D52A4DB00000000, float 0xBCD138F580000000, float 0xBFF78B26A0000000, float 0x4003FCC6C0000000, float 0xC012D290E0000000, float 0x4023F37A40000000, float 0xC0342BDB20000000, float 0x4044180B60000000, float 0xC0532B9980000000, float 0x405EC1C700000000, float 0xC05CF9D7E0000000, float 0xBFF3797260000000, float 0x3FFAB7E1E0000000, float 0xC0024846C0000000, float 0x40101BE9A0000000, float 0xC01A579C00000000, float 0x402515B300000000, float 0xC0306A4880000000, float 0x4036576E40000000, float 0xC032D598A0000000, float 0xBFF099FCC0000000, float 0x3FF3F0CA40000000, float 0xBFF3BFF640000000, float 0x3FFE632060000000, float 0xC005158360000000, float 0x400C07F420000000, float 0xC011DB4B20000000, float 0x40131E5640000000, float 0xC008054CA0000000, float 0xBFEACBF580000000, float 0x3FEDCA1700000000, float 0xBFE1BBCF20000000, float 0x3FE77A0D20000000, float 0xBFEB803640000000, float 0x3FED0F9CE0000000, float 0xBFECF446A0000000, float 0x3FE767D5E0000000, float 0xBFD5432780000000, float 0xBFE36E6B60000000, float 0x3FE79C5F20000000, float 0xBFCA0C16C0000000, float 0x3FCAE37220000000, float 0xBFCD8EB880000000, float 0x3FC8249700000000, float 0xBFC2B895C0000000, float 0x3FB8868240000000, float 0xBFA2B014A0000000, float 0xBFD9145D60000000, float 0x3FE4D465C0000000, float 0xBFB9A539C0000000, float 0x3FA5A02220000000, float 0xBFB2859EE0000000, float 0x3FA93F1AE0000000, float 0xBF9EA56860000000, float 0x3F90F78100000000, float 0xBF771F8600000000, float 0xBFC9482120000000, float 0x3FE3002980000000, float 0xBFB7608660000000, float 0xBF8C1C08C0000000, float 0xBF99CE26A0000000, float 0x3F9210EBE0000000, float 0xBF810C8B80000000, float 0x3F70CD08C0000000, float 0xBF575FAE60000000, float 0.000000e+00, float 0x3FE0AA4840000000, float 0xBFBE56F820000000, float 0xBFA0D2AF40000000, float 0xBF73A6DEC0000000, float 0x3F7E6708C0000000, float 0xBF65429040000000, float 0x3F5199FB20000000, float 0xBF40CBD4E0000000, float 0x3FADED04E0000000, float 0x3FDF7EB300000000, float 0xBFC0A92020000000, float 0xBFA17D0DA0000000, float 0xBF501611A0000000, float 0x3F7811AA80000000, float 0xBF5E679C00000000, float 0x3F43148880000000, float 0xBF23719880000000, float 0x3FCEC444C0000000, float 0x3FD754DA00000000, float 0xBFC5DBC720000000, float 0xBF9C453300000000, float 0x3F7F628220000000, float 0x3F667180C0000000, float 0xBF4B243F80000000, float 0x3F2208B6A0000000, float 0xBF000028A0000000, float 0x3FDAABB400000000, float 0xBDF1BFFF80000000, float 0xBFC8B45BA0000000, float 0x3F8E147240000000, float 0x3F88C5ADA0000000, float 0xBF41353A20000000, float 0xBF3BF71C80000000, float 0x3F0279AD20000000, float 0x3EAD70C9C0000000, float 0x3FD7843620000000, float 0xBFC75654A0000000, float 0xBFC368BC60000000, float 0x3FA31BFBE0000000, float 0x3F82CC3500000000, float 0xBF5AF253E0000000, float 0xBF32AD2B80000000, float 0x3F07AFBD00000000, float 0x3EC0A355E0000000, float 0.000000e+00, float 0xBFD5C7C560000000, float 0x3FA00B9F80000000, float 0x3FAA15D840000000, float 0xBF710A3200000000, float 0xBF61BDED20000000, float 0x3F23373980000000, float 0x3F08051460000000, float 0xBEC7B60500000000, float 0xBFD36732E0000000, float 0xBE17EECEC0000000, float 0x3FC3001C80000000, float 0xBF7BF598C0000000, float 0xBF8751E440000000, float 0x3F42372680000000, float 0x3F364D1280000000, float 0xBEEFA3D5A0000000, float 0xBED67C9A40000000, float 0.000000e+00, float 0x3FD15F9940000000, float 0xBF902B3940000000, float 0xBFA6395C80000000, float 0x3F63CED140000000, float 0x3F6079B740000000, float 0xBF1B4FB8A0000000, float 0xBF069150A0000000, float 0x3EC1295E40000000, float 0x3FD00EF380000000, float 0x3E12D41000000000, float 0xBFBFCDACC0000000, float 0x3F706CBD60000000, float 0x3F846416C0000000, float 0xBF37F8BAC0000000, float 0xBF34749720000000, float 0x3EE77C14E0000000, float 0x3ED52C8640000000, float 0.000000e+00, float 0xBFCDC14EA0000000, float 0x3F84429FE0000000, float 0x3FA367D660000000, float 0xBF59D6E940000000, float 0xBF5DC3A5E0000000, float 0x3F13151660000000, float 0x3F050F4060000000, float 0xBEB9B30800000000], align 4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_y1f(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %512

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fcmp ugt float %17, 1.256250e+01
  br i1 %18, label %352, label %19

19:                                               ; preds = %15
  %20 = fcmp olt float %17, 2.312500e+00
  br i1 %20, label %21, label %46

21:                                               ; preds = %19
  %22 = fcmp olt float %17, 1.218750e+00
  br i1 %22, label %23, label %35

23:                                               ; preds = %21
  %24 = fcmp olt float %17, 5.000000e-01
  br i1 %24, label %72, label %25

25:                                               ; preds = %23
  %26 = fcmp olt float %17, 6.250000e-01
  %27 = fcmp olt float %17, 7.500000e-01
  %28 = fcmp olt float %17, 9.375000e-01
  %29 = select i1 %28, float 7.500000e-01, float 9.375000e-01
  %30 = select i1 %28, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 27), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 36)
  %31 = select i1 %27, float 6.250000e-01, float %29
  %32 = select i1 %27, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 18), float addrspace(4)* %30
  %33 = select i1 %26, float 5.000000e-01, float %31
  %34 = select i1 %26, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 9), float addrspace(4)* %32
  br label %72

35:                                               ; preds = %21
  %36 = fcmp olt float %17, 1.531250e+00
  br i1 %36, label %72, label %37

37:                                               ; preds = %35
  %38 = fcmp olt float %17, 1.843750e+00
  %39 = fcmp olt float %17, 0x4000A00000000000
  %40 = select i1 %39, float 1.843750e+00, float 0x400193BEE0000000
  %41 = select i1 %39, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 63), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 72)
  %42 = or i1 %38, %39
  %43 = select i1 %42, float 0.000000e+00, float 0xBE76401B80000000
  %44 = select i1 %38, float 1.531250e+00, float %40
  %45 = select i1 %38, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 54), float addrspace(4)* %41
  br label %72

46:                                               ; preds = %19
  %47 = fcmp olt float %17, 6.187500e+00
  br i1 %47, label %48, label %61

48:                                               ; preds = %46
  %49 = fcmp olt float %17, 0x4005E00000000000
  br i1 %49, label %72, label %50

50:                                               ; preds = %48
  %51 = fcmp olt float %17, 3.156250e+00
  br i1 %51, label %72, label %52

52:                                               ; preds = %50
  %53 = fcmp olt float %17, 0x4010D00000000000
  %54 = fcmp olt float %17, 4.687500e+00
  %55 = select i1 %54, float 0.000000e+00, float 0x3E8D0F6060000000
  %56 = select i1 %54, float 0x4010D00000000000, float 0x4015B7FE40000000
  %57 = select i1 %54, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 108), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 117)
  %58 = select i1 %53, float 0x3E7FF742E0000000, float %55
  %59 = select i1 %53, float 0x400D76D4A0000000, float %56
  %60 = select i1 %53, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 99), float addrspace(4)* %57
  br label %72

61:                                               ; preds = %46
  %62 = fcmp olt float %17, 0x401F140000000000
  br i1 %62, label %72, label %63

63:                                               ; preds = %61
  %64 = fcmp olt float %17, 0x4022B80000000000
  %65 = fcmp olt float %17, 1.093750e+01
  %66 = select i1 %65, float 0x3E847A3200000000, float 0xBE8CAF37E0000000
  %67 = select i1 %65, float 0x40243F2EE0000000, float 0x40277F9140000000
  %68 = select i1 %65, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 144), float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 153)
  %69 = select i1 %64, float 0x3E9CC2D360000000, float %66
  %70 = select i1 %64, float 0x40213127A0000000, float %67
  %71 = select i1 %64, float addrspace(4)* getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 135), float addrspace(4)* %68
  br label %72

72:                                               ; preds = %63, %61, %52, %50, %48, %37, %35, %25, %23
  %73 = phi float [ 0.000000e+00, %23 ], [ 0.000000e+00, %35 ], [ 0.000000e+00, %48 ], [ 0.000000e+00, %50 ], [ 0xBE8F4EF560000000, %61 ], [ %43, %37 ], [ %58, %52 ], [ %69, %63 ], [ 0.000000e+00, %25 ]
  %74 = phi float [ 0.000000e+00, %23 ], [ 1.218750e+00, %35 ], [ 2.312500e+00, %48 ], [ 0x4005E00000000000, %50 ], [ 0x401BC418A0000000, %61 ], [ %44, %37 ], [ %59, %52 ], [ %70, %63 ], [ %33, %25 ]
  %75 = phi float addrspace(4)* [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 0), %23 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 45), %35 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 81), %48 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 90), %50 ], [ getelementptr inbounds ([162 x float], [162 x float] addrspace(4)* @__ocmltbl_M32_Y1, i64 0, i64 126), %61 ], [ %45, %37 ], [ %60, %52 ], [ %71, %63 ], [ %34, %25 ]
  %76 = fmul float %17, %17
  %77 = fsub float %17, %74
  %78 = fsub float %77, %73
  %79 = fcmp olt float %17, 5.000000e-01
  %80 = select i1 %79, float %76, float %78
  %81 = getelementptr inbounds float, float addrspace(4)* %75, i64 8
  %82 = load float, float addrspace(4)* %81, align 4, !tbaa !11
  %83 = getelementptr inbounds float, float addrspace(4)* %75, i64 7
  %84 = load float, float addrspace(4)* %83, align 4, !tbaa !11
  %85 = tail call float @llvm.fmuladd.f32(float %80, float %82, float %84)
  %86 = getelementptr inbounds float, float addrspace(4)* %75, i64 6
  %87 = load float, float addrspace(4)* %86, align 4, !tbaa !11
  %88 = tail call float @llvm.fmuladd.f32(float %80, float %85, float %87)
  %89 = getelementptr inbounds float, float addrspace(4)* %75, i64 5
  %90 = load float, float addrspace(4)* %89, align 4, !tbaa !11
  %91 = tail call float @llvm.fmuladd.f32(float %80, float %88, float %90)
  %92 = getelementptr inbounds float, float addrspace(4)* %75, i64 4
  %93 = load float, float addrspace(4)* %92, align 4, !tbaa !11
  %94 = tail call float @llvm.fmuladd.f32(float %80, float %91, float %93)
  %95 = getelementptr inbounds float, float addrspace(4)* %75, i64 3
  %96 = load float, float addrspace(4)* %95, align 4, !tbaa !11
  %97 = tail call float @llvm.fmuladd.f32(float %80, float %94, float %96)
  %98 = getelementptr inbounds float, float addrspace(4)* %75, i64 2
  %99 = load float, float addrspace(4)* %98, align 4, !tbaa !11
  %100 = tail call float @llvm.fmuladd.f32(float %80, float %97, float %99)
  %101 = getelementptr inbounds float, float addrspace(4)* %75, i64 1
  %102 = load float, float addrspace(4)* %101, align 4, !tbaa !11
  %103 = tail call float @llvm.fmuladd.f32(float %80, float %100, float %102)
  %104 = load float, float addrspace(4)* %75, align 4, !tbaa !11
  %105 = tail call float @llvm.fmuladd.f32(float %80, float %103, float %104)
  br i1 %79, label %106, label %509

106:                                              ; preds = %72
  %107 = fcmp olt float %17, 0x3EB0000000000000
  %108 = tail call float @llvm.fabs.f32(float %17)
  br i1 %107, label %109, label %111

109:                                              ; preds = %106
  %110 = fdiv float 0xBFE45F3060000000, %108, !fpmath !15
  br label %348

111:                                              ; preds = %106
  %112 = fcmp ugt float %108, 0x4029080000000000
  br i1 %112, label %168, label %113

113:                                              ; preds = %111
  %114 = fcmp ugt float %108, 0x4018B00000000000
  br i1 %114, label %126, label %115

115:                                              ; preds = %113
  %116 = fcmp ugt float %108, 1.093750e+00
  br i1 %116, label %117, label %137

117:                                              ; preds = %115
  %118 = fcmp ugt float %108, 2.843750e+00
  %119 = fcmp ugt float %108, 0x4012500000000000
  %120 = select i1 %119, float 0xBE6FE6DCC0000000, float 0xBE74A121E0000000
  %121 = select i1 %119, float 0x40155365C0000000, float 0x400EA75580000000
  %122 = select i1 %119, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 27), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 18)
  %123 = select i1 %118, float %120, float 0xBDF375C600000000
  %124 = select i1 %118, float %121, float 0x3FFD757D20000000
  %125 = select i1 %118, float addrspace(4)* %122, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 9)
  br label %137

126:                                              ; preds = %113
  %127 = fcmp ugt float %108, 7.781250e+00
  br i1 %127, label %128, label %137

128:                                              ; preds = %126
  %129 = fcmp ugt float %108, 0x4022B80000000000
  %130 = fcmp ugt float %108, 0x4025E80000000000
  %131 = select i1 %130, float 0xBE8A046940000000, float 0xBE9E8407A0000000
  %132 = select i1 %130, float 0x4027697980000000, float 0x402458D0E0000000
  %133 = select i1 %130, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 63), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 54)
  %134 = select i1 %129, float %131, float 0x3E9E171140000000
  %135 = select i1 %129, float %132, float 0x4021129800000000
  %136 = select i1 %129, float addrspace(4)* %133, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 45)
  br label %137

137:                                              ; preds = %128, %126, %117, %115
  %138 = phi float [ 0.000000e+00, %115 ], [ 0xBE88971B60000000, %126 ], [ %123, %117 ], [ %134, %128 ]
  %139 = phi float [ 0.000000e+00, %115 ], [ 0x401C0FF600000000, %126 ], [ %124, %117 ], [ %135, %128 ]
  %140 = phi float addrspace(4)* [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 0), %115 ], [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 36), %126 ], [ %125, %117 ], [ %136, %128 ]
  %141 = fsub float %108, %139
  %142 = fsub float %141, %138
  %143 = getelementptr inbounds float, float addrspace(4)* %140, i64 8
  %144 = load float, float addrspace(4)* %143, align 4, !tbaa !11
  %145 = getelementptr inbounds float, float addrspace(4)* %140, i64 7
  %146 = load float, float addrspace(4)* %145, align 4, !tbaa !11
  %147 = tail call float @llvm.fmuladd.f32(float %142, float %144, float %146)
  %148 = getelementptr inbounds float, float addrspace(4)* %140, i64 6
  %149 = load float, float addrspace(4)* %148, align 4, !tbaa !11
  %150 = tail call float @llvm.fmuladd.f32(float %142, float %147, float %149)
  %151 = getelementptr inbounds float, float addrspace(4)* %140, i64 5
  %152 = load float, float addrspace(4)* %151, align 4, !tbaa !11
  %153 = tail call float @llvm.fmuladd.f32(float %142, float %150, float %152)
  %154 = getelementptr inbounds float, float addrspace(4)* %140, i64 4
  %155 = load float, float addrspace(4)* %154, align 4, !tbaa !11
  %156 = tail call float @llvm.fmuladd.f32(float %142, float %153, float %155)
  %157 = getelementptr inbounds float, float addrspace(4)* %140, i64 3
  %158 = load float, float addrspace(4)* %157, align 4, !tbaa !11
  %159 = tail call float @llvm.fmuladd.f32(float %142, float %156, float %158)
  %160 = getelementptr inbounds float, float addrspace(4)* %140, i64 2
  %161 = load float, float addrspace(4)* %160, align 4, !tbaa !11
  %162 = tail call float @llvm.fmuladd.f32(float %142, float %159, float %161)
  %163 = getelementptr inbounds float, float addrspace(4)* %140, i64 1
  %164 = load float, float addrspace(4)* %163, align 4, !tbaa !11
  %165 = tail call float @llvm.fmuladd.f32(float %142, float %162, float %164)
  %166 = load float, float addrspace(4)* %140, align 4, !tbaa !11
  %167 = tail call float @llvm.fmuladd.f32(float %142, float %165, float %166)
  br label %326

168:                                              ; preds = %111
  %169 = fdiv float 1.000000e+00, %108, !fpmath !15
  %170 = fmul float %169, %169
  %171 = tail call float @llvm.fmuladd.f32(float %170, float 0x4000214CE0000000, float 0xBFD7A54CA0000000)
  %172 = tail call float @llvm.fmuladd.f32(float %170, float %171, float 0x3FC4FFEFE0000000)
  %173 = tail call float @llvm.fmuladd.f32(float %170, float %172, float -3.750000e-01)
  %174 = fmul float %169, %173
  %175 = tail call float @llvm.amdgcn.rsq.f32(float %108)
  %176 = fmul float %175, 0x3FE9884540000000
  %177 = tail call float @llvm.fmuladd.f32(float %170, float 0xBFC7C0D460000000, float 0x3FC7FF5AA0000000)
  %178 = tail call float @llvm.fmuladd.f32(float %170, float %177, float 1.000000e+00)
  %179 = fmul float %176, %178
  %180 = fcmp olt float %108, 1.310720e+05
  br i1 %180, label %181, label %188

181:                                              ; preds = %168
  %182 = fmul float %108, 0x3FE45F3060000000
  %183 = tail call float @llvm.rint.f32(float %182)
  %184 = tail call float @llvm.fma.f32(float %183, float 0xBFF921FB40000000, float %108)
  %185 = tail call float @llvm.fma.f32(float %183, float 0xBE74442D00000000, float %184)
  %186 = tail call float @llvm.fma.f32(float %183, float 0xBCF8469880000000, float %185)
  %187 = fptosi float %183 to i32
  br label %294

188:                                              ; preds = %168
  %189 = bitcast float %108 to i32
  %190 = lshr i32 %189, 23
  %191 = and i32 %189, 8388607
  %192 = or i32 %191, 8388608
  %193 = zext i32 %192 to i64
  %194 = mul nuw nsw i64 %193, 4266746795
  %195 = trunc i64 %194 to i32
  %196 = lshr i64 %194, 32
  %197 = mul nuw nsw i64 %193, 1011060801
  %198 = add nuw nsw i64 %196, %197
  %199 = trunc i64 %198 to i32
  %200 = lshr i64 %198, 32
  %201 = mul nuw nsw i64 %193, 3680671129
  %202 = add nuw nsw i64 %200, %201
  %203 = trunc i64 %202 to i32
  %204 = lshr i64 %202, 32
  %205 = mul nuw nsw i64 %193, 4113882560
  %206 = add nuw nsw i64 %204, %205
  %207 = trunc i64 %206 to i32
  %208 = lshr i64 %206, 32
  %209 = mul nuw nsw i64 %193, 4230436817
  %210 = add nuw nsw i64 %208, %209
  %211 = trunc i64 %210 to i32
  %212 = lshr i64 %210, 32
  %213 = mul nuw nsw i64 %193, 1313084713
  %214 = add nuw nsw i64 %212, %213
  %215 = trunc i64 %214 to i32
  %216 = lshr i64 %214, 32
  %217 = mul nuw nsw i64 %193, 2734261102
  %218 = add nuw nsw i64 %216, %217
  %219 = trunc i64 %218 to i32
  %220 = lshr i64 %218, 32
  %221 = trunc i64 %220 to i32
  %222 = add nsw i32 %190, -120
  %223 = icmp ugt i32 %222, 63
  %224 = select i1 %223, i32 %215, i32 %221
  %225 = select i1 %223, i32 %211, i32 %219
  %226 = select i1 %223, i32 %207, i32 %215
  %227 = select i1 %223, i32 %203, i32 %211
  %228 = select i1 %223, i32 %199, i32 %207
  %229 = select i1 %223, i32 %195, i32 %203
  %230 = select i1 %223, i32 -64, i32 0
  %231 = add nsw i32 %230, %222
  %232 = icmp ugt i32 %231, 31
  %233 = select i1 %232, i32 %225, i32 %224
  %234 = select i1 %232, i32 %226, i32 %225
  %235 = select i1 %232, i32 %227, i32 %226
  %236 = select i1 %232, i32 %228, i32 %227
  %237 = select i1 %232, i32 %229, i32 %228
  %238 = select i1 %232, i32 -32, i32 0
  %239 = add nsw i32 %238, %231
  %240 = icmp ugt i32 %239, 31
  %241 = select i1 %240, i32 %234, i32 %233
  %242 = select i1 %240, i32 %235, i32 %234
  %243 = select i1 %240, i32 %236, i32 %235
  %244 = select i1 %240, i32 %237, i32 %236
  %245 = select i1 %240, i32 -32, i32 0
  %246 = add nsw i32 %245, %239
  %247 = icmp eq i32 %246, 0
  %248 = sub nsw i32 32, %246
  %249 = tail call i32 @llvm.fshr.i32(i32 %241, i32 %242, i32 %248)
  %250 = tail call i32 @llvm.fshr.i32(i32 %242, i32 %243, i32 %248)
  %251 = tail call i32 @llvm.fshr.i32(i32 %243, i32 %244, i32 %248)
  %252 = select i1 %247, i32 %241, i32 %249
  %253 = select i1 %247, i32 %242, i32 %250
  %254 = select i1 %247, i32 %243, i32 %251
  %255 = lshr i32 %252, 29
  %256 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %253, i32 2)
  %257 = tail call i32 @llvm.fshl.i32(i32 %253, i32 %254, i32 2)
  %258 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %244, i32 2)
  %259 = and i32 %255, 1
  %260 = sub nsw i32 0, %259
  %261 = shl i32 %255, 31
  %262 = xor i32 %256, %260
  %263 = xor i32 %257, %260
  %264 = xor i32 %258, %260
  %265 = tail call i32 @llvm.ctlz.i32(i32 %262, i1 false), !range !16
  %266 = sub nsw i32 31, %265
  %267 = tail call i32 @llvm.fshr.i32(i32 %262, i32 %263, i32 %266)
  %268 = tail call i32 @llvm.fshr.i32(i32 %263, i32 %264, i32 %266)
  %269 = shl nuw nsw i32 %265, 23
  %270 = sub nuw nsw i32 1056964608, %269
  %271 = lshr i32 %267, 9
  %272 = or i32 %271, %270
  %273 = or i32 %272, %261
  %274 = bitcast i32 %273 to float
  %275 = tail call i32 @llvm.fshl.i32(i32 %267, i32 %268, i32 23)
  %276 = tail call i32 @llvm.ctlz.i32(i32 %275, i1 false), !range !16
  %277 = fmul float %274, 0x3FF921FB40000000
  %278 = add nuw nsw i32 %276, %265
  %279 = shl nuw nsw i32 %278, 23
  %280 = sub nuw nsw i32 855638016, %279
  %281 = sub nsw i32 31, %276
  %282 = tail call i32 @llvm.fshr.i32(i32 %275, i32 %268, i32 %281)
  %283 = lshr i32 %282, 9
  %284 = or i32 %280, %283
  %285 = or i32 %284, %261
  %286 = bitcast i32 %285 to float
  %287 = fneg float %277
  %288 = tail call float @llvm.fma.f32(float %274, float 0x3FF921FB40000000, float %287)
  %289 = tail call float @llvm.fma.f32(float %274, float 0x3E74442D00000000, float %288)
  %290 = tail call float @llvm.fma.f32(float %286, float 0x3FF921FB40000000, float %289)
  %291 = fadd float %277, %290
  %292 = lshr i32 %252, 30
  %293 = add nuw nsw i32 %259, %292
  br label %294

294:                                              ; preds = %188, %181
  %295 = phi float [ %186, %181 ], [ %291, %188 ]
  %296 = phi i32 [ %187, %181 ], [ %293, %188 ]
  %297 = and i32 %296, 3
  %298 = fcmp olt float %295, %174
  %299 = sext i1 %298 to i32
  %300 = add nsw i32 %297, -1
  %301 = add nsw i32 %300, %299
  %302 = fsub float %295, %174
  %303 = select i1 %298, float 0x3FE921FB60000000, float 0xBFE921FB60000000
  %304 = fadd float %302, %303
  %305 = fmul float %304, %304
  %306 = tail call float @llvm.fmuladd.f32(float %305, float 0xBF29833040000000, float 0x3F81103880000000)
  %307 = tail call float @llvm.fmuladd.f32(float %305, float %306, float 0xBFC55553A0000000)
  %308 = fmul float %305, %307
  %309 = tail call float @llvm.fmuladd.f32(float %304, float %308, float %304)
  %310 = tail call float @llvm.fmuladd.f32(float %305, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %311 = tail call float @llvm.fmuladd.f32(float %305, float %310, float 0x3FA5557EE0000000)
  %312 = tail call float @llvm.fmuladd.f32(float %305, float %311, float 0xBFE0000080000000)
  %313 = tail call float @llvm.fmuladd.f32(float %305, float %312, float 1.000000e+00)
  %314 = fneg float %309
  %315 = and i32 %301, 1
  %316 = icmp eq i32 %315, 0
  %317 = select i1 %316, float %313, float %314
  %318 = bitcast float %317 to i32
  %319 = shl i32 %301, 30
  %320 = and i32 %319, -2147483648
  %321 = xor i32 %320, %318
  %322 = bitcast i32 %321 to float
  %323 = fmul float %179, %322
  %324 = tail call i1 @llvm.amdgcn.class.f32(float %108, i32 512)
  %325 = select i1 %324, float 0.000000e+00, float %323
  br label %326

326:                                              ; preds = %294, %137
  %327 = phi float [ %167, %137 ], [ %325, %294 ]
  %328 = fcmp olt float %17, 0.000000e+00
  %329 = fneg float %327
  %330 = select i1 %328, float %329, float %327
  %331 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 144)
  %332 = select i1 %331, float 0x41F0000000000000, float 1.000000e+00
  %333 = fmul float %17, %332
  %334 = tail call float @llvm.log2.f32(float %333)
  %335 = fmul float %334, 0x3FE62E42E0000000
  %336 = tail call i1 @llvm.amdgcn.class.f32(float %334, i32 519)
  %337 = fneg float %335
  %338 = tail call float @llvm.fma.f32(float %334, float 0x3FE62E42E0000000, float %337)
  %339 = tail call float @llvm.fma.f32(float %334, float 0x3E6EFA39E0000000, float %338)
  %340 = fadd float %335, %339
  %341 = select i1 %336, float %334, float %340
  %342 = select i1 %331, float 0x40362E4300000000, float 0.000000e+00
  %343 = fsub float %341, %342
  %344 = fdiv float -1.000000e+00, %17
  %345 = tail call float @llvm.fmuladd.f32(float %330, float %343, float %344)
  %346 = fmul float %345, 0x3FE45F3060000000
  %347 = tail call float @llvm.fmuladd.f32(float %105, float %17, float %346)
  br label %348

348:                                              ; preds = %326, %109
  %349 = phi float [ %110, %109 ], [ %347, %326 ]
  %350 = fcmp olt float %17, 0.000000e+00
  %351 = select i1 %350, float 0x7FF8000000000000, float %349
  br label %509

352:                                              ; preds = %15
  %353 = fdiv float 1.000000e+00, %17, !fpmath !15
  %354 = fmul float %353, %353
  %355 = tail call float @llvm.fmuladd.f32(float %354, float 0x4000214CE0000000, float 0xBFD7A54CA0000000)
  %356 = tail call float @llvm.fmuladd.f32(float %354, float %355, float 0x3FC4FFEFE0000000)
  %357 = tail call float @llvm.fmuladd.f32(float %354, float %356, float -3.750000e-01)
  %358 = fmul float %353, %357
  %359 = tail call float @llvm.amdgcn.rsq.f32(float %17)
  %360 = fmul float %359, 0x3FE9884540000000
  %361 = tail call float @llvm.fmuladd.f32(float %354, float 0xBFC7C0D460000000, float 0x3FC7FF5AA0000000)
  %362 = tail call float @llvm.fmuladd.f32(float %354, float %361, float 1.000000e+00)
  %363 = fmul float %360, %362
  %364 = fcmp olt float %17, 1.310720e+05
  br i1 %364, label %365, label %372

365:                                              ; preds = %352
  %366 = fmul float %17, 0x3FE45F3060000000
  %367 = tail call float @llvm.rint.f32(float %366)
  %368 = tail call float @llvm.fma.f32(float %367, float 0xBFF921FB40000000, float %17)
  %369 = tail call float @llvm.fma.f32(float %367, float 0xBE74442D00000000, float %368)
  %370 = tail call float @llvm.fma.f32(float %367, float 0xBCF8469880000000, float %369)
  %371 = fptosi float %367 to i32
  br label %478

372:                                              ; preds = %352
  %373 = bitcast float %17 to i32
  %374 = lshr i32 %373, 23
  %375 = and i32 %373, 8388607
  %376 = or i32 %375, 8388608
  %377 = zext i32 %376 to i64
  %378 = mul nuw nsw i64 %377, 4266746795
  %379 = trunc i64 %378 to i32
  %380 = lshr i64 %378, 32
  %381 = mul nuw nsw i64 %377, 1011060801
  %382 = add nuw nsw i64 %380, %381
  %383 = trunc i64 %382 to i32
  %384 = lshr i64 %382, 32
  %385 = mul nuw nsw i64 %377, 3680671129
  %386 = add nuw nsw i64 %384, %385
  %387 = trunc i64 %386 to i32
  %388 = lshr i64 %386, 32
  %389 = mul nuw nsw i64 %377, 4113882560
  %390 = add nuw nsw i64 %388, %389
  %391 = trunc i64 %390 to i32
  %392 = lshr i64 %390, 32
  %393 = mul nuw nsw i64 %377, 4230436817
  %394 = add nuw nsw i64 %392, %393
  %395 = trunc i64 %394 to i32
  %396 = lshr i64 %394, 32
  %397 = mul nuw nsw i64 %377, 1313084713
  %398 = add nuw nsw i64 %396, %397
  %399 = trunc i64 %398 to i32
  %400 = lshr i64 %398, 32
  %401 = mul nuw nsw i64 %377, 2734261102
  %402 = add nuw nsw i64 %400, %401
  %403 = trunc i64 %402 to i32
  %404 = lshr i64 %402, 32
  %405 = trunc i64 %404 to i32
  %406 = add nsw i32 %374, -120
  %407 = icmp ugt i32 %406, 63
  %408 = select i1 %407, i32 %399, i32 %405
  %409 = select i1 %407, i32 %395, i32 %403
  %410 = select i1 %407, i32 %391, i32 %399
  %411 = select i1 %407, i32 %387, i32 %395
  %412 = select i1 %407, i32 %383, i32 %391
  %413 = select i1 %407, i32 %379, i32 %387
  %414 = select i1 %407, i32 -64, i32 0
  %415 = add nsw i32 %414, %406
  %416 = icmp ugt i32 %415, 31
  %417 = select i1 %416, i32 %409, i32 %408
  %418 = select i1 %416, i32 %410, i32 %409
  %419 = select i1 %416, i32 %411, i32 %410
  %420 = select i1 %416, i32 %412, i32 %411
  %421 = select i1 %416, i32 %413, i32 %412
  %422 = select i1 %416, i32 -32, i32 0
  %423 = add nsw i32 %422, %415
  %424 = icmp ugt i32 %423, 31
  %425 = select i1 %424, i32 %418, i32 %417
  %426 = select i1 %424, i32 %419, i32 %418
  %427 = select i1 %424, i32 %420, i32 %419
  %428 = select i1 %424, i32 %421, i32 %420
  %429 = select i1 %424, i32 -32, i32 0
  %430 = add nsw i32 %429, %423
  %431 = icmp eq i32 %430, 0
  %432 = sub nsw i32 32, %430
  %433 = tail call i32 @llvm.fshr.i32(i32 %425, i32 %426, i32 %432)
  %434 = tail call i32 @llvm.fshr.i32(i32 %426, i32 %427, i32 %432)
  %435 = tail call i32 @llvm.fshr.i32(i32 %427, i32 %428, i32 %432)
  %436 = select i1 %431, i32 %425, i32 %433
  %437 = select i1 %431, i32 %426, i32 %434
  %438 = select i1 %431, i32 %427, i32 %435
  %439 = lshr i32 %436, 29
  %440 = tail call i32 @llvm.fshl.i32(i32 %436, i32 %437, i32 2)
  %441 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %438, i32 2)
  %442 = tail call i32 @llvm.fshl.i32(i32 %438, i32 %428, i32 2)
  %443 = and i32 %439, 1
  %444 = sub nsw i32 0, %443
  %445 = shl i32 %439, 31
  %446 = xor i32 %440, %444
  %447 = xor i32 %441, %444
  %448 = xor i32 %442, %444
  %449 = tail call i32 @llvm.ctlz.i32(i32 %446, i1 false), !range !16
  %450 = sub nsw i32 31, %449
  %451 = tail call i32 @llvm.fshr.i32(i32 %446, i32 %447, i32 %450)
  %452 = tail call i32 @llvm.fshr.i32(i32 %447, i32 %448, i32 %450)
  %453 = shl nuw nsw i32 %449, 23
  %454 = sub nuw nsw i32 1056964608, %453
  %455 = lshr i32 %451, 9
  %456 = or i32 %455, %454
  %457 = or i32 %456, %445
  %458 = bitcast i32 %457 to float
  %459 = tail call i32 @llvm.fshl.i32(i32 %451, i32 %452, i32 23)
  %460 = tail call i32 @llvm.ctlz.i32(i32 %459, i1 false), !range !16
  %461 = fmul float %458, 0x3FF921FB40000000
  %462 = add nuw nsw i32 %460, %449
  %463 = shl nuw nsw i32 %462, 23
  %464 = sub nuw nsw i32 855638016, %463
  %465 = sub nsw i32 31, %460
  %466 = tail call i32 @llvm.fshr.i32(i32 %459, i32 %452, i32 %465)
  %467 = lshr i32 %466, 9
  %468 = or i32 %464, %467
  %469 = or i32 %468, %445
  %470 = bitcast i32 %469 to float
  %471 = fneg float %461
  %472 = tail call float @llvm.fma.f32(float %458, float 0x3FF921FB40000000, float %471)
  %473 = tail call float @llvm.fma.f32(float %458, float 0x3E74442D00000000, float %472)
  %474 = tail call float @llvm.fma.f32(float %470, float 0x3FF921FB40000000, float %473)
  %475 = fadd float %461, %474
  %476 = lshr i32 %436, 30
  %477 = add nuw nsw i32 %443, %476
  br label %478

478:                                              ; preds = %372, %365
  %479 = phi float [ %370, %365 ], [ %475, %372 ]
  %480 = phi i32 [ %371, %365 ], [ %477, %372 ]
  %481 = and i32 %480, 3
  %482 = fcmp olt float %479, %358
  %483 = sext i1 %482 to i32
  %484 = add nsw i32 %481, -1
  %485 = add nsw i32 %484, %483
  %486 = fsub float %479, %358
  %487 = select i1 %482, float 0x3FE921FB60000000, float 0xBFE921FB60000000
  %488 = fadd float %486, %487
  %489 = fmul float %488, %488
  %490 = tail call float @llvm.fmuladd.f32(float %489, float 0xBF29833040000000, float 0x3F81103880000000)
  %491 = tail call float @llvm.fmuladd.f32(float %489, float %490, float 0xBFC55553A0000000)
  %492 = fmul float %489, %491
  %493 = tail call float @llvm.fmuladd.f32(float %488, float %492, float %488)
  %494 = tail call float @llvm.fmuladd.f32(float %489, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %495 = tail call float @llvm.fmuladd.f32(float %489, float %494, float 0x3FA5557EE0000000)
  %496 = tail call float @llvm.fmuladd.f32(float %489, float %495, float 0xBFE0000080000000)
  %497 = tail call float @llvm.fmuladd.f32(float %489, float %496, float 1.000000e+00)
  %498 = and i32 %485, 1
  %499 = icmp eq i32 %498, 0
  %500 = select i1 %499, float %493, float %497
  %501 = bitcast float %500 to i32
  %502 = shl i32 %485, 30
  %503 = and i32 %502, -2147483648
  %504 = xor i32 %503, %501
  %505 = bitcast i32 %504 to float
  %506 = fmul float %363, %505
  %507 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 512)
  %508 = select i1 %507, float 0.000000e+00, float %506
  br label %509

509:                                              ; preds = %72, %348, %478
  %510 = phi float [ %508, %478 ], [ %351, %348 ], [ %105, %72 ]
  %511 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %510, float addrspace(1)* %511, align 4, !tbaa !7
  br label %512

512:                                              ; preds = %509, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rsq.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
