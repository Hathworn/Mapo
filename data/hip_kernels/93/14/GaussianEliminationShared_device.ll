; ModuleID = '../data/hip_kernels/93/14/main.cu'
source_filename = "../data/hip_kernels/93/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m = internal unnamed_addr addrspace(3) global [9 x [9 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25GaussianEliminationSharediPfPKfS1_S_(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %69

8:                                                ; preds = %5
  %9 = and i32 %0, 7
  %10 = icmp ult i32 %0, 8
  %11 = and i32 %0, -8
  %12 = icmp eq i32 %9, 0
  br label %13

13:                                               ; preds = %8, %31
  %14 = phi i32 [ %32, %31 ], [ 0, %8 ]
  br i1 %10, label %22, label %34

15:                                               ; preds = %31
  br i1 %7, label %16, label %69

16:                                               ; preds = %15
  %17 = mul nsw i32 %6, %0
  %18 = and i32 %0, 7
  %19 = icmp ult i32 %0, 8
  br i1 %19, label %55, label %20

20:                                               ; preds = %16
  %21 = and i32 %0, -8
  br label %79

22:                                               ; preds = %34, %13
  %23 = phi i32 [ 0, %13 ], [ %52, %34 ]
  br i1 %12, label %31, label %24

24:                                               ; preds = %22, %24
  %25 = phi i32 [ %28, %24 ], [ %23, %22 ]
  %26 = phi i32 [ %29, %24 ], [ 0, %22 ]
  %27 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %25
  store float 0.000000e+00, float addrspace(3)* %27, align 4, !tbaa !4
  %28 = add nuw nsw i32 %25, 1
  %29 = add i32 %26, 1
  %30 = icmp eq i32 %29, %9
  br i1 %30, label %31, label %24, !llvm.loop !8

31:                                               ; preds = %24, %22
  %32 = add nuw nsw i32 %14, 1
  %33 = icmp eq i32 %32, %0
  br i1 %33, label %15, label %13, !llvm.loop !10

34:                                               ; preds = %13, %34
  %35 = phi i32 [ %52, %34 ], [ 0, %13 ]
  %36 = phi i32 [ %53, %34 ], [ 0, %13 ]
  %37 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %35
  store float 0.000000e+00, float addrspace(3)* %37, align 4, !tbaa !4
  %38 = or i32 %35, 1
  %39 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %38
  store float 0.000000e+00, float addrspace(3)* %39, align 4, !tbaa !4
  %40 = or i32 %35, 2
  %41 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %40
  store float 0.000000e+00, float addrspace(3)* %41, align 4, !tbaa !4
  %42 = or i32 %35, 3
  %43 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %42
  store float 0.000000e+00, float addrspace(3)* %43, align 4, !tbaa !4
  %44 = or i32 %35, 4
  %45 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %44
  store float 0.000000e+00, float addrspace(3)* %45, align 4, !tbaa !4
  %46 = or i32 %35, 5
  %47 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %46
  store float 0.000000e+00, float addrspace(3)* %47, align 4, !tbaa !4
  %48 = or i32 %35, 6
  %49 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %48
  store float 0.000000e+00, float addrspace(3)* %49, align 4, !tbaa !4
  %50 = or i32 %35, 7
  %51 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %14, i32 %50
  store float 0.000000e+00, float addrspace(3)* %51, align 4, !tbaa !4
  %52 = add nuw nsw i32 %35, 8
  %53 = add i32 %36, 8
  %54 = icmp eq i32 %53, %11
  br i1 %54, label %22, label %34, !llvm.loop !12

55:                                               ; preds = %79, %16
  %56 = phi i32 [ 0, %16 ], [ %129, %79 ]
  %57 = icmp eq i32 %18, 0
  br i1 %57, label %69, label %58

58:                                               ; preds = %55, %58
  %59 = phi i32 [ %66, %58 ], [ %56, %55 ]
  %60 = phi i32 [ %67, %58 ], [ 0, %55 ]
  %61 = add nsw i32 %59, %17
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !4, !amdgpu.noclobber !13
  %65 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %59, i32 %59
  store float %64, float addrspace(3)* %65, align 4, !tbaa !4
  %66 = add nuw nsw i32 %59, 1
  %67 = add i32 %60, 1
  %68 = icmp eq i32 %67, %18
  br i1 %68, label %69, label %58, !llvm.loop !14

