; ModuleID = '../data/hip_kernels/1538/80/main.cu'
source_filename = "../data/hip_kernels/1538/80/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang = internal unnamed_addr addrspace(3) global [18 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10, double addrspace(1)* nocapture writeonly %11, double addrspace(1)* nocapture writeonly %12, double addrspace(1)* nocapture writeonly %13, double addrspace(1)* nocapture writeonly %14, double addrspace(1)* nocapture writeonly %15) local_unnamed_addr #0 {
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !7
  %27 = mul i32 %18, %23
  %28 = add i32 %27, %17
  %29 = udiv i32 %26, %23
  %30 = mul i32 %29, %23
  %31 = icmp ugt i32 %26, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %23
  %35 = icmp ult i32 %17, 18
  br i1 %35, label %36, label %42

36:                                               ; preds = %16
  %37 = add nuw nsw i32 %17, 18
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %6, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16, !amdgpu.noclobber !6
  %41 = getelementptr inbounds [18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 %17
  store double %40, double addrspace(3)* %41, align 8, !tbaa !16
  br label %42

42:                                               ; preds = %36, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp slt i32 %28, %5
  br i1 %43, label %44, label %63

44:                                               ; preds = %42
  %45 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 0), align 16, !tbaa !16
  %46 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 1), align 8, !tbaa !16
  %47 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 2), align 16, !tbaa !16
  %48 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 3), align 8, !tbaa !16
  %49 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 4), align 16, !tbaa !16
  %50 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 5), align 8, !tbaa !16
  %51 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 6), align 16, !tbaa !16
  %52 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 7), align 8, !tbaa !16
  %53 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 8), align 16, !tbaa !16
  %54 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 9), align 8, !tbaa !16
  %55 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 10), align 16, !tbaa !16
  %56 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 11), align 8, !tbaa !16
  %57 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 12), align 16, !tbaa !16
  %58 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 13), align 8, !tbaa !16
  %59 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 14), align 16, !tbaa !16
  %60 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 15), align 8, !tbaa !16
  %61 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 16), align 16, !tbaa !16
  %62 = load double, double addrspace(3)* getelementptr inbounds ([18 x double], [18 x double] addrspace(3)* @_ZZ20computePointHessian1PfS_S_iPiiPdS1_S1_S1_S1_S1_S1_S1_S1_S1_E5h_ang, i32 0, i32 17), align 8, !tbaa !16
  br label %64

63:                                               ; preds = %64, %42
  ret void

64:                                               ; preds = %44, %64
  %65 = phi i32 [ %28, %44 ], [ %118, %64 ]
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !20, !amdgpu.noclobber !6
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !22, !amdgpu.noclobber !6
  %72 = fpext float %71 to double
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !22, !amdgpu.noclobber !6
  %75 = fpext float %74 to double
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %69
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !22, !amdgpu.noclobber !6
  %78 = fpext float %77 to double
  %79 = fmul contract double %45, %72
  %80 = fmul contract double %46, %75
  %81 = fadd contract double %79, %80
  %82 = fmul contract double %47, %78
  %83 = fadd contract double %81, %82
  %84 = getelementptr inbounds double, double addrspace(1)* %7, i64 %66
  store double %83, double addrspace(1)* %84, align 8, !tbaa !16
  %85 = fmul contract double %48, %72
  %86 = fmul contract double %49, %75
  %87 = fadd contract double %85, %86
  %88 = fmul contract double %50, %78
  %89 = fadd contract double %87, %88
  %90 = getelementptr inbounds double, double addrspace(1)* %8, i64 %66
  store double %89, double addrspace(1)* %90, align 8, !tbaa !16
  %91 = fmul contract double %51, %72
  %92 = fmul contract double %52, %75
  %93 = fadd contract double %91, %92
  %94 = fmul contract double %53, %78
  %95 = fadd contract double %93, %94
  %96 = getelementptr inbounds double, double addrspace(1)* %9, i64 %66
  store double %95, double addrspace(1)* %96, align 8, !tbaa !16
  %97 = fmul contract double %54, %72
  %98 = fmul contract double %55, %75
  %99 = fadd contract double %97, %98
  %100 = fmul contract double %56, %78
  %101 = fadd contract double %99, %100
  %102 = getelementptr inbounds double, double addrspace(1)* %11, i64 %66
  store double %101, double addrspace(1)* %102, align 8, !tbaa !16
  %103 = getelementptr inbounds double, double addrspace(1)* %10, i64 %66
  store double %101, double addrspace(1)* %103, align 8, !tbaa !16
  %104 = fmul contract double %57, %72
  %105 = fmul contract double %58, %75
  %106 = fadd contract double %104, %105
  %107 = fmul contract double %59, %78
  %108 = fadd contract double %106, %107
  %109 = getelementptr inbounds double, double addrspace(1)* %13, i64 %66
  store double %108, double addrspace(1)* %109, align 8, !tbaa !16
  %110 = getelementptr inbounds double, double addrspace(1)* %12, i64 %66
  store double %108, double addrspace(1)* %110, align 8, !tbaa !16
  %111 = fmul contract double %60, %72
  %112 = fmul contract double %61, %75
  %113 = fadd contract double %111, %112
  %114 = fmul contract double %62, %78
  %115 = fadd contract double %113, %114
  %116 = getelementptr inbounds double, double addrspace(1)* %15, i64 %66
  store double %115, double addrspace(1)* %116, align 8, !tbaa !16
  %117 = getelementptr inbounds double, double addrspace(1)* %14, i64 %66
  store double %115, double addrspace(1)* %117, align 8, !tbaa !16
  %118 = add nsw i32 %65, %34
  %119 = icmp slt i32 %118, %5
  br i1 %119, label %64, label %63, !llvm.loop !24
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
