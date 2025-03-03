; ModuleID = '../data/hip_kernels/397/10/main.cu'
source_filename = "../data/hip_kernels/397/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10gpu_reducePii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !6
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %3, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %11, %8
  %18 = mul i32 %17, %8
  %19 = icmp ugt i32 %11, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %12
  %23 = add i32 %22, %4
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %24, %25
  %28 = mul i32 %27, %8
  %29 = add i32 %28, %26
  %30 = icmp slt i32 %29, %1
  br i1 %30, label %31, label %52

31:                                               ; preds = %2
  %32 = and i32 %1, 1
  %33 = icmp eq i32 %32, 0
  %34 = sext i32 %29 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !16
  br i1 %33, label %43, label %37

37:                                               ; preds = %31
  %38 = add nsw i32 %1, -1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !5
  %42 = icmp slt i32 %36, %41
  br i1 %42, label %50, label %52

43:                                               ; preds = %31
  %44 = sdiv i32 %1, 2
  %45 = add nsw i32 %29, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !5
  %49 = icmp slt i32 %36, %48
  br i1 %49, label %50, label %52

50:                                               ; preds = %43, %37
  %51 = phi i32 [ %41, %37 ], [ %48, %43 ]
  store i32 %51, i32 addrspace(1)* %35, align 4, !tbaa !16
  br label %52

52:                                               ; preds = %50, %37, %43, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