69:                                               ; preds = %55, %58, %5, %15
  %70 = add i32 %0, -1
  %71 = icmp sgt i32 %0, 1
  br i1 %71, label %72, label %153

72:                                               ; preds = %69
  %73 = mul nsw i32 %6, %0
  %74 = add i32 %0, -2
  %75 = and i32 %70, 3
  %76 = icmp ult i32 %74, 3
  br i1 %76, label %132, label %77

77:                                               ; preds = %72
  %78 = and i32 %70, -4
  br label %160

79:                                               ; preds = %79, %20
  %80 = phi i32 [ 0, %20 ], [ %129, %79 ]
  %81 = phi i32 [ 0, %20 ], [ %130, %79 ]
  %82 = add nsw i32 %80, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !4, !amdgpu.noclobber !13
  %86 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %80, i32 %80
  store float %85, float addrspace(3)* %86, align 16, !tbaa !4
  %87 = or i32 %80, 1
  %88 = add nsw i32 %87, %17
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !4, !amdgpu.noclobber !13
  %92 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %87, i32 %87
  store float %91, float addrspace(3)* %92, align 8, !tbaa !4
  %93 = or i32 %80, 2
  %94 = add nsw i32 %93, %17
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !4, !amdgpu.noclobber !13
  %98 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %93, i32 %93
  store float %97, float addrspace(3)* %98, align 16, !tbaa !4
  %99 = or i32 %80, 3
  %100 = add nsw i32 %99, %17
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !4, !amdgpu.noclobber !13
  %104 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %99, i32 %99
  store float %103, float addrspace(3)* %104, align 8, !tbaa !4
  %105 = or i32 %80, 4
  %106 = add nsw i32 %105, %17
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !4, !amdgpu.noclobber !13
  %110 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %105, i32 %105
  store float %109, float addrspace(3)* %110, align 16, !tbaa !4
  %111 = or i32 %80, 5
  %112 = add nsw i32 %111, %17
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !4, !amdgpu.noclobber !13
  %116 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %111, i32 %111
  store float %115, float addrspace(3)* %116, align 8, !tbaa !4
  %117 = or i32 %80, 6
  %118 = add nsw i32 %117, %17
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !4, !amdgpu.noclobber !13
  %122 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %117, i32 %117
  store float %121, float addrspace(3)* %122, align 16, !tbaa !4
  %123 = or i32 %80, 7
  %124 = add nsw i32 %123, %17
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !4, !amdgpu.noclobber !13
  %128 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %123, i32 %123
  store float %127, float addrspace(3)* %128, align 8, !tbaa !4
  %129 = add nuw nsw i32 %80, 8
  %130 = add i32 %81, 8
  %131 = icmp eq i32 %130, %21
  br i1 %131, label %55, label %79, !llvm.loop !15

132:                                              ; preds = %160, %72
  %133 = phi i32 [ 0, %72 ], [ %208, %160 ]
  %134 = icmp eq i32 %75, 0
  br i1 %134, label %153, label %135

135:                                              ; preds = %132, %135
  %136 = phi i32 [ %144, %135 ], [ %133, %132 ]
  %137 = phi i32 [ %151, %135 ], [ 0, %132 ]
  %138 = add i32 %136, %73
  %139 = shl i32 %138, 1
  %140 = add nuw nsw i32 %139, 1
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !4, !amdgpu.noclobber !13
  %144 = add nuw nsw i32 %136, 1
  %145 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %136, i32 %144
  store float %143, float addrspace(3)* %145, align 4, !tbaa !4
  %146 = add nsw i32 %139, 2
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %3, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !4, !amdgpu.noclobber !13
  %150 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %144, i32 %136
  store float %149, float addrspace(3)* %150, align 4, !tbaa !4
  %151 = add i32 %137, 1
  %152 = icmp eq i32 %151, %75
  br i1 %152, label %153, label %135, !llvm.loop !16

153:                                              ; preds = %132, %135, %69
  br i1 %7, label %154, label %219

154:                                              ; preds = %153
  %155 = mul nsw i32 %6, %0
  %156 = and i32 %0, 7
  %157 = icmp ult i32 %0, 8
  %158 = and i32 %0, -8
  %159 = icmp eq i32 %156, 0
  br label %222

