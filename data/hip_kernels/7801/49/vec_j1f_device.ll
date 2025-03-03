; ModuleID = '../data/hip_kernels/7801/49/main.cu'
source_filename = "../data/hip_kernels/7801/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@__ocmltbl_M32_J1 = internal unnamed_addr addrspace(4) constant [72 x float] [float 0.000000e+00, float 5.000000e-01, float 0x3E33DE0600000000, float 0xBFB0000180000000, float 0x3EA5B4D700000000, float 0x3F655074C0000000, float 0x3ED31A9A00000000, float 0xBF0F0C7740000000, float 0x3EC7E36D80000000, float 0x3FE29EA3E0000000, float 0xBDC7CA19E0000000, float 0xBFCA411140000000, float 0x3F78D14440000000, float 0x3F8C440A40000000, float 0xBF3865F680000000, float 0xBF39DCCE40000000, float 0x3EE30E4EE0000000, float 0x3ED8EE7240000000, float 0.000000e+00, float 0xBFD9C6CF60000000, float 0x3FAAE8A3A0000000, float 0x3FAB589780000000, float 0xBF75375280000000, float 0xBF62496BA0000000, float 0x3F26E5D980000000, float 0x3F0786BC40000000, float 0xBECA3971C0000000, float 0xBFD626EE80000000, float 0xBE175C9380000000, float 0x3FC55F6BE0000000, float 0xBF83D22F80000000, float 0xBF88C772A0000000, float 0x3F45CC7980000000, float 0x3F37325140000000, float 0xBEF1EB9180000000, float 0xBED6D4DDC0000000, float 0.000000e+00, float 0x3FD33518C0000000, float 0xBF95E70DC0000000, float 0xBFA80C8200000000, float 0x3F69A4B0C0000000, float 0x3F613EFC60000000, float 0xBF2072A300000000, float 0xBF072AFE60000000, float 0x3EC3C96C00000000, float 0x3FD17DBF00000000, float 0x3E1547ECC0000000, float 0xBFC1404BE0000000, float 0x3F74F4D880000000, float 0x3F85C62300000000, float 0xBF3D6658C0000000, float 0xBF35689DE0000000, float 0x3EEB74E880000000, float 0x3ED5D54FC0000000, float 0.000000e+00, float 0xBFCFF65440000000, float 0x3F89223FE0000000, float 0x3FA4B0C0E0000000, float 0xBF5F919F20000000, float 0xBF5F4EAD00000000, float 0x3F16B0C580000000, float 0x3F05A23A00000000, float 0xBEBCB23DA0000000, float 0xBFCDDCEB40000000, float 0xBE1169AB80000000, float 0x3FBDA52100000000, float 0xBF6A9D9980000000, float 0xBF8331E400000000, float 0x3F33E3EAE0000000, float 0x3F3386F480000000, float 0xBEE418A9C0000000, float 0xBED4969A60000000], align 4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_j1f(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %239

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp ugt float %18, 0x4029080000000000
  br i1 %19, label %75, label %20

20:                                               ; preds = %15
  %21 = fcmp ugt float %18, 0x4018B00000000000
  br i1 %21, label %33, label %22

22:                                               ; preds = %20
  %23 = fcmp ugt float %18, 1.093750e+00
  br i1 %23, label %24, label %44

24:                                               ; preds = %22
  %25 = fcmp ugt float %18, 2.843750e+00
  %26 = fcmp ugt float %18, 0x4012500000000000
  %27 = select i1 %26, float 0xBE6FE6DCC0000000, float 0xBE74A121E0000000
  %28 = select i1 %26, float 0x40155365C0000000, float 0x400EA75580000000
  %29 = select i1 %26, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 27), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 18)
  %30 = select i1 %25, float %27, float 0xBDF375C600000000
  %31 = select i1 %25, float %28, float 0x3FFD757D20000000
  %32 = select i1 %25, float addrspace(4)* %29, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 9)
  br label %44

33:                                               ; preds = %20
  %34 = fcmp ugt float %18, 7.781250e+00
  br i1 %34, label %35, label %44

