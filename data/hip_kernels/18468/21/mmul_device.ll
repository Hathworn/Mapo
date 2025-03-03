; ModuleID = '../data/hip_kernels/18468/21/main.cu'
source_filename = "../data/hip_kernels/18468/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4mmulPKfS0_PfiE2As = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ4mmulPKfS0_PfiE2Bs = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4mmulPKfS0_Pfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %246

25:                                               ; preds = %4
  %26 = sdiv i32 %3, 32
  %27 = icmp sgt i32 %3, 31
  %28 = mul nsw i32 %21, %3
  br i1 %27, label %29, label %97

29:                                               ; preds = %25
  %30 = add i32 %28, %5
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 %5
  %32 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 %14, i32 %5
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 0
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 0, i32 %5
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 1
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 1, i32 %5
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 2
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 2, i32 %5
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 3
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 3, i32 %5
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 4
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 4, i32 %5
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 5
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 5, i32 %5
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 6
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 6, i32 %5
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 7
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 7, i32 %5
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 8
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 8, i32 %5
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 9
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 9, i32 %5
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 10
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 10, i32 %5
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 11
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 11, i32 %5
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 12
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 12, i32 %5
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 13
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 13, i32 %5
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 14
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 14, i32 %5
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 15
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 15, i32 %5
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 16
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 16, i32 %5
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 17
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 17, i32 %5
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 18
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 18, i32 %5
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 19
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 19, i32 %5
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 20
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 20, i32 %5
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 21
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 21, i32 %5
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 22
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 22, i32 %5
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 23
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 23, i32 %5
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 24
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 24, i32 %5
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 25
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 25, i32 %5
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 26
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 26, i32 %5
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 27
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 27, i32 %5
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 28
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 28, i32 %5
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 29
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 29, i32 %5
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 30
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 30, i32 %5
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2As, i32 0, i32 %14, i32 31
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ4mmulPKfS0_PfiE2Bs, i32 0, i32 31, i32 %5
  br label %102

97:                                               ; preds = %102, %25
  %98 = phi float [ 0.000000e+00, %25 ], [ %243, %102 ]
  %99 = add nsw i32 %28, %13
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  store float %98, float addrspace(1)* %101, align 4, !tbaa !7
  br label %246

102:                                              ; preds = %29, %102
  %103 = phi i32 [ 0, %29 ], [ %244, %102 ]
  %104 = phi float [ 0.000000e+00, %29 ], [ %243, %102 ]
  %105 = shl nsw i32 %103, 5
  %106 = add i32 %30, %105
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %109, float addrspace(3)* %31, align 4, !tbaa !7
  %110 = add nuw i32 %105, %14
  %111 = mul i32 %110, %3
  %112 = add i32 %111, %13
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %115, float addrspace(3)* %32, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %116 = load float, float addrspace(3)* %33, align 16, !tbaa !7
  %117 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %104, %118
  %120 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %121 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %37, align 8, !tbaa !7
  %125 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %129 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %41, align 16, !tbaa !7
  %133 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %137 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %45, align 8, !tbaa !7
  %141 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %145 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %49, align 16, !tbaa !7
  %149 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %153 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %53, align 8, !tbaa !7
  %157 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %161 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %57, align 16, !tbaa !7
  %165 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %169 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  %172 = load float, float addrspace(3)* %61, align 8, !tbaa !7
  %173 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %171, %174
  %176 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %177 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %175, %178
  %180 = load float, float addrspace(3)* %65, align 16, !tbaa !7
  %181 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %185 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %69, align 8, !tbaa !7
  %189 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %193 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %73, align 16, !tbaa !7
  %197 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %201 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %77, align 8, !tbaa !7
  %205 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %209 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %81, align 16, !tbaa !7
  %213 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %217 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %85, align 8, !tbaa !7
  %221 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %225 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %89, align 16, !tbaa !7
  %229 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %233 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  %236 = load float, float addrspace(3)* %93, align 8, !tbaa !7
  %237 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %235, %238
  %240 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %241 = load float, float addrspace(3)* %96, align 4, !tbaa !7
  %242 = fmul contract float %240, %241
  %243 = fadd contract float %239, %242
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %244 = add nuw nsw i32 %103, 1
  %245 = icmp eq i32 %244, %26
  br i1 %245, label %97, label %102, !llvm.loop !11

246:                                              ; preds = %97, %4
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
