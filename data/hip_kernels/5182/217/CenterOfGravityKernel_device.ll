; ModuleID = '../data/hip_kernels/5182/217/main.cu'
source_filename = "../data/hip_kernels/5182/217/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21CenterOfGravityKernelPfS_Pii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
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
  %25 = icmp slt i32 %24, 1
  br i1 %25, label %26, label %140

26:                                               ; preds = %4
  %27 = icmp sgt i32 %3, 0
  br i1 %27, label %28, label %66

28:                                               ; preds = %26
  %29 = and i32 %3, 1
  %30 = icmp eq i32 %3, 1
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %3, -2
  br label %77

33:                                               ; preds = %132, %28
  %34 = phi float [ undef, %28 ], [ %133, %132 ]
  %35 = phi float [ undef, %28 ], [ %134, %132 ]
  %36 = phi float [ undef, %28 ], [ %135, %132 ]
  %37 = phi i32 [ undef, %28 ], [ %136, %132 ]
  %38 = phi i32 [ 0, %28 ], [ %137, %132 ]
  %39 = phi i32 [ 0, %28 ], [ %136, %132 ]
  %40 = phi float [ 0.000000e+00, %28 ], [ %135, %132 ]
  %41 = phi float [ 0.000000e+00, %28 ], [ %134, %132 ]
  %42 = phi float [ 0.000000e+00, %28 ], [ %133, %132 ]
  %43 = icmp eq i32 %29, 0
  br i1 %43, label %66, label %44

44:                                               ; preds = %33
  %45 = zext i32 %38 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %49, label %66

49:                                               ; preds = %44
  %50 = mul nsw i32 %38, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !20, !amdgpu.noclobber !5
  %54 = fadd contract float %42, %53
  %55 = add nuw nsw i32 %50, 1
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !20, !amdgpu.noclobber !5
  %59 = fadd contract float %41, %58
  %60 = add nuw nsw i32 %50, 2
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !20, !amdgpu.noclobber !5
  %64 = fadd contract float %40, %63
  %65 = add nsw i32 %39, 1
  br label %66

66:                                               ; preds = %33, %49, %44, %26
  %67 = phi float [ 0.000000e+00, %26 ], [ %34, %33 ], [ %54, %49 ], [ %42, %44 ]
  %68 = phi float [ 0.000000e+00, %26 ], [ %35, %33 ], [ %59, %49 ], [ %41, %44 ]
  %69 = phi float [ 0.000000e+00, %26 ], [ %36, %33 ], [ %64, %49 ], [ %40, %44 ]
  %70 = phi i32 [ 0, %26 ], [ %37, %33 ], [ %65, %49 ], [ %39, %44 ]
  %71 = sitofp i32 %70 to float
  %72 = fdiv contract float %67, %71
  store float %72, float addrspace(1)* %1, align 4, !tbaa !20
  %73 = fdiv contract float %68, %71
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  store float %73, float addrspace(1)* %74, align 4, !tbaa !20
  %75 = fdiv contract float %69, %71
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  store float %75, float addrspace(1)* %76, align 4, !tbaa !20
  br label %140

77:                                               ; preds = %132, %31
  %78 = phi i32 [ 0, %31 ], [ %137, %132 ]
  %79 = phi i32 [ 0, %31 ], [ %136, %132 ]
  %80 = phi float [ 0.000000e+00, %31 ], [ %135, %132 ]
  %81 = phi float [ 0.000000e+00, %31 ], [ %134, %132 ]
  %82 = phi float [ 0.000000e+00, %31 ], [ %133, %132 ]
  %83 = phi i32 [ 0, %31 ], [ %138, %132 ]
  %84 = zext i32 %78 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !16, !amdgpu.noclobber !5
  %87 = icmp eq i32 %86, 1
  br i1 %87, label %88, label %105

88:                                               ; preds = %77
  %89 = mul nsw i32 %78, 3
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !20, !amdgpu.noclobber !5
  %93 = fadd contract float %82, %92
  %94 = or i32 %89, 1
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !20, !amdgpu.noclobber !5
  %98 = fadd contract float %81, %97
  %99 = add nuw nsw i32 %89, 2
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !20, !amdgpu.noclobber !5
  %103 = fadd contract float %80, %102
  %104 = add nsw i32 %79, 1
  br label %105

105:                                              ; preds = %77, %88
  %106 = phi float [ %93, %88 ], [ %82, %77 ]
  %107 = phi float [ %98, %88 ], [ %81, %77 ]
  %108 = phi float [ %103, %88 ], [ %80, %77 ]
  %109 = phi i32 [ %104, %88 ], [ %79, %77 ]
  %110 = or i32 %78, 1
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !16, !amdgpu.noclobber !5
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %115, label %132

115:                                              ; preds = %105
  %116 = mul nsw i32 %110, 3
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !20, !amdgpu.noclobber !5
  %120 = fadd contract float %106, %119
  %121 = add nuw nsw i32 %116, 1
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !20, !amdgpu.noclobber !5
  %125 = fadd contract float %107, %124
  %126 = add nuw nsw i32 %116, 2
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !20, !amdgpu.noclobber !5
  %130 = fadd contract float %108, %129
  %131 = add nsw i32 %109, 1
  br label %132

132:                                              ; preds = %115, %105
  %133 = phi float [ %120, %115 ], [ %106, %105 ]
  %134 = phi float [ %125, %115 ], [ %107, %105 ]
  %135 = phi float [ %130, %115 ], [ %108, %105 ]
  %136 = phi i32 [ %131, %115 ], [ %109, %105 ]
  %137 = add nuw nsw i32 %78, 2
  %138 = add i32 %83, 2
  %139 = icmp eq i32 %138, %32
  br i1 %139, label %33, label %77, !llvm.loop !22

140:                                              ; preds = %66, %4
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