160:                                              ; preds = %160, %77
  %161 = phi i32 [ 0, %77 ], [ %208, %160 ]
  %162 = phi i32 [ 0, %77 ], [ %215, %160 ]
  %163 = add i32 %161, %73
  %164 = shl i32 %163, 1
  %165 = add nuw nsw i32 %164, 1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %3, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !4, !amdgpu.noclobber !13
  %169 = or i32 %161, 1
  %170 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %161, i32 %169
  store float %168, float addrspace(3)* %170, align 4, !tbaa !4
  %171 = add nsw i32 %164, 2
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %3, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !4, !amdgpu.noclobber !13
  %175 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %169, i32 %161
  store float %174, float addrspace(3)* %175, align 4, !tbaa !4
  %176 = add i32 %169, %73
  %177 = shl i32 %176, 1
  %178 = add nuw nsw i32 %177, 1
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %3, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !4, !amdgpu.noclobber !13
  %182 = or i32 %161, 2
  %183 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %169, i32 %182
  store float %181, float addrspace(3)* %183, align 4, !tbaa !4
  %184 = add nsw i32 %177, 2
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds float, float addrspace(1)* %3, i64 %185
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !4, !amdgpu.noclobber !13
  %188 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %182, i32 %169
  store float %187, float addrspace(3)* %188, align 4, !tbaa !4
  %189 = add i32 %182, %73
  %190 = shl i32 %189, 1
  %191 = add nuw nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %3, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !4, !amdgpu.noclobber !13
  %195 = or i32 %161, 3
  %196 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %182, i32 %195
  store float %194, float addrspace(3)* %196, align 4, !tbaa !4
  %197 = add nsw i32 %190, 2
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %3, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !4, !amdgpu.noclobber !13
  %201 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %195, i32 %182
  store float %200, float addrspace(3)* %201, align 4, !tbaa !4
  %202 = add i32 %195, %73
  %203 = shl i32 %202, 1
  %204 = add nuw nsw i32 %203, 1
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %3, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !4, !amdgpu.noclobber !13
  %208 = add nuw nsw i32 %161, 4
  %209 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %195, i32 %208
  store float %207, float addrspace(3)* %209, align 4, !tbaa !4
  %210 = add nsw i32 %203, 2
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %3, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !4, !amdgpu.noclobber !13
  %214 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %208, i32 %195
  store float %213, float addrspace(3)* %214, align 4, !tbaa !4
  %215 = add nuw nsw i32 %162, 4
  %216 = icmp eq i32 %215, %78
  br i1 %216, label %132, label %160, !llvm.loop !17

217:                                              ; preds = %255, %222
  %218 = icmp eq i32 %224, %0
  br i1 %218, label %219, label %222, !llvm.loop !18

219:                                              ; preds = %217, %153
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %7, label %220, label %382

220:                                              ; preds = %219
  %221 = mul nsw i32 %6, %0
  br label %353

222:                                              ; preds = %154, %217
  %223 = phi i32 [ 0, %154 ], [ %224, %217 ]
  %224 = add nuw nsw i32 %223, 1
  %225 = icmp slt i32 %224, %0
  br i1 %225, label %226, label %217

226:                                              ; preds = %222
  %227 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %223
  %228 = add nsw i32 %223, %155
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %4, i64 %229
  br label %231

231:                                              ; preds = %226, %255
  %232 = phi i32 [ %224, %226 ], [ %266, %255 ]
  %233 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %223
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !4
  %235 = load float, float addrspace(3)* %227, align 4, !tbaa !4
  %236 = fdiv contract float %234, %235
  %237 = fpext float %236 to double
  br i1 %157, label %238, label %268

238:                                              ; preds = %268, %231
  %239 = phi i32 [ 0, %231 ], [ %350, %268 ]
  br i1 %159, label %255, label %240

240:                                              ; preds = %238, %240
  %241 = phi i32 [ %252, %240 ], [ %239, %238 ]
  %242 = phi i32 [ %253, %240 ], [ 0, %238 ]
  %243 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %241
  %244 = load float, float addrspace(3)* %243, align 4, !tbaa !4
  %245 = fpext float %244 to double
  %246 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %241
  %247 = load float, float addrspace(3)* %246, align 4, !tbaa !4
  %248 = fpext float %247 to double
  %249 = fmul contract double %237, %248
  %250 = fsub contract double %245, %249
  %251 = fptrunc double %250 to float
  store float %251, float addrspace(3)* %243, align 4, !tbaa !4
  %252 = add nuw nsw i32 %241, 1
  %253 = add i32 %242, 1
  %254 = icmp eq i32 %253, %156
  br i1 %254, label %255, label %240, !llvm.loop !19

