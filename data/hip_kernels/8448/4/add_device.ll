; ModuleID = '../data/hip_kernels/8448/4/main.cu'
source_filename = "../data/hip_kernels/8448/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3addPfS_S_E9blockData = internal unnamed_addr addrspace(3) global [18 x [18 x [3 x float]]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3addPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, 5
  %22 = add nsw i32 %21, %12
  %23 = icmp sgt i32 %12, 0
  %24 = icmp sgt i32 %20, 0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %29, label %26

26:                                               ; preds = %3
  %27 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %11, i32 %19, i32 0
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %11, i32 %19, i32 1
  store float 0.000000e+00, float addrspace(3)* %28, align 4, !tbaa !7
  br label %45

29:                                               ; preds = %3
  %30 = mul i32 %22, 3
  %31 = add i32 %30, -18
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %11, i32 %19, i32 0
  store float %34, float addrspace(3)* %35, align 4, !tbaa !7
  %36 = add i32 %30, -17
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %11, i32 %19, i32 1
  store float %39, float addrspace(3)* %40, align 4, !tbaa !7
  %41 = add i32 %30, -16
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %45

45:                                               ; preds = %26, %29
  %46 = phi float [ 0.000000e+00, %26 ], [ %44, %29 ]
  %47 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %11, i32 %19, i32 2
  store float %46, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = icmp slt i32 %12, 4
  %49 = select i1 %48, i1 %24, i1 false
  br i1 %49, label %54, label %50

50:                                               ; preds = %45
  %51 = add nuw nsw i32 %11, 2
  %52 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %51, i32 0
  store float 0.000000e+00, float addrspace(3)* %52, align 4, !tbaa !7
  %53 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %51, i32 1
  store float 0.000000e+00, float addrspace(3)* %53, align 4, !tbaa !7
  br label %71

54:                                               ; preds = %45
  %55 = mul i32 %22, 3
  %56 = add i32 %55, -12
  %57 = add nuw nsw i32 %11, 2
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %57, i32 0
  store float %60, float addrspace(3)* %61, align 4, !tbaa !7
  %62 = add i32 %55, -11
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %57, i32 1
  store float %65, float addrspace(3)* %66, align 4, !tbaa !7
  %67 = add i32 %55, -10
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %71

71:                                               ; preds = %50, %54
  %72 = phi i32 [ %51, %50 ], [ %57, %54 ]
  %73 = phi float [ 0.000000e+00, %50 ], [ %70, %54 ]
  %74 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %72, i32 2
  store float %73, float addrspace(3)* %74, align 4, !tbaa !7
  %75 = icmp slt i32 %20, 4
  %76 = select i1 %23, i1 %75, i1 false
  br i1 %76, label %81, label %77

77:                                               ; preds = %71
  %78 = add nuw nsw i32 %19, 2
  %79 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %78, i32 %11, i32 0
  store float 0.000000e+00, float addrspace(3)* %79, align 4, !tbaa !7
  %80 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %78, i32 %11, i32 1
  store float 0.000000e+00, float addrspace(3)* %80, align 4, !tbaa !7
  br label %98

81:                                               ; preds = %71
  %82 = mul i32 %22, 3
  %83 = add i32 %82, 12
  %84 = add nuw nsw i32 %19, 2
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %84, i32 %11, i32 0
  store float %87, float addrspace(3)* %88, align 4, !tbaa !7
  %89 = add i32 %82, 13
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %84, i32 %11, i32 1
  store float %92, float addrspace(3)* %93, align 4, !tbaa !7
  %94 = add i32 %82, 14
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %98

98:                                               ; preds = %77, %81
  %99 = phi i32 [ %78, %77 ], [ %84, %81 ]
  %100 = phi float [ 0.000000e+00, %77 ], [ %97, %81 ]
  %101 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %99, i32 %11, i32 2
  store float %100, float addrspace(3)* %101, align 4, !tbaa !7
  %102 = select i1 %48, i1 %75, i1 false
  br i1 %102, label %110, label %103

103:                                              ; preds = %98
  %104 = add nuw nsw i32 %19, 2
  %105 = add nuw nsw i32 %11, 2
  %106 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %104, i32 %105, i32 0
  store float 0.000000e+00, float addrspace(3)* %106, align 4, !tbaa !7
  %107 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %104, i32 %105, i32 1
  store float 0.000000e+00, float addrspace(3)* %107, align 4, !tbaa !7
  %108 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %104, i32 %105, i32 2
  store float 0.000000e+00, float addrspace(3)* %108, align 4, !tbaa !7
  %109 = mul nsw i32 %22, 3
  br label %129

