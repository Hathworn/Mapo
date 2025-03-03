; ModuleID = '../data/hip_kernels/10802/3/main.cu'
source_filename = "../data/hip_kernels/10802/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@l_mem = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16Histogram_kerneliiiPjS_(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = udiv i32 %15, %12
  %17 = mul i32 %16, %12
  %18 = icmp ugt i32 %15, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = sub nsw i32 %1, %2
  %22 = sdiv i32 %21, %20
  %23 = mul nsw i32 %22, %6
  %24 = add nsw i32 %23, %2
  %25 = add nsw i32 %24, %22
  %26 = icmp slt i32 %7, %22
  br i1 %26, label %29, label %27

27:                                               ; preds = %29, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp slt i32 %7, %0
  br i1 %28, label %35, label %34

29:                                               ; preds = %5, %29
  %30 = phi i32 [ %32, %29 ], [ %7, %5 ]
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !16
  %32 = add nuw nsw i32 %30, %12
  %33 = icmp slt i32 %32, %22
  br i1 %33, label %29, label %27, !llvm.loop !20

34:                                               ; preds = %49, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %52, label %63

35:                                               ; preds = %27, %49
  %36 = phi i32 [ %50, %49 ], [ %7, %27 ]
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !6
  %40 = mul i32 %39, %1
  %41 = lshr i32 %40, 12
  %42 = icmp uge i32 %41, %24
  %43 = icmp ult i32 %41, %25
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %49

45:                                               ; preds = %35
  %46 = sub i32 %41, %24
  %47 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %46
  %48 = atomicrmw add i32 addrspace(3)* %47, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %49

49:                                               ; preds = %45, %35
  %50 = add nuw nsw i32 %36, %12
  %51 = icmp slt i32 %50, %0
  br i1 %51, label %35, label %34, !llvm.loop !22

52:                                               ; preds = %34, %52
  %53 = phi i32 [ %61, %52 ], [ %7, %34 ]
  %54 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @l_mem, i32 0, i32 %53
  %55 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !16
  %56 = add nsw i32 %53, %24
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16
  %60 = add i32 %59, %55
  store i32 %60, i32 addrspace(1)* %58, align 4, !tbaa !16
  %61 = add nuw nsw i32 %53, %12
  %62 = icmp slt i32 %61, %22
  br i1 %62, label %52, label %63, !llvm.loop !23

63:                                               ; preds = %52, %34
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
