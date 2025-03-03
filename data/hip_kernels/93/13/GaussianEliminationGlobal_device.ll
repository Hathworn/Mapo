; ModuleID = '../data/hip_kernels/93/13/main.cu'
source_filename = "../data/hip_kernels/93/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25GaussianEliminationGlobaliPfPKfS1_S_i(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, i32 %5) local_unnamed_addr #1 {
  %7 = alloca [180 x [180 x float]], align 16, addrspace(5)
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %16, %0
  %18 = bitcast [180 x [180 x float]] addrspace(5)* %7 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 129600, i8 addrspace(5)* %18) #4
  %19 = add i32 %17, %0
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %6, %51
  %22 = phi i32 [ %56, %51 ], [ %17, %6 ]
  br label %58

23:                                               ; preds = %51, %6
  %24 = add nsw i32 %19, -1
  %25 = icmp slt i32 %17, %24
  br i1 %25, label %26, label %63

26:                                               ; preds = %23
  %27 = add i32 %0, 7
  %28 = add i32 %0, -2
  %29 = and i32 %27, 7
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %48, label %31

31:                                               ; preds = %26, %31
  %32 = phi i32 [ %39, %31 ], [ %17, %26 ]
  %33 = phi i32 [ %46, %31 ], [ 0, %26 ]
  %34 = shl nsw i32 %32, 1
  %35 = add nuw nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %32, 1
  %40 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %32, i32 %39
  store float %38, float addrspace(5)* %40, align 4, !tbaa !7
  %41 = add nsw i32 %34, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %39, i32 %32
  store float %44, float addrspace(5)* %45, align 4, !tbaa !7
  %46 = add i32 %33, 1
  %47 = icmp eq i32 %46, %29
  br i1 %47, label %48, label %31, !llvm.loop !11

48:                                               ; preds = %31, %26
  %49 = phi i32 [ %17, %26 ], [ %39, %31 ]
  %50 = icmp ult i32 %28, 7
  br i1 %50, label %63, label %64

51:                                               ; preds = %58
  %52 = sext i32 %22 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %22, i32 %22
  store float %54, float addrspace(5)* %55, align 4, !tbaa !7
  %56 = add nsw i32 %22, 1
  %57 = icmp slt i32 %56, %19
  br i1 %57, label %21, label %23, !llvm.loop !13

58:                                               ; preds = %21, %58
  %59 = phi i32 [ %61, %58 ], [ %17, %21 ]
  %60 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %22, i32 %59
  store float 0.000000e+00, float addrspace(5)* %60, align 4, !tbaa !7
  %61 = add nsw i32 %59, 1
  %62 = icmp slt i32 %61, %19
  br i1 %62, label %58, label %51, !llvm.loop !15

63:                                               ; preds = %48, %64, %23
  br i1 %20, label %165, label %164

64:                                               ; preds = %48, %64
  %65 = phi i32 [ %155, %64 ], [ %49, %48 ]
  %66 = shl nsw i32 %65, 1
  %67 = add nuw nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = add nsw i32 %65, 1
  %72 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %65, i32 %71
  store float %70, float addrspace(5)* %72, align 4, !tbaa !7
  %73 = add nsw i32 %66, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %71, i32 %65
  store float %76, float addrspace(5)* %77, align 4, !tbaa !7
  %78 = shl nsw i32 %71, 1
  %79 = add nuw nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = add nsw i32 %65, 2
  %84 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %71, i32 %83
  store float %82, float addrspace(5)* %84, align 4, !tbaa !7
  %85 = add nsw i32 %78, 2
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %83, i32 %71
  store float %88, float addrspace(5)* %89, align 4, !tbaa !7
  %90 = shl nsw i32 %83, 1
  %91 = add nuw nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %3, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = add nsw i32 %65, 3
  %96 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %83, i32 %95
  store float %94, float addrspace(5)* %96, align 4, !tbaa !7
  %97 = add nsw i32 %90, 2
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %95, i32 %83
  store float %100, float addrspace(5)* %101, align 4, !tbaa !7
  %102 = shl nsw i32 %95, 1
  %103 = add nuw nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %3, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = add nsw i32 %65, 4
  %108 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %95, i32 %107
  store float %106, float addrspace(5)* %108, align 4, !tbaa !7
  %109 = add nsw i32 %102, 2
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %3, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %107, i32 %95
  store float %112, float addrspace(5)* %113, align 4, !tbaa !7
  %114 = shl nsw i32 %107, 1
  %115 = add nuw nsw i32 %114, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %3, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = add nsw i32 %65, 5
  %120 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %107, i32 %119
  store float %118, float addrspace(5)* %120, align 4, !tbaa !7
  %121 = add nsw i32 %114, 2
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %3, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %119, i32 %107
  store float %124, float addrspace(5)* %125, align 4, !tbaa !7
  %126 = shl nsw i32 %119, 1
  %127 = add nuw nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %3, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = add nsw i32 %65, 6
  %132 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %119, i32 %131
  store float %130, float addrspace(5)* %132, align 4, !tbaa !7
  %133 = add nsw i32 %126, 2
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %3, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %131, i32 %119
  store float %136, float addrspace(5)* %137, align 4, !tbaa !7
  %138 = shl nsw i32 %131, 1
  %139 = add nuw nsw i32 %138, 1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = add nsw i32 %65, 7
  %144 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %131, i32 %143
  store float %142, float addrspace(5)* %144, align 4, !tbaa !7
  %145 = add nsw i32 %138, 2
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %3, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %143, i32 %131
  store float %148, float addrspace(5)* %149, align 4, !tbaa !7
  %150 = shl nsw i32 %143, 1
  %151 = add nuw nsw i32 %150, 1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %3, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = add nsw i32 %65, 8
  %156 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %143, i32 %155
  store float %154, float addrspace(5)* %156, align 4, !tbaa !7
  %157 = add nsw i32 %150, 2
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %3, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %155, i32 %143
  store float %160, float addrspace(5)* %161, align 4, !tbaa !7
  %162 = icmp eq i32 %155, %24
  br i1 %162, label %63, label %64, !llvm.loop !16

