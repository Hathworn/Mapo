; ModuleID = '../data/hip_kernels/4156/14/main.cu'
source_filename = "../data/hip_kernels/4156/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11int_to_charPiPh(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
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
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16
  %29 = sdiv i32 %28, 65536
  %30 = trunc i32 %29 to i8
  %31 = mul nsw i32 %25, 3
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %32
  store i8 %30, i8 addrspace(1)* %33, align 1, !tbaa !20
  %34 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16
  %35 = sdiv i32 %34, 256
  %36 = trunc i32 %35 to i8
  %37 = add nsw i32 %31, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %38
  store i8 %36, i8 addrspace(1)* %39, align 1, !tbaa !20
  %40 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16
  %41 = trunc i32 %40 to i8
  %42 = add nsw i32 %31, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %43
  store i8 %41, i8 addrspace(1)* %44, align 1, !tbaa !20
  %45 = add nsw i32 %8, 8
  %46 = mul i32 %45, %21
  %47 = add i32 %46, %3
  %48 = shl i32 %47, 5
  %49 = add i32 %48, %4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %53 = sdiv i32 %52, 65536
  %54 = trunc i32 %53 to i8
  %55 = mul nsw i32 %49, 3
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %56
  store i8 %54, i8 addrspace(1)* %57, align 1, !tbaa !20
  %58 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %59 = sdiv i32 %58, 256
  %60 = trunc i32 %59 to i8
  %61 = add nsw i32 %55, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %62
  store i8 %60, i8 addrspace(1)* %63, align 1, !tbaa !20
  %64 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !16
  %65 = trunc i32 %64 to i8
  %66 = add nsw i32 %55, 2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %67
  store i8 %65, i8 addrspace(1)* %68, align 1, !tbaa !20
  %69 = add nsw i32 %8, 16
  %70 = mul i32 %69, %21
  %71 = add i32 %70, %3
  %72 = shl i32 %71, 5
  %73 = add i32 %72, %4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !16
  %77 = sdiv i32 %76, 65536
  %78 = trunc i32 %77 to i8
  %79 = mul nsw i32 %73, 3
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %80
  store i8 %78, i8 addrspace(1)* %81, align 1, !tbaa !20
  %82 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !16
  %83 = sdiv i32 %82, 256
  %84 = trunc i32 %83 to i8
  %85 = add nsw i32 %79, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %86
  store i8 %84, i8 addrspace(1)* %87, align 1, !tbaa !20
  %88 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !16
  %89 = trunc i32 %88 to i8
  %90 = add nsw i32 %79, 2
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %91
  store i8 %89, i8 addrspace(1)* %92, align 1, !tbaa !20
  %93 = add nsw i32 %8, 24
  %94 = mul i32 %93, %21
  %95 = add i32 %94, %3
  %96 = shl i32 %95, 5
  %97 = add i32 %96, %4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !16
  %101 = sdiv i32 %100, 65536
  %102 = trunc i32 %101 to i8
  %103 = mul nsw i32 %97, 3
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %104
  store i8 %102, i8 addrspace(1)* %105, align 1, !tbaa !20
  %106 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !16
  %107 = sdiv i32 %106, 256
  %108 = trunc i32 %107 to i8
  %109 = add nsw i32 %103, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %110
  store i8 %108, i8 addrspace(1)* %111, align 1, !tbaa !20
  %112 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !16
  %113 = trunc i32 %112 to i8
  %114 = add nsw i32 %103, 2
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %115
  store i8 %113, i8 addrspace(1)* %116, align 1, !tbaa !20
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
