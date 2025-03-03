; ModuleID = '../data/hip_kernels/43/3/main.cu'
source_filename = "../data/hip_kernels/43/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z25chol_kernel_cudaUFMG_zeroPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !6
  %11 = udiv i32 %10, %7
  %12 = icmp eq i32 %1, 0
  br i1 %12, label %57, label %13

13:                                               ; preds = %2
  %14 = mul i32 %11, %7
  %15 = icmp ugt i32 %10, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %3, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %25 = add i32 %23, %24
  %26 = mul i32 %17, %25
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %28 = add i32 %26, %27
  %29 = mul i32 %28, %7
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %30
  %32 = mul nsw i32 %31, %1
  %33 = and i32 %1, 1
  %34 = icmp eq i32 %1, 1
  br i1 %34, label %37, label %35

35:                                               ; preds = %13
  %36 = and i32 %1, -2
  br label %58

37:                                               ; preds = %95, %13
  %38 = phi i32 [ 0, %13 ], [ %96, %95 ]
  %39 = icmp eq i32 %33, 0
  br i1 %39, label %57, label %40

40:                                               ; preds = %37
  %41 = add i32 %38, %32
  %42 = freeze i32 %41
  %43 = sdiv i32 %42, 2048
  %44 = mul i32 %43, 2048
  %45 = sub i32 %42, %44
  %46 = icmp eq i32 %45, %43
  br i1 %46, label %57, label %47

47:                                               ; preds = %40
  %48 = icmp slt i32 %43, %45
  %49 = sub nsw i32 2047, %45
  %50 = sub nsw i32 2047, %43
  %51 = select i1 %48, i32 %49, i32 %45
  %52 = select i1 %48, i32 %50, i32 %43
  %53 = shl nsw i32 %52, 11
  %54 = add nsw i32 %53, %51
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  store float 0.000000e+00, float addrspace(1)* %56, align 4, !tbaa !16
  br label %57

57:                                               ; preds = %37, %47, %40, %2
  ret void

58:                                               ; preds = %95, %35
  %59 = phi i32 [ 0, %35 ], [ %96, %95 ]
  %60 = phi i32 [ 0, %35 ], [ %97, %95 ]
  %61 = add i32 %59, %32
  %62 = freeze i32 %61
  %63 = sdiv i32 %62, 2048
  %64 = mul i32 %63, 2048
  %65 = sub i32 %62, %64
  %66 = icmp eq i32 %65, %63
  br i1 %66, label %77, label %67

67:                                               ; preds = %58
  %68 = icmp slt i32 %63, %65
  %69 = sub nsw i32 2047, %65
  %70 = sub nsw i32 2047, %63
  %71 = select i1 %68, i32 %69, i32 %65
  %72 = select i1 %68, i32 %70, i32 %63
  %73 = shl nsw i32 %72, 11
  %74 = add nsw i32 %73, %71
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  store float 0.000000e+00, float addrspace(1)* %76, align 4, !tbaa !16
  br label %77

77:                                               ; preds = %58, %67
  %78 = or i32 %59, 1
  %79 = add i32 %78, %32
  %80 = freeze i32 %79
  %81 = sdiv i32 %80, 2048
  %82 = mul i32 %81, 2048
  %83 = sub i32 %80, %82
  %84 = icmp eq i32 %83, %81
  br i1 %84, label %95, label %85

85:                                               ; preds = %77
  %86 = icmp slt i32 %81, %83
  %87 = sub nsw i32 2047, %83
  %88 = sub nsw i32 2047, %81
  %89 = select i1 %86, i32 %87, i32 %83
  %90 = select i1 %86, i32 %88, i32 %81
  %91 = shl nsw i32 %90, 11
  %92 = add nsw i32 %91, %89
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  store float 0.000000e+00, float addrspace(1)* %94, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %85, %77
  %96 = add nuw i32 %59, 2
  %97 = add i32 %60, 2
  %98 = icmp eq i32 %97, %36
  br i1 %98, label %37, label %58, !llvm.loop !20
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
