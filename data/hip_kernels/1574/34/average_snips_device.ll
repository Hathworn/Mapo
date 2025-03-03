; ModuleID = '../data/hip_kernels/1574/34/main.cu'
source_filename = "../data/hip_kernels/1574/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13average_snipsPKdPKiS2_PKfS4_S2_PfS5_(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !4, !amdgpu.noclobber !8
  %13 = fptosi double %12 to i32
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 3
  %15 = load double, double addrspace(1)* %14, align 8, !tbaa !4, !amdgpu.noclobber !8
  %16 = fptrunc double %15 to float
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 6
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !4, !amdgpu.noclobber !8
  %19 = fptosi double %18 to i32
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = icmp sgt i32 %10, 0
  br i1 %22, label %23, label %143

23:                                               ; preds = %8
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !4, !amdgpu.noclobber !8
  %26 = fptosi double %25 to i32
  %27 = mul nsw i32 %21, %26
  %28 = add i32 %27, %20
  %29 = fsub contract float 1.000000e+00, %16
  %30 = icmp sgt i32 %19, 0
  %31 = mul nsw i32 %21, %19
  %32 = and i32 %19, 3
  %33 = icmp ult i32 %19, 4
  %34 = and i32 %19, -4
  %35 = icmp eq i32 %32, 0
  br label %36

36:                                               ; preds = %23, %140
  %37 = phi i32 [ 0, %23 ], [ %141, %140 ]
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !10, !amdgpu.noclobber !8
  %41 = icmp eq i32 %40, %21
  br i1 %41, label %42, label %140

42:                                               ; preds = %36
  %43 = mul nsw i32 %37, %13
  %44 = add nsw i32 %43, %20
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !12
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !10, !amdgpu.noclobber !8
  %50 = add i32 %28, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %7, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !12
  %54 = fmul contract float %53, %16
  %55 = fmul contract float %29, %47
  %56 = fadd contract float %55, %54
  store float %56, float addrspace(1)* %52, align 4, !tbaa !12
  br i1 %30, label %57, label %140

57:                                               ; preds = %42
  br i1 %33, label %119, label %58

58:                                               ; preds = %57, %58
  %59 = phi i32 [ %116, %58 ], [ 0, %57 ]
  %60 = phi i32 [ %117, %58 ], [ 0, %57 ]
  %61 = add nsw i32 %59, %31
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !10, !amdgpu.noclobber !8
  %65 = mul nsw i32 %64, %10
  %66 = add nsw i32 %65, %37
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !12
  %70 = mul nsw i32 %59, %10
  %71 = add nsw i32 %70, %37
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %6, i64 %72
  store float %69, float addrspace(1)* %73, align 4, !tbaa !12
  %74 = or i32 %59, 1
  %75 = add nsw i32 %74, %31
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !10, !amdgpu.noclobber !8
  %79 = mul nsw i32 %78, %10
  %80 = add nsw i32 %79, %37
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !12
  %84 = mul nsw i32 %74, %10
  %85 = add nsw i32 %84, %37
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %6, i64 %86
  store float %83, float addrspace(1)* %87, align 4, !tbaa !12
  %88 = or i32 %59, 2
  %89 = add nsw i32 %88, %31
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !10, !amdgpu.noclobber !8
  %93 = mul nsw i32 %92, %10
  %94 = add nsw i32 %93, %37
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !12
  %98 = mul nsw i32 %88, %10
  %99 = add nsw i32 %98, %37
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %6, i64 %100
  store float %97, float addrspace(1)* %101, align 4, !tbaa !12
  %102 = or i32 %59, 3
  %103 = add nsw i32 %102, %31
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !10, !amdgpu.noclobber !8
  %107 = mul nsw i32 %106, %10
  %108 = add nsw i32 %107, %37
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !12
  %112 = mul nsw i32 %102, %10
  %113 = add nsw i32 %112, %37
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %6, i64 %114
  store float %111, float addrspace(1)* %115, align 4, !tbaa !12
  %116 = add nuw nsw i32 %59, 4
  %117 = add i32 %60, 4
  %118 = icmp eq i32 %117, %34
  br i1 %118, label %119, label %58, !llvm.loop !14

119:                                              ; preds = %58, %57
  %120 = phi i32 [ 0, %57 ], [ %116, %58 ]
  br i1 %35, label %140, label %121

121:                                              ; preds = %119, %121
  %122 = phi i32 [ %137, %121 ], [ %120, %119 ]
  %123 = phi i32 [ %138, %121 ], [ 0, %119 ]
  %124 = add nsw i32 %122, %31
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !10, !amdgpu.noclobber !8
  %128 = mul nsw i32 %127, %10
  %129 = add nsw i32 %128, %37
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %4, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !12
  %133 = mul nsw i32 %122, %10
  %134 = add nsw i32 %133, %37
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %6, i64 %135
  store float %132, float addrspace(1)* %136, align 4, !tbaa !12
  %137 = add nuw nsw i32 %122, 1
  %138 = add i32 %123, 1
  %139 = icmp eq i32 %138, %32
  br i1 %139, label %140, label %121, !llvm.loop !16

140:                                              ; preds = %119, %121, %42, %36
  %141 = add nuw nsw i32 %37, 1
  %142 = icmp eq i32 %141, %10
  br i1 %142, label %143, label %36, !llvm.loop !18

143:                                              ; preds = %140, %8
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
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !6, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !15}
