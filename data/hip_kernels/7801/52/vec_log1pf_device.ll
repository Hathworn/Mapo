; ModuleID = '../data/hip_kernels/7801/52/main.cu'
source_filename = "../data/hip_kernels/7801/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_log1pf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %135

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fadd float %17, 1.000000e+00
  %19 = fadd float %18, -1.000000e+00
  %20 = fsub float %19, %18
  %21 = fadd float %20, 1.000000e+00
  %22 = fsub float %17, %19
  %23 = fadd float %22, %21
  %24 = tail call float @llvm.amdgcn.frexp.mant.f32(float %18)
  %25 = fcmp olt float %24, 0x3FE5555560000000
  %26 = sext i1 %25 to i32
  %27 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %18)
  %28 = add i32 %27, %26
  %29 = sub nsw i32 0, %28
  %30 = tail call float @llvm.amdgcn.ldexp.f32(float %18, i32 %29)
  %31 = tail call float @llvm.amdgcn.ldexp.f32(float %23, i32 %29)
  %32 = fadd float %30, -1.000000e+00
  %33 = fadd float %32, 1.000000e+00
  %34 = fsub float %30, %33
  %35 = fadd float %31, %34
  %36 = fadd float %32, %35
  %37 = fsub float %36, %32
  %38 = fsub float %35, %37
  %39 = fadd float %30, 1.000000e+00
  %40 = fadd float %39, -1.000000e+00
  %41 = fsub float %30, %40
  %42 = fadd float %31, %41
  %43 = fadd float %39, %42
  %44 = fsub float %43, %39
  %45 = fsub float %42, %44
  %46 = tail call float @llvm.amdgcn.rcp.f32(float %43)
  %47 = fmul float %36, %46
  %48 = fmul float %43, %47
  %49 = fneg float %48
  %50 = tail call float @llvm.fma.f32(float %47, float %43, float %49)
  %51 = tail call float @llvm.fma.f32(float %47, float %45, float %50)
  %52 = fadd float %48, %51
  %53 = fsub float %52, %48
  %54 = fsub float %51, %53
  %55 = fsub float %36, %52
  %56 = fsub float %36, %55
  %57 = fsub float %56, %52
  %58 = fadd float %38, %57
  %59 = fsub float %58, %54
  %60 = fadd float %55, %59
  %61 = fmul float %46, %60
  %62 = fmul float %43, %61
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %61, float %43, float %63)
  %65 = tail call float @llvm.fma.f32(float %61, float %45, float %64)
  %66 = fsub float %60, %55
  %67 = fsub float %59, %66
  %68 = fadd float %62, %65
  %69 = fsub float %68, %62
  %70 = fsub float %65, %69
  %71 = fsub float %60, %68
  %72 = fsub float %60, %71
  %73 = fsub float %72, %68
  %74 = fadd float %67, %73
  %75 = fsub float %74, %70
  %76 = fadd float %71, %75
  %77 = fmul float %46, %76
  %78 = fadd float %47, %61
  %79 = fsub float %78, %47
  %80 = fsub float %61, %79
  %81 = fadd float %80, %77
  %82 = fadd float %78, %81
  %83 = fmul float %82, %82
  %84 = tail call float @llvm.fmuladd.f32(float %83, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %85 = tail call float @llvm.fmuladd.f32(float %83, float %84, float 0x3FE5555B40000000)
  %86 = sitofp i32 %28 to float
  %87 = fmul float %86, 0x3FE62E4300000000
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %86, float 0x3FE62E4300000000, float %88)
  %90 = tail call float @llvm.fma.f32(float %86, float 0xBE205C6100000000, float %89)
  %91 = fsub float %82, %78
  %92 = fsub float %81, %91
  %93 = fadd float %87, %90
  %94 = fsub float %93, %87
  %95 = fsub float %90, %94
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 1)
  %97 = tail call float @llvm.amdgcn.ldexp.f32(float %92, i32 1)
  %98 = fmul float %82, %83
  %99 = fmul float %98, %85
  %100 = fadd float %96, %99
  %101 = fsub float %100, %96
  %102 = fsub float %99, %101
  %103 = fadd float %97, %102
  %104 = fadd float %100, %103
  %105 = fsub float %104, %100
  %106 = fsub float %103, %105
  %107 = fadd float %93, %104
  %108 = fsub float %107, %93
  %109 = fsub float %107, %108
  %110 = fsub float %93, %109
  %111 = fsub float %104, %108
  %112 = fadd float %111, %110
  %113 = fadd float %95, %106
  %114 = fsub float %113, %95
  %115 = fsub float %113, %114
  %116 = fsub float %95, %115
  %117 = fsub float %106, %114
  %118 = fadd float %117, %116
  %119 = fadd float %113, %112
  %120 = fadd float %107, %119
  %121 = fsub float %120, %107
  %122 = fsub float %119, %121
  %123 = fadd float %118, %122
  %124 = fadd float %120, %123
  %125 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 512)
  %126 = select i1 %125, float %17, float %124
  %127 = fcmp olt float %17, -1.000000e+00
  %128 = select i1 %127, float 0x7FF8000000000000, float %126
  %129 = fcmp oeq float %17, -1.000000e+00
  %130 = select i1 %129, float 0xFFF0000000000000, float %128
  %131 = tail call float @llvm.fabs.f32(float %17)
  %132 = fcmp olt float %131, 0x3E70000000000000
  %133 = select i1 %132, float %17, float %130
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %133, float addrspace(1)* %134, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
