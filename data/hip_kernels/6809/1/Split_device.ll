; ModuleID = '../data/hip_kernels/6809/1/main.cu'
source_filename = "../data/hip_kernels/6809/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5SplitPiPbmmmf(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i64 %4, float %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = sext i32 %18 to i64
  %20 = icmp ult i64 %19, %4
  br i1 %20, label %21, label %31

21:                                               ; preds = %6
  %22 = add i64 %2, -1
  %23 = mul i64 %22, %4
  %24 = mul i64 %4, %3
  %25 = udiv i32 %15, %12
  %26 = mul i32 %25, %12
  %27 = icmp ugt i32 %15, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %12
  br label %32

31:                                               ; preds = %32, %6
  ret void

32:                                               ; preds = %21, %32
  %33 = phi i64 [ %19, %21 ], [ %44, %32 ]
  %34 = trunc i64 %33 to i32
  %35 = add i64 %33, %23
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !5
  %38 = sitofp i32 %37 to float
  %39 = fcmp contract oeq float %38, %5
  %40 = add i64 %33, %24
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  %42 = zext i1 %39 to i8
  store i8 %42, i8 addrspace(1)* %41, align 1, !tbaa !20
  %43 = add i32 %30, %34
  %44 = sext i32 %43 to i64
  %45 = icmp ult i64 %44, %4
  br i1 %45, label %32, label %31, !llvm.loop !22
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!20 = !{!21, !21, i64 0}
!21 = !{!"bool", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
