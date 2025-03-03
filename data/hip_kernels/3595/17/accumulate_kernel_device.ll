; ModuleID = '../data/hip_kernels/3595/17/main.cu'
source_filename = "../data/hip_kernels/3595/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17accumulate_kernelPfiiS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %114

26:                                               ; preds = %4
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  store float 0.000000e+00, float addrspace(1)* %28, align 4, !tbaa !16
  %29 = icmp sgt i32 %1, 0
  br i1 %29, label %30, label %114

30:                                               ; preds = %26
  %31 = and i32 %1, 7
  %32 = icmp ult i32 %1, 8
  br i1 %32, label %97, label %33

33:                                               ; preds = %30
  %34 = and i32 %1, -8
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi float [ 0.000000e+00, %33 ], [ %93, %35 ]
  %37 = phi i32 [ 0, %33 ], [ %94, %35 ]
  %38 = phi i32 [ 0, %33 ], [ %95, %35 ]
  %39 = mul nsw i32 %37, %2
  %40 = add nsw i32 %39, %24
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16
  %44 = fadd contract float %43, %36
  store float %44, float addrspace(1)* %28, align 4, !tbaa !16
  %45 = or i32 %37, 1
  %46 = mul nsw i32 %45, %2
  %47 = add nsw i32 %46, %24
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16
  %51 = fadd contract float %50, %44
  store float %51, float addrspace(1)* %28, align 4, !tbaa !16
  %52 = or i32 %37, 2
  %53 = mul nsw i32 %52, %2
  %54 = add nsw i32 %53, %24
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fadd contract float %57, %51
  store float %58, float addrspace(1)* %28, align 4, !tbaa !16
  %59 = or i32 %37, 3
  %60 = mul nsw i32 %59, %2
  %61 = add nsw i32 %60, %24
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fadd contract float %64, %58
  store float %65, float addrspace(1)* %28, align 4, !tbaa !16
  %66 = or i32 %37, 4
  %67 = mul nsw i32 %66, %2
  %68 = add nsw i32 %67, %24
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = fadd contract float %71, %65
  store float %72, float addrspace(1)* %28, align 4, !tbaa !16
  %73 = or i32 %37, 5
  %74 = mul nsw i32 %73, %2
  %75 = add nsw i32 %74, %24
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fadd contract float %78, %72
  store float %79, float addrspace(1)* %28, align 4, !tbaa !16
  %80 = or i32 %37, 6
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %24
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %85, %79
  store float %86, float addrspace(1)* %28, align 4, !tbaa !16
  %87 = or i32 %37, 7
  %88 = mul nsw i32 %87, %2
  %89 = add nsw i32 %88, %24
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fadd contract float %92, %86
  store float %93, float addrspace(1)* %28, align 4, !tbaa !16
  %94 = add nuw nsw i32 %37, 8
  %95 = add i32 %38, 8
  %96 = icmp eq i32 %95, %34
  br i1 %96, label %97, label %35, !llvm.loop !20

97:                                               ; preds = %35, %30
  %98 = phi float [ 0.000000e+00, %30 ], [ %93, %35 ]
  %99 = phi i32 [ 0, %30 ], [ %94, %35 ]
  %100 = icmp eq i32 %31, 0
  br i1 %100, label %114, label %101

101:                                              ; preds = %97, %101
  %102 = phi float [ %110, %101 ], [ %98, %97 ]
  %103 = phi i32 [ %111, %101 ], [ %99, %97 ]
  %104 = phi i32 [ %112, %101 ], [ 0, %97 ]
  %105 = mul nsw i32 %103, %2
  %106 = add nsw i32 %105, %24
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16
  %110 = fadd contract float %109, %102
  store float %110, float addrspace(1)* %28, align 4, !tbaa !16
  %111 = add nuw nsw i32 %103, 1
  %112 = add i32 %104, 1
  %113 = icmp eq i32 %112, %31
  br i1 %113, label %114, label %101, !llvm.loop !22

114:                                              ; preds = %97, %101, %26, %4
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
