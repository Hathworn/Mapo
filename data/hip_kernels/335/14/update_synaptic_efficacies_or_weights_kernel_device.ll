; ModuleID = '../data/hip_kernels/335/14/main.cu'
source_filename = "../data/hip_kernels/335/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z44update_synaptic_efficacies_or_weights_kernelPfS_PiS_fS_S_Pbmf(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, float %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i8 addrspace(1)* nocapture readonly %7, i64 %8, float %9) local_unnamed_addr #0 {
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
  %24 = icmp ult i64 %23, %8
  br i1 %24, label %25, label %81

25:                                               ; preds = %10
  %26 = udiv i32 %20, %17
  %27 = mul i32 %26, %17
  %28 = icmp ugt i32 %20, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %17
  br label %32

32:                                               ; preds = %25, %77
  %33 = phi i64 [ %23, %25 ], [ %79, %77 ]
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 %33
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !16, !range !20, !amdgpu.noclobber !6
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %77, label %38

38:                                               ; preds = %32
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %33
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !21
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %33
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !23, !amdgpu.noclobber !6
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %6, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !21
  %46 = fcmp contract oeq float %45, %4
  br i1 %46, label %47, label %53

47:                                               ; preds = %38
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !21
  %50 = fsub contract float 1.000000e+00, %40
  %51 = fmul contract float %50, %49
  %52 = fadd contract float %51, 0.000000e+00
  br label %53

53:                                               ; preds = %47, %38
  %54 = phi float [ %52, %47 ], [ 0.000000e+00, %38 ]
  %55 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !21
  %57 = fcmp contract oeq float %56, %4
  br i1 %57, label %58, label %63

58:                                               ; preds = %53
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !21
  %61 = fmul contract float %40, %60
  %62 = fsub contract float %54, %61
  br label %63

63:                                               ; preds = %58, %53
  %64 = phi float [ %62, %58 ], [ %54, %53 ]
  %65 = fcmp contract une float %64, 0.000000e+00
  %66 = fmul contract float %64, %9
  %67 = select i1 %65, float %66, float -0.000000e+00
  %68 = fadd contract float %40, %67
  %69 = fcmp contract une float %40, %68
  br i1 %69, label %70, label %77

70:                                               ; preds = %63
  %71 = fpext float %68 to double
  %72 = tail call double @llvm.maxnum.f64(double %71, double 0.000000e+00)
  %73 = fptrunc double %72 to float
  %74 = fpext float %73 to double
  %75 = tail call double @llvm.minnum.f64(double %74, double 1.000000e+00)
  %76 = fptrunc double %75 to float
  store float %76, float addrspace(1)* %39, align 4, !tbaa !21
  br label %77

77:                                               ; preds = %63, %70, %32
  %78 = add i32 %31, %34
  %79 = sext i32 %78 to i64
  %80 = icmp ult i64 %79, %8
  br i1 %80, label %32, label %81, !llvm.loop !25

81:                                               ; preds = %77, %10
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
!17 = !{!"bool", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i8 0, i8 2}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !18, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !18, i64 0}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.mustprogress"}
