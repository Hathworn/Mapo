; ModuleID = '../data/hip_kernels/5182/69/main.cu'
source_filename = "../data/hip_kernels/5182/69/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12SumCentroidsPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = mul nsw i32 %2, 5
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %110

27:                                               ; preds = %4
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %52

29:                                               ; preds = %27
  %30 = mul nsw i32 %24, %3
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %3, -8
  br label %56

35:                                               ; preds = %56, %29
  %36 = phi float [ undef, %29 ], [ %106, %56 ]
  %37 = phi i32 [ 0, %29 ], [ %107, %56 ]
  %38 = phi float [ 0.000000e+00, %29 ], [ %106, %56 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %52, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %49, %40 ], [ %37, %35 ]
  %42 = phi float [ %48, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %50, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = fadd contract float %42, %47
  %49 = add nuw nsw i32 %41, 1
  %50 = add i32 %43, 1
  %51 = icmp eq i32 %50, %31
  br i1 %51, label %52, label %40, !llvm.loop !20

52:                                               ; preds = %35, %40, %27
  %53 = phi float [ 0.000000e+00, %27 ], [ %36, %35 ], [ %48, %40 ]
  %54 = sext i32 %24 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %53, float addrspace(1)* %55, align 4, !tbaa !16
  br label %110

56:                                               ; preds = %56, %33
  %57 = phi i32 [ 0, %33 ], [ %107, %56 ]
  %58 = phi float [ 0.000000e+00, %33 ], [ %106, %56 ]
  %59 = phi i32 [ 0, %33 ], [ %108, %56 ]
  %60 = add nsw i32 %57, %30
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = fadd contract float %58, %63
  %65 = or i32 %57, 1
  %66 = add nsw i32 %65, %30
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !5
  %70 = fadd contract float %64, %69
  %71 = or i32 %57, 2
  %72 = add nsw i32 %71, %30
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !5
  %76 = fadd contract float %70, %75
  %77 = or i32 %57, 3
  %78 = add nsw i32 %77, %30
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !5
  %82 = fadd contract float %76, %81
  %83 = or i32 %57, 4
  %84 = add nsw i32 %83, %30
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !5
  %88 = fadd contract float %82, %87
  %89 = or i32 %57, 5
  %90 = add nsw i32 %89, %30
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16, !amdgpu.noclobber !5
  %94 = fadd contract float %88, %93
  %95 = or i32 %57, 6
  %96 = add nsw i32 %95, %30
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !5
  %100 = fadd contract float %94, %99
  %101 = or i32 %57, 7
  %102 = add nsw i32 %101, %30
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !5
  %106 = fadd contract float %100, %105
  %107 = add nuw nsw i32 %57, 8
  %108 = add i32 %59, 8
  %109 = icmp eq i32 %108, %34
  br i1 %109, label %35, label %56, !llvm.loop !22

110:                                              ; preds = %52, %4
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
