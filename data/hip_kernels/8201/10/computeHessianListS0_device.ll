; ModuleID = '../data/hip_kernels/8201/10/main.cu'
source_filename = "../data/hip_kernels/8201/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20computeHessianListS0PfS_S_PiS0_S0_iPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, double addrspace(1)* nocapture readonly %17, double addrspace(1)* nocapture readonly %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture readonly %20, double addrspace(1)* nocapture readonly %21, double addrspace(1)* nocapture writeonly %22, i32 %23) local_unnamed_addr #0 {
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !4, !invariant.load !5
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !6
  %33 = udiv i32 %32, %29
  %34 = mul i32 %33, %29
  %35 = icmp ugt i32 %32, %34
  %36 = zext i1 %35 to i32
  %37 = add i32 %33, %36
  %38 = mul i32 %37, %29
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %40 = icmp slt i32 %39, 6
  br i1 %40, label %41, label %144

41:                                               ; preds = %24
  %42 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %43 = mul i32 %42, %29
  %44 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %45 = add i32 %43, %44
  %46 = mul nsw i32 %39, %6
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %19, i64 %47
  %49 = mul nsw i32 %6, 6
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %20, i64 %50
  %52 = getelementptr inbounds double, double addrspace(1)* %21, i64 %50
  %53 = mul nsw i32 %39, %23
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %22, i64 %54
  %56 = icmp slt i32 %45, %6
  br i1 %56, label %57, label %144

57:                                               ; preds = %41, %85
  %58 = phi i32 [ %86, %85 ], [ %45, %41 ]
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !16, !amdgpu.noclobber !5
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !20, !amdgpu.noclobber !5
  %65 = fpext float %64 to double
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !20, !amdgpu.noclobber !5
  %68 = fpext float %67 to double
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !20, !amdgpu.noclobber !5
  %71 = fpext float %70 to double
  %72 = getelementptr inbounds double, double addrspace(1)* %48, i64 %59
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !22
  %74 = getelementptr inbounds double, double addrspace(1)* %51, i64 %59
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !22
  %76 = getelementptr inbounds double, double addrspace(1)* %52, i64 %59
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !22
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %59
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !16, !amdgpu.noclobber !5
  %80 = add nsw i32 %58, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = icmp slt i32 %79, %83
  br i1 %84, label %88, label %85

85:                                               ; preds = %88, %57
  %86 = add nsw i32 %58, %38
  %87 = icmp slt i32 %86, %6
  br i1 %87, label %57, label %144, !llvm.loop !24

88:                                               ; preds = %57, %88
  %89 = phi i32 [ %142, %88 ], [ %79, %57 ]
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %7, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !22
  %96 = fsub contract double %65, %95
  %97 = getelementptr inbounds double, double addrspace(1)* %10, i64 %93
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !22
  %99 = fmul contract double %73, %98
  %100 = getelementptr inbounds double, double addrspace(1)* %11, i64 %93
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !22
  %102 = fmul contract double %75, %101
  %103 = fadd contract double %99, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %12, i64 %93
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !22
  %106 = fmul contract double %77, %105
  %107 = fadd contract double %103, %106
  %108 = fmul contract double %96, %107
  %109 = getelementptr inbounds double, double addrspace(1)* %8, i64 %93
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !22
  %111 = fsub contract double %68, %110
  %112 = getelementptr inbounds double, double addrspace(1)* %13, i64 %93
  %113 = load double, double addrspace(1)* %112, align 8, !tbaa !22
  %114 = fmul contract double %73, %113
  %115 = getelementptr inbounds double, double addrspace(1)* %14, i64 %93
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !22
  %117 = fmul contract double %75, %116
  %118 = fadd contract double %114, %117
  %119 = getelementptr inbounds double, double addrspace(1)* %15, i64 %93
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !22
  %121 = fmul contract double %77, %120
  %122 = fadd contract double %118, %121
  %123 = fmul contract double %111, %122
  %124 = fadd contract double %108, %123
  %125 = getelementptr inbounds double, double addrspace(1)* %9, i64 %93
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !22
  %127 = fsub contract double %71, %126
  %128 = getelementptr inbounds double, double addrspace(1)* %16, i64 %93
  %129 = load double, double addrspace(1)* %128, align 8, !tbaa !22
  %130 = fmul contract double %73, %129
  %131 = getelementptr inbounds double, double addrspace(1)* %17, i64 %93
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !22
  %133 = fmul contract double %75, %132
  %134 = fadd contract double %130, %133
  %135 = getelementptr inbounds double, double addrspace(1)* %18, i64 %93
  %136 = load double, double addrspace(1)* %135, align 8, !tbaa !22
  %137 = fmul contract double %77, %136
  %138 = fadd contract double %134, %137
  %139 = fmul contract double %127, %138
  %140 = fadd contract double %124, %139
  %141 = getelementptr inbounds double, double addrspace(1)* %55, i64 %90
  store double %140, double addrspace(1)* %141, align 8, !tbaa !22
  %142 = add nsw i32 %89, 1
  %143 = icmp slt i32 %142, %83
  br i1 %143, label %88, label %85, !llvm.loop !26

144:                                              ; preds = %85, %41, %24
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
