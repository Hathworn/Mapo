; ModuleID = '../data/hip_kernels/15929/3/main.cu'
source_filename = "../data/hip_kernels/15929/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11mish_kernelPKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %75

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fcmp contract ogt float %17, 2.000000e+01
  br i1 %18, label %53, label %19

19:                                               ; preds = %14
  %20 = fcmp contract olt float %17, -2.000000e+01
  %21 = fmul float %17, 0x3FF7154760000000
  %22 = tail call float @llvm.rint.f32(float %21)
  %23 = fcmp ogt float %17, 0x40562E4300000000
  %24 = fcmp olt float %17, 0xC059D1DA00000000
  %25 = fneg float %21
  %26 = tail call float @llvm.fma.f32(float %17, float 0x3FF7154760000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %17, float 0x3E54AE0BE0000000, float %26)
  %28 = fsub float %21, %22
  %29 = fadd float %27, %28
  %30 = tail call float @llvm.exp2.f32(float %29)
  %31 = fptosi float %22 to i32
  %32 = tail call float @llvm.amdgcn.ldexp.f32(float %30, i32 %31)
  br i1 %20, label %33, label %36

33:                                               ; preds = %19
  %34 = select i1 %24, float 0.000000e+00, float %32
  %35 = select i1 %23, float 0x7FF0000000000000, float %34
  br label %53

36:                                               ; preds = %19
  %37 = fadd contract float %32, 1.000000e+00
  %38 = select i1 %24, float 1.000000e+00, float %37
  %39 = select i1 %23, float 0x7FF0000000000000, float %38
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %39, i32 144)
  %41 = select i1 %40, float 0x41F0000000000000, float 1.000000e+00
  %42 = fmul float %39, %41
  %43 = tail call float @llvm.log2.f32(float %42)
  %44 = fmul float %43, 0x3FE62E42E0000000
  %45 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 519)
  %46 = fneg float %44
  %47 = tail call float @llvm.fma.f32(float %43, float 0x3FE62E42E0000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %43, float 0x3E6EFA39E0000000, float %47)
  %49 = fadd float %44, %48
  %50 = select i1 %45, float %43, float %49
  %51 = select i1 %40, float 0x40362E4300000000, float 0.000000e+00
  %52 = fsub float %50, %51
  br label %53

53:                                               ; preds = %14, %33, %36
  %54 = phi float [ %35, %33 ], [ %52, %36 ], [ %17, %14 ]
  %55 = fmul contract float %54, -2.000000e+00
  %56 = fmul float %55, 0x3FF7154760000000
  %57 = tail call float @llvm.rint.f32(float %56)
  %58 = fcmp ogt float %55, 0x40562E4300000000
  %59 = fcmp olt float %55, 0xC059D1DA00000000
  %60 = fneg float %56
  %61 = tail call float @llvm.fma.f32(float %55, float 0x3FF7154760000000, float %60)
  %62 = tail call float @llvm.fma.f32(float %55, float 0x3E54AE0BE0000000, float %61)
  %63 = fsub float %56, %57
  %64 = fadd float %62, %63
  %65 = tail call float @llvm.exp2.f32(float %64)
  %66 = fptosi float %57 to i32
  %67 = tail call float @llvm.amdgcn.ldexp.f32(float %65, i32 %66)
  %68 = fadd contract float %67, 1.000000e+00
  %69 = fdiv contract float 2.000000e+00, %68
  %70 = fadd contract float %69, -1.000000e+00
  %71 = select i1 %59, float 1.000000e+00, float %70
  %72 = select i1 %58, float -1.000000e+00, float %71
  %73 = fmul contract float %17, %72
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  store float %73, float addrspace(1)* %74, align 4, !tbaa !7
  br label %75

75:                                               ; preds = %3, %53
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