255:                                              ; preds = %240, %238
  %256 = add nsw i32 %232, %155
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds float, float addrspace(1)* %4, i64 %257
  %259 = load float, float addrspace(1)* %258, align 4, !tbaa !4
  %260 = fpext float %259 to double
  %261 = load float, float addrspace(1)* %230, align 4, !tbaa !4
  %262 = fpext float %261 to double
  %263 = fmul contract double %237, %262
  %264 = fsub contract double %260, %263
  %265 = fptrunc double %264 to float
  store float %265, float addrspace(1)* %258, align 4, !tbaa !4
  %266 = add nuw nsw i32 %232, 1
  %267 = icmp slt i32 %266, %0
  br i1 %267, label %231, label %217, !llvm.loop !20

268:                                              ; preds = %231, %268
  %269 = phi i32 [ %350, %268 ], [ 0, %231 ]
  %270 = phi i32 [ %351, %268 ], [ 0, %231 ]
  %271 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %269
  %272 = load float, float addrspace(3)* %271, align 4, !tbaa !4
  %273 = fpext float %272 to double
  %274 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %269
  %275 = load float, float addrspace(3)* %274, align 4, !tbaa !4
  %276 = fpext float %275 to double
  %277 = fmul contract double %237, %276
  %278 = fsub contract double %273, %277
  %279 = fptrunc double %278 to float
  store float %279, float addrspace(3)* %271, align 4, !tbaa !4
  %280 = or i32 %269, 1
  %281 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %280
  %282 = load float, float addrspace(3)* %281, align 4, !tbaa !4
  %283 = fpext float %282 to double
  %284 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %280
  %285 = load float, float addrspace(3)* %284, align 4, !tbaa !4
  %286 = fpext float %285 to double
  %287 = fmul contract double %237, %286
  %288 = fsub contract double %283, %287
  %289 = fptrunc double %288 to float
  store float %289, float addrspace(3)* %281, align 4, !tbaa !4
  %290 = or i32 %269, 2
  %291 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %290
  %292 = load float, float addrspace(3)* %291, align 4, !tbaa !4
  %293 = fpext float %292 to double
  %294 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %290
  %295 = load float, float addrspace(3)* %294, align 4, !tbaa !4
  %296 = fpext float %295 to double
  %297 = fmul contract double %237, %296
  %298 = fsub contract double %293, %297
  %299 = fptrunc double %298 to float
  store float %299, float addrspace(3)* %291, align 4, !tbaa !4
  %300 = or i32 %269, 3
  %301 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %300
  %302 = load float, float addrspace(3)* %301, align 4, !tbaa !4
  %303 = fpext float %302 to double
  %304 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %300
  %305 = load float, float addrspace(3)* %304, align 4, !tbaa !4
  %306 = fpext float %305 to double
  %307 = fmul contract double %237, %306
  %308 = fsub contract double %303, %307
  %309 = fptrunc double %308 to float
  store float %309, float addrspace(3)* %301, align 4, !tbaa !4
  %310 = or i32 %269, 4
  %311 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %310
  %312 = load float, float addrspace(3)* %311, align 4, !tbaa !4
  %313 = fpext float %312 to double
  %314 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %310
  %315 = load float, float addrspace(3)* %314, align 4, !tbaa !4
  %316 = fpext float %315 to double
  %317 = fmul contract double %237, %316
  %318 = fsub contract double %313, %317
  %319 = fptrunc double %318 to float
  store float %319, float addrspace(3)* %311, align 4, !tbaa !4
  %320 = or i32 %269, 5
  %321 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %320
  %322 = load float, float addrspace(3)* %321, align 4, !tbaa !4
  %323 = fpext float %322 to double
  %324 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %320
  %325 = load float, float addrspace(3)* %324, align 4, !tbaa !4
  %326 = fpext float %325 to double
  %327 = fmul contract double %237, %326
  %328 = fsub contract double %323, %327
  %329 = fptrunc double %328 to float
  store float %329, float addrspace(3)* %321, align 4, !tbaa !4
  %330 = or i32 %269, 6
  %331 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %330
  %332 = load float, float addrspace(3)* %331, align 4, !tbaa !4
  %333 = fpext float %332 to double
  %334 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %330
  %335 = load float, float addrspace(3)* %334, align 4, !tbaa !4
  %336 = fpext float %335 to double
  %337 = fmul contract double %237, %336
  %338 = fsub contract double %333, %337
  %339 = fptrunc double %338 to float
  store float %339, float addrspace(3)* %331, align 4, !tbaa !4
  %340 = or i32 %269, 7
  %341 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %232, i32 %340
  %342 = load float, float addrspace(3)* %341, align 4, !tbaa !4
  %343 = fpext float %342 to double
  %344 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %223, i32 %340
  %345 = load float, float addrspace(3)* %344, align 4, !tbaa !4
  %346 = fpext float %345 to double
  %347 = fmul contract double %237, %346
  %348 = fsub contract double %343, %347
  %349 = fptrunc double %348 to float
  store float %349, float addrspace(3)* %341, align 4, !tbaa !4
  %350 = add nuw nsw i32 %269, 8
  %351 = add i32 %270, 8
  %352 = icmp eq i32 %351, %158
  br i1 %352, label %238, label %268, !llvm.loop !21

