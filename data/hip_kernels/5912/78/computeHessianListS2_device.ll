; ModuleID = '../data/hip_kernels/5912/78/main.cu'
source_filename = "../data/hip_kernels/5912/78/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20computeHessianListS2PfS_S_PiS0_S0_iPdS1_S1_dS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double %10, double addrspace(1)* nocapture readonly %11, double addrspace(1)* nocapture readonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, double addrspace(1)* nocapture readonly %17, double addrspace(1)* nocapture readonly %18, double addrspace(1)* nocapture readonly %19, double addrspace(1)* nocapture readonly %20, double addrspace(1)* nocapture readonly %21, double addrspace(1)* nocapture %22, i32 %23) local_unnamed_addr #0 {
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
  %40 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %41 = icmp slt i32 %39, 6
  %42 = icmp slt i32 %40, 6
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %169

44:                                               ; preds = %24
  %45 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %46 = mul i32 %45, %29
  %47 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %48 = add i32 %46, %47
  %49 = mul nsw i32 %39, 6
  %50 = add nsw i32 %49, %40
  %51 = mul nsw i32 %50, %6
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %22, i64 %52
  %54 = mul i32 %39, 18
  %55 = add nsw i32 %54, %40
  %56 = mul nsw i32 %55, %6
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %21, i64 %57
  %59 = mul nsw i32 %6, 6
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %58, i64 %60
  %62 = getelementptr inbounds double, double addrspace(1)* %61, i64 %60
  %63 = icmp slt i32 %48, %6
  br i1 %63, label %64, label %169

64:                                               ; preds = %44, %94
  %65 = phi i32 [ %96, %94 ], [ %48, %44 ]
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !5
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !20, !amdgpu.noclobber !5
  %72 = fpext float %71 to double
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !20, !amdgpu.noclobber !5
  %75 = fpext float %74 to double
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !20, !amdgpu.noclobber !5
  %78 = fpext float %77 to double
  %79 = getelementptr inbounds double, double addrspace(1)* %58, i64 %66
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !22
  %81 = getelementptr inbounds double, double addrspace(1)* %61, i64 %66
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !22
  %83 = getelementptr inbounds double, double addrspace(1)* %62, i64 %66
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !22
  %85 = getelementptr inbounds double, double addrspace(1)* %53, i64 %66
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !22
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %66
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !16, !amdgpu.noclobber !5
  %89 = add nsw i32 %65, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !5
  %93 = icmp slt i32 %88, %92
  br i1 %93, label %98, label %94

94:                                               ; preds = %165, %64
  %95 = phi double [ %86, %64 ], [ %166, %165 ]
  store double %95, double addrspace(1)* %85, align 8, !tbaa !22
  %96 = add nsw i32 %65, %38
  %97 = icmp slt i32 %96, %6
  br i1 %97, label %64, label %169, !llvm.loop !24

98:                                               ; preds = %64, %165
  %99 = phi i32 [ %167, %165 ], [ %88, %64 ]
  %100 = phi double [ %166, %165 ], [ %86, %64 ]
  %101 = sext i32 %99 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %11, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !22
  %104 = fcmp contract ogt double %103, 1.000000e+00
  %105 = fcmp contract olt double %103, 0.000000e+00
  %106 = or i1 %104, %105
  %107 = fcmp contract uno double %103, 0.000000e+00
  %108 = or i1 %107, %106
  br i1 %108, label %165, label %109

109:                                              ; preds = %98
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %101
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !16, !amdgpu.noclobber !5
  %112 = fmul contract double %103, %10
  %113 = sext i32 %111 to i64
  %114 = getelementptr inbounds double, double addrspace(1)* %7, i64 %113
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !22
  %116 = fsub contract double %72, %115
  %117 = getelementptr inbounds double, double addrspace(1)* %12, i64 %113
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !22
  %119 = fmul contract double %80, %118
  %120 = getelementptr inbounds double, double addrspace(1)* %13, i64 %113
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !22
  %122 = fmul contract double %82, %121
  %123 = fadd contract double %119, %122
  %124 = getelementptr inbounds double, double addrspace(1)* %14, i64 %113
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !22
  %126 = fmul contract double %84, %125
  %127 = fadd contract double %123, %126
  %128 = fmul contract double %116, %127
  %129 = fmul contract double %112, %128
  %130 = fadd contract double %100, %129
  %131 = getelementptr inbounds double, double addrspace(1)* %8, i64 %113
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !22
  %133 = fsub contract double %75, %132
  %134 = getelementptr inbounds double, double addrspace(1)* %15, i64 %113
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !22
  %136 = fmul contract double %80, %135
  %137 = getelementptr inbounds double, double addrspace(1)* %16, i64 %113
  %138 = load double, double addrspace(1)* %137, align 8, !tbaa !22
  %139 = fmul contract double %82, %138
  %140 = fadd contract double %136, %139
  %141 = getelementptr inbounds double, double addrspace(1)* %17, i64 %113
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !22
  %143 = fmul contract double %84, %142
  %144 = fadd contract double %140, %143
  %145 = fmul contract double %133, %144
  %146 = fmul contract double %112, %145
  %147 = fadd contract double %130, %146
  %148 = getelementptr inbounds double, double addrspace(1)* %9, i64 %113
  %149 = load double, double addrspace(1)* %148, align 8, !tbaa !22
  %150 = fsub contract double %78, %149
  %151 = getelementptr inbounds double, double addrspace(1)* %18, i64 %113
  %152 = load double, double addrspace(1)* %151, align 8, !tbaa !22
  %153 = fmul contract double %80, %152
  %154 = getelementptr inbounds double, double addrspace(1)* %19, i64 %113
  %155 = load double, double addrspace(1)* %154, align 8, !tbaa !22
  %156 = fmul contract double %82, %155
  %157 = fadd contract double %153, %156
  %158 = getelementptr inbounds double, double addrspace(1)* %20, i64 %113
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !22
  %160 = fmul contract double %84, %159
  %161 = fadd contract double %157, %160
  %162 = fmul contract double %150, %161
  %163 = fmul contract double %112, %162
  %164 = fadd contract double %147, %163
  br label %165

165:                                              ; preds = %109, %98
  %166 = phi double [ %100, %98 ], [ %164, %109 ]
  %167 = add nsw i32 %99, 1
  %168 = icmp slt i32 %167, %92
  br i1 %168, label %98, label %94, !llvm.loop !26

169:                                              ; preds = %94, %44, %24
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
