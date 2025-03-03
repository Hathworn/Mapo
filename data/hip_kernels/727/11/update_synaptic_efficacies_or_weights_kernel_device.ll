; ModuleID = '../data/hip_kernels/727/11/main.cu'
source_filename = "../data/hip_kernels/727/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z44update_synaptic_efficacies_or_weights_kernelPfS_PiS_fS_S_fS0_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float %7, i32 addrspace(1)* nocapture readonly %8, i64 %9) local_unnamed_addr #0 {
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
  %23 = sext i32 %22 to i64
  %24 = icmp ult i64 %23, %9
  br i1 %24, label %25, label %80

25:                                               ; preds = %10
  %26 = udiv i32 %20, %17
  %27 = mul i32 %26, %17
  %28 = icmp ugt i32 %20, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %17
  br label %32

32:                                               ; preds = %25, %76
  %33 = phi i64 [ %23, %25 ], [ %78, %76 ]
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %33
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !6
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !20
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !16, !amdgpu.noclobber !6
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %6, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !20
  %45 = fcmp contract oeq float %44, %4
  br i1 %45, label %46, label %52

46:                                               ; preds = %32
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !20
  %49 = fsub contract float 1.000000e+00, %39
  %50 = fmul contract float %49, %48
  %51 = fadd contract float %50, 0.000000e+00
  br label %52

52:                                               ; preds = %46, %32
  %53 = phi float [ %51, %46 ], [ 0.000000e+00, %32 ]
  %54 = getelementptr inbounds float, float addrspace(1)* %5, i64 %37
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !20
  %56 = fcmp contract oeq float %55, %4
  br i1 %56, label %57, label %62

57:                                               ; preds = %52
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20
  %60 = fmul contract float %39, %59
  %61 = fsub contract float %53, %60
  br label %62

62:                                               ; preds = %57, %52
  %63 = phi float [ %61, %57 ], [ %53, %52 ]
  %64 = fcmp contract une float %63, 0.000000e+00
  %65 = fmul contract float %63, %7
  %66 = select i1 %64, float %65, float -0.000000e+00
  %67 = fadd contract float %39, %66
  %68 = fcmp contract une float %39, %67
  br i1 %68, label %69, label %76

69:                                               ; preds = %62
  %70 = fpext float %67 to double
  %71 = tail call double @llvm.maxnum.f64(double %70, double 0.000000e+00)
  %72 = fptrunc double %71 to float
  %73 = fpext float %72 to double
  %74 = tail call double @llvm.minnum.f64(double %73, double 1.000000e+00)
  %75 = fptrunc double %74 to float
  store float %75, float addrspace(1)* %38, align 4, !tbaa !20
  br label %76

76:                                               ; preds = %69, %62
  %77 = add i32 %31, %34
  %78 = sext i32 %77 to i64
  %79 = icmp ult i64 %78, %9
  br i1 %79, label %32, label %80, !llvm.loop !22

80:                                               ; preds = %76, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
