; ModuleID = '../data/hip_kernels/1143/19/main.cu'
source_filename = "../data/hip_kernels/1143/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6vecSumPdS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 16
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 8, !tbaa !15
  %22 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %21, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %32 = mul i32 %30, %31
  %33 = add i32 %32, %5
  %34 = mul i32 %33, %18
  %35 = add i32 %34, %4
  %36 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %37 = bitcast i8 addrspace(4)* %36 to i16 addrspace(4)*
  %38 = load i16, i16 addrspace(4)* %37, align 4, !range !13, !invariant.load !14
  %39 = zext i16 %38 to i32
  %40 = mul i32 %35, %39
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %42 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %43 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %44 = add i32 %40, %42
  %45 = mul i32 %44, %25
  %46 = add i32 %45, %41
  %47 = mul i32 %46, %13
  %48 = add i32 %47, %43
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !17, !amdgpu.noclobber !14
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %49
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !17, !amdgpu.noclobber !14
  %54 = fadd contract double %51, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %2, i64 %49
  store double %54, double addrspace(1)* %55, align 8, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"double", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
