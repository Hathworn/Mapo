; ModuleID = '../data/hip_kernels/13303/0/main.cu'
source_filename = "../data/hip_kernels/13303/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11matrix_multPfjjS_jjS_E2S1 = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16
@_ZZ11matrix_multPfjjS_jjS_E2S2 = internal unnamed_addr addrspace(3) global [32 x [32 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11matrix_multPfjjS_jjS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %8
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %9
  %25 = mul i32 %17, %1
  %26 = add i32 %4, -1
  %27 = lshr i32 %26, 5
  %28 = icmp ult i32 %24, %1
  %29 = icmp ult i32 %17, %5
  %30 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 %8
  %31 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 %9, i32 %8
  %32 = mul i32 %17, %4
  %33 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 0
  %34 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 0, i32 %8
  %35 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 1
  %36 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 1, i32 %8
  %37 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 2
  %38 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 2, i32 %8
  %39 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 3
  %40 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 3, i32 %8
  %41 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 4
  %42 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 4, i32 %8
  %43 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 5
  %44 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 5, i32 %8
  %45 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 6
  %46 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 6, i32 %8
  %47 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 7
  %48 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 7, i32 %8
  %49 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 8
  %50 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 8, i32 %8
  %51 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 9
  %52 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 9, i32 %8
  %53 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 10
  %54 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 10, i32 %8
  %55 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 11
  %56 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 11, i32 %8
  %57 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 12
  %58 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 12, i32 %8
  %59 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 13
  %60 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 13, i32 %8
  %61 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 14
  %62 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 14, i32 %8
  %63 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 15
  %64 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 15, i32 %8
  %65 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 16
  %66 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 16, i32 %8
  %67 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 17
  %68 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 17, i32 %8
  %69 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 18
  %70 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 18, i32 %8
  %71 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 19
  %72 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 19, i32 %8
  %73 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 20
  %74 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 20, i32 %8
  %75 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 21
  %76 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 21, i32 %8
  %77 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 22
  %78 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 22, i32 %8
  %79 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 23
  %80 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 23, i32 %8
  %81 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 24
  %82 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 24, i32 %8
  %83 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 25
  %84 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 25, i32 %8
  %85 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 26
  %86 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 26, i32 %8
  %87 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 27
  %88 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 27, i32 %8
  %89 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 28
  %90 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 28, i32 %8
  %91 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 29
  %92 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 29, i32 %8
  %93 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 30
  %94 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 30, i32 %8
  %95 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S1, i32 0, i32 %9, i32 31
  %96 = getelementptr inbounds [32 x [32 x float]], [32 x [32 x float]] addrspace(3)* @_ZZ11matrix_multPfjjS_jjS_E2S2, i32 0, i32 31, i32 %8
  br label %99

97:                                               ; preds = %122
  %98 = select i1 %28, i1 %29, i1 false
  br i1 %98, label %254, label %258

99:                                               ; preds = %7, %122
  %100 = phi float [ 0.000000e+00, %7 ], [ %251, %122 ]
  %101 = phi i32 [ 0, %7 ], [ %252, %122 ]
  %102 = shl nsw i32 %101, 5
  %103 = add nuw i32 %102, %8
  %104 = add nuw i32 %102, %9
  %105 = icmp ult i32 %103, %4
  %106 = select i1 %28, i1 %105, i1 false
  br i1 %106, label %107, label %113

107:                                              ; preds = %99
  %108 = mul i32 %103, %1
  %109 = add i32 %108, %24
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %113

113:                                              ; preds = %99, %107
  %114 = phi float [ %112, %107 ], [ 0.000000e+00, %99 ]
  store float %114, float addrspace(3)* %30, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = icmp ult i32 %104, %4
  %116 = select i1 %29, i1 %115, i1 false
  br i1 %116, label %117, label %122

117:                                              ; preds = %113
  %118 = add i32 %104, %32
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %122

122:                                              ; preds = %113, %117
  %123 = phi float [ %121, %117 ], [ 0.000000e+00, %113 ]
  store float %123, float addrspace(3)* %31, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %124 = load float, float addrspace(3)* %33, align 16, !tbaa !7
  %125 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %100, %126
  %128 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %129 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %37, align 8, !tbaa !7
  %133 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %137 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %41, align 16, !tbaa !7
  %141 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  %144 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %145 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %146 = fmul contract float %144, %145
  %147 = fadd contract float %143, %146
  %148 = load float, float addrspace(3)* %45, align 8, !tbaa !7
  %149 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %150 = fmul contract float %148, %149
  %151 = fadd contract float %147, %150
  %152 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %153 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %154 = fmul contract float %152, %153
  %155 = fadd contract float %151, %154
  %156 = load float, float addrspace(3)* %49, align 16, !tbaa !7
  %157 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %158 = fmul contract float %156, %157
  %159 = fadd contract float %155, %158
  %160 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %161 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %162 = fmul contract float %160, %161
  %163 = fadd contract float %159, %162
  %164 = load float, float addrspace(3)* %53, align 8, !tbaa !7
  %165 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %166 = fmul contract float %164, %165
  %167 = fadd contract float %163, %166
  %168 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %169 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %170 = fmul contract float %168, %169
  %171 = fadd contract float %167, %170
  %172 = load float, float addrspace(3)* %57, align 16, !tbaa !7
  %173 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %174 = fmul contract float %172, %173
  %175 = fadd contract float %171, %174
  %176 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %177 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %178 = fmul contract float %176, %177
  %179 = fadd contract float %175, %178
  %180 = load float, float addrspace(3)* %61, align 8, !tbaa !7
  %181 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %182 = fmul contract float %180, %181
  %183 = fadd contract float %179, %182
  %184 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %185 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %186 = fmul contract float %184, %185
  %187 = fadd contract float %183, %186
  %188 = load float, float addrspace(3)* %65, align 16, !tbaa !7
  %189 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %190 = fmul contract float %188, %189
  %191 = fadd contract float %187, %190
  %192 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %193 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %194 = fmul contract float %192, %193
  %195 = fadd contract float %191, %194
  %196 = load float, float addrspace(3)* %69, align 8, !tbaa !7
  %197 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %198 = fmul contract float %196, %197
  %199 = fadd contract float %195, %198
  %200 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %201 = load float, float addrspace(3)* %72, align 4, !tbaa !7
  %202 = fmul contract float %200, %201
  %203 = fadd contract float %199, %202
  %204 = load float, float addrspace(3)* %73, align 16, !tbaa !7
  %205 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %206 = fmul contract float %204, %205
  %207 = fadd contract float %203, %206
  %208 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %209 = load float, float addrspace(3)* %76, align 4, !tbaa !7
  %210 = fmul contract float %208, %209
  %211 = fadd contract float %207, %210
  %212 = load float, float addrspace(3)* %77, align 8, !tbaa !7
  %213 = load float, float addrspace(3)* %78, align 4, !tbaa !7
  %214 = fmul contract float %212, %213
  %215 = fadd contract float %211, %214
  %216 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %217 = load float, float addrspace(3)* %80, align 4, !tbaa !7
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %215, %218
  %220 = load float, float addrspace(3)* %81, align 16, !tbaa !7
  %221 = load float, float addrspace(3)* %82, align 4, !tbaa !7
  %222 = fmul contract float %220, %221
  %223 = fadd contract float %219, %222
  %224 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %225 = load float, float addrspace(3)* %84, align 4, !tbaa !7
  %226 = fmul contract float %224, %225
  %227 = fadd contract float %223, %226
  %228 = load float, float addrspace(3)* %85, align 8, !tbaa !7
  %229 = load float, float addrspace(3)* %86, align 4, !tbaa !7
  %230 = fmul contract float %228, %229
  %231 = fadd contract float %227, %230
  %232 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %233 = load float, float addrspace(3)* %88, align 4, !tbaa !7
  %234 = fmul contract float %232, %233
  %235 = fadd contract float %231, %234
  %236 = load float, float addrspace(3)* %89, align 16, !tbaa !7
  %237 = load float, float addrspace(3)* %90, align 4, !tbaa !7
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %235, %238
  %240 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %241 = load float, float addrspace(3)* %92, align 4, !tbaa !7
  %242 = fmul contract float %240, %241
  %243 = fadd contract float %239, %242
  %244 = load float, float addrspace(3)* %93, align 8, !tbaa !7
  %245 = load float, float addrspace(3)* %94, align 4, !tbaa !7
  %246 = fmul contract float %244, %245
  %247 = fadd contract float %243, %246
  %248 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %249 = load float, float addrspace(3)* %96, align 4, !tbaa !7
  %250 = fmul contract float %248, %249
  %251 = fadd contract float %247, %250
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %252 = add nuw nsw i32 %101, 1
  %253 = icmp eq i32 %101, %27
  br i1 %253, label %97, label %99, !llvm.loop !11

254:                                              ; preds = %97
  %255 = add i32 %25, %24
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %6, i64 %256
  store float %251, float addrspace(1)* %257, align 4, !tbaa !7
  br label %258

258:                                              ; preds = %254, %97
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
