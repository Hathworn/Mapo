; ModuleID = '../data/hip_kernels/8201/4/main.cu'
source_filename = "../data/hip_kernels/8201/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang = internal unnamed_addr addrspace(3) global [9 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20computePointHessian2PfS_S_iPiiPdS1_S1_S1_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture writeonly %7, double addrspace(1)* nocapture writeonly %8, double addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %11
  %23 = udiv i32 %20, %17
  %24 = mul i32 %23, %17
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %17
  %29 = icmp ult i32 %11, 9
  br i1 %29, label %30, label %36

30:                                               ; preds = %10
  %31 = add nuw nsw i32 %11, 36
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %6, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !16, !amdgpu.noclobber !6
  %35 = getelementptr inbounds [9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 %11
  store double %34, double addrspace(3)* %35, align 8, !tbaa !16
  br label %36

36:                                               ; preds = %30, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp slt i32 %22, %5
  br i1 %37, label %38, label %48

38:                                               ; preds = %36
  %39 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 0), align 16, !tbaa !16
  %40 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 1), align 8, !tbaa !16
  %41 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 2), align 16, !tbaa !16
  %42 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 3), align 8, !tbaa !16
  %43 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 4), align 16, !tbaa !16
  %44 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 5), align 8, !tbaa !16
  %45 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 6), align 16, !tbaa !16
  %46 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 7), align 8, !tbaa !16
  %47 = load double, double addrspace(3)* getelementptr inbounds ([9 x double], [9 x double] addrspace(3)* @_ZZ20computePointHessian2PfS_S_iPiiPdS1_S1_S1_E5h_ang, i32 0, i32 8), align 16, !tbaa !16
  br label %49

48:                                               ; preds = %49, %36
  ret void

49:                                               ; preds = %38, %49
  %50 = phi i32 [ %22, %38 ], [ %82, %49 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !20, !amdgpu.noclobber !6
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !22, !amdgpu.noclobber !6
  %57 = fpext float %56 to double
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !22, !amdgpu.noclobber !6
  %60 = fpext float %59 to double
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !22, !amdgpu.noclobber !6
  %63 = fpext float %62 to double
  %64 = fmul contract double %39, %57
  %65 = fmul contract double %40, %60
  %66 = fadd contract double %64, %65
  %67 = fmul contract double %41, %63
  %68 = fadd contract double %66, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %7, i64 %51
  store double %68, double addrspace(1)* %69, align 8, !tbaa !16
  %70 = fmul contract double %42, %57
  %71 = fmul contract double %43, %60
  %72 = fadd contract double %70, %71
  %73 = fmul contract double %44, %63
  %74 = fadd contract double %72, %73
  %75 = getelementptr inbounds double, double addrspace(1)* %8, i64 %51
  store double %74, double addrspace(1)* %75, align 8, !tbaa !16
  %76 = fmul contract double %45, %57
  %77 = fmul contract double %46, %60
  %78 = fadd contract double %76, %77
  %79 = fmul contract double %47, %63
  %80 = fadd contract double %78, %79
  %81 = getelementptr inbounds double, double addrspace(1)* %9, i64 %51
  store double %80, double addrspace(1)* %81, align 8, !tbaa !16
  %82 = add nsw i32 %50, %28
  %83 = icmp slt i32 %82, %5
  br i1 %83, label %49, label %48, !llvm.loop !24
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
