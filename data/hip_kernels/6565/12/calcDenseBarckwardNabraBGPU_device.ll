; ModuleID = '../data/hip_kernels/6565/12/main.cu'
source_filename = "../data/hip_kernels/6565/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27calcDenseBarckwardNabraBGPUPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %24, %3
  %26 = icmp sgt i32 %2, 0
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %115

28:                                               ; preds = %4
  %29 = sext i32 %24 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = and i32 %2, 7
  %33 = icmp ult i32 %2, 8
  br i1 %33, label %98, label %34

34:                                               ; preds = %28
  %35 = and i32 %2, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi float [ %31, %34 ], [ %94, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %95, %36 ]
  %39 = phi i32 [ 0, %34 ], [ %96, %36 ]
  %40 = mul nsw i32 %38, %3
  %41 = add nsw i32 %40, %24
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !16
  %45 = fadd contract float %44, %37
  store float %45, float addrspace(1)* %30, align 4, !tbaa !16
  %46 = or i32 %38, 1
  %47 = mul nsw i32 %46, %3
  %48 = add nsw i32 %47, %24
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fadd contract float %51, %45
  store float %52, float addrspace(1)* %30, align 4, !tbaa !16
  %53 = or i32 %38, 2
  %54 = mul nsw i32 %53, %3
  %55 = add nsw i32 %54, %24
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fadd contract float %58, %52
  store float %59, float addrspace(1)* %30, align 4, !tbaa !16
  %60 = or i32 %38, 3
  %61 = mul nsw i32 %60, %3
  %62 = add nsw i32 %61, %24
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fadd contract float %65, %59
  store float %66, float addrspace(1)* %30, align 4, !tbaa !16
  %67 = or i32 %38, 4
  %68 = mul nsw i32 %67, %3
  %69 = add nsw i32 %68, %24
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16
  %73 = fadd contract float %72, %66
  store float %73, float addrspace(1)* %30, align 4, !tbaa !16
  %74 = or i32 %38, 5
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %75, %24
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !16
  %80 = fadd contract float %79, %73
  store float %80, float addrspace(1)* %30, align 4, !tbaa !16
  %81 = or i32 %38, 6
  %82 = mul nsw i32 %81, %3
  %83 = add nsw i32 %82, %24
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = fadd contract float %86, %80
  store float %87, float addrspace(1)* %30, align 4, !tbaa !16
  %88 = or i32 %38, 7
  %89 = mul nsw i32 %88, %3
  %90 = add nsw i32 %89, %24
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fadd contract float %93, %87
  store float %94, float addrspace(1)* %30, align 4, !tbaa !16
  %95 = add nuw nsw i32 %38, 8
  %96 = add i32 %39, 8
  %97 = icmp eq i32 %96, %35
  br i1 %97, label %98, label %36, !llvm.loop !20

98:                                               ; preds = %36, %28
  %99 = phi float [ %31, %28 ], [ %94, %36 ]
  %100 = phi i32 [ 0, %28 ], [ %95, %36 ]
  %101 = icmp eq i32 %32, 0
  br i1 %101, label %115, label %102

102:                                              ; preds = %98, %102
  %103 = phi float [ %111, %102 ], [ %99, %98 ]
  %104 = phi i32 [ %112, %102 ], [ %100, %98 ]
  %105 = phi i32 [ %113, %102 ], [ 0, %98 ]
  %106 = mul nsw i32 %104, %3
  %107 = add nsw i32 %106, %24
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %0, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fadd contract float %110, %103
  store float %111, float addrspace(1)* %30, align 4, !tbaa !16
  %112 = add nuw nsw i32 %104, 1
  %113 = add i32 %105, 1
  %114 = icmp eq i32 %113, %32
  br i1 %114, label %115, label %102, !llvm.loop !22

115:                                              ; preds = %98, %102, %4
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
