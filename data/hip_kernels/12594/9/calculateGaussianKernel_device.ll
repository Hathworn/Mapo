; ModuleID = '../data/hip_kernels/12594/9/main.cu'
source_filename = "../data/hip_kernels/12594/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23calculateGaussianKernelPffiE3sum = internal unnamed_addr addrspace(3) global float undef, align 4
@s_gaussKernel = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23calculateGaussianKernelPffi(float addrspace(1)* nocapture writeonly %0, float %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = sub i32 %4, %2
  %6 = fpext float %1 to double
  %7 = fmul contract double %6, 0x401921FB54442D18
  %8 = fptrunc double %7 to float
  %9 = fcmp olt float %8, 0x39F0000000000000
  %10 = select i1 %9, float 0x41F0000000000000, float 1.000000e+00
  %11 = fmul float %10, %8
  %12 = tail call float @llvm.sqrt.f32(float %11)
  %13 = bitcast float %12 to i32
  %14 = add nsw i32 %13, -1
  %15 = bitcast i32 %14 to float
  %16 = add nsw i32 %13, 1
  %17 = bitcast i32 %16 to float
  %18 = tail call i1 @llvm.amdgcn.class.f32(float %11, i32 608)
  %19 = select i1 %9, float 0x3EF0000000000000, float 1.000000e+00
  %20 = fneg float %17
  %21 = tail call float @llvm.fma.f32(float %20, float %12, float %11)
  %22 = fcmp ogt float %21, 0.000000e+00
  %23 = fneg float %15
  %24 = tail call float @llvm.fma.f32(float %23, float %12, float %11)
  %25 = fcmp ole float %24, 0.000000e+00
  %26 = select i1 %25, float %15, float %12
  %27 = select i1 %22, float %17, float %26
  %28 = fmul float %19, %27
  %29 = select i1 %18, float %11, float %28
  %30 = fdiv contract float 1.000000e+00, %29
  %31 = mul nsw i32 %5, %5
  %32 = sitofp i32 %31 to float
  %33 = fmul contract float %1, 2.000000e+00
  %34 = fmul contract float %33, %1
  %35 = fneg contract float %32
  %36 = fdiv contract float %35, %34
  %37 = fmul float %36, 0x3FF7154760000000
  %38 = tail call float @llvm.rint.f32(float %37)
  %39 = fcmp ogt float %36, 0x40562E4300000000
  %40 = fcmp olt float %36, 0xC059D1DA00000000
  %41 = fneg float %37
  %42 = tail call float @llvm.fma.f32(float %36, float 0x3FF7154760000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %36, float 0x3E54AE0BE0000000, float %42)
  %44 = fsub float %37, %38
  %45 = fadd float %43, %44
  %46 = tail call float @llvm.exp2.f32(float %45)
  %47 = fptosi float %38 to i32
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %46, i32 %47)
  %49 = select i1 %40, float 0.000000e+00, float %48
  %50 = select i1 %39, float 0x7FF0000000000000, float %49
  %51 = fmul contract float %50, %30
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %4
  store float %51, float addrspace(3)* %52, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp eq i32 %4, 0
  br i1 %53, label %54, label %119

54:                                               ; preds = %3
  %55 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %56 = getelementptr i8, i8 addrspace(4)* %55, i64 4
  %57 = bitcast i8 addrspace(4)* %56 to i16 addrspace(4)*
  %58 = load i16, i16 addrspace(4)* %57, align 4, !range !9, !invariant.load !10
  %59 = zext i16 %58 to i32
  %60 = and i32 %59, 7
  %61 = icmp ult i16 %58, 8
  br i1 %61, label %102, label %62

62:                                               ; preds = %54
  %63 = and i32 %59, 2040
  br label %64

64:                                               ; preds = %64, %62
  %65 = phi i32 [ 0, %62 ], [ %99, %64 ]
  %66 = phi float [ 0.000000e+00, %62 ], [ %98, %64 ]
  %67 = phi i32 [ 0, %62 ], [ %100, %64 ]
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %65
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !5
  %70 = fadd contract float %69, %66
  %71 = or i32 %65, 1
  %72 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %74 = fadd contract float %73, %70
  %75 = or i32 %65, 2
  %76 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %75
  %77 = load float, float addrspace(3)* %76, align 4, !tbaa !5
  %78 = fadd contract float %77, %74
  %79 = or i32 %65, 3
  %80 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !5
  %82 = fadd contract float %81, %78
  %83 = or i32 %65, 4
  %84 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %83
  %85 = load float, float addrspace(3)* %84, align 4, !tbaa !5
  %86 = fadd contract float %85, %82
  %87 = or i32 %65, 5
  %88 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %90 = fadd contract float %89, %86
  %91 = or i32 %65, 6
  %92 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %91
  %93 = load float, float addrspace(3)* %92, align 4, !tbaa !5
  %94 = fadd contract float %93, %90
  %95 = or i32 %65, 7
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %95
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !5
  %98 = fadd contract float %97, %94
  %99 = add nuw nsw i32 %65, 8
  %100 = add i32 %67, 8
  %101 = icmp eq i32 %100, %63
  br i1 %101, label %102, label %64, !llvm.loop !11

102:                                              ; preds = %64, %54
  %103 = phi float [ undef, %54 ], [ %98, %64 ]
  %104 = phi i32 [ 0, %54 ], [ %99, %64 ]
  %105 = phi float [ 0.000000e+00, %54 ], [ %98, %64 ]
  %106 = icmp eq i32 %60, 0
  br i1 %106, label %117, label %107

107:                                              ; preds = %102, %107
  %108 = phi i32 [ %114, %107 ], [ %104, %102 ]
  %109 = phi float [ %113, %107 ], [ %105, %102 ]
  %110 = phi i32 [ %115, %107 ], [ 0, %102 ]
  %111 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_gaussKernel, i32 0, i32 %108
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !5
  %113 = fadd contract float %112, %109
  %114 = add nuw nsw i32 %108, 1
  %115 = add i32 %110, 1
  %116 = icmp eq i32 %115, %60
  br i1 %116, label %117, label %107, !llvm.loop !13

117:                                              ; preds = %107, %102
  %118 = phi float [ %103, %102 ], [ %113, %107 ]
  store float %118, float addrspace(3)* @_ZZ23calculateGaussianKernelPffiE3sum, align 4, !tbaa !5
  br label %119

119:                                              ; preds = %117, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %121 = load float, float addrspace(3)* @_ZZ23calculateGaussianKernelPffiE3sum, align 4, !tbaa !5
  %122 = fdiv contract float %120, %121
  %123 = zext i32 %4 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  store float %122, float addrspace(1)* %124, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
