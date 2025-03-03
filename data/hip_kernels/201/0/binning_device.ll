; ModuleID = '../data/hip_kernels/201/0/main.cu'
source_filename = "../data/hip_kernels/201/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7binningPfS_S_S_iiiE4temp = internal addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7binningPfS_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7binningPfS_S_S_iiiE4temp, i32 0, i32 %8
  store float 0.000000e+00, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = icmp sgt i32 %4, 0
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !10
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !11
  %21 = mul i32 %12, %17
  %22 = add i32 %21, %8
  %23 = icmp slt i32 %22, %4
  %24 = sitofp i32 %6 to float
  %25 = sitofp i32 %5 to float
  br label %33

26:                                               ; preds = %49
  %27 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %26, %7
  %29 = phi float [ %27, %26 ], [ 0.000000e+00, %7 ]
  %30 = zext i32 %8 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %32 = atomicrmw fadd float addrspace(1)* %31, float %29 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void

33:                                               ; preds = %11, %49
  %34 = phi i32 [ 0, %11 ], [ %50, %49 ]
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  br i1 %23, label %42, label %49

42:                                               ; preds = %33
  %43 = udiv i32 %20, %17
  %44 = mul i32 %43, %17
  %45 = icmp ugt i32 %20, %44
  %46 = zext i1 %45 to i32
  %47 = add i32 %43, %46
  %48 = mul i32 %47, %17
  br label %52

49:                                               ; preds = %97, %33
  %50 = add nuw nsw i32 %34, 1
  %51 = icmp eq i32 %50, %4
  br i1 %51, label %26, label %33, !llvm.loop !20

52:                                               ; preds = %42, %97
  %53 = phi i32 [ %22, %42 ], [ %98, %97 ]
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5
  %61 = fmul contract float %37, %56
  %62 = fmul contract float %39, %58
  %63 = fadd contract float %61, %62
  %64 = fmul contract float %41, %60
  %65 = fadd contract float %63, %64
  %66 = tail call float @llvm.minnum.f32(float %65, float 1.000000e+00)
  %67 = tail call float @llvm.fabs.f32(float %66)
  %68 = tail call float @llvm.fmuladd.f32(float %67, float -5.000000e-01, float 5.000000e-01)
  %69 = fmul float %66, %66
  %70 = fcmp ogt float %67, 5.000000e-01
  %71 = select i1 %70, float %68, float %69
  %72 = tail call float @llvm.fmuladd.f32(float %71, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %73 = tail call float @llvm.fmuladd.f32(float %71, float %72, float 0x3FA0698780000000)
  %74 = tail call float @llvm.fmuladd.f32(float %71, float %73, float 0x3FA6C83620000000)
  %75 = tail call float @llvm.fmuladd.f32(float %71, float %74, float 0x3FB3337900000000)
  %76 = tail call float @llvm.fmuladd.f32(float %71, float %75, float 0x3FC5555580000000)
  %77 = fmul float %71, %76
  %78 = tail call float @llvm.sqrt.f32(float %71)
  %79 = tail call float @llvm.fmuladd.f32(float %78, float %77, float %78)
  %80 = fmul float %79, 2.000000e+00
  %81 = fsub float 0x400921FB60000000, %80
  %82 = fcmp olt float %66, 0.000000e+00
  %83 = select i1 %82, float %81, float %80
  %84 = tail call float @llvm.fmuladd.f32(float %66, float %77, float %66)
  %85 = fsub float 0x3FF921FB60000000, %84
  %86 = select i1 %70, float %83, float %85
  %87 = fpext float %86 to double
  %88 = fmul contract double %87, 1.800000e+02
  %89 = fdiv contract double %88, 0x400921FB54442D18
  %90 = fptrunc double %89 to float
  %91 = fcmp contract olt float %90, %24
  br i1 %91, label %92, label %97

92:                                               ; preds = %52
  %93 = fmul contract float %25, %90
  %94 = fptosi float %93 to i32
  %95 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ7binningPfS_S_S_iiiE4temp, i32 0, i32 %94
  %96 = atomicrmw fadd float addrspace(3)* %95, float 1.000000e+00 syncscope("agent-one-as") monotonic, align 4
  br label %97

97:                                               ; preds = %92, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = add i32 %48, %53
  %99 = icmp slt i32 %98, %4
  br i1 %99, label %52, label %49, !llvm.loop !22
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
