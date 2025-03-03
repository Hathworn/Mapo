; ModuleID = '../data/hip_kernels/5280/23/main.cu'
source_filename = "../data/hip_kernels/5280/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26make_pillar_feature_kernelPfS_S_PiS0_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %5, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi float %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %16 = icmp slt i32 %15, %14
  br i1 %16, label %17, label %143

17:                                               ; preds = %9
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %11
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !10, !amdgpu.noclobber !8
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %11
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !10, !amdgpu.noclobber !8
  %22 = mul i32 %7, %6
  %23 = mul i32 %22, %10
  %24 = mul nsw i32 %15, %7
  %25 = mul nsw i32 %21, %8
  %26 = add i32 %25, %19
  %27 = mul i32 %22, %26
  %28 = icmp sgt i32 %7, 0
  br i1 %28, label %29, label %51

29:                                               ; preds = %17
  %30 = and i32 %7, 7
  %31 = icmp ult i32 %7, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = and i32 %7, -8
  br label %66

34:                                               ; preds = %66, %29
  %35 = phi i32 [ 0, %29 ], [ %140, %66 ]
  %36 = icmp eq i32 %30, 0
  br i1 %36, label %51, label %37

37:                                               ; preds = %34, %37
  %38 = phi i32 [ %48, %37 ], [ %35, %34 ]
  %39 = phi i32 [ %49, %37 ], [ 0, %34 ]
  %40 = add i32 %38, %24
  %41 = add i32 %40, %27
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !4
  %45 = add i32 %40, %23
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  store float %44, float addrspace(1)* %47, align 4, !tbaa !4
  %48 = add nuw nsw i32 %38, 1
  %49 = add i32 %39, 1
  %50 = icmp eq i32 %49, %30
  br i1 %50, label %51, label %37, !llvm.loop !12

51:                                               ; preds = %34, %37, %17
  %52 = sitofp i32 %19 to float
  %53 = sitofp i32 %21 to float
  %54 = shl nsw i32 %10, 2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !4
  %57 = add nuw nsw i32 %54, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  store float 0.000000e+00, float addrspace(1)* %59, align 4, !tbaa !4
  %60 = add nuw nsw i32 %54, 2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  store float %53, float addrspace(1)* %62, align 4, !tbaa !4
  %63 = add nuw nsw i32 %54, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  store float %52, float addrspace(1)* %65, align 4, !tbaa !4
  br label %143

66:                                               ; preds = %66, %32
  %67 = phi i32 [ 0, %32 ], [ %140, %66 ]
  %68 = phi i32 [ 0, %32 ], [ %141, %66 ]
  %69 = add i32 %67, %24
  %70 = add i32 %69, %27
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !4
  %74 = add i32 %69, %23
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  store float %73, float addrspace(1)* %76, align 4, !tbaa !4
  %77 = or i32 %67, 1
  %78 = add i32 %77, %24
  %79 = add i32 %78, %27
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !4
  %83 = add i32 %78, %23
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  store float %82, float addrspace(1)* %85, align 4, !tbaa !4
  %86 = or i32 %67, 2
  %87 = add i32 %86, %24
  %88 = add i32 %87, %27
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !4
  %92 = add i32 %87, %23
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  store float %91, float addrspace(1)* %94, align 4, !tbaa !4
  %95 = or i32 %67, 3
  %96 = add i32 %95, %24
  %97 = add i32 %96, %27
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !4
  %101 = add i32 %96, %23
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  store float %100, float addrspace(1)* %103, align 4, !tbaa !4
  %104 = or i32 %67, 4
  %105 = add i32 %104, %24
  %106 = add i32 %105, %27
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !4
  %110 = add i32 %105, %23
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  store float %109, float addrspace(1)* %112, align 4, !tbaa !4
  %113 = or i32 %67, 5
  %114 = add i32 %113, %24
  %115 = add i32 %114, %27
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !4
  %119 = add i32 %114, %23
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  store float %118, float addrspace(1)* %121, align 4, !tbaa !4
  %122 = or i32 %67, 6
  %123 = add i32 %122, %24
  %124 = add i32 %123, %27
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !4
  %128 = add i32 %123, %23
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  store float %127, float addrspace(1)* %130, align 4, !tbaa !4
  %131 = or i32 %67, 7
  %132 = add i32 %131, %24
  %133 = add i32 %132, %27
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !4
  %137 = add i32 %132, %23
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  store float %136, float addrspace(1)* %139, align 4, !tbaa !4
  %140 = add nuw nsw i32 %67, 8
  %141 = add i32 %68, 8
  %142 = icmp eq i32 %141, %33
  br i1 %142, label %34, label %66, !llvm.loop !14

143:                                              ; preds = %9, %51
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
