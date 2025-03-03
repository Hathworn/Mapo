; ModuleID = '../data/hip_kernels/7801/63/main.cu'
source_filename = "../data/hip_kernels/7801/63/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_sinhf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %139

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fadd float %18, 0xBFE62E4300000000
  %20 = fsub float %19, %18
  %21 = fsub float %20, %19
  %22 = fadd float %18, %21
  %23 = fadd float %20, 0x3FE62E4300000000
  %24 = fsub float %22, %23
  %25 = fadd float %24, 0x3E205C6100000000
  %26 = fadd float %19, %25
  %27 = fsub float %26, %19
  %28 = fsub float %25, %27
  %29 = fmul float %26, 0x3FF7154760000000
  %30 = tail call float @llvm.rint.f32(float %29)
  %31 = tail call float @llvm.fmuladd.f32(float %30, float 0xBFE62E4000000000, float %26)
  %32 = fadd float %28, %31
  %33 = fsub float %32, %31
  %34 = fsub float %28, %33
  %35 = fmul float %30, 0x3EB7F78000000000
  %36 = fsub float %32, %35
  %37 = fsub float %32, %36
  %38 = fsub float %37, %35
  %39 = fadd float %34, %38
  %40 = fadd float %36, %39
  %41 = fsub float %40, %36
  %42 = fsub float %39, %41
  %43 = fmul float %30, 0x3DD473DE60000000
  %44 = fsub float %40, %43
  %45 = fsub float %40, %44
  %46 = fsub float %45, %43
  %47 = fadd float %42, %46
  %48 = fadd float %44, %47
  %49 = fsub float %48, %44
  %50 = fsub float %47, %49
  %51 = tail call float @llvm.fmuladd.f32(float %48, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %48, float %51, float 0x3FA555B980000000)
  %53 = tail call float @llvm.fmuladd.f32(float %48, float %52, float 0x3FC55548E0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %48, float %53, float 0x3FDFFFFF80000000)
  %55 = fmul float %48, %48
  %56 = fneg float %55
  %57 = tail call float @llvm.fma.f32(float %48, float %48, float %56)
  %58 = fmul float %50, 2.000000e+00
  %59 = tail call float @llvm.fma.f32(float %48, float %58, float %57)
  %60 = fadd float %55, %59
  %61 = fsub float %60, %55
  %62 = fsub float %59, %61
  %63 = fmul float %54, %60
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %60, float %54, float %64)
  %66 = tail call float @llvm.fma.f32(float %62, float %54, float %65)
  %67 = fadd float %63, %66
  %68 = fsub float %67, %63
  %69 = fsub float %66, %68
  %70 = fadd float %48, %67
  %71 = fsub float %70, %48
  %72 = fsub float %67, %71
  %73 = fadd float %50, %69
  %74 = fadd float %73, %72
  %75 = fadd float %70, %74
  %76 = fsub float %75, %70
  %77 = fsub float %74, %76
  %78 = fadd float %75, 1.000000e+00
  %79 = fadd float %78, -1.000000e+00
  %80 = fsub float %75, %79
  %81 = fadd float %77, %80
  %82 = fadd float %78, %81
  %83 = fsub float %82, %78
  %84 = fsub float %81, %83
  %85 = fptosi float %30 to i32
  %86 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 %85)
  %87 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 %85)
  %88 = tail call float @llvm.amdgcn.rcp.f32(float %86)
  %89 = fmul float %86, %88
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %88, float %86, float %90)
  %92 = tail call float @llvm.fma.f32(float %88, float %87, float %91)
  %93 = fadd float %89, %92
  %94 = fsub float %93, %89
  %95 = fsub float %92, %94
  %96 = fsub float 1.000000e+00, %93
  %97 = fsub float 1.000000e+00, %96
  %98 = fsub float %97, %93
  %99 = fsub float %98, %95
  %100 = fadd float %96, %99
  %101 = fmul float %88, %100
  %102 = fmul float %86, %101
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %101, float %86, float %103)
  %105 = tail call float @llvm.fma.f32(float %101, float %87, float %104)
  %106 = fsub float %100, %96
  %107 = fsub float %99, %106
  %108 = fadd float %102, %105
  %109 = fsub float %108, %102
  %110 = fsub float %105, %109
  %111 = fsub float %100, %108
  %112 = fsub float %100, %111
  %113 = fsub float %112, %108
  %114 = fadd float %107, %113
  %115 = fsub float %114, %110
  %116 = fadd float %111, %115
  %117 = fmul float %88, %116
  %118 = fadd float %88, %101
  %119 = fsub float %118, %88
  %120 = fsub float %101, %119
  %121 = fadd float %120, %117
  %122 = fadd float %118, %121
  %123 = fsub float %122, %118
  %124 = fsub float %121, %123
  %125 = tail call float @llvm.amdgcn.ldexp.f32(float %122, i32 -2)
  %126 = tail call float @llvm.amdgcn.ldexp.f32(float %124, i32 -2)
  %127 = fsub float %86, %125
  %128 = fsub float %86, %127
  %129 = fsub float %128, %125
  %130 = fadd float %87, %129
  %131 = fsub float %130, %126
  %132 = fadd float %127, %131
  %133 = fcmp ogt float %18, 0x40565A9F80000000
  %134 = select i1 %133, float 0x7FF0000000000000, float %132
  %135 = fcmp olt float %18, 0x3F30000000000000
  %136 = select i1 %135, float %18, float %134
  %137 = tail call float @llvm.copysign.f32(float %136, float %17)
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %137, float addrspace(1)* %138, align 4, !tbaa !7
  br label %139

139:                                              ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
