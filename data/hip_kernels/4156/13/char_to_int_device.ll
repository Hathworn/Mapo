; ModuleID = '../data/hip_kernels/4156/13/main.cu'
source_filename = "../data/hip_kernels/4156/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11char_to_intPiPh(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !5
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !14, !invariant.load !15
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %8, %21
  %23 = add i32 %22, %3
  %24 = shl i32 %23, 5
  %25 = add i32 %24, %4
  %26 = mul nsw i32 %25, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !16
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 16
  %32 = add nsw i32 %26, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !16
  %36 = zext i8 %35 to i32
  %37 = shl nuw nsw i32 %36, 8
  %38 = or i32 %37, %31
  %39 = add nsw i32 %26, 2
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !16
  %43 = zext i8 %42 to i32
  %44 = or i32 %38, %43
  %45 = sext i32 %25 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  store i32 %44, i32 addrspace(1)* %46, align 4, !tbaa !19
  %47 = add nsw i32 %8, 8
  %48 = mul i32 %47, %21
  %49 = add i32 %48, %3
  %50 = shl i32 %49, 5
  %51 = add i32 %50, %4
  %52 = mul nsw i32 %51, 3
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !16
  %56 = zext i8 %55 to i32
  %57 = shl nuw nsw i32 %56, 16
  %58 = add nsw i32 %52, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !16
  %62 = zext i8 %61 to i32
  %63 = shl nuw nsw i32 %62, 8
  %64 = or i32 %63, %57
  %65 = add nsw i32 %52, 2
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !16
  %69 = zext i8 %68 to i32
  %70 = or i32 %64, %69
  %71 = sext i32 %51 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  store i32 %70, i32 addrspace(1)* %72, align 4, !tbaa !19
  %73 = add nsw i32 %8, 16
  %74 = mul i32 %73, %21
  %75 = add i32 %74, %3
  %76 = shl i32 %75, 5
  %77 = add i32 %76, %4
  %78 = mul nsw i32 %77, 3
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %79
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !16
  %82 = zext i8 %81 to i32
  %83 = shl nuw nsw i32 %82, 16
  %84 = add nsw i32 %78, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !16
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = or i32 %89, %83
  %91 = add nsw i32 %78, 2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !16
  %95 = zext i8 %94 to i32
  %96 = or i32 %90, %95
  %97 = sext i32 %77 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  store i32 %96, i32 addrspace(1)* %98, align 4, !tbaa !19
  %99 = add nsw i32 %8, 24
  %100 = mul i32 %99, %21
  %101 = add i32 %100, %3
  %102 = shl i32 %101, 5
  %103 = add i32 %102, %4
  %104 = mul nsw i32 %103, 3
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !16
  %108 = zext i8 %107 to i32
  %109 = shl nuw nsw i32 %108, 16
  %110 = add nsw i32 %104, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %111
  %113 = load i8, i8 addrspace(1)* %112, align 1, !tbaa !16
  %114 = zext i8 %113 to i32
  %115 = shl nuw nsw i32 %114, 8
  %116 = or i32 %115, %109
  %117 = add nsw i32 %104, 2
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %118
  %120 = load i8, i8 addrspace(1)* %119, align 1, !tbaa !16
  %121 = zext i8 %120 to i32
  %122 = or i32 %116, %121
  %123 = sext i32 %103 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %123
  store i32 %122, i32 addrspace(1)* %124, align 4, !tbaa !19
  ret void
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
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !17, i64 0}
