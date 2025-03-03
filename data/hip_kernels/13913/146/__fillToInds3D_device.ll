; ModuleID = '../data/hip_kernels/13913/146/main.cu'
source_filename = "../data/hip_kernels/13913/146/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14__fillToInds3DfPfiiPiiS0_iS0_i(float %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 addrspace(1)* readonly %4, i32 %5, i32 addrspace(1)* readonly %6, i32 %7, i32 addrspace(1)* readonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = udiv i32 %19, %16
  %22 = mul i32 %21, %16
  %23 = icmp ugt i32 %19, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = mul i32 %25, %26
  %28 = add i32 %27, %20
  %29 = mul i32 %28, %16
  %30 = add i32 %29, %11
  %31 = mul i32 %25, %16
  %32 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %33 = bitcast i8 addrspace(4)* %32 to i32 addrspace(4)*
  %34 = load i32, i32 addrspace(4)* %33, align 8, !tbaa !16
  %35 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 2, !range !5, !invariant.load !6
  %38 = zext i16 %37 to i32
  %39 = udiv i32 %34, %38
  %40 = mul i32 %39, %38
  %41 = icmp ugt i32 %34, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %31, %43
  %45 = mul nsw i32 %7, %5
  %46 = sdiv i32 %30, %45
  %47 = mul nsw i32 %46, %45
  %48 = sub nsw i32 %30, %47
  %49 = sdiv i32 %44, %45
  %50 = mul nsw i32 %49, %45
  %51 = sub nsw i32 %44, %50
  %52 = sdiv i32 %48, %5
  %53 = sdiv i32 %51, %5
  %54 = mul nsw i32 %53, %5
  %55 = sub nsw i32 %51, %54
  %56 = mul nsw i32 %45, %9
  %57 = icmp slt i32 %30, %56
  br i1 %57, label %58, label %108

58:                                               ; preds = %10
  %59 = mul nsw i32 %52, %5
  %60 = sub nsw i32 %48, %59
  %61 = icmp eq i32 addrspace(1)* %8, addrspacecast (i32* null to i32 addrspace(1)*)
  %62 = icmp eq i32 addrspace(1)* %6, addrspacecast (i32* null to i32 addrspace(1)*)
  %63 = icmp eq i32 addrspace(1)* %4, addrspacecast (i32* null to i32 addrspace(1)*)
  br label %64

64:                                               ; preds = %58, %85
  %65 = phi i32 [ %30, %58 ], [ %106, %85 ]
  %66 = phi i32 [ %46, %58 ], [ %105, %85 ]
  %67 = phi i32 [ %52, %58 ], [ %102, %85 ]
  %68 = phi i32 [ %60, %58 ], [ %96, %85 ]
  br i1 %61, label %73, label %69

69:                                               ; preds = %64
  %70 = sext i32 %66 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %73

73:                                               ; preds = %69, %64
  %74 = phi i32 [ %72, %69 ], [ %66, %64 ]
  br i1 %62, label %79, label %75

75:                                               ; preds = %73
  %76 = sext i32 %67 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %79

79:                                               ; preds = %75, %73
  %80 = phi i32 [ %78, %75 ], [ %67, %73 ]
  br i1 %63, label %85, label %81

81:                                               ; preds = %79
  %82 = sext i32 %68 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !17, !amdgpu.noclobber !6
  br label %85

85:                                               ; preds = %81, %79
  %86 = phi i32 [ %84, %81 ], [ %68, %79 ]
  %87 = mul nsw i32 %74, %3
  %88 = add nsw i32 %80, %87
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %86, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  store float %0, float addrspace(1)* %92, align 4, !tbaa !21
  %93 = add nsw i32 %68, %55
  %94 = icmp sge i32 %93, %5
  %95 = select i1 %94, i32 %5, i32 0
  %96 = sub nsw i32 %93, %95
  %97 = zext i1 %94 to i32
  %98 = add i32 %67, %53
  %99 = add i32 %98, %97
  %100 = icmp sge i32 %99, %7
  %101 = select i1 %100, i32 %7, i32 0
  %102 = sub nsw i32 %99, %101
  %103 = zext i1 %100 to i32
  %104 = add i32 %66, %49
  %105 = add i32 %104, %103
  %106 = add nsw i32 %65, %44
  %107 = icmp slt i32 %106, %56
  br i1 %107, label %64, label %108, !llvm.loop !23

108:                                              ; preds = %85, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!16 = !{!8, !12, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
