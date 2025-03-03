; ModuleID = '../data/hip_kernels/3809/22/main.cu'
source_filename = "../data/hip_kernels/3809/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21power_spectrum_kerneliPfiS_i(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul nsw i32 %7, %2
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %1, i64 %9
  %11 = mul nsw i32 %7, %4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %3, i64 %12
  %14 = sdiv i32 %0, 2
  %15 = icmp slt i32 %6, %14
  br i1 %15, label %16, label %18

16:                                               ; preds = %5
  %17 = bitcast float addrspace(1)* %10 to %struct.HIP_vector_type addrspace(1)*
  br label %20

18:                                               ; preds = %33, %5
  %19 = icmp eq i32 %6, 0
  br i1 %19, label %36, label %45

20:                                               ; preds = %16, %33
  %21 = phi i32 [ %6, %16 ], [ %34, %33 ]
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %33, label %23

23:                                               ; preds = %20
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %17, i64 %24, i32 0, i32 0, i32 0, i64 0
  %26 = load float, float addrspace(1)* %25, align 8
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %17, i64 %24, i32 0, i32 0, i32 0, i64 1
  %28 = load float, float addrspace(1)* %27, align 4
  %29 = fmul contract float %26, %26
  %30 = fmul contract float %28, %28
  %31 = fadd contract float %29, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %13, i64 %24
  store float %31, float addrspace(1)* %32, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %20, %23
  %34 = add nuw nsw i32 %21, 256
  %35 = icmp slt i32 %34, %14
  br i1 %35, label %20, label %18, !llvm.loop !9

36:                                               ; preds = %18
  %37 = load float, float addrspace(1)* %10, align 4, !tbaa !5
  %38 = sext i32 %0 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %10, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5
  %41 = fmul contract float %37, %37
  store float %41, float addrspace(1)* %13, align 4, !tbaa !5
  %42 = fmul contract float %40, %40
  %43 = sext i32 %14 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %13, i64 %43
  store float %42, float addrspace(1)* %44, align 4, !tbaa !5
  br label %45

45:                                               ; preds = %36, %18
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