110:                                              ; preds = %98
  %111 = mul i32 %22, 3
  %112 = add i32 %111, 18
  %113 = add nuw nsw i32 %19, 2
  %114 = add nuw nsw i32 %11, 2
  %115 = sext i32 %112 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %113, i32 %114, i32 0
  store float %117, float addrspace(3)* %118, align 4, !tbaa !7
  %119 = add i32 %111, 19
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %113, i32 %114, i32 1
  store float %122, float addrspace(3)* %123, align 4, !tbaa !7
  %124 = add i32 %111, 20
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %113, i32 %114, i32 2
  store float %127, float addrspace(3)* %128, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %103, %110
  %130 = phi i32 [ %105, %103 ], [ %114, %110 ]
  %131 = phi i32 [ %104, %103 ], [ %113, %110 ]
  %132 = phi i32 [ %109, %103 ], [ %111, %110 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %133
  %135 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %11, i32 0
  %136 = load float, float addrspace(3)* %135, align 4, !tbaa !7
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 8
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %139 = fmul contract float %136, %138
  %140 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %141 = fadd contract float %140, %139
  store float %141, float addrspace(1)* %134, align 4, !tbaa !7
  %142 = add nuw nsw i32 %11, 1
  %143 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %142, i32 0
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 7
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fmul contract float %144, %146
  %148 = fadd contract float %141, %147
  store float %148, float addrspace(1)* %134, align 4, !tbaa !7
  %149 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %130, i32 0
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !7
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 6
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %153 = fmul contract float %150, %152
  %154 = fadd contract float %148, %153
  store float %154, float addrspace(1)* %134, align 4, !tbaa !7
  %155 = add nuw nsw i32 %19, 1
  %156 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %11, i32 0
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !7
  %158 = getelementptr inbounds float, float addrspace(1)* %1, i64 5
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %160 = fmul contract float %157, %159
  %161 = fadd contract float %154, %160
  store float %161, float addrspace(1)* %134, align 4, !tbaa !7
  %162 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %142, i32 0
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !7
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 4
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %166 = fmul contract float %163, %165
  %167 = fadd contract float %161, %166
  store float %167, float addrspace(1)* %134, align 4, !tbaa !7
  %168 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %130, i32 0
  %169 = load float, float addrspace(3)* %168, align 4, !tbaa !7
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 3
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = fmul contract float %169, %171
  %173 = fadd contract float %167, %172
  store float %173, float addrspace(1)* %134, align 4, !tbaa !7
  %174 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %11, i32 0
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !7
  %176 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %178 = fmul contract float %175, %177
  %179 = fadd contract float %173, %178
  store float %179, float addrspace(1)* %134, align 4, !tbaa !7
  %180 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %142, i32 0
  %181 = load float, float addrspace(3)* %180, align 4, !tbaa !7
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7
  %184 = fmul contract float %181, %183
  %185 = fadd contract float %179, %184
  store float %185, float addrspace(1)* %134, align 4, !tbaa !7
  %186 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %130, i32 0
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !7
  %188 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %189 = fmul contract float %187, %188
  %190 = fadd contract float %185, %189
  store float %190, float addrspace(1)* %134, align 4, !tbaa !7
  %191 = add nsw i32 %132, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %11, i32 1
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !7
  %196 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %197 = fmul contract float %195, %196
  %198 = load float, float addrspace(1)* %193, align 4, !tbaa !7
  %199 = fadd contract float %198, %197
  store float %199, float addrspace(1)* %193, align 4, !tbaa !7
  %200 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %142, i32 1
  %201 = load float, float addrspace(3)* %200, align 4, !tbaa !7
  %202 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %203 = fmul contract float %201, %202
  %204 = fadd contract float %199, %203
  store float %204, float addrspace(1)* %193, align 4, !tbaa !7
  %205 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %130, i32 1
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !7
  %207 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %208 = fmul contract float %206, %207
  %209 = fadd contract float %204, %208
  store float %209, float addrspace(1)* %193, align 4, !tbaa !7
  %210 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %11, i32 1
  %211 = load float, float addrspace(3)* %210, align 4, !tbaa !7
  %212 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %213 = fmul contract float %211, %212
  %214 = fadd contract float %209, %213
  store float %214, float addrspace(1)* %193, align 4, !tbaa !7
  %215 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %142, i32 1
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !7
  %217 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %218 = fmul contract float %216, %217
  %219 = fadd contract float %214, %218
  store float %219, float addrspace(1)* %193, align 4, !tbaa !7
  %220 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %130, i32 1
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !7
  %222 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %223 = fmul contract float %221, %222
  %224 = fadd contract float %219, %223
  store float %224, float addrspace(1)* %193, align 4, !tbaa !7
  %225 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %11, i32 1
  %226 = load float, float addrspace(3)* %225, align 4, !tbaa !7
  %227 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %228 = fmul contract float %226, %227
  %229 = fadd contract float %224, %228
  store float %229, float addrspace(1)* %193, align 4, !tbaa !7
  %230 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %142, i32 1
  %231 = load float, float addrspace(3)* %230, align 4, !tbaa !7
  %232 = load float, float addrspace(1)* %182, align 4, !tbaa !7
  %233 = fmul contract float %231, %232
  %234 = fadd contract float %229, %233
  store float %234, float addrspace(1)* %193, align 4, !tbaa !7
  %235 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %130, i32 1
  %236 = load float, float addrspace(3)* %235, align 4, !tbaa !7
  %237 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %238 = fmul contract float %236, %237
  %239 = fadd contract float %234, %238
  store float %239, float addrspace(1)* %193, align 4, !tbaa !7
  %240 = add nsw i32 %132, 2
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %2, i64 %241
  %243 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %11, i32 2
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !7
  %245 = load float, float addrspace(1)* %137, align 4, !tbaa !7
  %246 = fmul contract float %244, %245
  %247 = load float, float addrspace(1)* %242, align 4, !tbaa !7
  %248 = fadd contract float %247, %246
  store float %248, float addrspace(1)* %242, align 4, !tbaa !7
  %249 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %142, i32 2
  %250 = load float, float addrspace(3)* %249, align 4, !tbaa !7
  %251 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %252 = fmul contract float %250, %251
  %253 = fadd contract float %248, %252
  store float %253, float addrspace(1)* %242, align 4, !tbaa !7
  %254 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %19, i32 %130, i32 2
  %255 = load float, float addrspace(3)* %254, align 4, !tbaa !7
  %256 = load float, float addrspace(1)* %151, align 4, !tbaa !7
  %257 = fmul contract float %255, %256
  %258 = fadd contract float %253, %257
  store float %258, float addrspace(1)* %242, align 4, !tbaa !7
  %259 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %11, i32 2
  %260 = load float, float addrspace(3)* %259, align 4, !tbaa !7
  %261 = load float, float addrspace(1)* %158, align 4, !tbaa !7
  %262 = fmul contract float %260, %261
  %263 = fadd contract float %258, %262
  store float %263, float addrspace(1)* %242, align 4, !tbaa !7
  %264 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %142, i32 2
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !7
  %266 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %267 = fmul contract float %265, %266
  %268 = fadd contract float %263, %267
  store float %268, float addrspace(1)* %242, align 4, !tbaa !7
  %269 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %155, i32 %130, i32 2
  %270 = load float, float addrspace(3)* %269, align 4, !tbaa !7
  %271 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %272 = fmul contract float %270, %271
  %273 = fadd contract float %268, %272
  store float %273, float addrspace(1)* %242, align 4, !tbaa !7
  %274 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %11, i32 2
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !7
  %276 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %277 = fmul contract float %275, %276
  %278 = fadd contract float %273, %277
  store float %278, float addrspace(1)* %242, align 4, !tbaa !7
  %279 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %142, i32 2
  %280 = load float, float addrspace(3)* %279, align 4, !tbaa !7
  %281 = load float, float addrspace(1)* %182, align 4, !tbaa !7
  %282 = fmul contract float %280, %281
  %283 = fadd contract float %278, %282
  store float %283, float addrspace(1)* %242, align 4, !tbaa !7
  %284 = getelementptr inbounds [18 x [18 x [3 x float]]], [18 x [18 x [3 x float]]] addrspace(3)* @_ZZ3addPfS_S_E9blockData, i32 0, i32 %131, i32 %130, i32 2
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !7
  %286 = load float, float addrspace(1)* %1, align 4, !tbaa !7
  %287 = fmul contract float %285, %286
  %288 = fadd contract float %283, %287
  store float %288, float addrspace(1)* %242, align 4, !tbaa !7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
