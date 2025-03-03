; ModuleID = '../data/hip_kernels/6580/60/main.cu'
source_filename = "../data/hip_kernels/6580/60/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22binaryCrossEntropyCostPfS_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %56

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 144)
  %22 = select i1 %21, float 0x41F0000000000000, float 1.000000e+00
  %23 = fmul float %20, %22
  %24 = tail call float @llvm.log2.f32(float %23)
  %25 = fmul float %24, 0x3FE62E42E0000000
  %26 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 519)
  %27 = fneg float %25
  %28 = tail call float @llvm.fma.f32(float %24, float 0x3FE62E42E0000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %24, float 0x3E6EFA39E0000000, float %28)
  %30 = fadd float %25, %29
  %31 = select i1 %26, float %24, float %30
  %32 = select i1 %21, float 0x40362E4300000000, float 0.000000e+00
  %33 = fsub float %31, %32
  %34 = fmul contract float %18, %33
  %35 = fsub contract float 1.000000e+00, %18
  %36 = fsub contract float 1.000000e+00, %20
  %37 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %38 = select i1 %37, float 0x41F0000000000000, float 1.000000e+00
  %39 = fmul float %36, %38
  %40 = tail call float @llvm.log2.f32(float %39)
  %41 = fmul float %40, 0x3FE62E42E0000000
  %42 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 519)
  %43 = fneg float %41
  %44 = tail call float @llvm.fma.f32(float %40, float 0x3FE62E42E0000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %40, float 0x3E6EFA39E0000000, float %44)
  %46 = fadd float %41, %45
  %47 = select i1 %42, float %40, float %46
  %48 = select i1 %37, float 0x40362E4300000000, float 0.000000e+00
  %49 = fsub float %47, %48
  %50 = fmul contract float %35, %49
  %51 = fadd contract float %34, %50
  %52 = fneg contract float %51
  %53 = sitofp i32 %2 to float
  %54 = fdiv contract float %52, %53
  %55 = atomicrmw fadd float addrspace(1)* %3, float %54 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %15, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