35:                                               ; preds = %33
  %36 = fcmp ugt float %18, 0x4022B80000000000
  %37 = fcmp ugt float %18, 0x4025E80000000000
  %38 = select i1 %37, float 0xBE8A046940000000, float 0xBE9E8407A0000000
  %39 = select i1 %37, float 0x4027697980000000, float 0x402458D0E0000000
  %40 = select i1 %37, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 63), float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 54)
  %41 = select i1 %36, float %38, float 0x3E9E171140000000
  %42 = select i1 %36, float %39, float 0x4021129800000000
  %43 = select i1 %36, float addrspace(4)* %40, float addrspace(4)* getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 45)
  br label %44

44:                                               ; preds = %35, %33, %24, %22
  %45 = phi float [ 0.000000e+00, %22 ], [ 0xBE88971B60000000, %33 ], [ %30, %24 ], [ %41, %35 ]
  %46 = phi float [ 0.000000e+00, %22 ], [ 0x401C0FF600000000, %33 ], [ %31, %24 ], [ %42, %35 ]
  %47 = phi float addrspace(4)* [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 0), %22 ], [ getelementptr inbounds ([72 x float], [72 x float] addrspace(4)* @__ocmltbl_M32_J1, i64 0, i64 36), %33 ], [ %32, %24 ], [ %43, %35 ]
  %48 = fsub float %18, %46
  %49 = fsub float %48, %45
  %50 = getelementptr inbounds float, float addrspace(4)* %47, i64 8
  %51 = load float, float addrspace(4)* %50, align 4, !tbaa !11
  %52 = getelementptr inbounds float, float addrspace(4)* %47, i64 7
  %53 = load float, float addrspace(4)* %52, align 4, !tbaa !11
  %54 = tail call float @llvm.fmuladd.f32(float %49, float %51, float %53)
  %55 = getelementptr inbounds float, float addrspace(4)* %47, i64 6
  %56 = load float, float addrspace(4)* %55, align 4, !tbaa !11
  %57 = tail call float @llvm.fmuladd.f32(float %49, float %54, float %56)
  %58 = getelementptr inbounds float, float addrspace(4)* %47, i64 5
  %59 = load float, float addrspace(4)* %58, align 4, !tbaa !11
  %60 = tail call float @llvm.fmuladd.f32(float %49, float %57, float %59)
  %61 = getelementptr inbounds float, float addrspace(4)* %47, i64 4
  %62 = load float, float addrspace(4)* %61, align 4, !tbaa !11
  %63 = tail call float @llvm.fmuladd.f32(float %49, float %60, float %62)
  %64 = getelementptr inbounds float, float addrspace(4)* %47, i64 3
  %65 = load float, float addrspace(4)* %64, align 4, !tbaa !11
  %66 = tail call float @llvm.fmuladd.f32(float %49, float %63, float %65)
  %67 = getelementptr inbounds float, float addrspace(4)* %47, i64 2
  %68 = load float, float addrspace(4)* %67, align 4, !tbaa !11
  %69 = tail call float @llvm.fmuladd.f32(float %49, float %66, float %68)
  %70 = getelementptr inbounds float, float addrspace(4)* %47, i64 1
  %71 = load float, float addrspace(4)* %70, align 4, !tbaa !11
  %72 = tail call float @llvm.fmuladd.f32(float %49, float %69, float %71)
  %73 = load float, float addrspace(4)* %47, align 4, !tbaa !11
  %74 = tail call float @llvm.fmuladd.f32(float %49, float %72, float %73)
  br label %233

75:                                               ; preds = %15
  %76 = fdiv float 1.000000e+00, %18, !fpmath !15
  %77 = fmul float %76, %76
  %78 = tail call float @llvm.fmuladd.f32(float %77, float 0x4000214CE0000000, float 0xBFD7A54CA0000000)
  %79 = tail call float @llvm.fmuladd.f32(float %77, float %78, float 0x3FC4FFEFE0000000)
  %80 = tail call float @llvm.fmuladd.f32(float %77, float %79, float -3.750000e-01)
  %81 = fmul float %76, %80
  %82 = tail call float @llvm.amdgcn.rsq.f32(float %18)
  %83 = fmul float %82, 0x3FE9884540000000
  %84 = tail call float @llvm.fmuladd.f32(float %77, float 0xBFC7C0D460000000, float 0x3FC7FF5AA0000000)
  %85 = tail call float @llvm.fmuladd.f32(float %77, float %84, float 1.000000e+00)
  %86 = fmul float %83, %85
  %87 = fcmp olt float %18, 1.310720e+05
  br i1 %87, label %88, label %95

