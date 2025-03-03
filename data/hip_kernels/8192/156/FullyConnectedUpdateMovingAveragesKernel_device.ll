; ModuleID = '../data/hip_kernels/8192/156/main.cu'
source_filename = "../data/hip_kernels/8192/156/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z40FullyConnectedUpdateMovingAveragesKernelPfS_S_S_S_S_S_S_S_S_S_S_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float addrspace(1)* nocapture %10, float addrspace(1)* nocapture %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, i32 %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !6
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = udiv i32 %25, %22
  %29 = mul i32 %28, %22
  %30 = icmp ugt i32 %25, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %27
  %34 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %35 = add i32 %33, %26
  %36 = mul i32 %35, %22
  %37 = add i32 %36, %34
  %38 = icmp slt i32 %37, %16
  br i1 %38, label %39, label %136

39:                                               ; preds = %17
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %14, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16, !amdgpu.noclobber !5
  %43 = fcmp contract une float %42, 0.000000e+00
  br i1 %43, label %136, label %44

44:                                               ; preds = %39
  %45 = icmp sgt i32 %15, 0
  br i1 %45, label %46, label %94

46:                                               ; preds = %44, %46
  %47 = phi i32 [ %91, %46 ], [ %37, %44 ]
  %48 = phi i32 [ %92, %46 ], [ 0, %44 ]
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %12, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fdiv contract float 1.000000e+00, %51
  %53 = fsub contract float 1.000000e+00, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %49
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fmul contract float %55, %53
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = fmul contract float %52, %58
  %60 = fadd contract float %56, %59
  store float %60, float addrspace(1)* %54, align 4, !tbaa !16
  %61 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %62 = fdiv contract float 1.000000e+00, %61
  %63 = fsub contract float 1.000000e+00, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %6, i64 %49
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fmul contract float %65, %63
  %67 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %68 = fmul contract float %62, %67
  %69 = fmul contract float %67, %68
  %70 = fadd contract float %66, %69
  store float %70, float addrspace(1)* %64, align 4, !tbaa !16
  %71 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %72 = fdiv contract float 1.000000e+00, %71
  %73 = fsub contract float 1.000000e+00, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %8, i64 %49
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = fmul contract float %75, %73
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %79 = fmul contract float %72, %78
  %80 = fadd contract float %76, %79
  store float %80, float addrspace(1)* %74, align 4, !tbaa !16
  %81 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %82 = fdiv contract float 1.000000e+00, %81
  %83 = fsub contract float 1.000000e+00, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %10, i64 %49
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fmul contract float %85, %83
  %87 = load float, float addrspace(1)* %77, align 4, !tbaa !16
  %88 = fmul contract float %82, %87
  %89 = fmul contract float %87, %88
  %90 = fadd contract float %86, %89
  store float %90, float addrspace(1)* %84, align 4, !tbaa !16
  %91 = add nsw i32 %47, %16
  %92 = add nuw nsw i32 %48, 1
  %93 = icmp eq i32 %92, %15
  br i1 %93, label %94, label %46, !llvm.loop !20

94:                                               ; preds = %46, %44
  %95 = getelementptr inbounds float, float addrspace(1)* %13, i64 %40
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fdiv contract float 1.000000e+00, %96
  %98 = fsub contract float 1.000000e+00, %97
  %99 = getelementptr inbounds float, float addrspace(1)* %5, i64 %40
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fmul contract float %100, %98
  %102 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %104 = fmul contract float %97, %103
  %105 = fadd contract float %101, %104
  store float %105, float addrspace(1)* %99, align 4, !tbaa !16
  %106 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %107 = fdiv contract float 1.000000e+00, %106
  %108 = fsub contract float 1.000000e+00, %107
  %109 = getelementptr inbounds float, float addrspace(1)* %7, i64 %40
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !16
  %111 = fmul contract float %110, %108
  %112 = load float, float addrspace(1)* %102, align 4, !tbaa !16
  %113 = fmul contract float %107, %112
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  store float %115, float addrspace(1)* %109, align 4, !tbaa !16
  %116 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %117 = fdiv contract float 1.000000e+00, %116
  %118 = fsub contract float 1.000000e+00, %117
  %119 = getelementptr inbounds float, float addrspace(1)* %9, i64 %40
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fmul contract float %120, %118
  %122 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %124 = fmul contract float %117, %123
  %125 = fadd contract float %121, %124
  store float %125, float addrspace(1)* %119, align 4, !tbaa !16
  %126 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %127 = fdiv contract float 1.000000e+00, %126
  %128 = fsub contract float 1.000000e+00, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %11, i64 %40
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = fmul contract float %130, %128
  %132 = load float, float addrspace(1)* %122, align 4, !tbaa !16
  %133 = fmul contract float %127, %132
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  store float %135, float addrspace(1)* %129, align 4, !tbaa !16
  br label %136

136:                                              ; preds = %39, %94, %17
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
!21 = !{!"llvm.loop.mustprogress"}
