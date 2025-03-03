; ModuleID = '../data/hip_kernels/3595/77/main.cu'
source_filename = "../data/hip_kernels/3595/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20computeHessianListS1PfS_S_PiS0_S0_iPdS1_S1_ddS1_S1_S1_S1_S1_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double %10, double %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture readonly %13, double addrspace(1)* nocapture readonly %14, double addrspace(1)* nocapture readonly %15, double addrspace(1)* nocapture readonly %16, i32 %17) local_unnamed_addr #0 {
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !6
  %27 = udiv i32 %26, %23
  %28 = mul i32 %27, %23
  %29 = icmp ugt i32 %26, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %23
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %35 = icmp slt i32 %33, 6
  %36 = icmp slt i32 %34, 6
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %154

38:                                               ; preds = %18
  %39 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %40 = mul i32 %39, %23
  %41 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %42 = add i32 %40, %41
  %43 = mul nsw i32 %33, %17
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %15, i64 %44
  %46 = mul nsw i32 %17, 6
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %45, i64 %47
  %49 = getelementptr inbounds double, double addrspace(1)* %48, i64 %47
  %50 = mul nsw i32 %34, %17
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %14, i64 %51
  %53 = mul nsw i32 %33, 6
  %54 = add nsw i32 %53, %34
  %55 = mul nsw i32 %54, %6
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %12, i64 %56
  %58 = mul nsw i32 %34, %6
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %16, i64 %59
  %61 = mul nsw i32 %6, 6
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %60, i64 %62
  %64 = getelementptr inbounds double, double addrspace(1)* %63, i64 %62
  %65 = icmp slt i32 %42, %6
  br i1 %65, label %66, label %154

66:                                               ; preds = %38
  %67 = fneg contract double %11
  br label %68

68:                                               ; preds = %66, %96
  %69 = phi i32 [ %42, %66 ], [ %99, %96 ]
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !5
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !20, !amdgpu.noclobber !5
  %76 = fpext float %75 to double
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !20, !amdgpu.noclobber !5
  %79 = fpext float %78 to double
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !20, !amdgpu.noclobber !5
  %82 = fpext float %81 to double
  %83 = getelementptr inbounds double, double addrspace(1)* %60, i64 %70
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !22
  %85 = getelementptr inbounds double, double addrspace(1)* %63, i64 %70
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !22
  %87 = getelementptr inbounds double, double addrspace(1)* %64, i64 %70
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !22
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %70
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !5
  %91 = add nsw i32 %69, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !16, !amdgpu.noclobber !5
  %95 = icmp slt i32 %90, %94
  br i1 %95, label %101, label %96

96:                                               ; preds = %150, %68
  %97 = phi double [ 0.000000e+00, %68 ], [ %151, %150 ]
  %98 = getelementptr inbounds double, double addrspace(1)* %57, i64 %70
  store double %97, double addrspace(1)* %98, align 8, !tbaa !22
  %99 = add nsw i32 %69, %32
  %100 = icmp slt i32 %99, %6
  br i1 %100, label %68, label %154, !llvm.loop !24

101:                                              ; preds = %68, %150
  %102 = phi double [ %151, %150 ], [ 0.000000e+00, %68 ]
  %103 = phi i32 [ %152, %150 ], [ %90, %68 ]
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %13, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !22
  %107 = fcmp contract ogt double %106, 1.000000e+00
  %108 = fcmp contract olt double %106, 0.000000e+00
  %109 = or i1 %107, %108
  %110 = fcmp contract uno double %106, 0.000000e+00
  %111 = or i1 %110, %109
  br i1 %111, label %150, label %112

112:                                              ; preds = %101
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %104
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !5
  %115 = getelementptr inbounds double, double addrspace(1)* %45, i64 %104
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !22
  %117 = getelementptr inbounds double, double addrspace(1)* %48, i64 %104
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !22
  %119 = getelementptr inbounds double, double addrspace(1)* %49, i64 %104
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !22
  %121 = fmul contract double %106, %10
  %122 = sext i32 %114 to i64
  %123 = getelementptr inbounds double, double addrspace(1)* %7, i64 %122
  %124 = load double, double addrspace(1)* %123, align 8, !tbaa !22
  %125 = fsub contract double %76, %124
  %126 = fmul contract double %116, %125
  %127 = getelementptr inbounds double, double addrspace(1)* %8, i64 %122
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !22
  %129 = fsub contract double %79, %128
  %130 = fmul contract double %118, %129
  %131 = fadd contract double %126, %130
  %132 = getelementptr inbounds double, double addrspace(1)* %9, i64 %122
  %133 = load double, double addrspace(1)* %132, align 8, !tbaa !22
  %134 = fsub contract double %82, %133
  %135 = fmul contract double %120, %134
  %136 = fadd contract double %131, %135
  %137 = fmul contract double %136, %67
  %138 = getelementptr inbounds double, double addrspace(1)* %52, i64 %104
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !22
  %140 = fmul contract double %139, %137
  %141 = fmul contract double %121, %140
  %142 = fadd contract double %102, %141
  %143 = fmul contract double %84, %116
  %144 = fmul contract double %86, %118
  %145 = fadd contract double %143, %144
  %146 = fmul contract double %88, %120
  %147 = fadd contract double %145, %146
  %148 = fmul contract double %121, %147
  %149 = fadd contract double %148, %142
  br label %150

150:                                              ; preds = %112, %101
  %151 = phi double [ %102, %101 ], [ %149, %112 ]
  %152 = add nsw i32 %103, 1
  %153 = icmp slt i32 %152, %94
  br i1 %153, label %101, label %96, !llvm.loop !26

154:                                              ; preds = %96, %38, %18
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