353:                                              ; preds = %220, %383
  %354 = phi i32 [ 0, %220 ], [ %399, %383 ]
  %355 = phi i32 [ %70, %220 ], [ %397, %383 ]
  %356 = icmp ult i32 %355, %0
  br i1 %356, label %357, label %383

357:                                              ; preds = %353
  %358 = add i32 %354, 1
  %359 = and i32 %358, 7
  %360 = icmp eq i32 %359, 0
  br i1 %360, label %377, label %361

361:                                              ; preds = %357, %361
  %362 = phi i32 [ %374, %361 ], [ %355, %357 ]
  %363 = phi double [ %373, %361 ], [ 0.000000e+00, %357 ]
  %364 = phi i32 [ %375, %361 ], [ 0, %357 ]
  %365 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %362
  %366 = load float, float addrspace(3)* %365, align 4, !tbaa !4
  %367 = add i32 %362, %221
  %368 = zext i32 %367 to i64
  %369 = getelementptr inbounds float, float addrspace(1)* %1, i64 %368
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !4
  %371 = fmul contract float %366, %370
  %372 = fpext float %371 to double
  %373 = fadd contract double %363, %372
  %374 = add nuw i32 %362, 1
  %375 = add i32 %364, 1
  %376 = icmp eq i32 %375, %359
  br i1 %376, label %377, label %361, !llvm.loop !22

377:                                              ; preds = %361, %357
  %378 = phi double [ undef, %357 ], [ %373, %361 ]
  %379 = phi i32 [ %355, %357 ], [ %374, %361 ]
  %380 = phi double [ 0.000000e+00, %357 ], [ %373, %361 ]
  %381 = icmp ult i32 %354, 7
  br i1 %381, label %383, label %400

382:                                              ; preds = %383, %219
  ret void

383:                                              ; preds = %377, %400, %353
  %384 = phi double [ 0.000000e+00, %353 ], [ %378, %377 ], [ %481, %400 ]
  %385 = add nsw i32 %355, %221
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %4, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !4
  %389 = fpext float %388 to double
  %390 = fsub contract double %389, %384
  %391 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %355
  %392 = load float, float addrspace(3)* %391, align 4, !tbaa !4
  %393 = fpext float %392 to double
  %394 = fdiv contract double %390, %393
  %395 = fptrunc double %394 to float
  %396 = getelementptr inbounds float, float addrspace(1)* %1, i64 %386
  store float %395, float addrspace(1)* %396, align 4, !tbaa !4
  %397 = add nsw i32 %355, -1
  %398 = icmp sgt i32 %355, 0
  %399 = add i32 %354, 1
  br i1 %398, label %353, label %382, !llvm.loop !23

