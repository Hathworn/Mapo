; ModuleID = '../data/hip_kernels/1227/4/main.cu'
source_filename = "../data/hip_kernels/1227/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ26mat_mult_transposed_kernelPiS_S_E4smem = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26mat_mult_transposed_kernelPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 12
  %6 = bitcast i8 addrspace(4)* %5 to i32 addrspace(4)*
  %7 = load i32, i32 addrspace(4)* %6, align 4, !tbaa !4
  %8 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !13, !invariant.load !14
  %11 = zext i16 %10 to i32
  %12 = udiv i32 %7, %11
  %13 = mul i32 %12, %11
  %14 = icmp ugt i32 %7, %13
  %15 = zext i1 %14 to i32
  %16 = add i32 %12, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ26mat_mult_transposed_kernelPiS_S_E4smem, i32 0, i32 %18
  %20 = icmp ult i16 %10, 2
  %21 = icmp eq i32 %18, 0
  %22 = udiv i16 239, %10
  %23 = zext i16 %22 to i32
  br label %25

24:                                               ; preds = %34
  ret void

25:                                               ; preds = %3, %34
  %26 = phi i32 [ 0, %3 ], [ %36, %34 ]
  %27 = phi i32 [ 0, %3 ], [ %35, %34 ]
  %28 = add i32 %26, %17
  %29 = mul nsw i32 %28, 240
  %30 = shl nsw i32 %28, 9
  br label %31

31:                                               ; preds = %25, %82
  %32 = phi i32 [ 0, %25 ], [ %83, %82 ]
  %33 = mul nuw nsw i32 %32, 240
  br label %39

34:                                               ; preds = %82
  %35 = add nuw nsw i32 %27, 1
  %36 = mul i32 %16, %35
  %37 = icmp ult i32 %36, 256
  br i1 %37, label %25, label %24, !llvm.loop !16

38:                                               ; preds = %73
  br i1 %21, label %78, label %82

39:                                               ; preds = %31, %73
  %40 = phi i32 [ 0, %31 ], [ %76, %73 ]
  %41 = phi i32 [ 0, %31 ], [ %75, %73 ]
  %42 = phi i32 [ 0, %31 ], [ %74, %73 ]
  %43 = add nuw nsw i32 %40, %18
  %44 = icmp ugt i32 %43, 239
  br i1 %44, label %55, label %45

45:                                               ; preds = %39
  %46 = add nsw i32 %43, %29
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !18
  %50 = add nuw nsw i32 %43, %33
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !18
  %54 = mul nsw i32 %53, %49
  br label %55

55:                                               ; preds = %39, %45
  %56 = phi i32 [ %54, %45 ], [ 0, %39 ]
  store i32 %56, i32 addrspace(3)* %19, align 4, !tbaa !18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %57, label %58

57:                                               ; preds = %68, %55
  br i1 %21, label %70, label %73

58:                                               ; preds = %55, %68
  %59 = phi i32 [ %60, %68 ], [ %11, %55 ]
  %60 = lshr i32 %59, 1
  %61 = icmp ult i32 %18, %60
  br i1 %61, label %62, label %68

62:                                               ; preds = %58
  %63 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !18
  %64 = add nuw nsw i32 %60, %18
  %65 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ26mat_mult_transposed_kernelPiS_S_E4smem, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !18
  %67 = add nsw i32 %66, %63
  store i32 %67, i32 addrspace(3)* %19, align 4, !tbaa !18
  br label %68

68:                                               ; preds = %62, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = icmp ult i32 %59, 4
  br i1 %69, label %57, label %58, !llvm.loop !22

70:                                               ; preds = %57
  %71 = load i32, i32 addrspace(3)* %19, align 4, !tbaa !18
  %72 = add nsw i32 %71, %42
  br label %73

73:                                               ; preds = %70, %57
  %74 = phi i32 [ %72, %70 ], [ %42, %57 ]
  %75 = add nuw nsw i32 %41, 1
  %76 = mul nuw nsw i32 %75, %11
  %77 = icmp eq i32 %41, %23
  br i1 %77, label %38, label %39, !llvm.loop !23

78:                                               ; preds = %38
  %79 = add nsw i32 %32, %30
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %80
  store i32 %74, i32 addrspace(1)* %81, align 4, !tbaa !18
  br label %82

82:                                               ; preds = %78, %38
  %83 = add nuw nsw i32 %32, 1
  %84 = icmp eq i32 %83, 512
  br i1 %84, label %34, label %31, !llvm.loop !24
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
!15 = !{i32 0, i32 1024}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
!23 = distinct !{!23, !17}
!24 = distinct !{!24, !17}
