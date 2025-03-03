; ModuleID = '../data/hip_kernels/5182/315/main.cu'
source_filename = "../data/hip_kernels/5182/315/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z19DrawRgbaColorKernelPfiiiiiifff(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = mul nsw i32 %6, %5
  %32 = sdiv i32 %30, %31
  %33 = mul nsw i32 %32, %31
  %34 = sub nsw i32 %30, %33
  %35 = sdiv i32 %34, %5
  %36 = icmp slt i32 %32, 3
  br i1 %36, label %37, label %61

37:                                               ; preds = %10
  %38 = mul nsw i32 %35, %5
  %39 = sub nsw i32 %34, %38
  %40 = add nsw i32 %39, %3
  %41 = icmp slt i32 %40, %1
  %42 = icmp sgt i32 %40, -1
  %43 = and i1 %41, %42
  br i1 %43, label %44, label %61

44:                                               ; preds = %37
  %45 = add nsw i32 %35, %4
  %46 = icmp slt i32 %45, %2
  %47 = icmp sgt i32 %45, -1
  %48 = and i1 %46, %47
  br i1 %48, label %49, label %61

49:                                               ; preds = %44
  switch i32 %32, label %53 [
    i32 0, label %50
    i32 1, label %51
    i32 2, label %52
  ]

50:                                               ; preds = %49
  br label %53

51:                                               ; preds = %49
  br label %53

52:                                               ; preds = %49
  br label %53

53:                                               ; preds = %49, %52, %51, %50
  %54 = phi float [ 0.000000e+00, %49 ], [ %9, %52 ], [ %8, %51 ], [ %7, %50 ]
  %55 = mul i32 %32, %2
  %56 = add i32 %45, %55
  %57 = mul i32 %56, %1
  %58 = add i32 %40, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  store float %54, float addrspace(1)* %60, align 4, !tbaa !16
  br label %61

61:                                               ; preds = %37, %44, %53, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
