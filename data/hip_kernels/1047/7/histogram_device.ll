; ModuleID = '../data/hip_kernels/1047/7/main.cu'
source_filename = "../data/hip_kernels/1047/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9histogramPhPjmE6lhisto = internal addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9histogramPhPjm(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ9histogramPhPjmE6lhisto, i32 0, i32 %4
  store i32 0, i32 addrspace(3)* %5, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !9, !invariant.load !10
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !11
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %4
  %17 = lshr i64 %2, 1
  %18 = sext i32 %16 to i64
  %19 = icmp ugt i64 %17, %18
  br i1 %19, label %20, label %27

20:                                               ; preds = %3
  %21 = udiv i32 %14, %11
  %22 = mul i32 %21, %11
  %23 = icmp ugt i32 %14, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %11
  br label %37

27:                                               ; preds = %37, %3
  %28 = phi i64 [ %18, %3 ], [ %46, %37 ]
  %29 = icmp ult i64 %28, %2
  br i1 %29, label %30, label %59

30:                                               ; preds = %27
  %31 = udiv i32 %14, %11
  %32 = mul i32 %31, %11
  %33 = icmp ugt i32 %14, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %11
  br label %48

37:                                               ; preds = %20, %37
  %38 = phi i64 [ %18, %20 ], [ %46, %37 ]
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !20, !amdgpu.noclobber !10
  %42 = zext i8 %41 to i32
  %43 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ9histogramPhPjmE6lhisto, i32 0, i32 %42
  %44 = atomicrmw add i32 addrspace(3)* %43, i32 1 syncscope("agent-one-as") monotonic, align 4
  %45 = add i32 %26, %39
  %46 = sext i32 %45 to i64
  %47 = icmp ugt i64 %17, %46
  br i1 %47, label %37, label %27, !llvm.loop !21

48:                                               ; preds = %30, %48
  %49 = phi i64 [ %28, %30 ], [ %57, %48 ]
  %50 = trunc i64 %49 to i32
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !20, !amdgpu.noclobber !10
  %53 = zext i8 %52 to i32
  %54 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([512 x i32], [512 x i32] addrspace(3)* @_ZZ9histogramPhPjmE6lhisto, i32 0, i32 256), i32 %53
  %55 = atomicrmw add i32 addrspace(3)* %54, i32 1 syncscope("agent-one-as") monotonic, align 4
  %56 = add i32 %36, %50
  %57 = sext i32 %56 to i64
  %58 = icmp ult i64 %57, %2
  br i1 %58, label %48, label %59, !llvm.loop !23

59:                                               ; preds = %48, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = zext i32 %4 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(3)* %5, align 4, !tbaa !5
  %63 = atomicrmw add i32 addrspace(1)* %61, i32 %62 syncscope("agent-one-as") monotonic, align 4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!7, !7, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !22}
