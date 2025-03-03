; ModuleID = '../data/hip_kernels/198/1/main.cu'
source_filename = "../data/hip_kernels/198/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11binning_mixPfS_S_S_S_S_S_iiiiE4temp = internal addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11binning_mixPfS_S_S_S_S_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ11binning_mixPfS_S_S_S_S_S_iiiiE4temp, i32 0, i32 %12
  store float 0.000000e+00, float addrspace(3)* %13, align 4, !tbaa !5
  %14 = icmp sgt i32 %7, 0
  br i1 %14, label %15, label %32

15:                                               ; preds = %11
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !9, !invariant.load !10
  %21 = zext i16 %20 to i32
  %22 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %23 = bitcast i8 addrspace(4)* %22 to i32 addrspace(4)*
  %24 = load i32, i32 addrspace(4)* %23, align 4, !tbaa !11
  %25 = mul i32 %16, %21
  %26 = add i32 %25, %12
  %27 = icmp slt i32 %26, %8
  %28 = sitofp i32 %10 to float
  %29 = sitofp i32 %9 to float
  br label %37

30:                                               ; preds = %53
  %31 = load float, float addrspace(3)* %13, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %30, %11
  %33 = phi float [ %31, %30 ], [ 0.000000e+00, %11 ]
  %34 = zext i32 %12 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %6, i64 %34
  %36 = atomicrmw fadd float addrspace(1)* %35, float %33 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

37:                                               ; preds = %15, %53
  %38 = phi i32 [ 0, %15 ], [ %54, %53 ]
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  br i1 %27, label %46, label %53

46:                                               ; preds = %37
  %47 = udiv i32 %24, %21
  %48 = mul i32 %47, %21
  %49 = icmp ugt i32 %24, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = mul i32 %51, %21
  br label %56

53:                                               ; preds = %101, %37
  %54 = add nuw nsw i32 %38, 1
  %55 = icmp eq i32 %54, %7
  br i1 %55, label %30, label %37, !llvm.loop !20

56:                                               ; preds = %46, %101
  %57 = phi i32 [ %26, %46 ], [ %102, %101 ]
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %58
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5
  %65 = fmul contract float %41, %60
  %66 = fmul contract float %43, %62
  %67 = fadd contract float %65, %66
  %68 = fmul contract float %45, %64
  %69 = fadd contract float %67, %68
  %70 = tail call float @llvm.minnum.f32(float %69, float 1.000000e+00)
  %71 = tail call float @llvm.fabs.f32(float %70)
  %72 = tail call float @llvm.fmuladd.f32(float %71, float -5.000000e-01, float 5.000000e-01)
  %73 = fmul float %70, %70
  %74 = fcmp ogt float %71, 5.000000e-01
  %75 = select i1 %74, float %72, float %73
  %76 = tail call float @llvm.fmuladd.f32(float %75, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %77 = tail call float @llvm.fmuladd.f32(float %75, float %76, float 0x3FA0698780000000)
  %78 = tail call float @llvm.fmuladd.f32(float %75, float %77, float 0x3FA6C83620000000)
  %79 = tail call float @llvm.fmuladd.f32(float %75, float %78, float 0x3FB3337900000000)
  %80 = tail call float @llvm.fmuladd.f32(float %75, float %79, float 0x3FC5555580000000)
  %81 = fmul float %75, %80
  %82 = tail call float @llvm.sqrt.f32(float %75)
  %83 = tail call float @llvm.fmuladd.f32(float %82, float %81, float %82)
  %84 = fmul float %83, 2.000000e+00
  %85 = fsub float 0x400921FB60000000, %84
  %86 = fcmp olt float %70, 0.000000e+00
  %87 = select i1 %86, float %85, float %84
  %88 = tail call float @llvm.fmuladd.f32(float %70, float %81, float %70)
  %89 = fsub float 0x3FF921FB60000000, %88
  %90 = select i1 %74, float %87, float %89
  %91 = fpext float %90 to double
  %92 = fmul contract double %91, 1.800000e+02
  %93 = fdiv contract double %92, 0x400921FB54442D18
  %94 = fptrunc double %93 to float
  %95 = fcmp contract olt float %94, %28
  br i1 %95, label %96, label %101

96:                                               ; preds = %56
  %97 = fmul contract float %29, %94
  %98 = fptosi float %97 to i32
  %99 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ11binning_mixPfS_S_S_S_S_S_iiiiE4temp, i32 0, i32 %98
  %100 = atomicrmw fadd float addrspace(3)* %99, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %96, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = add i32 %52, %57
  %103 = icmp slt i32 %102, %8
  br i1 %103, label %56, label %53, !llvm.loop !22
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
