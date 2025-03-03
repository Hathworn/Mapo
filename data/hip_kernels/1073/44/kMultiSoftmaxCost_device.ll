; ModuleID = '../data/hip_kernels/1073/44/main.cu'
source_filename = "../data/hip_kernels/1073/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17kMultiSoftmaxCostPfS_S_S_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 7
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %6
  br i1 %14, label %15, label %185

15:                                               ; preds = %9
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = fptosi float %18 to i32
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = mul nsw i32 %19, %6
  %23 = add nsw i32 %22, %13
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !5, !amdgpu.noclobber !9
  %27 = tail call float @llvm.log.f32(float %26)
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  store float %27, float addrspace(1)* %28, align 4, !tbaa !5
  %29 = icmp sgt i32 %7, 0
  br i1 %29, label %30, label %61

30:                                               ; preds = %15
  %31 = and i32 %7, 7
  %32 = icmp ult i32 %7, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %7, -8
  br label %67

35:                                               ; preds = %67, %30
  %36 = phi i32 [ undef, %30 ], [ %163, %67 ]
  %37 = phi i32 [ undef, %30 ], [ %166, %67 ]
  %38 = phi i32 [ 0, %30 ], [ %163, %67 ]
  %39 = phi i32 [ 0, %30 ], [ %167, %67 ]
  %40 = phi i32 [ 0, %30 ], [ %166, %67 ]
  %41 = icmp eq i32 %31, 0
  br i1 %41, label %61, label %42

42:                                               ; preds = %35, %42
  %43 = phi i32 [ %54, %42 ], [ %38, %35 ]
  %44 = phi i32 [ %58, %42 ], [ %39, %35 ]
  %45 = phi i32 [ %57, %42 ], [ %40, %35 ]
  %46 = phi i32 [ %59, %42 ], [ 0, %35 ]
  %47 = mul nsw i32 %44, %6
  %48 = add nsw i32 %47, %13
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5
  %52 = fcmp contract ogt float %51, %26
  %53 = zext i1 %52 to i32
  %54 = add nuw nsw i32 %43, %53
  %55 = fcmp contract oeq float %51, %26
  %56 = zext i1 %55 to i32
  %57 = add nuw nsw i32 %45, %56
  %58 = add nuw nsw i32 %44, 1
  %59 = add i32 %46, 1
  %60 = icmp eq i32 %59, %31
  br i1 %60, label %61, label %42, !llvm.loop !10

61:                                               ; preds = %35, %42, %15
  %62 = phi i32 [ 0, %15 ], [ %37, %35 ], [ %57, %42 ]
  %63 = phi i32 [ 0, %15 ], [ %36, %35 ], [ %54, %42 ]
  %64 = sub nsw i32 %8, %63
  %65 = sitofp i32 %64 to float
  %66 = icmp slt i32 %64, 1
  br i1 %66, label %175, label %170

