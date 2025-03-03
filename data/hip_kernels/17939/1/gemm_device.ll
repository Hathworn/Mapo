; ModuleID = '../data/hip_kernels/17939/1/main.cu'
source_filename = "../data/hip_kernels/17939/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4gemmPfS_S_ffS_iE3s_a = internal unnamed_addr addrspace(3) global [24 x [24 x float]] undef, align 16
@_ZZ4gemmPfS_S_ffS_iE3s_b = internal unnamed_addr addrspace(3) global [24 x [24 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4gemmPfS_S_ffS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float %3, float %4, float addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %9
  %19 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %10, %22
  %24 = add i32 %23, %8
  %25 = sdiv i32 %6, 24
  %26 = mul nsw i32 %25, 24
  %27 = add i32 %26, 24
  %28 = icmp slt i32 %18, %27
  %29 = icmp slt i32 %24, %27
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %222

31:                                               ; preds = %7
  %32 = icmp slt i32 %6, -23
  br i1 %32, label %87, label %33

33:                                               ; preds = %31
  %34 = mul nsw i32 %18, %6
  %35 = add i32 %34, %8
  %36 = mul nsw i32 %6, %6
  %37 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 %8
  %38 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 %9, i32 %8
  %39 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 0
  %40 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 0, i32 %8
  %41 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 1
  %42 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 1, i32 %8
  %43 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 2
  %44 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 2, i32 %8
  %45 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 3
  %46 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 3, i32 %8
  %47 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 4
  %48 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 4, i32 %8
  %49 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 5
  %50 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 5, i32 %8
  %51 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 6
  %52 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 6, i32 %8
  %53 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 7
  %54 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 7, i32 %8
  %55 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 8
  %56 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 8, i32 %8
  %57 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 9
  %58 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 9, i32 %8
  %59 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 10
  %60 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 10, i32 %8
  %61 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 11
  %62 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 11, i32 %8
  %63 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 12
  %64 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 12, i32 %8
  %65 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 13
  %66 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 13, i32 %8
  %67 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 14
  %68 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 14, i32 %8
  %69 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 15
  %70 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 15, i32 %8
  %71 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 16
  %72 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 16, i32 %8
  %73 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 17
  %74 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 17, i32 %8
  %75 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 18
  %76 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 18, i32 %8
  %77 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 19
  %78 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 19, i32 %8
  %79 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 20
  %80 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 20, i32 %8
  %81 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 21
  %82 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 21, i32 %8
  %83 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 22
  %84 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 22, i32 %8
  %85 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_a, i32 0, i32 %9, i32 23
  %86 = getelementptr inbounds [24 x [24 x float]], [24 x [24 x float]] addrspace(3)* @_ZZ4gemmPfS_S_ffS_iE3s_b, i32 0, i32 23, i32 %8
  br label %92

87:                                               ; preds = %112, %31
  %88 = phi float [ 0.000000e+00, %31 ], [ %209, %112 ]
  %89 = icmp slt i32 %18, %6
  %90 = icmp slt i32 %24, %6
  %91 = select i1 %89, i1 %90, i1 false
  br i1 %91, label %212, label %222

92:                                               ; preds = %33, %112
  %93 = phi i32 [ 0, %33 ], [ %210, %112 ]
  %94 = phi float [ 0.000000e+00, %33 ], [ %209, %112 ]
  %95 = mul nuw nsw i32 %93, 24
  %96 = add i32 %35, %95
  %97 = add nuw nsw i32 %95, %9
  %98 = mul nsw i32 %97, %6
  %99 = add nsw i32 %98, %24
  %100 = icmp slt i32 %96, %36
  br i1 %100, label %101, label %105

101:                                              ; preds = %92
  %102 = sext i32 %96 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %0, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %105

105:                                              ; preds = %92, %101
  %106 = phi float [ %104, %101 ], [ 0.000000e+00, %92 ]
  store float %106, float addrspace(3)* %37, align 4, !tbaa !7
  %107 = icmp slt i32 %99, %36
  br i1 %107, label %108, label %112

108:                                              ; preds = %105
  %109 = sext i32 %99 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %112

112:                                              ; preds = %105, %108
  %113 = phi float [ %111, %108 ], [ 0.000000e+00, %105 ]
  store float %113, float addrspace(3)* %38, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = load float, float addrspace(3)* %39, align 16, !tbaa !7
  %115 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %116 = fmul contract float %114, %115
  %117 = fadd contract float %94, %116
  %118 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %119 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %120 = fmul contract float %118, %119
  %121 = fadd contract float %117, %120
  %122 = load float, float addrspace(3)* %43, align 8, !tbaa !7
  %123 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %121, %124
  %126 = load float, float addrspace(3)* %45, align 4, !tbaa !7
  %127 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %128 = fmul contract float %126, %127
  %129 = fadd contract float %125, %128
  %130 = load float, float addrspace(3)* %47, align 16, !tbaa !7
  %131 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %132 = fmul contract float %130, %131
  %133 = fadd contract float %129, %132
  %134 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %135 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %136 = fmul contract float %134, %135
  %137 = fadd contract float %133, %136
  %138 = load float, float addrspace(3)* %51, align 8, !tbaa !7
  %139 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %140 = fmul contract float %138, %139
  %141 = fadd contract float %137, %140
  %142 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %143 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %144 = fmul contract float %142, %143
  %145 = fadd contract float %141, %144
  %146 = load float, float addrspace(3)* %55, align 16, !tbaa !7
  %147 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %148 = fmul contract float %146, %147
  %149 = fadd contract float %145, %148
  %150 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %151 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %152 = fmul contract float %150, %151
  %153 = fadd contract float %149, %152
  %154 = load float, float addrspace(3)* %59, align 8, !tbaa !7
  %155 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %156 = fmul contract float %154, %155
  %157 = fadd contract float %153, %156
  %158 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %159 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %160 = fmul contract float %158, %159
  %161 = fadd contract float %157, %160
  %162 = load float, float addrspace(3)* %63, align 16, !tbaa !7
  %163 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %164 = fmul contract float %162, %163
  %165 = fadd contract float %161, %164
  %166 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %167 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %168 = fmul contract float %166, %167
  %169 = fadd contract float %165, %168
  %170 = load float, float addrspace(3)* %67, align 8, !tbaa !7
  %171 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %172 = fmul contract float %170, %171
  %173 = fadd contract float %169, %172
  %174 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %175 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %176 = fmul contract float %174, %175
  %177 = fadd contract float %173, %176
  %178 = load float, float addrspace(3)* %71, align 16, !tbaa !7
  %179 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %180 = fmul contract float %178, %179
  %181 = fadd contract float %177, %180
  %182 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %183 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %184 = fmul contract float %182, %183
  %185 = fadd contract float %181, %184
  %186 = load float, float addrspace(3)* %75, align 8, !tbaa !7
  %187 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %188 = fmul contract float %186, %187
  %189 = fadd contract float %185, %188
  %190 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %191 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %192 = fmul contract float %190, %191
  %193 = fadd contract float %189, %192
  %194 = load float, float addrspace(3)* %79, align 16, !tbaa !7
  %195 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %196 = fmul contract float %194, %195
  %197 = fadd contract float %193, %196
  %198 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %199 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %200 = fmul contract float %198, %199
  %201 = fadd contract float %197, %200
  %202 = load float, float addrspace(3)* %83, align 8, !tbaa !7
  %203 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %204 = fmul contract float %202, %203
  %205 = fadd contract float %201, %204
  %206 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %207 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %205, %208
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %210 = add nuw nsw i32 %93, 1
  %211 = icmp eq i32 %93, %25
  br i1 %211, label %87, label %92, !llvm.loop !11

212:                                              ; preds = %87
  %213 = fmul contract float %88, %3
  %214 = mul nsw i32 %18, %6
  %215 = add nsw i32 %214, %24
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %2, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !7, !amdgpu.noclobber !6
  %219 = fmul contract float %218, %4
  %220 = fadd contract float %213, %219
  %221 = getelementptr inbounds float, float addrspace(1)* %5, i64 %216
  store float %220, float addrspace(1)* %221, align 4, !tbaa !7
  br label %222

222:                                              ; preds = %87, %212, %7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