88:                                               ; preds = %75
  %89 = fmul float %18, 0x3FE45F3060000000
  %90 = tail call float @llvm.rint.f32(float %89)
  %91 = tail call float @llvm.fma.f32(float %90, float 0xBFF921FB40000000, float %18)
  %92 = tail call float @llvm.fma.f32(float %90, float 0xBE74442D00000000, float %91)
  %93 = tail call float @llvm.fma.f32(float %90, float 0xBCF8469880000000, float %92)
  %94 = fptosi float %90 to i32
  br label %201

95:                                               ; preds = %75
  %96 = bitcast float %18 to i32
  %97 = lshr i32 %96, 23
  %98 = and i32 %96, 8388607
  %99 = or i32 %98, 8388608
  %100 = zext i32 %99 to i64
  %101 = mul nuw nsw i64 %100, 4266746795
  %102 = trunc i64 %101 to i32
  %103 = lshr i64 %101, 32
  %104 = mul nuw nsw i64 %100, 1011060801
  %105 = add nuw nsw i64 %103, %104
  %106 = trunc i64 %105 to i32
  %107 = lshr i64 %105, 32
  %108 = mul nuw nsw i64 %100, 3680671129
  %109 = add nuw nsw i64 %107, %108
  %110 = trunc i64 %109 to i32
  %111 = lshr i64 %109, 32
  %112 = mul nuw nsw i64 %100, 4113882560
  %113 = add nuw nsw i64 %111, %112
  %114 = trunc i64 %113 to i32
  %115 = lshr i64 %113, 32
  %116 = mul nuw nsw i64 %100, 4230436817
  %117 = add nuw nsw i64 %115, %116
  %118 = trunc i64 %117 to i32
  %119 = lshr i64 %117, 32
  %120 = mul nuw nsw i64 %100, 1313084713
  %121 = add nuw nsw i64 %119, %120
  %122 = trunc i64 %121 to i32
  %123 = lshr i64 %121, 32
  %124 = mul nuw nsw i64 %100, 2734261102
  %125 = add nuw nsw i64 %123, %124
  %126 = trunc i64 %125 to i32
  %127 = lshr i64 %125, 32
  %128 = trunc i64 %127 to i32
  %129 = add nsw i32 %97, -120
  %130 = icmp ugt i32 %129, 63
  %131 = select i1 %130, i32 %122, i32 %128
  %132 = select i1 %130, i32 %118, i32 %126
  %133 = select i1 %130, i32 %114, i32 %122
  %134 = select i1 %130, i32 %110, i32 %118
  %135 = select i1 %130, i32 %106, i32 %114
  %136 = select i1 %130, i32 %102, i32 %110
  %137 = select i1 %130, i32 -64, i32 0
  %138 = add nsw i32 %137, %129
  %139 = icmp ugt i32 %138, 31
  %140 = select i1 %139, i32 %132, i32 %131
  %141 = select i1 %139, i32 %133, i32 %132
  %142 = select i1 %139, i32 %134, i32 %133
  %143 = select i1 %139, i32 %135, i32 %134
  %144 = select i1 %139, i32 %136, i32 %135
  %145 = select i1 %139, i32 -32, i32 0
  %146 = add nsw i32 %145, %138
  %147 = icmp ugt i32 %146, 31
  %148 = select i1 %147, i32 %141, i32 %140
  %149 = select i1 %147, i32 %142, i32 %141
  %150 = select i1 %147, i32 %143, i32 %142
  %151 = select i1 %147, i32 %144, i32 %143
  %152 = select i1 %147, i32 -32, i32 0
  %153 = add nsw i32 %152, %146
  %154 = icmp eq i32 %153, 0
  %155 = sub nsw i32 32, %153
  %156 = tail call i32 @llvm.fshr.i32(i32 %148, i32 %149, i32 %155)
  %157 = tail call i32 @llvm.fshr.i32(i32 %149, i32 %150, i32 %155)
  %158 = tail call i32 @llvm.fshr.i32(i32 %150, i32 %151, i32 %155)
  %159 = select i1 %154, i32 %148, i32 %156
  %160 = select i1 %154, i32 %149, i32 %157
  %161 = select i1 %154, i32 %150, i32 %158
  %162 = lshr i32 %159, 29
  %163 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %160, i32 2)
  %164 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %161, i32 2)
  %165 = tail call i32 @llvm.fshl.i32(i32 %161, i32 %151, i32 2)
  %166 = and i32 %162, 1
  %167 = sub nsw i32 0, %166
  %168 = shl i32 %162, 31
  %169 = xor i32 %163, %167
  %170 = xor i32 %164, %167
  %171 = xor i32 %165, %167
  %172 = tail call i32 @llvm.ctlz.i32(i32 %169, i1 false), !range !16
  %173 = sub nsw i32 31, %172
  %174 = tail call i32 @llvm.fshr.i32(i32 %169, i32 %170, i32 %173)
  %175 = tail call i32 @llvm.fshr.i32(i32 %170, i32 %171, i32 %173)
  %176 = shl nuw nsw i32 %172, 23
  %177 = sub nuw nsw i32 1056964608, %176
  %178 = lshr i32 %174, 9
  %179 = or i32 %178, %177
  %180 = or i32 %179, %168
  %181 = bitcast i32 %180 to float
  %182 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %175, i32 23)
  %183 = tail call i32 @llvm.ctlz.i32(i32 %182, i1 false), !range !16
  %184 = fmul float %181, 0x3FF921FB40000000
  %185 = add nuw nsw i32 %183, %172
  %186 = shl nuw nsw i32 %185, 23
  %187 = sub nuw nsw i32 855638016, %186
  %188 = sub nsw i32 31, %183
  %189 = tail call i32 @llvm.fshr.i32(i32 %182, i32 %175, i32 %188)
  %190 = lshr i32 %189, 9
  %191 = or i32 %187, %190
  %192 = or i32 %191, %168
  %193 = bitcast i32 %192 to float
  %194 = fneg float %184
  %195 = tail call float @llvm.fma.f32(float %181, float 0x3FF921FB40000000, float %194)
  %196 = tail call float @llvm.fma.f32(float %181, float 0x3E74442D00000000, float %195)
  %197 = tail call float @llvm.fma.f32(float %193, float 0x3FF921FB40000000, float %196)
  %198 = fadd float %184, %197
  %199 = lshr i32 %159, 30
  %200 = add nuw nsw i32 %166, %199
  br label %201

