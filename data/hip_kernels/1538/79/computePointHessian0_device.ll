; ModuleID = '../data/hip_kernels/1538/79/main.cu'
source_filename = "../data/hip_kernels/1538/79/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang = internal unnamed_addr addrspace(3) global [18 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, double addrspace(1)* nocapture writeonly %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture writeonly %13, double addrspace(1)* nocapture writeonly %14, double addrspace(1)* nocapture writeonly %15, double addrspace(1)* nocapture writeonly %16, double addrspace(1)* nocapture writeonly %17, double addrspace(1)* nocapture writeonly %18, double addrspace(1)* nocapture writeonly %19, double addrspace(1)* nocapture writeonly %20, double addrspace(1)* nocapture writeonly %21) local_unnamed_addr #0 {
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 12
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7
  %33 = mul i32 %24, %29
  %34 = add i32 %33, %23
  %35 = udiv i32 %32, %29
  %36 = mul i32 %35, %29
  %37 = icmp ugt i32 %32, %36
  %38 = zext i1 %37 to i32
  %39 = add i32 %35, %38
  %40 = mul i32 %39, %29
  %41 = icmp ult i32 %23, 18
  br i1 %41, label %42, label %47

42:                                               ; preds = %22
  %43 = zext i32 %23 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %6, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !16, !amdgpu.noclobber !6
  %46 = getelementptr inbounds [18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 %23
  store double %45, double addrspace(3)* %46, align 8, !tbaa !16
  br label %47

47:                                               ; preds = %42, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp slt i32 %34, %5
  br i1 %48, label %49, label %68

49:                                               ; preds = %47
  %50 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 0), align 16, !tbaa !16
  %51 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 1), align 8, !tbaa !16
  %52 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 2), align 16, !tbaa !16
  %53 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 3), align 8, !tbaa !16
  %54 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 4), align 16, !tbaa !16
  %55 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 5), align 8, !tbaa !16
  %56 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 6), align 16, !tbaa !16
  %57 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 7), align 8, !tbaa !16
  %58 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 8), align 16, !tbaa !16
  %59 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 9), align 8, !tbaa !16
  %60 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 10), align 16, !tbaa !16
  %61 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 11), align 8, !tbaa !16
  %62 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 12), align 16, !tbaa !16
  %63 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 13), align 8, !tbaa !16
  %64 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 14), align 16, !tbaa !16
  %65 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 15), align 8, !tbaa !16
  %66 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 16), align 16, !tbaa !16
  %67 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian0PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 17), align 8, !tbaa !16
  br label %69

68:                                               ; preds = %69, %47
  ret void

69:                                               ; preds = %49, %69
  %70 = phi i32 [ %34, %49 ], [ %129, %69 ]
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !20, !amdgpu.noclobber !6
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !22, !amdgpu.noclobber !6
  %77 = fpext float %76 to double
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !22, !amdgpu.noclobber !6
  %80 = fpext float %79 to double
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !22, !amdgpu.noclobber !6
  %83 = fpext float %82 to double
  %84 = getelementptr inbounds double, double addrspace(1)* %7, i64 %71
  store double 0.000000e+00, double addrspace(1)* %84, align 8, !tbaa !16
  %85 = fmul contract double %50, %77
  %86 = fmul contract double %51, %80
  %87 = fadd contract double %85, %86
  %88 = fmul contract double %52, %83
  %89 = fadd contract double %87, %88
  %90 = getelementptr inbounds double, double addrspace(1)* %8, i64 %71
  store double %89, double addrspace(1)* %90, align 8, !tbaa !16
  %91 = fmul contract double %53, %77
  %92 = fmul contract double %54, %80
  %93 = fadd contract double %91, %92
  %94 = fmul contract double %55, %83
  %95 = fadd contract double %93, %94
  %96 = getelementptr inbounds double, double addrspace(1)* %9, i64 %71
  store double %95, double addrspace(1)* %96, align 8, !tbaa !16
  %97 = getelementptr inbounds double, double addrspace(1)* %11, i64 %71
  store double 0.000000e+00, double addrspace(1)* %97, align 8, !tbaa !16
  %98 = getelementptr inbounds double, double addrspace(1)* %10, i64 %71
  store double 0.000000e+00, double addrspace(1)* %98, align 8, !tbaa !16
  %99 = fmul contract double %56, %77
  %100 = fmul contract double %57, %80
  %101 = fadd contract double %99, %100
  %102 = fmul contract double %58, %83
  %103 = fadd contract double %101, %102
  %104 = getelementptr inbounds double, double addrspace(1)* %13, i64 %71
  store double %103, double addrspace(1)* %104, align 8, !tbaa !16
  %105 = getelementptr inbounds double, double addrspace(1)* %12, i64 %71
  store double %103, double addrspace(1)* %105, align 8, !tbaa !16
  %106 = fmul contract double %59, %77
  %107 = fmul contract double %60, %80
  %108 = fadd contract double %106, %107
  %109 = fmul contract double %61, %83
  %110 = fadd contract double %108, %109
  %111 = getelementptr inbounds double, double addrspace(1)* %15, i64 %71
  store double %110, double addrspace(1)* %111, align 8, !tbaa !16
  %112 = getelementptr inbounds double, double addrspace(1)* %14, i64 %71
  store double %110, double addrspace(1)* %112, align 8, !tbaa !16
  %113 = getelementptr inbounds double, double addrspace(1)* %17, i64 %71
  store double 0.000000e+00, double addrspace(1)* %113, align 8, !tbaa !16
  %114 = getelementptr inbounds double, double addrspace(1)* %16, i64 %71
  store double 0.000000e+00, double addrspace(1)* %114, align 8, !tbaa !16
  %115 = fmul contract double %62, %77
  %116 = fmul contract double %63, %80
  %117 = fadd contract double %115, %116
  %118 = fmul contract double %64, %83
  %119 = fadd contract double %117, %118
  %120 = getelementptr inbounds double, double addrspace(1)* %19, i64 %71
  store double %119, double addrspace(1)* %120, align 8, !tbaa !16
  %121 = getelementptr inbounds double, double addrspace(1)* %18, i64 %71
  store double %119, double addrspace(1)* %121, align 8, !tbaa !16
  %122 = fmul contract double %65, %77
  %123 = fmul contract double %66, %80
  %124 = fadd contract double %122, %123
  %125 = fmul contract double %67, %83
  %126 = fadd contract double %124, %125
  %127 = getelementptr inbounds double, double addrspace(1)* %21, i64 %71
  store double %126, double addrspace(1)* %127, align 8, !tbaa !16
  %128 = getelementptr inbounds double, double addrspace(1)* %20, i64 %71
  store double %126, double addrspace(1)* %128, align 8, !tbaa !16
  %129 = add nsw i32 %70, %40
  %130 = icmp slt i32 %129, %5
  br i1 %130, label %69, label %68, !llvm.loop !24
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
