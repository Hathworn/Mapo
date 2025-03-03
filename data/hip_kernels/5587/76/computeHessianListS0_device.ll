; ModuleID = '../data/hip_kernels/5587/76/main.cu'
source_filename = "../data/hip_kernels/5587/76/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20computeHessianListS0PfS_S_PiS0_S0_iPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, double addrspace(1)* nocapture readonly %17, double addrspace(1)* nocapture readonly %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture writeonly %20, i32 %21) local_unnamed_addr #0 {
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 12
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 4, !tbaa !6
  %31 = udiv i32 %30, %27
  %32 = mul i32 %31, %27
  %33 = icmp ugt i32 %30, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %27
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %38 = icmp slt i32 %37, 6
  br i1 %38, label %39, label %142

39:                                               ; preds = %22
  %40 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %41 = mul i32 %40, %27
  %42 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %43 = add i32 %41, %42
  %44 = mul nsw i32 %37, %6
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %19, i64 %45
  %47 = mul nsw i32 %6, 6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %46, i64 %48
  %50 = getelementptr inbounds double, double addrspace(1)* %49, i64 %48
  %51 = mul nsw i32 %37, %21
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %20, i64 %52
  %54 = icmp slt i32 %43, %6
  br i1 %54, label %55, label %142

55:                                               ; preds = %39, %83
  %56 = phi i32 [ %84, %83 ], [ %43, %39 ]
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !5
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !20, !amdgpu.noclobber !5
  %63 = fpext float %62 to double
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %60
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !20, !amdgpu.noclobber !5
  %66 = fpext float %65 to double
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !20, !amdgpu.noclobber !5
  %69 = fpext float %68 to double
  %70 = getelementptr inbounds double, double addrspace(1)* %46, i64 %57
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !22
  %72 = getelementptr inbounds double, double addrspace(1)* %49, i64 %57
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !22
  %74 = getelementptr inbounds double, double addrspace(1)* %50, i64 %57
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !22
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %57
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !16, !amdgpu.noclobber !5
  %78 = add nsw i32 %56, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !16, !amdgpu.noclobber !5
  %82 = icmp slt i32 %77, %81
  br i1 %82, label %86, label %83

83:                                               ; preds = %86, %55
  %84 = add nsw i32 %56, %36
  %85 = icmp slt i32 %84, %6
  br i1 %85, label %55, label %142, !llvm.loop !24

86:                                               ; preds = %55, %86
  %87 = phi i32 [ %140, %86 ], [ %77, %55 ]
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %7, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !22
  %94 = fsub contract double %63, %93
  %95 = getelementptr inbounds double, double addrspace(1)* %10, i64 %91
  %96 = load double, double addrspace(1)* %95, align 8, !tbaa !22
  %97 = fmul contract double %71, %96
  %98 = getelementptr inbounds double, double addrspace(1)* %11, i64 %91
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !22
  %100 = fmul contract double %73, %99
  %101 = fadd contract double %97, %100
  %102 = getelementptr inbounds double, double addrspace(1)* %12, i64 %91
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !22
  %104 = fmul contract double %75, %103
  %105 = fadd contract double %101, %104
  %106 = fmul contract double %94, %105
  %107 = getelementptr inbounds double, double addrspace(1)* %8, i64 %91
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !22
  %109 = fsub contract double %66, %108
  %110 = getelementptr inbounds double, double addrspace(1)* %13, i64 %91
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !22
  %112 = fmul contract double %71, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %14, i64 %91
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !22
  %115 = fmul contract double %73, %114
  %116 = fadd contract double %112, %115
  %117 = getelementptr inbounds double, double addrspace(1)* %15, i64 %91
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !22
  %119 = fmul contract double %75, %118
  %120 = fadd contract double %116, %119
  %121 = fmul contract double %109, %120
  %122 = fadd contract double %106, %121
  %123 = getelementptr inbounds double, double addrspace(1)* %9, i64 %91
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !22
  %125 = fsub contract double %69, %124
  %126 = getelementptr inbounds double, double addrspace(1)* %16, i64 %91
  %127 = load double, double addrspace(1)* %126, align 8, !tbaa !22
  %128 = fmul contract double %71, %127
  %129 = getelementptr inbounds double, double addrspace(1)* %17, i64 %91
  %130 = load double, double addrspace(1)* %129, align 8, !tbaa !22
  %131 = fmul contract double %73, %130
  %132 = fadd contract double %128, %131
  %133 = getelementptr inbounds double, double addrspace(1)* %18, i64 %91
  %134 = load double, double addrspace(1)* %133, align 8, !tbaa !22
  %135 = fmul contract double %75, %134
  %136 = fadd contract double %132, %135
  %137 = fmul contract double %125, %136
  %138 = fadd contract double %122, %137
  %139 = getelementptr inbounds double, double addrspace(1)* %53, i64 %88
  store double %138, double addrspace(1)* %139, align 8, !tbaa !22
  %140 = add nsw i32 %87, 1
  %141 = icmp slt i32 %140, %81
  br i1 %141, label %86, label %83, !llvm.loop !26

142:                                              ; preds = %83, %39, %22
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
!22 = !{!23, !23, i64 0}
!23 = !{!"double", !18, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
