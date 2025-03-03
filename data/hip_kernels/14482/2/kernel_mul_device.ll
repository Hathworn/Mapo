; ModuleID = '../data/hip_kernels/14482/2/main.cu'
source_filename = "../data/hip_kernels/14482/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10kernel_mulPcS_S_iiPi(i8 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readnone %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !5
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = icmp ne i32 %8, 0
  %19 = icmp ne i32 %7, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %38

21:                                               ; preds = %6
  %22 = mul i32 %17, %16
  %23 = icmp ugt i32 %12, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %17, %24
  %26 = mul nuw nsw i32 %8, %16
  %27 = mul i32 %26, %25
  %28 = add i32 %27, %7
  %29 = zext i32 %7 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !16, !amdgpu.noclobber !15
  %32 = zext i32 %8 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !16, !amdgpu.noclobber !15
  %35 = mul i8 %34, %31
  %36 = sext i32 %28 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  store i8 %35, i8 addrspace(1)* %37, align 1, !tbaa !16
  br label %38

38:                                               ; preds = %21, %6
  %39 = icmp eq i32 %8, 0
  %40 = icmp eq i32 %7, 0
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %47

42:                                               ; preds = %38
  %43 = load i8, i8 addrspace(1)* %1, align 1, !tbaa !16
  %44 = load i8, i8 addrspace(1)* %2, align 1, !tbaa !16
  %45 = icmp eq i8 %43, %44
  %46 = select i1 %45, i8 43, i8 45
  store i8 %46, i8 addrspace(1)* %0, align 1, !tbaa !16
  br label %47

47:                                               ; preds = %42, %38
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
