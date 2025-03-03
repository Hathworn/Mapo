; ModuleID = '../data/hip_kernels/10615/5/main.cu'
source_filename = "../data/hip_kernels/10615/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@maxLum = protected addrspace(1) externally_initialized global float 0.000000e+00, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (float addrspace(1)* @maxLum to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19tonemap_logarithmicPfS_iiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 2, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %3
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %143

29:                                               ; preds = %8
  %30 = mul nsw i32 %17, %2
  %31 = add nsw i32 %30, %25
  %32 = mul nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fmul contract float %35, %6
  %37 = fadd contract float %36, 1.000000e+00
  %38 = tail call i1 @llvm.amdgcn.class.f32(float %37, i32 144)
  %39 = select i1 %38, float 0x41F0000000000000, float 1.000000e+00
  %40 = fmul float %37, %39
  %41 = tail call float @llvm.log2.f32(float %40)
  %42 = fmul float %41, 0x3FD3441340000000
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %41, i32 519)
  %44 = fneg float %42
  %45 = tail call float @llvm.fma.f32(float %41, float 0x3FD3441340000000, float %44)
  %46 = tail call float @llvm.fma.f32(float %41, float 0x3E509F79E0000000, float %45)
  %47 = fadd float %42, %46
  %48 = select i1 %43, float %41, float %47
  %49 = select i1 %38, float 0x4023441360000000, float 0.000000e+00
  %50 = fsub float %48, %49
  %51 = load float, float addrspace(1)* @maxLum, align 4, !tbaa !7
  %52 = fmul contract float %51, %7
  %53 = fadd contract float %52, 1.000000e+00
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %53, i32 144)
  %55 = select i1 %54, float 0x41F0000000000000, float 1.000000e+00
  %56 = fmul float %53, %55
  %57 = tail call float @llvm.log2.f32(float %56)
  %58 = fmul float %57, 0x3FD3441340000000
  %59 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 519)
  %60 = fneg float %58
  %61 = tail call float @llvm.fma.f32(float %57, float 0x3FD3441340000000, float %60)
  %62 = tail call float @llvm.fma.f32(float %57, float 0x3E509F79E0000000, float %61)
  %63 = fadd float %58, %62
  %64 = select i1 %59, float %57, float %63
  %65 = select i1 %54, float 0x4023441360000000, float 0.000000e+00
  %66 = fsub float %64, %65
  %67 = fdiv contract float %50, %66
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  store float %67, float addrspace(1)* %68, align 4, !tbaa !7
  %69 = add nsw i32 %32, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fmul contract float %72, %6
  %74 = fadd contract float %73, 1.000000e+00
  %75 = tail call i1 @llvm.amdgcn.class.f32(float %74, i32 144)
  %76 = select i1 %75, float 0x41F0000000000000, float 1.000000e+00
  %77 = fmul float %74, %76
  %78 = tail call float @llvm.log2.f32(float %77)
  %79 = fmul float %78, 0x3FD3441340000000
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %78, i32 519)
  %81 = fneg float %79
  %82 = tail call float @llvm.fma.f32(float %78, float 0x3FD3441340000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %78, float 0x3E509F79E0000000, float %82)
  %84 = fadd float %79, %83
  %85 = select i1 %80, float %78, float %84
  %86 = select i1 %75, float 0x4023441360000000, float 0.000000e+00
  %87 = fsub float %85, %86
  %88 = load float, float addrspace(1)* @maxLum, align 4, !tbaa !7
  %89 = fmul contract float %88, %7
  %90 = fadd contract float %89, 1.000000e+00
  %91 = tail call i1 @llvm.amdgcn.class.f32(float %90, i32 144)
  %92 = select i1 %91, float 0x41F0000000000000, float 1.000000e+00
  %93 = fmul float %90, %92
  %94 = tail call float @llvm.log2.f32(float %93)
  %95 = fmul float %94, 0x3FD3441340000000
  %96 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 519)
  %97 = fneg float %95
  %98 = tail call float @llvm.fma.f32(float %94, float 0x3FD3441340000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %94, float 0x3E509F79E0000000, float %98)
  %100 = fadd float %95, %99
  %101 = select i1 %96, float %94, float %100
  %102 = select i1 %91, float 0x4023441360000000, float 0.000000e+00
  %103 = fsub float %101, %102
  %104 = fdiv contract float %87, %103
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  store float %104, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = add nsw i32 %32, 2
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = fmul contract float %109, %6
  %111 = fadd contract float %110, 1.000000e+00
  %112 = tail call i1 @llvm.amdgcn.class.f32(float %111, i32 144)
  %113 = select i1 %112, float 0x41F0000000000000, float 1.000000e+00
  %114 = fmul float %111, %113
  %115 = tail call float @llvm.log2.f32(float %114)
  %116 = fmul float %115, 0x3FD3441340000000
  %117 = tail call i1 @llvm.amdgcn.class.f32(float %115, i32 519)
  %118 = fneg float %116
  %119 = tail call float @llvm.fma.f32(float %115, float 0x3FD3441340000000, float %118)
  %120 = tail call float @llvm.fma.f32(float %115, float 0x3E509F79E0000000, float %119)
  %121 = fadd float %116, %120
  %122 = select i1 %117, float %115, float %121
  %123 = select i1 %112, float 0x4023441360000000, float 0.000000e+00
  %124 = fsub float %122, %123
  %125 = load float, float addrspace(1)* @maxLum, align 4, !tbaa !7
  %126 = fmul contract float %125, %7
  %127 = fadd contract float %126, 1.000000e+00
  %128 = tail call i1 @llvm.amdgcn.class.f32(float %127, i32 144)
  %129 = select i1 %128, float 0x41F0000000000000, float 1.000000e+00
  %130 = fmul float %127, %129
  %131 = tail call float @llvm.log2.f32(float %130)
  %132 = fmul float %131, 0x3FD3441340000000
  %133 = tail call i1 @llvm.amdgcn.class.f32(float %131, i32 519)
  %134 = fneg float %132
  %135 = tail call float @llvm.fma.f32(float %131, float 0x3FD3441340000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %131, float 0x3E509F79E0000000, float %135)
  %137 = fadd float %132, %136
  %138 = select i1 %133, float %131, float %137
  %139 = select i1 %128, float 0x4023441360000000, float 0.000000e+00
  %140 = fsub float %138, %139
  %141 = fdiv contract float %124, %140
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  store float %141, float addrspace(1)* %142, align 4, !tbaa !7
  br label %143

143:                                              ; preds = %29, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
