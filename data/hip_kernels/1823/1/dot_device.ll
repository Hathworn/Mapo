; ModuleID = '../data/hip_kernels/1823/1/main.cu'
source_filename = "../data/hip_kernels/1823/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3dotPiS_S_E5cache = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = icmp slt i32 %15, 1000
  br i1 %16, label %17, label %36

17:                                               ; preds = %3
  %18 = udiv i32 %12, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %12, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  br label %24

24:                                               ; preds = %17, %24
  %25 = phi i32 [ 0, %17 ], [ %33, %24 ]
  %26 = phi i32 [ %15, %17 ], [ %34, %24 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !5
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !5
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %25
  %34 = add i32 %23, %26
  %35 = icmp slt i32 %34, 1000
  br i1 %35, label %24, label %36, !llvm.loop !20

36:                                               ; preds = %24, %3
  %37 = phi i32 [ 0, %3 ], [ %33, %24 ]
  %38 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ3dotPiS_S_E5cache, i32 0, i32 %14
  store i32 %37, i32 addrspace(3)* %38, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ult i16 %8, 2
  br i1 %39, label %55, label %40

40:                                               ; preds = %36
  %41 = lshr i32 %9, 1
  br label %42

42:                                               ; preds = %40, %51
  %43 = phi i32 [ %52, %51 ], [ %41, %40 ]
  %44 = icmp ult i32 %14, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %42
  %46 = add nsw i32 %43, %14
  %47 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ3dotPiS_S_E5cache, i32 0, i32 %46
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !16
  %49 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !16
  %50 = add nsw i32 %49, %48
  store i32 %50, i32 addrspace(3)* %38, align 4, !tbaa !16
  br label %51

51:                                               ; preds = %45, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = sdiv i32 %43, 2
  %53 = add nsw i32 %43, 1
  %54 = icmp ult i32 %53, 3
  br i1 %54, label %55, label %42, !llvm.loop !22

55:                                               ; preds = %51, %36
  %56 = icmp eq i32 %14, 0
  br i1 %56, label %57, label %61

57:                                               ; preds = %55
  %58 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ3dotPiS_S_E5cache, i32 0, i32 0), align 16, !tbaa !16
  %59 = zext i32 %4 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %59
  store i32 %58, i32 addrspace(1)* %60, align 4, !tbaa !16
  br label %61

61:                                               ; preds = %57, %55
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