400:                                              ; preds = %377, %400
  %401 = phi i32 [ %482, %400 ], [ %379, %377 ]
  %402 = phi double [ %481, %400 ], [ %380, %377 ]
  %403 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %401
  %404 = load float, float addrspace(3)* %403, align 4, !tbaa !4
  %405 = add i32 %401, %221
  %406 = zext i32 %405 to i64
  %407 = getelementptr inbounds float, float addrspace(1)* %1, i64 %406
  %408 = load float, float addrspace(1)* %407, align 4, !tbaa !4
  %409 = fmul contract float %404, %408
  %410 = fpext float %409 to double
  %411 = fadd contract double %402, %410
  %412 = add nuw i32 %401, 1
  %413 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %412
  %414 = load float, float addrspace(3)* %413, align 4, !tbaa !4
  %415 = add i32 %412, %221
  %416 = zext i32 %415 to i64
  %417 = getelementptr inbounds float, float addrspace(1)* %1, i64 %416
  %418 = load float, float addrspace(1)* %417, align 4, !tbaa !4
  %419 = fmul contract float %414, %418
  %420 = fpext float %419 to double
  %421 = fadd contract double %411, %420
  %422 = add nuw i32 %401, 2
  %423 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %422
  %424 = load float, float addrspace(3)* %423, align 4, !tbaa !4
  %425 = add i32 %422, %221
  %426 = zext i32 %425 to i64
  %427 = getelementptr inbounds float, float addrspace(1)* %1, i64 %426
  %428 = load float, float addrspace(1)* %427, align 4, !tbaa !4
  %429 = fmul contract float %424, %428
  %430 = fpext float %429 to double
  %431 = fadd contract double %421, %430
  %432 = add nuw i32 %401, 3
  %433 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %432
  %434 = load float, float addrspace(3)* %433, align 4, !tbaa !4
  %435 = add i32 %432, %221
  %436 = zext i32 %435 to i64
  %437 = getelementptr inbounds float, float addrspace(1)* %1, i64 %436
  %438 = load float, float addrspace(1)* %437, align 4, !tbaa !4
  %439 = fmul contract float %434, %438
  %440 = fpext float %439 to double
  %441 = fadd contract double %431, %440
  %442 = add nuw i32 %401, 4
  %443 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %442
  %444 = load float, float addrspace(3)* %443, align 4, !tbaa !4
  %445 = add i32 %442, %221
  %446 = zext i32 %445 to i64
  %447 = getelementptr inbounds float, float addrspace(1)* %1, i64 %446
  %448 = load float, float addrspace(1)* %447, align 4, !tbaa !4
  %449 = fmul contract float %444, %448
  %450 = fpext float %449 to double
  %451 = fadd contract double %441, %450
  %452 = add nuw i32 %401, 5
  %453 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %452
  %454 = load float, float addrspace(3)* %453, align 4, !tbaa !4
  %455 = add i32 %452, %221
  %456 = zext i32 %455 to i64
  %457 = getelementptr inbounds float, float addrspace(1)* %1, i64 %456
  %458 = load float, float addrspace(1)* %457, align 4, !tbaa !4
  %459 = fmul contract float %454, %458
  %460 = fpext float %459 to double
  %461 = fadd contract double %451, %460
  %462 = add nuw i32 %401, 6
  %463 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %462
  %464 = load float, float addrspace(3)* %463, align 4, !tbaa !4
  %465 = add i32 %462, %221
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds float, float addrspace(1)* %1, i64 %466
  %468 = load float, float addrspace(1)* %467, align 4, !tbaa !4
  %469 = fmul contract float %464, %468
  %470 = fpext float %469 to double
  %471 = fadd contract double %461, %470
  %472 = add nuw i32 %401, 7
  %473 = getelementptr inbounds [9 x [9 x float]], [9 x [9 x float]] addrspace(3)* @_ZZ25GaussianEliminationSharediPfPKfS1_S_E8shared_m, i32 0, i32 %355, i32 %472
  %474 = load float, float addrspace(3)* %473, align 4, !tbaa !4
  %475 = add i32 %472, %221
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds float, float addrspace(1)* %1, i64 %476
  %478 = load float, float addrspace(1)* %477, align 4, !tbaa !4
  %479 = fmul contract float %474, %478
  %480 = fpext float %479 to double
  %481 = fadd contract double %471, %480
  %482 = add nuw i32 %401, 8
  %483 = icmp eq i32 %482, %0
  br i1 %483, label %383, label %400, !llvm.loop !24
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = !{}
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !11}
!24 = distinct !{!24, !11}
