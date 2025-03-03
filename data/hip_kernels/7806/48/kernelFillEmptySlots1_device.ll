; ModuleID = '../data/hip_kernels/7806/48/main.cu'
source_filename = "../data/hip_kernels/7806/48/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21kernelFillEmptySlots1PsPiS0_S0_iii(i16 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = add i32 %22, %23
  %25 = mul i32 %24, %16
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %26
  %28 = icmp slt i32 %27, %4
  br i1 %28, label %29, label %109

29:                                               ; preds = %7
  %30 = sext i32 %27 to i64
  %31 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %30
  %32 = load i16, i16 addrspace(1)* %31, align 2, !tbaa !16, !amdgpu.noclobber !14
  %33 = icmp slt i16 %32, 0
  br i1 %33, label %109, label %34

34:                                               ; preds = %29
  %35 = icmp slt i32 %27, %5
  br i1 %35, label %106, label %36

36:                                               ; preds = %34
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !20, !amdgpu.noclobber !14
  %39 = sub nsw i32 %38, %6
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !20, !amdgpu.noclobber !14
  %43 = mul nsw i32 %27, 9
  %44 = mul nsw i32 %42, 9
  %45 = sext i32 %43 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !20
  %48 = sext i32 %44 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !20
  %50 = add nsw i32 %43, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !20
  %54 = add nsw i32 %44, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %55
  store i32 %53, i32 addrspace(1)* %56, align 4, !tbaa !20
  %57 = add nsw i32 %43, 2
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !20
  %61 = add nsw i32 %44, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %62
  store i32 %60, i32 addrspace(1)* %63, align 4, !tbaa !20
  %64 = add nsw i32 %43, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !20
  %68 = add nsw i32 %44, 3
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %69
  store i32 %67, i32 addrspace(1)* %70, align 4, !tbaa !20
  %71 = add nsw i32 %43, 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !20
  %75 = add nsw i32 %44, 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %76
  store i32 %74, i32 addrspace(1)* %77, align 4, !tbaa !20
  %78 = add nsw i32 %43, 5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !20
  %82 = add nsw i32 %44, 5
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %83
  store i32 %81, i32 addrspace(1)* %84, align 4, !tbaa !20
  %85 = add nsw i32 %43, 6
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !20
  %89 = add nsw i32 %44, 6
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %90
  store i32 %88, i32 addrspace(1)* %91, align 4, !tbaa !20
  %92 = add nsw i32 %43, 7
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !20
  %96 = add nsw i32 %44, 7
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %97
  store i32 %95, i32 addrspace(1)* %98, align 4, !tbaa !20
  %99 = add nsw i32 %43, 8
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !20
  %103 = add nsw i32 %44, 8
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %104
  store i32 %102, i32 addrspace(1)* %105, align 4, !tbaa !20
  br label %106

106:                                              ; preds = %36, %34
  %107 = phi i32 [ %27, %34 ], [ %42, %36 ]
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  store i32 %107, i32 addrspace(1)* %108, align 4, !tbaa !20
  br label %109

109:                                              ; preds = %7, %29, %106
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
!16 = !{!17, !17, i64 0}
!17 = !{!"short", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