67:                                               ; preds = %67, %33
  %68 = phi i32 [ 0, %33 ], [ %163, %67 ]
  %69 = phi i32 [ 0, %33 ], [ %167, %67 ]
  %70 = phi i32 [ 0, %33 ], [ %166, %67 ]
  %71 = phi i32 [ 0, %33 ], [ %168, %67 ]
  %72 = mul nsw i32 %69, %6
  %73 = add nsw i32 %72, %13
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5
  %77 = fcmp contract ogt float %76, %26
  %78 = zext i1 %77 to i32
  %79 = add nuw nsw i32 %68, %78
  %80 = fcmp contract oeq float %76, %26
  %81 = zext i1 %80 to i32
  %82 = add nuw nsw i32 %70, %81
  %83 = or i32 %69, 1
  %84 = mul nsw i32 %83, %6
  %85 = add nsw i32 %84, %13
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5
  %89 = fcmp contract ogt float %88, %26
  %90 = zext i1 %89 to i32
  %91 = add nuw nsw i32 %79, %90
  %92 = fcmp contract oeq float %88, %26
  %93 = zext i1 %92 to i32
  %94 = add nuw nsw i32 %82, %93
  %95 = or i32 %69, 2
  %96 = mul nsw i32 %95, %6
  %97 = add nsw i32 %96, %13
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !5
  %101 = fcmp contract ogt float %100, %26
  %102 = zext i1 %101 to i32
  %103 = add nuw nsw i32 %91, %102
  %104 = fcmp contract oeq float %100, %26
  %105 = zext i1 %104 to i32
  %106 = add nuw nsw i32 %94, %105
  %107 = or i32 %69, 3
  %108 = mul nsw i32 %107, %6
  %109 = add nsw i32 %108, %13
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !5
  %113 = fcmp contract ogt float %112, %26
  %114 = zext i1 %113 to i32
  %115 = add nuw nsw i32 %103, %114
  %116 = fcmp contract oeq float %112, %26
  %117 = zext i1 %116 to i32
  %118 = add nuw nsw i32 %106, %117
  %119 = or i32 %69, 4
  %120 = mul nsw i32 %119, %6
  %121 = add nsw i32 %120, %13
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !5
  %125 = fcmp contract ogt float %124, %26
  %126 = zext i1 %125 to i32
  %127 = add nuw nsw i32 %115, %126
  %128 = fcmp contract oeq float %124, %26
  %129 = zext i1 %128 to i32
  %130 = add nuw nsw i32 %118, %129
  %131 = or i32 %69, 5
  %132 = mul nsw i32 %131, %6
  %133 = add nsw i32 %132, %13
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !5
  %137 = fcmp contract ogt float %136, %26
  %138 = zext i1 %137 to i32
  %139 = add nuw nsw i32 %127, %138
  %140 = fcmp contract oeq float %136, %26
  %141 = zext i1 %140 to i32
  %142 = add nuw nsw i32 %130, %141
  %143 = or i32 %69, 6
  %144 = mul nsw i32 %143, %6
  %145 = add nsw i32 %144, %13
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !5
  %149 = fcmp contract ogt float %148, %26
  %150 = zext i1 %149 to i32
  %151 = add nuw nsw i32 %139, %150
  %152 = fcmp contract oeq float %148, %26
  %153 = zext i1 %152 to i32
  %154 = add nuw nsw i32 %142, %153
  %155 = or i32 %69, 7
  %156 = mul nsw i32 %155, %6
  %157 = add nsw i32 %156, %13
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %0, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !5
  %161 = fcmp contract ogt float %160, %26
  %162 = zext i1 %161 to i32
  %163 = add nuw nsw i32 %151, %162
  %164 = fcmp contract oeq float %160, %26
  %165 = zext i1 %164 to i32
  %166 = add nuw nsw i32 %154, %165
  %167 = add nuw nsw i32 %69, 8
  %168 = add i32 %71, 8
  %169 = icmp eq i32 %168, %34
  br i1 %169, label %35, label %67, !llvm.loop !12

170:                                              ; preds = %61
  %171 = icmp sgt i32 %62, %64
  br i1 %171, label %172, label %175

172:                                              ; preds = %170
  %173 = sitofp i32 %62 to float
  %174 = fdiv contract float %65, %173
  br label %175

175:                                              ; preds = %172, %170, %61
  %176 = phi contract float [ 0.000000e+00, %61 ], [ %174, %172 ], [ 1.000000e+00, %170 ]
  %177 = getelementptr inbounds float, float addrspace(1)* %5, i64 %16
  store float %176, float addrspace(1)* %177, align 4, !tbaa !5
  %178 = fcmp contract une float %26, %21
  br i1 %178, label %182, label %179

179:                                              ; preds = %175
  %180 = sitofp i32 %62 to float
  %181 = fdiv contract float 1.000000e+00, %180
  br label %182

182:                                              ; preds = %175, %179
  %183 = phi contract float [ %181, %179 ], [ 0.000000e+00, %175 ]
  %184 = getelementptr inbounds float, float addrspace(1)* %4, i64 %16
  store float %183, float addrspace(1)* %184, align 4, !tbaa !5
  br label %185

185:                                              ; preds = %182, %9
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
