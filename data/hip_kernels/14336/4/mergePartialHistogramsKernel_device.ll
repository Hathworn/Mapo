; ModuleID = '../data/hip_kernels/14336/4/main.cu'
source_filename = "../data/hip_kernels/14336/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ28mergePartialHistogramsKernelPjS_jjE4data = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z28mergePartialHistogramsKernelPjS_jj(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = icmp ult i32 %5, %3
  br i1 %6, label %7, label %44

7:                                                ; preds = %4
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = icmp ult i32 %8, %2
  %10 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %8
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !5
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = icmp ult i32 %8, 64
  %24 = add nuw nsw i32 %8, 64
  %25 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %24
  %26 = icmp ult i32 %8, 32
  %27 = add nuw nsw i32 %8, 32
  %28 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %27
  %29 = icmp ult i32 %8, 16
  %30 = add nuw nsw i32 %8, 16
  %31 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %30
  %32 = icmp ult i32 %8, 8
  %33 = add nuw nsw i32 %8, 8
  %34 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %33
  %35 = icmp ult i32 %8, 4
  %36 = add nuw nsw i32 %8, 4
  %37 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %36
  %38 = icmp ult i32 %8, 2
  %39 = add nuw nsw i32 %8, 2
  %40 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %39
  %41 = add nuw nsw i32 %8, 1
  %42 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 %41
  %43 = icmp eq i32 %8, 0
  br label %45

44:                                               ; preds = %97, %4
  ret void

45:                                               ; preds = %7, %97
  %46 = phi i32 [ %5, %7 ], [ %99, %97 ]
  br i1 %9, label %49, label %47

47:                                               ; preds = %49, %45
  %48 = phi i32 [ 0, %45 ], [ %57, %49 ]
  store i32 %48, i32 addrspace(3)* %10, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %23, label %60, label %64

49:                                               ; preds = %45, %49
  %50 = phi i32 [ %58, %49 ], [ %8, %45 ]
  %51 = phi i32 [ %57, %49 ], [ 0, %45 ]
  %52 = mul i32 %50, %3
  %53 = add i32 %52, %46
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !16
  %57 = add i32 %56, %51
  %58 = add i32 %50, 128
  %59 = icmp ult i32 %58, %2
  br i1 %59, label %49, label %47, !llvm.loop !20

60:                                               ; preds = %47
  %61 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !16
  %62 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %63 = add i32 %62, %61
  store i32 %63, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %64

64:                                               ; preds = %47, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %26, label %65, label %69

65:                                               ; preds = %64
  %66 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !16
  %67 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %68 = add i32 %67, %66
  store i32 %68, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %69

69:                                               ; preds = %65, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %29, label %70, label %74

70:                                               ; preds = %69
  %71 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !16
  %72 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %73 = add i32 %72, %71
  store i32 %73, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %70, %69
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %32, label %75, label %79

75:                                               ; preds = %74
  %76 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !16
  %77 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %78 = add i32 %77, %76
  store i32 %78, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %79

79:                                               ; preds = %75, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %35, label %80, label %84

80:                                               ; preds = %79
  %81 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !16
  %82 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %83 = add i32 %82, %81
  store i32 %83, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %84

84:                                               ; preds = %80, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %38, label %85, label %89

85:                                               ; preds = %84
  %86 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !16
  %87 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %88 = add i32 %87, %86
  store i32 %88, i32 addrspace(3)* %10, align 4, !tbaa !16
  br label %89

89:                                               ; preds = %85, %84
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %43, label %90, label %97

90:                                               ; preds = %89
  %91 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !16
  %92 = load i32, i32 addrspace(3)* %10, align 4, !tbaa !16
  %93 = add i32 %92, %91
  store i32 %93, i32 addrspace(3)* %10, align 4, !tbaa !16
  %94 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ28mergePartialHistogramsKernelPjS_jjE4data, i32 0, i32 0), align 16, !tbaa !16
  %95 = zext i32 %46 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  store i32 %94, i32 addrspace(1)* %96, align 4, !tbaa !16
  br label %97

97:                                               ; preds = %89, %90
  %98 = add i32 %19, %46
  %99 = add i32 %98, %22
  %100 = icmp ult i32 %99, %3
  br i1 %100, label %45, label %44, !llvm.loop !22
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