201:                                              ; preds = %95, %88
  %202 = phi float [ %93, %88 ], [ %198, %95 ]
  %203 = phi i32 [ %94, %88 ], [ %200, %95 ]
  %204 = and i32 %203, 3
  %205 = fcmp olt float %202, %81
  %206 = sext i1 %205 to i32
  %207 = add nsw i32 %204, -1
  %208 = add nsw i32 %207, %206
  %209 = fsub float %202, %81
  %210 = select i1 %205, float 0x3FE921FB60000000, float 0xBFE921FB60000000
  %211 = fadd float %209, %210
  %212 = fmul float %211, %211
  %213 = tail call float @llvm.fmuladd.f32(float %212, float 0xBF29833040000000, float 0x3F81103880000000)
  %214 = tail call float @llvm.fmuladd.f32(float %212, float %213, float 0xBFC55553A0000000)
  %215 = fmul float %212, %214
  %216 = tail call float @llvm.fmuladd.f32(float %211, float %215, float %211)
  %217 = tail call float @llvm.fmuladd.f32(float %212, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %218 = tail call float @llvm.fmuladd.f32(float %212, float %217, float 0x3FA5557EE0000000)
  %219 = tail call float @llvm.fmuladd.f32(float %212, float %218, float 0xBFE0000080000000)
  %220 = tail call float @llvm.fmuladd.f32(float %212, float %219, float 1.000000e+00)
  %221 = fneg float %216
  %222 = and i32 %208, 1
  %223 = icmp eq i32 %222, 0
  %224 = select i1 %223, float %220, float %221
  %225 = bitcast float %224 to i32
  %226 = shl i32 %208, 30
  %227 = and i32 %226, -2147483648
  %228 = xor i32 %227, %225
  %229 = bitcast i32 %228 to float
  %230 = fmul float %86, %229
  %231 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 512)
  %232 = select i1 %231, float 0.000000e+00, float %230
  br label %233

233:                                              ; preds = %44, %201
  %234 = phi float [ %74, %44 ], [ %232, %201 ]
  %235 = fcmp olt float %17, 0.000000e+00
  %236 = fneg float %234
  %237 = select i1 %235, float %236, float %234
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %237, float addrspace(1)* %238, align 4, !tbaa !7
  br label %239

239:                                              ; preds = %233, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
declare float @llvm.fmuladd.f32(float, float, float) #1

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
