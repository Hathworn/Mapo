; ModuleID = '../data/hip_kernels/5665/5/main.cu'
source_filename = "../data/hip_kernels/5665/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z22binaryCrossEntropyCostPfS_S_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %64

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = fpext float %20 to double
  %22 = fadd contract double %21, 1.000000e-15
  %23 = fptrunc double %22 to float
  %24 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 144)
  %25 = select i1 %24, float 0x41F0000000000000, float 1.000000e+00
  %26 = fmul float %25, %23
  %27 = tail call float @llvm.log2.f32(float %26)
  %28 = fmul float %27, 0x3FE62E42E0000000
  %29 = tail call i1 @llvm.amdgcn.class.f32(float %27, i32 519)
  %30 = fneg float %28
  %31 = tail call float @llvm.fma.f32(float %27, float 0x3FE62E42E0000000, float %30)
  %32 = tail call float @llvm.fma.f32(float %27, float 0x3E6EFA39E0000000, float %31)
  %33 = fadd float %28, %32
  %34 = select i1 %29, float %27, float %33
  %35 = select i1 %24, float 0x40362E4300000000, float 0.000000e+00
  %36 = fsub float %34, %35
  %37 = fmul contract float %18, %36
  %38 = fsub contract float 1.000000e+00, %18
  %39 = fsub contract float 1.000000e+00, %20
  %40 = fpext float %39 to double
  %41 = fadd contract double %40, 1.000000e-15
  %42 = fptrunc double %41 to float
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 144)
  %44 = select i1 %43, float 0x41F0000000000000, float 1.000000e+00
  %45 = fmul float %44, %42
  %46 = tail call float @llvm.log2.f32(float %45)
  %47 = fmul float %46, 0x3FE62E42E0000000
  %48 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 519)
  %49 = fneg float %47
  %50 = tail call float @llvm.fma.f32(float %46, float 0x3FE62E42E0000000, float %49)
  %51 = tail call float @llvm.fma.f32(float %46, float 0x3E6EFA39E0000000, float %50)
  %52 = fadd float %47, %51
  %53 = select i1 %48, float %46, float %52
  %54 = select i1 %43, float 0x40362E4300000000, float 0.000000e+00
  %55 = fsub float %53, %54
  %56 = fmul contract float %38, %55
  %57 = fadd contract float %37, %56
  %58 = fpext float %57 to double
  %59 = fneg contract double %58
  %60 = sitofp i32 %3 to double
  %61 = fdiv contract double %59, %60
  %62 = fptrunc double %61 to float
  %63 = atomicrmw fadd float addrspace(1)* %0, float %62 syncscope("agent-one-as") monotonic, align 4
  br label %64

64:                                               ; preds = %15, %4
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
