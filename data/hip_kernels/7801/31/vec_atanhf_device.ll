; ModuleID = '../data/hip_kernels/7801/31/main.cu'
source_filename = "../data/hip_kernels/7801/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_atanhf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %154

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fadd float %18, 1.000000e+00
  %20 = fsub float 1.000000e+00, %18
  %21 = fsub float 1.000000e+00, %20
  %22 = fsub float %21, %18
  %23 = tail call float @llvm.amdgcn.rcp.f32(float %20)
  %24 = fmul float %19, %23
  %25 = fmul float %20, %24
  %26 = fneg float %25
  %27 = tail call float @llvm.fma.f32(float %24, float %20, float %26)
  %28 = tail call float @llvm.fma.f32(float %24, float %22, float %27)
  %29 = fadd float %19, -1.000000e+00
  %30 = fsub float %18, %29
  %31 = fadd float %25, %28
  %32 = fsub float %31, %25
  %33 = fsub float %28, %32
  %34 = fsub float %19, %31
  %35 = fsub float %19, %34
  %36 = fsub float %35, %31
  %37 = fsub float %36, %33
  %38 = fadd float %30, %37
  %39 = fadd float %34, %38
  %40 = fmul float %23, %39
  %41 = fadd float %24, %40
  %42 = fsub float %41, %24
  %43 = fsub float %40, %42
  %44 = tail call float @llvm.amdgcn.frexp.mant.f32(float %41)
  %45 = fcmp olt float %44, 0x3FE5555560000000
  %46 = sext i1 %45 to i32
  %47 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %41)
  %48 = add i32 %47, %46
  %49 = sub nsw i32 0, %48
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %49)
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %43, i32 %49)
  %52 = fadd float %50, -1.000000e+00
  %53 = fadd float %52, 1.000000e+00
  %54 = fsub float %50, %53
  %55 = fadd float %51, %54
  %56 = fadd float %52, %55
  %57 = fsub float %56, %52
  %58 = fsub float %55, %57
  %59 = fadd float %50, 1.000000e+00
  %60 = fadd float %59, -1.000000e+00
  %61 = fsub float %50, %60
  %62 = fadd float %51, %61
  %63 = fadd float %59, %62
  %64 = fsub float %63, %59
  %65 = fsub float %62, %64
  %66 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %67 = fmul float %56, %66
  %68 = fmul float %63, %67
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %67, float %63, float %69)
  %71 = tail call float @llvm.fma.f32(float %67, float %65, float %70)
  %72 = fadd float %68, %71
  %73 = fsub float %72, %68
  %74 = fsub float %71, %73
  %75 = fsub float %56, %72
  %76 = fsub float %56, %75
  %77 = fsub float %76, %72
  %78 = fadd float %58, %77
  %79 = fsub float %78, %74
  %80 = fadd float %75, %79
  %81 = fmul float %66, %80
  %82 = fmul float %63, %81
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %81, float %63, float %83)
  %85 = tail call float @llvm.fma.f32(float %81, float %65, float %84)
  %86 = fsub float %80, %75
  %87 = fsub float %79, %86
  %88 = fadd float %82, %85
  %89 = fsub float %88, %82
  %90 = fsub float %85, %89
  %91 = fsub float %80, %88
  %92 = fsub float %80, %91
  %93 = fsub float %92, %88
  %94 = fadd float %87, %93
  %95 = fsub float %94, %90
  %96 = fadd float %91, %95
  %97 = fmul float %66, %96
  %98 = fadd float %67, %81
  %99 = fsub float %98, %67
  %100 = fsub float %81, %99
  %101 = fadd float %100, %97
  %102 = fadd float %98, %101
  %103 = fmul float %102, %102
  %104 = tail call float @llvm.fmuladd.f32(float %103, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %105 = tail call float @llvm.fmuladd.f32(float %103, float %104, float 0x3FE5555B40000000)
  %106 = sitofp i32 %48 to float
  %107 = fmul float %106, 0x3FE62E4300000000
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %106, float 0x3FE62E4300000000, float %108)
  %110 = tail call float @llvm.fma.f32(float %106, float 0xBE205C6100000000, float %109)
  %111 = fsub float %102, %98
  %112 = fsub float %101, %111
  %113 = fadd float %107, %110
  %114 = fsub float %113, %107
  %115 = fsub float %110, %114
  %116 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 1)
  %117 = tail call float @llvm.amdgcn.ldexp.f32(float %112, i32 1)
  %118 = fmul float %102, %103
  %119 = fmul float %118, %105
  %120 = fadd float %116, %119
  %121 = fsub float %120, %116
  %122 = fsub float %119, %121
  %123 = fadd float %117, %122
  %124 = fadd float %120, %123
  %125 = fsub float %124, %120
  %126 = fsub float %123, %125
  %127 = fadd float %113, %124
  %128 = fsub float %127, %113
  %129 = fsub float %127, %128
  %130 = fsub float %113, %129
  %131 = fsub float %124, %128
  %132 = fadd float %131, %130
  %133 = fadd float %115, %126
  %134 = fsub float %133, %115
  %135 = fsub float %133, %134
  %136 = fsub float %115, %135
  %137 = fsub float %126, %134
  %138 = fadd float %137, %136
  %139 = fadd float %133, %132
  %140 = fadd float %127, %139
  %141 = fsub float %140, %127
  %142 = fsub float %139, %141
  %143 = fadd float %138, %142
  %144 = fadd float %140, %143
  %145 = fmul float %144, 5.000000e-01
  %146 = fcmp olt float %18, 0x3F30000000000000
  %147 = select i1 %146, float %18, float %145
  %148 = fcmp ogt float %18, 1.000000e+00
  %149 = select i1 %148, float 0x7FF8000000000000, float %147
  %150 = fcmp oeq float %18, 1.000000e+00
  %151 = select i1 %150, float 0x7FF0000000000000, float %149
  %152 = tail call float @llvm.copysign.f32(float %151, float %17)
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %152, float addrspace(1)* %153, align 4, !tbaa !7
  br label %154

154:                                              ; preds = %15, %3
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

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
