; ModuleID = '../data/hip_kernels/12483/22/main.cu'
source_filename = "../data/hip_kernels/12483/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16
@_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16
@_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16
@_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared = internal unnamed_addr addrspace(3) global [256 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = mul i32 %18, %17
  %20 = add i32 %19, %12
  %21 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %12
  store double 0.000000e+00, double addrspace(3)* %21, align 8, !tbaa !7
  %22 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %12
  store double 0.000000e+00, double addrspace(3)* %22, align 8, !tbaa !7
  %23 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %12
  store double 0.000000e+00, double addrspace(3)* %23, align 8, !tbaa !7
  %24 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %12
  store double 0.000000e+00, double addrspace(3)* %24, align 8, !tbaa !7
  %25 = mul nsw i32 %1, %0
  %26 = icmp slt i32 %20, %25
  br i1 %26, label %27, label %52

27:                                               ; preds = %11
  %28 = shl nsw i32 %2, 1
  %29 = add nsw i32 %28, %0
  %30 = freeze i32 %20
  %31 = freeze i32 %0
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = add nsw i32 %29, 1
  %36 = mul nsw i32 %35, %2
  %37 = add nsw i32 %34, %36
  %38 = mul nsw i32 %32, %29
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %3, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !6
  %43 = getelementptr inbounds double, double addrspace(1)* %4, i64 %40
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !6
  %45 = fmul contract double %42, %44
  store double %42, double addrspace(3)* %21, align 8, !tbaa !7
  store double %45, double addrspace(3)* %22, align 8, !tbaa !7
  %46 = getelementptr inbounds double, double addrspace(1)* %5, i64 %40
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !6
  %48 = fmul contract double %45, %47
  store double %48, double addrspace(3)* %23, align 8, !tbaa !7
  %49 = getelementptr inbounds double, double addrspace(1)* %6, i64 %40
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !6
  %51 = fmul contract double %45, %50
  store double %51, double addrspace(3)* %24, align 8, !tbaa !7
  br label %52

52:                                               ; preds = %27, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp ult i32 %12, 128
  br i1 %53, label %54, label %72

54:                                               ; preds = %52
  %55 = add nuw nsw i32 %12, 128
  %56 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %55
  %57 = load double, double addrspace(3)* %56, align 8, !tbaa !7
  %58 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %59 = fadd contract double %57, %58
  store double %59, double addrspace(3)* %21, align 8, !tbaa !7
  %60 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %55
  %61 = load double, double addrspace(3)* %60, align 8, !tbaa !7
  %62 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %63 = fadd contract double %61, %62
  store double %63, double addrspace(3)* %22, align 8, !tbaa !7
  %64 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %55
  %65 = load double, double addrspace(3)* %64, align 8, !tbaa !7
  %66 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %67 = fadd contract double %65, %66
  store double %67, double addrspace(3)* %23, align 8, !tbaa !7
  %68 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %55
  %69 = load double, double addrspace(3)* %68, align 8, !tbaa !7
  %70 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %71 = fadd contract double %69, %70
  store double %71, double addrspace(3)* %24, align 8, !tbaa !7
  br label %72

72:                                               ; preds = %54, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %73 = icmp ult i32 %12, 64
  br i1 %73, label %74, label %92

74:                                               ; preds = %72
  %75 = add nuw nsw i32 %12, 64
  %76 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %75
  %77 = load double, double addrspace(3)* %76, align 8, !tbaa !7
  %78 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %79 = fadd contract double %77, %78
  store double %79, double addrspace(3)* %21, align 8, !tbaa !7
  %80 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %75
  %81 = load double, double addrspace(3)* %80, align 8, !tbaa !7
  %82 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %83 = fadd contract double %81, %82
  store double %83, double addrspace(3)* %22, align 8, !tbaa !7
  %84 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %75
  %85 = load double, double addrspace(3)* %84, align 8, !tbaa !7
  %86 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %87 = fadd contract double %85, %86
  store double %87, double addrspace(3)* %23, align 8, !tbaa !7
  %88 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %75
  %89 = load double, double addrspace(3)* %88, align 8, !tbaa !7
  %90 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %91 = fadd contract double %89, %90
  store double %91, double addrspace(3)* %24, align 8, !tbaa !7
  br label %92

92:                                               ; preds = %74, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = icmp ult i32 %12, 32
  br i1 %93, label %94, label %112

94:                                               ; preds = %92
  %95 = add nuw nsw i32 %12, 32
  %96 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %95
  %97 = load double, double addrspace(3)* %96, align 8, !tbaa !7
  %98 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %99 = fadd contract double %97, %98
  store double %99, double addrspace(3)* %21, align 8, !tbaa !7
  %100 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %95
  %101 = load double, double addrspace(3)* %100, align 8, !tbaa !7
  %102 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %103 = fadd contract double %101, %102
  store double %103, double addrspace(3)* %22, align 8, !tbaa !7
  %104 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %95
  %105 = load double, double addrspace(3)* %104, align 8, !tbaa !7
  %106 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %107 = fadd contract double %105, %106
  store double %107, double addrspace(3)* %23, align 8, !tbaa !7
  %108 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %95
  %109 = load double, double addrspace(3)* %108, align 8, !tbaa !7
  %110 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %111 = fadd contract double %109, %110
  store double %111, double addrspace(3)* %24, align 8, !tbaa !7
  br label %112

112:                                              ; preds = %94, %92
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %113 = icmp ult i32 %12, 16
  br i1 %113, label %114, label %132

114:                                              ; preds = %112
  %115 = add nuw nsw i32 %12, 16
  %116 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %115
  %117 = load double, double addrspace(3)* %116, align 8, !tbaa !7
  %118 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %119 = fadd contract double %117, %118
  store double %119, double addrspace(3)* %21, align 8, !tbaa !7
  %120 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %115
  %121 = load double, double addrspace(3)* %120, align 8, !tbaa !7
  %122 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %123 = fadd contract double %121, %122
  store double %123, double addrspace(3)* %22, align 8, !tbaa !7
  %124 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %115
  %125 = load double, double addrspace(3)* %124, align 8, !tbaa !7
  %126 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %127 = fadd contract double %125, %126
  store double %127, double addrspace(3)* %23, align 8, !tbaa !7
  %128 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %115
  %129 = load double, double addrspace(3)* %128, align 8, !tbaa !7
  %130 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %131 = fadd contract double %129, %130
  store double %131, double addrspace(3)* %24, align 8, !tbaa !7
  br label %132

132:                                              ; preds = %114, %112
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = icmp ult i32 %12, 8
  br i1 %133, label %134, label %152

134:                                              ; preds = %132
  %135 = add nuw nsw i32 %12, 8
  %136 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %135
  %137 = load double, double addrspace(3)* %136, align 8, !tbaa !7
  %138 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %139 = fadd contract double %137, %138
  store double %139, double addrspace(3)* %21, align 8, !tbaa !7
  %140 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %135
  %141 = load double, double addrspace(3)* %140, align 8, !tbaa !7
  %142 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %143 = fadd contract double %141, %142
  store double %143, double addrspace(3)* %22, align 8, !tbaa !7
  %144 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %135
  %145 = load double, double addrspace(3)* %144, align 8, !tbaa !7
  %146 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %147 = fadd contract double %145, %146
  store double %147, double addrspace(3)* %23, align 8, !tbaa !7
  %148 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %135
  %149 = load double, double addrspace(3)* %148, align 8, !tbaa !7
  %150 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %151 = fadd contract double %149, %150
  store double %151, double addrspace(3)* %24, align 8, !tbaa !7
  br label %152

152:                                              ; preds = %134, %132
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = icmp ult i32 %12, 4
  br i1 %153, label %154, label %172

154:                                              ; preds = %152
  %155 = add nuw nsw i32 %12, 4
  %156 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %155
  %157 = load double, double addrspace(3)* %156, align 8, !tbaa !7
  %158 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %159 = fadd contract double %157, %158
  store double %159, double addrspace(3)* %21, align 8, !tbaa !7
  %160 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %155
  %161 = load double, double addrspace(3)* %160, align 8, !tbaa !7
  %162 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %163 = fadd contract double %161, %162
  store double %163, double addrspace(3)* %22, align 8, !tbaa !7
  %164 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %155
  %165 = load double, double addrspace(3)* %164, align 8, !tbaa !7
  %166 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %167 = fadd contract double %165, %166
  store double %167, double addrspace(3)* %23, align 8, !tbaa !7
  %168 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %155
  %169 = load double, double addrspace(3)* %168, align 8, !tbaa !7
  %170 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %171 = fadd contract double %169, %170
  store double %171, double addrspace(3)* %24, align 8, !tbaa !7
  br label %172

172:                                              ; preds = %154, %152
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %173 = icmp ult i32 %12, 2
  br i1 %173, label %174, label %192

174:                                              ; preds = %172
  %175 = add nuw nsw i32 %12, 2
  %176 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %175
  %177 = load double, double addrspace(3)* %176, align 8, !tbaa !7
  %178 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %179 = fadd contract double %177, %178
  store double %179, double addrspace(3)* %21, align 8, !tbaa !7
  %180 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %175
  %181 = load double, double addrspace(3)* %180, align 8, !tbaa !7
  %182 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %183 = fadd contract double %181, %182
  store double %183, double addrspace(3)* %22, align 8, !tbaa !7
  %184 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %175
  %185 = load double, double addrspace(3)* %184, align 8, !tbaa !7
  %186 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %187 = fadd contract double %185, %186
  store double %187, double addrspace(3)* %23, align 8, !tbaa !7
  %188 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %175
  %189 = load double, double addrspace(3)* %188, align 8, !tbaa !7
  %190 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %191 = fadd contract double %189, %190
  store double %191, double addrspace(3)* %24, align 8, !tbaa !7
  br label %192

192:                                              ; preds = %174, %172
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %193 = icmp eq i32 %12, 0
  br i1 %193, label %194, label %212

194:                                              ; preds = %192
  %195 = add nuw nsw i32 %12, 1
  %196 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 %195
  %197 = load double, double addrspace(3)* %196, align 8, !tbaa !7
  %198 = load double, double addrspace(3)* %21, align 8, !tbaa !7
  %199 = fadd contract double %197, %198
  store double %199, double addrspace(3)* %21, align 8, !tbaa !7
  %200 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 %195
  %201 = load double, double addrspace(3)* %200, align 8, !tbaa !7
  %202 = load double, double addrspace(3)* %22, align 8, !tbaa !7
  %203 = fadd contract double %201, %202
  store double %203, double addrspace(3)* %22, align 8, !tbaa !7
  %204 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 %195
  %205 = load double, double addrspace(3)* %204, align 8, !tbaa !7
  %206 = load double, double addrspace(3)* %23, align 8, !tbaa !7
  %207 = fadd contract double %205, %206
  store double %207, double addrspace(3)* %23, align 8, !tbaa !7
  %208 = getelementptr inbounds [256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 %195
  %209 = load double, double addrspace(3)* %208, align 8, !tbaa !7
  %210 = load double, double addrspace(3)* %24, align 8, !tbaa !7
  %211 = fadd contract double %209, %210
  store double %211, double addrspace(3)* %24, align 8, !tbaa !7
  br label %212

212:                                              ; preds = %194, %192
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %213 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E10vol_shared, i32 0, i32 0), align 16, !tbaa !7
  %214 = zext i32 %18 to i64
  %215 = getelementptr inbounds double, double addrspace(1)* %7, i64 %214
  store double %213, double addrspace(1)* %215, align 8, !tbaa !7
  %216 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11mass_shared, i32 0, i32 0), align 16, !tbaa !7
  %217 = getelementptr inbounds double, double addrspace(1)* %8, i64 %214
  store double %216, double addrspace(1)* %217, align 8, !tbaa !7
  %218 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E9ie_shared, i32 0, i32 0), align 16, !tbaa !7
  %219 = getelementptr inbounds double, double addrspace(1)* %9, i64 %214
  store double %218, double addrspace(1)* %219, align 8, !tbaa !7
  %220 = load double, double addrspace(3)* getelementptr inbounds ([256 x double], [256 x double] addrspace(3)* @_ZZ13field_summaryiiiPKdS0_S0_S0_PdS1_S1_S1_E11temp_shared, i32 0, i32 0), align 16, !tbaa !7
  %221 = getelementptr inbounds double, double addrspace(1)* %10, i64 %214
  store double %220, double addrspace(1)* %221, align 8, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