163:                                              ; preds = %181
  br i1 %168, label %165, label %164, !llvm.loop !17

164:                                              ; preds = %165, %163, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %205, label %233

165:                                              ; preds = %63, %163
  %166 = phi i32 [ %167, %163 ], [ %17, %63 ]
  %167 = add nsw i32 %166, 1
  %168 = icmp slt i32 %167, %19
  br i1 %168, label %169, label %164

169:                                              ; preds = %165
  %170 = sext i32 %166 to i64
  %171 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %166, i32 %166
  %172 = getelementptr inbounds float, float addrspace(1)* %4, i64 %170
  br label %173

173:                                              ; preds = %169, %181
  %174 = phi i32 [ %167, %169 ], [ %190, %181 ]
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %174, i32 %166
  %177 = load float, float addrspace(5)* %176, align 4, !tbaa !7
  %178 = load float, float addrspace(5)* %171, align 4, !tbaa !7
  %179 = fdiv contract float %177, %178
  %180 = fpext float %179 to double
  br label %192

181:                                              ; preds = %192
  %182 = getelementptr inbounds float, float addrspace(1)* %4, i64 %175
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !7
  %184 = fpext float %183 to double
  %185 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %186 = fpext float %185 to double
  %187 = fmul contract double %180, %186
  %188 = fsub contract double %184, %187
  %189 = fptrunc double %188 to float
  store float %189, float addrspace(1)* %182, align 4, !tbaa !7
  %190 = add nsw i32 %174, 1
  %191 = icmp slt i32 %190, %19
  br i1 %191, label %173, label %163, !llvm.loop !18

192:                                              ; preds = %173, %192
  %193 = phi i32 [ %203, %192 ], [ %17, %173 ]
  %194 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %174, i32 %193
  %195 = load float, float addrspace(5)* %194, align 4, !tbaa !7
  %196 = fpext float %195 to double
  %197 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %166, i32 %193
  %198 = load float, float addrspace(5)* %197, align 4, !tbaa !7
  %199 = fpext float %198 to double
  %200 = fmul contract double %180, %199
  %201 = fsub contract double %196, %200
  %202 = fptrunc double %201 to float
  store float %202, float addrspace(5)* %194, align 4, !tbaa !7
  %203 = add nsw i32 %193, 1
  %204 = icmp slt i32 %203, %19
  br i1 %204, label %192, label %181, !llvm.loop !19

205:                                              ; preds = %164, %234
  %206 = phi i32 [ %249, %234 ], [ 0, %164 ]
  %207 = phi i32 [ %247, %234 ], [ %24, %164 ]
  %208 = icmp ult i32 %207, %19
  br i1 %208, label %209, label %234

209:                                              ; preds = %205
  %210 = add i32 %206, 1
  %211 = and i32 %210, 7
  %212 = icmp eq i32 %211, 0
  br i1 %212, label %228, label %213

213:                                              ; preds = %209, %213
  %214 = phi i32 [ %225, %213 ], [ %207, %209 ]
  %215 = phi double [ %224, %213 ], [ 0.000000e+00, %209 ]
  %216 = phi i32 [ %226, %213 ], [ 0, %209 ]
  %217 = zext i32 %214 to i64
  %218 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %214
  %219 = load float, float addrspace(5)* %218, align 4, !tbaa !7
  %220 = getelementptr inbounds float, float addrspace(1)* %1, i64 %217
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = fmul contract float %219, %221
  %223 = fpext float %222 to double
  %224 = fadd contract double %215, %223
  %225 = add nuw i32 %214, 1
  %226 = add i32 %216, 1
  %227 = icmp eq i32 %226, %211
  br i1 %227, label %228, label %213, !llvm.loop !20

228:                                              ; preds = %213, %209
  %229 = phi double [ undef, %209 ], [ %224, %213 ]
  %230 = phi i32 [ %207, %209 ], [ %225, %213 ]
  %231 = phi double [ 0.000000e+00, %209 ], [ %224, %213 ]
  %232 = icmp ult i32 %206, 7
  br i1 %232, label %234, label %250

