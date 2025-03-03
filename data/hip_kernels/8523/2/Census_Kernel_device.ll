; ModuleID = '../data/hip_kernels/8523/2/main.cu'
source_filename = "../data/hip_kernels/8523/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13Census_KernelPhPjiii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %3
  %24 = add i32 %23, %14
  %25 = icmp sgt i32 %14, 1
  br i1 %25, label %26, label %268

26:                                               ; preds = %5
  %27 = add nsw i32 %3, -2
  %28 = icmp slt i32 %14, %27
  %29 = icmp sgt i32 %22, 1
  %30 = select i1 %28, i1 %29, i1 false
  %31 = add nsw i32 %4, -2
  %32 = icmp slt i32 %22, %31
  %33 = select i1 %30, i1 %32, i1 false
  br i1 %33, label %34, label %268

34:                                               ; preds = %26
  %35 = sext i32 %24 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !7, !amdgpu.noclobber !5
  %38 = uitofp i8 %37 to float
  %39 = sitofp i32 %2 to float
  %40 = add nsw i32 %22, -1
  %41 = mul nsw i32 %40, %3
  %42 = add i32 %41, %14
  %43 = add i32 %42, -1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !7, !amdgpu.noclobber !5
  %47 = uitofp i8 %46 to float
  %48 = fsub contract float %38, %47
  %49 = tail call float @llvm.fabs.f32(float %48)
  %50 = fcmp contract ugt float %49, %39
  %51 = fcmp contract ogt float %48, %39
  %52 = select i1 %51, i32 8, i32 0
  %53 = select i1 %50, i32 %52, i32 4
  %54 = sext i32 %42 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7, !amdgpu.noclobber !5
  %57 = uitofp i8 %56 to float
  %58 = fsub contract float %38, %57
  %59 = tail call float @llvm.fabs.f32(float %58)
  %60 = fcmp contract ugt float %59, %39
  %61 = or i32 %53, 1
  %62 = fcmp contract ogt float %58, %39
  %63 = or i32 %53, 2
  %64 = select i1 %62, i32 %63, i32 %53
  %65 = select i1 %60, i32 %64, i32 %61
  %66 = add i32 %42, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !7, !amdgpu.noclobber !5
  %70 = uitofp i8 %69 to float
  %71 = fsub contract float %38, %70
  %72 = shl nuw nsw i32 %65, 2
  %73 = tail call float @llvm.fabs.f32(float %71)
  %74 = fcmp contract ugt float %73, %39
  %75 = add nuw nsw i32 %72, 1
  %76 = fcmp contract ogt float %71, %39
  %77 = add nuw nsw i32 %72, 2
  %78 = select i1 %76, i32 %77, i32 %72
  %79 = select i1 %74, i32 %78, i32 %75
  %80 = add i32 %24, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !7, !amdgpu.noclobber !5
  %84 = uitofp i8 %83 to float
  %85 = fsub contract float %38, %84
  %86 = shl nuw nsw i32 %79, 2
  %87 = tail call float @llvm.fabs.f32(float %85)
  %88 = fcmp contract ugt float %87, %39
  %89 = add nuw nsw i32 %86, 1
  %90 = fcmp contract ogt float %85, %39
  %91 = add nuw nsw i32 %86, 2
  %92 = select i1 %90, i32 %91, i32 %86
  %93 = select i1 %88, i32 %92, i32 %89
  %94 = add i32 %24, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !5
  %98 = uitofp i8 %97 to float
  %99 = fsub contract float %38, %98
  %100 = shl nuw nsw i32 %93, 2
  %101 = tail call float @llvm.fabs.f32(float %99)
  %102 = fcmp contract ugt float %101, %39
  %103 = add nuw nsw i32 %100, 1
  %104 = fcmp contract ogt float %99, %39
  %105 = add nuw nsw i32 %100, 2
  %106 = select i1 %104, i32 %105, i32 %100
  %107 = select i1 %102, i32 %106, i32 %103
  %108 = add nuw nsw i32 %22, 1
  %109 = mul nsw i32 %108, %3
  %110 = add i32 %109, %14
  %111 = add i32 %110, -1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %112
  %114 = load i8, i8 addrspace(1)* %113, align 1, !tbaa !7, !amdgpu.noclobber !5
  %115 = uitofp i8 %114 to float
  %116 = fsub contract float %38, %115
  %117 = shl nuw nsw i32 %107, 2
  %118 = tail call float @llvm.fabs.f32(float %116)
  %119 = fcmp contract ugt float %118, %39
  %120 = add nuw nsw i32 %117, 1
  %121 = fcmp contract ogt float %116, %39
  %122 = add nuw nsw i32 %117, 2
  %123 = select i1 %121, i32 %122, i32 %117
  %124 = select i1 %119, i32 %123, i32 %120
  %125 = sext i32 %110 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !7, !amdgpu.noclobber !5
  %128 = uitofp i8 %127 to float
  %129 = fsub contract float %38, %128
  %130 = shl nuw nsw i32 %124, 2
  %131 = tail call float @llvm.fabs.f32(float %129)
  %132 = fcmp contract ugt float %131, %39
  %133 = add nuw nsw i32 %130, 1
  %134 = fcmp contract ogt float %129, %39
  %135 = add nuw nsw i32 %130, 2
  %136 = select i1 %134, i32 %135, i32 %130
  %137 = select i1 %132, i32 %136, i32 %133
  %138 = add i32 %110, 1
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %139
  %141 = load i8, i8 addrspace(1)* %140, align 1, !tbaa !7, !amdgpu.noclobber !5
  %142 = uitofp i8 %141 to float
  %143 = fsub contract float %38, %142
  %144 = shl nuw nsw i32 %137, 2
  %145 = tail call float @llvm.fabs.f32(float %143)
  %146 = fcmp contract ugt float %145, %39
  %147 = add nuw nsw i32 %144, 1
  %148 = fcmp contract ogt float %143, %39
  %149 = add nuw nsw i32 %144, 2
  %150 = select i1 %148, i32 %149, i32 %144
  %151 = select i1 %146, i32 %150, i32 %147
  %152 = add nsw i32 %22, -2
  %153 = mul nsw i32 %152, %3
  %154 = add i32 %153, %14
  %155 = add i32 %154, -2
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %156
  %158 = load i8, i8 addrspace(1)* %157, align 1, !tbaa !7, !amdgpu.noclobber !5
  %159 = uitofp i8 %158 to float
  %160 = fsub contract float %38, %159
  %161 = shl nuw nsw i32 %151, 2
  %162 = tail call float @llvm.fabs.f32(float %160)
  %163 = fcmp contract ugt float %162, %39
  %164 = add nuw nsw i32 %161, 1
  %165 = fcmp contract ogt float %160, %39
  %166 = add nuw nsw i32 %161, 2
  %167 = select i1 %165, i32 %166, i32 %161
  %168 = select i1 %163, i32 %167, i32 %164
  %169 = sext i32 %154 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %169
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !7, !amdgpu.noclobber !5
  %172 = uitofp i8 %171 to float
  %173 = fsub contract float %38, %172
  %174 = shl nuw nsw i32 %168, 2
  %175 = tail call float @llvm.fabs.f32(float %173)
  %176 = fcmp contract ugt float %175, %39
  %177 = add nuw nsw i32 %174, 1
  %178 = fcmp contract ogt float %173, %39
  %179 = add nuw nsw i32 %174, 2
  %180 = select i1 %178, i32 %179, i32 %174
  %181 = select i1 %176, i32 %180, i32 %177
  %182 = add i32 %154, 2
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %183
  %185 = load i8, i8 addrspace(1)* %184, align 1, !tbaa !7, !amdgpu.noclobber !5
  %186 = uitofp i8 %185 to float
  %187 = fsub contract float %38, %186
  %188 = shl nuw nsw i32 %181, 2
  %189 = tail call float @llvm.fabs.f32(float %187)
  %190 = fcmp contract ugt float %189, %39
  %191 = add nuw nsw i32 %188, 1
  %192 = fcmp contract ogt float %187, %39
  %193 = add nuw nsw i32 %188, 2
  %194 = select i1 %192, i32 %193, i32 %188
  %195 = select i1 %190, i32 %194, i32 %191
  %196 = add i32 %24, -2
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %197
  %199 = load i8, i8 addrspace(1)* %198, align 1, !tbaa !7, !amdgpu.noclobber !5
  %200 = uitofp i8 %199 to float
  %201 = fsub contract float %38, %200
  %202 = shl nuw nsw i32 %195, 2
  %203 = tail call float @llvm.fabs.f32(float %201)
  %204 = fcmp contract ugt float %203, %39
  %205 = add nuw nsw i32 %202, 1
  %206 = fcmp contract ogt float %201, %39
  %207 = add nuw nsw i32 %202, 2
  %208 = select i1 %206, i32 %207, i32 %202
  %209 = select i1 %204, i32 %208, i32 %205
  %210 = add i32 %24, 2
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %211
  %213 = load i8, i8 addrspace(1)* %212, align 1, !tbaa !7, !amdgpu.noclobber !5
  %214 = uitofp i8 %213 to float
  %215 = fsub contract float %38, %214
  %216 = shl nuw nsw i32 %209, 2
  %217 = tail call float @llvm.fabs.f32(float %215)
  %218 = fcmp contract ugt float %217, %39
  %219 = add nuw nsw i32 %216, 1
  %220 = fcmp contract ogt float %215, %39
  %221 = add nuw nsw i32 %216, 2
  %222 = select i1 %220, i32 %221, i32 %216
  %223 = select i1 %218, i32 %222, i32 %219
  %224 = add nuw nsw i32 %22, 2
  %225 = mul nsw i32 %224, %3
  %226 = add i32 %225, %14
  %227 = add i32 %226, -2
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %228
  %230 = load i8, i8 addrspace(1)* %229, align 1, !tbaa !7, !amdgpu.noclobber !5
  %231 = uitofp i8 %230 to float
  %232 = fsub contract float %38, %231
  %233 = shl nuw nsw i32 %223, 2
  %234 = tail call float @llvm.fabs.f32(float %232)
  %235 = fcmp contract ugt float %234, %39
  %236 = add nuw nsw i32 %233, 1
  %237 = fcmp contract ogt float %232, %39
  %238 = add nuw nsw i32 %233, 2
  %239 = select i1 %237, i32 %238, i32 %233
  %240 = select i1 %235, i32 %239, i32 %236
  %241 = sext i32 %226 to i64
  %242 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %241
  %243 = load i8, i8 addrspace(1)* %242, align 1, !tbaa !7, !amdgpu.noclobber !5
  %244 = uitofp i8 %243 to float
  %245 = fsub contract float %38, %244
  %246 = shl nuw nsw i32 %240, 2
  %247 = tail call float @llvm.fabs.f32(float %245)
  %248 = fcmp contract ugt float %247, %39
  %249 = add nuw nsw i32 %246, 1
  %250 = fcmp contract ogt float %245, %39
  %251 = add nuw nsw i32 %246, 2
  %252 = select i1 %250, i32 %251, i32 %246
  %253 = select i1 %248, i32 %252, i32 %249
  %254 = add i32 %226, 2
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %255
  %257 = load i8, i8 addrspace(1)* %256, align 1, !tbaa !7, !amdgpu.noclobber !5
  %258 = uitofp i8 %257 to float
  %259 = fsub contract float %38, %258
  %260 = shl nuw i32 %253, 2
  %261 = tail call float @llvm.fabs.f32(float %259)
  %262 = fcmp contract ugt float %261, %39
  %263 = add nuw nsw i32 %260, 1
  %264 = fcmp contract ogt float %259, %39
  %265 = add nuw nsw i32 %260, 2
  %266 = select i1 %264, i32 %265, i32 %260
  %267 = select i1 %262, i32 %266, i32 %263
  br label %278

268:                                              ; preds = %26, %5
  %269 = icmp sgt i32 %14, -1
  br i1 %269, label %270, label %282

270:                                              ; preds = %268
  %271 = icmp slt i32 %14, %3
  %272 = icmp sgt i32 %22, -1
  %273 = select i1 %271, i1 %272, i1 false
  %274 = icmp slt i32 %22, %4
  %275 = select i1 %273, i1 %274, i1 false
  br i1 %275, label %276, label %282

276:                                              ; preds = %270
  %277 = sext i32 %24 to i64
  br label %278

278:                                              ; preds = %34, %276
  %279 = phi i64 [ %277, %276 ], [ %35, %34 ]
  %280 = phi i32 [ 0, %276 ], [ %267, %34 ]
  %281 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %279
  store i32 %280, i32 addrspace(1)* %281, align 4, !tbaa !10
  br label %282

282:                                              ; preds = %278, %268, %270
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
