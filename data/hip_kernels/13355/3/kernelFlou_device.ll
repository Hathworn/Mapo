; ModuleID = '../data/hip_kernels/13355/3/main.cu'
source_filename = "../data/hip_kernels/13355/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10kernelFlouPhPjE3sum = internal unnamed_addr addrspace(3) global [4 x i8] undef, align 1

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z10kernelFlouPhPj(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  store i8 0, i8 addrspace(3)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(3)* @_ZZ10kernelFlouPhPjE3sum, i32 0, i32 0), align 1, !tbaa !4
  store i8 0, i8 addrspace(3)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(3)* @_ZZ10kernelFlouPhPjE3sum, i32 0, i32 1), align 1, !tbaa !4
  store i8 0, i8 addrspace(3)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(3)* @_ZZ10kernelFlouPhPjE3sum, i32 0, i32 2), align 1, !tbaa !4
  store i8 0, i8 addrspace(3)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(3)* @_ZZ10kernelFlouPhPjE3sum, i32 0, i32 3), align 1, !tbaa !4
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %5 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !7
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !7
  %7 = shl nsw i32 %4, 1
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !7
  %9 = add i32 %7, %8
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !8
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !17, !invariant.load !18
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %3
  %25 = shl i32 %24, 3
  %26 = shl nuw nsw i32 %6, 2
  %27 = add i32 %25, %26
  %28 = mul i32 %22, %4
  %29 = add i32 %28, %3
  %30 = shl i32 %29, 2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = add nsw i32 %27, %5
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !4, !amdgpu.noclobber !18
  %35 = lshr i8 %34, 2
  %36 = getelementptr inbounds [4 x i8], [4 x i8] addrspace(3)* @_ZZ10kernelFlouPhPjE3sum, i32 0, i32 %5
  %37 = load i8, i8 addrspace(3)* %36, align 1, !tbaa !4
  %38 = add i8 %37, %35
  store i8 %38, i8 addrspace(3)* %36, align 1, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = load i8, i8 addrspace(3)* %36, align 1, !tbaa !4
  store i8 %39, i8 addrspace(1)* %33, align 1, !tbaa !4
  %40 = sext i8 %39 to i32
  %41 = add nsw i32 %30, %5
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  store i32 %40, i32 addrspace(1)* %43, align 4, !tbaa !19
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 0, i32 1024}
!8 = !{!9, !13, i64 12}
!9 = !{!"hsa_kernel_dispatch_packet_s", !10, i64 0, !10, i64 2, !10, i64 4, !10, i64 6, !10, i64 8, !10, i64 10, !13, i64 12, !13, i64 16, !13, i64 20, !13, i64 24, !13, i64 28, !14, i64 32, !15, i64 40, !14, i64 48, !16, i64 56}
!10 = !{!"short", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{!"int", !11, i64 0}
!14 = !{!"long", !11, i64 0}
!15 = !{!"any pointer", !11, i64 0}
!16 = !{!"hsa_signal_s", !14, i64 0}
!17 = !{i16 1, i16 1025}
!18 = !{}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !5, i64 0}