233:                                              ; preds = %234, %164
  call void @llvm.lifetime.end.p5i8(i64 129600, i8 addrspace(5)* %18) #4
  ret void

234:                                              ; preds = %228, %250, %205
  %235 = phi double [ 0.000000e+00, %205 ], [ %229, %228 ], [ %323, %250 ]
  %236 = sext i32 %207 to i64
  %237 = getelementptr inbounds float, float addrspace(1)* %4, i64 %236
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !7
  %239 = fpext float %238 to double
  %240 = fsub contract double %239, %235
  %241 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %207
  %242 = load float, float addrspace(5)* %241, align 4, !tbaa !7
  %243 = fpext float %242 to double
  %244 = fdiv contract double %240, %243
  %245 = fptrunc double %244 to float
  %246 = getelementptr inbounds float, float addrspace(1)* %1, i64 %236
  store float %245, float addrspace(1)* %246, align 4, !tbaa !7
  %247 = add nsw i32 %207, -1
  %248 = icmp sgt i32 %207, %17
  %249 = add i32 %206, 1
  br i1 %248, label %205, label %233, !llvm.loop !21

250:                                              ; preds = %228, %250
  %251 = phi i32 [ %324, %250 ], [ %230, %228 ]
  %252 = phi double [ %323, %250 ], [ %231, %228 ]
  %253 = zext i32 %251 to i64
  %254 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %251
  %255 = load float, float addrspace(5)* %254, align 4, !tbaa !7
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %253
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !7
  %258 = fmul contract float %255, %257
  %259 = fpext float %258 to double
  %260 = fadd contract double %252, %259
  %261 = add nuw i32 %251, 1
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %261
  %264 = load float, float addrspace(5)* %263, align 4, !tbaa !7
  %265 = getelementptr inbounds float, float addrspace(1)* %1, i64 %262
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !7
  %267 = fmul contract float %264, %266
  %268 = fpext float %267 to double
  %269 = fadd contract double %260, %268
  %270 = add nuw i32 %251, 2
  %271 = zext i32 %270 to i64
  %272 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %270
  %273 = load float, float addrspace(5)* %272, align 4, !tbaa !7
  %274 = getelementptr inbounds float, float addrspace(1)* %1, i64 %271
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !7
  %276 = fmul contract float %273, %275
  %277 = fpext float %276 to double
  %278 = fadd contract double %269, %277
  %279 = add nuw i32 %251, 3
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %279
  %282 = load float, float addrspace(5)* %281, align 4, !tbaa !7
  %283 = getelementptr inbounds float, float addrspace(1)* %1, i64 %280
  %284 = load float, float addrspace(1)* %283, align 4, !tbaa !7
  %285 = fmul contract float %282, %284
  %286 = fpext float %285 to double
  %287 = fadd contract double %278, %286
  %288 = add nuw i32 %251, 4
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %288
  %291 = load float, float addrspace(5)* %290, align 4, !tbaa !7
  %292 = getelementptr inbounds float, float addrspace(1)* %1, i64 %289
  %293 = load float, float addrspace(1)* %292, align 4, !tbaa !7
  %294 = fmul contract float %291, %293
  %295 = fpext float %294 to double
  %296 = fadd contract double %287, %295
  %297 = add nuw i32 %251, 5
  %298 = zext i32 %297 to i64
  %299 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %297
  %300 = load float, float addrspace(5)* %299, align 4, !tbaa !7
  %301 = getelementptr inbounds float, float addrspace(1)* %1, i64 %298
  %302 = load float, float addrspace(1)* %301, align 4, !tbaa !7
  %303 = fmul contract float %300, %302
  %304 = fpext float %303 to double
  %305 = fadd contract double %296, %304
  %306 = add nuw i32 %251, 6
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %306
  %309 = load float, float addrspace(5)* %308, align 4, !tbaa !7
  %310 = getelementptr inbounds float, float addrspace(1)* %1, i64 %307
  %311 = load float, float addrspace(1)* %310, align 4, !tbaa !7
  %312 = fmul contract float %309, %311
  %313 = fpext float %312 to double
  %314 = fadd contract double %305, %313
  %315 = add nuw i32 %251, 7
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds [180 x [180 x float]], [180 x [180 x float]] addrspace(5)* %7, i32 0, i32 %207, i32 %315
  %318 = load float, float addrspace(5)* %317, align 4, !tbaa !7
  %319 = getelementptr inbounds float, float addrspace(1)* %1, i64 %316
  %320 = load float, float addrspace(1)* %319, align 4, !tbaa !7
  %321 = fmul contract float %318, %320
  %322 = fpext float %321 to double
  %323 = fadd contract double %314, %322
  %324 = add nuw i32 %251, 8
  %325 = icmp eq i32 %324, %19
  br i1 %325, label %234, label %250, !llvm.loop !22
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
!19 = distinct !{!19, !14}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !14}
!22 = distinct !{!22, !14}
