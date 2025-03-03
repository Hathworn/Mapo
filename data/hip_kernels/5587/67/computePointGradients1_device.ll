; ModuleID = '../data/hip_kernels/5587/67/main.cu'
source_filename = "../data/hip_kernels/5587/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang = internal unnamed_addr addrspace(3) global [12 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9, double addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !7
  %22 = mul i32 %13, %18
  %23 = add i32 %22, %12
  %24 = udiv i32 %21, %18
  %25 = mul i32 %24, %18
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %18
  %30 = icmp ult i32 %12, 12
  br i1 %30, label %31, label %37

31:                                               ; preds = %11
  %32 = add nuw nsw i32 %12, 12
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %6, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = getelementptr inbounds [12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 %12
  store double %35, double addrspace(3)* %36, align 8, !tbaa !16
  br label %37

37:                                               ; preds = %31, %11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp slt i32 %23, %5
  br i1 %38, label %39, label %52

39:                                               ; preds = %37
  %40 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 0), align 16, !tbaa !16
  %41 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 1), align 8, !tbaa !16
  %42 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 2), align 16, !tbaa !16
  %43 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 3), align 8, !tbaa !16
  %44 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 4), align 16, !tbaa !16
  %45 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 5), align 8, !tbaa !16
  %46 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 6), align 16, !tbaa !16
  %47 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 7), align 8, !tbaa !16
  %48 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 8), align 16, !tbaa !16
  %49 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 9), align 8, !tbaa !16
  %50 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 10), align 16, !tbaa !16
  %51 = load double, double addrspace(3)* getelementptr inbounds ([12 x double], [12 x double] addrspace(3)* @_ZZ22computePointGradients1PfS_S_iPiiPdS1_S1_S1_S1_E5j_ang, i32 0, i32 11), align 8, !tbaa !16
  br label %53

52:                                               ; preds = %53, %37
  ret void

53:                                               ; preds = %39, %53
  %54 = phi i32 [ %23, %39 ], [ %92, %53 ]
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !20, !amdgpu.noclobber !6
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !22, !amdgpu.noclobber !6
  %61 = fpext float %60 to double
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !22, !amdgpu.noclobber !6
  %64 = fpext float %63 to double
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !22, !amdgpu.noclobber !6
  %67 = fpext float %66 to double
  %68 = fmul contract double %40, %61
  %69 = fmul contract double %41, %64
  %70 = fadd contract double %68, %69
  %71 = fmul contract double %42, %67
  %72 = fadd contract double %70, %71
  %73 = getelementptr inbounds double, double addrspace(1)* %7, i64 %55
  store double %72, double addrspace(1)* %73, align 8, !tbaa !16
  %74 = fmul contract double %43, %61
  %75 = fmul contract double %44, %64
  %76 = fadd contract double %74, %75
  %77 = fmul contract double %45, %67
  %78 = fadd contract double %76, %77
  %79 = getelementptr inbounds double, double addrspace(1)* %8, i64 %55
  store double %78, double addrspace(1)* %79, align 8, !tbaa !16
  %80 = fmul contract double %46, %61
  %81 = fmul contract double %47, %64
  %82 = fadd contract double %80, %81
  %83 = fmul contract double %48, %67
  %84 = fadd contract double %82, %83
  %85 = getelementptr inbounds double, double addrspace(1)* %9, i64 %55
  store double %84, double addrspace(1)* %85, align 8, !tbaa !16
  %86 = fmul contract double %49, %61
  %87 = fmul contract double %50, %64
  %88 = fadd contract double %86, %87
  %89 = fmul contract double %51, %67
  %90 = fadd contract double %88, %89
  %91 = getelementptr inbounds double, double addrspace(1)* %10, i64 %55
  store double %90, double addrspace(1)* %91, align 8, !tbaa !16
  %92 = add nsw i32 %54, %29
  %93 = icmp slt i32 %92, %5
  br i1 %93, label %53, label %52, !llvm.loop !24
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
