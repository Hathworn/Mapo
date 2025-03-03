; ModuleID = '../data/hip_kernels/8192/12/main.cu'
source_filename = "../data/hip_kernels/8192/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21ComputeDistanceKernelPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = icmp slt i32 %25, %4
  br i1 %26, label %27, label %146

27:                                               ; preds = %5
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %56

29:                                               ; preds = %27
  %30 = mul nsw i32 %25, %3
  %31 = and i32 %3, 7
  %32 = icmp ult i32 %3, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %3, -8
  br label %60

35:                                               ; preds = %60, %29
  %36 = phi float [ undef, %29 ], [ %142, %60 ]
  %37 = phi i32 [ 0, %29 ], [ %143, %60 ]
  %38 = phi float [ 0.000000e+00, %29 ], [ %142, %60 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %56, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %53, %40 ], [ %37, %35 ]
  %42 = phi float [ %52, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %54, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !5
  %48 = zext i32 %41 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !16, !amdgpu.noclobber !5
  %51 = fmul contract float %47, %50
  %52 = fadd contract float %42, %51
  %53 = add nuw nsw i32 %41, 1
  %54 = add i32 %43, 1
  %55 = icmp eq i32 %54, %31
  br i1 %55, label %56, label %40, !llvm.loop !20

56:                                               ; preds = %35, %40, %27
  %57 = phi float [ 0.000000e+00, %27 ], [ %36, %35 ], [ %52, %40 ]
  %58 = sext i32 %25 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !16
  br label %146

60:                                               ; preds = %60, %33
  %61 = phi i32 [ 0, %33 ], [ %143, %60 ]
  %62 = phi float [ 0.000000e+00, %33 ], [ %142, %60 ]
  %63 = phi i32 [ 0, %33 ], [ %144, %60 ]
  %64 = add nsw i32 %61, %30
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !5
  %68 = zext i32 %61 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16, !amdgpu.noclobber !5
  %71 = fmul contract float %67, %70
  %72 = fadd contract float %62, %71
  %73 = or i32 %61, 1
  %74 = add nsw i32 %73, %30
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !5
  %78 = zext i32 %73 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16, !amdgpu.noclobber !5
  %81 = fmul contract float %77, %80
  %82 = fadd contract float %72, %81
  %83 = or i32 %61, 2
  %84 = add nsw i32 %83, %30
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !5
  %88 = zext i32 %83 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = fmul contract float %87, %90
  %92 = fadd contract float %82, %91
  %93 = or i32 %61, 3
  %94 = add nsw i32 %93, %30
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16, !amdgpu.noclobber !5
  %98 = zext i32 %93 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16, !amdgpu.noclobber !5
  %101 = fmul contract float %97, %100
  %102 = fadd contract float %92, %101
  %103 = or i32 %61, 4
  %104 = add nsw i32 %103, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !5
  %108 = zext i32 %103 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %1, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16, !amdgpu.noclobber !5
  %111 = fmul contract float %107, %110
  %112 = fadd contract float %102, %111
  %113 = or i32 %61, 5
  %114 = add nsw i32 %113, %30
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !5
  %118 = zext i32 %113 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16, !amdgpu.noclobber !5
  %121 = fmul contract float %117, %120
  %122 = fadd contract float %112, %121
  %123 = or i32 %61, 6
  %124 = add nsw i32 %123, %30
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %0, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16, !amdgpu.noclobber !5
  %128 = zext i32 %123 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16, !amdgpu.noclobber !5
  %131 = fmul contract float %127, %130
  %132 = fadd contract float %122, %131
  %133 = or i32 %61, 7
  %134 = add nsw i32 %133, %30
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %0, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !16, !amdgpu.noclobber !5
  %138 = zext i32 %133 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !16, !amdgpu.noclobber !5
  %141 = fmul contract float %137, %140
  %142 = fadd contract float %132, %141
  %143 = add nuw nsw i32 %61, 8
  %144 = add i32 %63, 8
  %145 = icmp eq i32 %144, %34
  br i1 %145, label %35, label %60, !llvm.loop !22

146:                                              ; preds = %56, %5
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
