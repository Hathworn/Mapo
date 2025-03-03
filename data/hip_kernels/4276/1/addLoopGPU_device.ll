; ModuleID = '../data/hip_kernels/4276/1/main.cu'
source_filename = "../data/hip_kernels/4276/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10addLoopGPUPiS_S_(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = icmp slt i32 %4, 64
  br i1 %5, label %6, label %165

6:                                                ; preds = %3
  %7 = sext i32 %4 to i64
  %8 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %7
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = sitofp i32 %9 to float
  %11 = tail call float @llvm.fabs.f32(float %10)
  %12 = tail call float @llvm.amdgcn.frexp.mant.f32(float %11)
  %13 = fcmp olt float %12, 0x3FE5555560000000
  %14 = zext i1 %13 to i32
  %15 = tail call float @llvm.amdgcn.ldexp.f32(float %12, i32 %14)
  %16 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %11)
  %17 = sub nsw i32 %16, %14
  %18 = fadd float %15, -1.000000e+00
  %19 = fadd float %15, 1.000000e+00
  %20 = fadd float %19, -1.000000e+00
  %21 = fsub float %15, %20
  %22 = tail call float @llvm.amdgcn.rcp.f32(float %19)
  %23 = fmul float %18, %22
  %24 = fmul float %19, %23
  %25 = fneg float %24
  %26 = tail call float @llvm.fma.f32(float %23, float %19, float %25)
  %27 = tail call float @llvm.fma.f32(float %23, float %21, float %26)
  %28 = fadd float %24, %27
  %29 = fsub float %28, %24
  %30 = fsub float %27, %29
  %31 = fsub float %18, %28
  %32 = fsub float %18, %31
  %33 = fsub float %32, %28
  %34 = fsub float %33, %30
  %35 = fadd float %31, %34
  %36 = fmul float %22, %35
  %37 = fadd float %23, %36
  %38 = fsub float %37, %23
  %39 = fsub float %36, %38
  %40 = fmul float %37, %37
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %37, float %37, float %41)
  %43 = fmul float %39, 2.000000e+00
  %44 = tail call float @llvm.fma.f32(float %37, float %43, float %42)
  %45 = fadd float %40, %44
  %46 = fsub float %45, %40
  %47 = fsub float %44, %46
  %48 = tail call float @llvm.fmuladd.f32(float %45, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %49 = tail call float @llvm.fmuladd.f32(float %45, float %48, float 0x3FD999BDE0000000)
  %50 = sitofp i32 %17 to float
  %51 = fmul float %50, 0x3FE62E4300000000
  %52 = fneg float %51
  %53 = tail call float @llvm.fma.f32(float %50, float 0x3FE62E4300000000, float %52)
  %54 = tail call float @llvm.fma.f32(float %50, float 0xBE205C6100000000, float %53)
  %55 = fadd float %51, %54
  %56 = fsub float %55, %51
  %57 = fsub float %54, %56
  %58 = tail call float @llvm.amdgcn.ldexp.f32(float %37, i32 1)
  %59 = fmul float %37, %45
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %45, float %37, float %60)
  %62 = tail call float @llvm.fma.f32(float %45, float %39, float %61)
  %63 = tail call float @llvm.fma.f32(float %47, float %37, float %62)
  %64 = fadd float %59, %63
  %65 = fsub float %64, %59
  %66 = fsub float %63, %65
  %67 = fmul float %45, %49
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %45, float %49, float %68)
  %70 = tail call float @llvm.fma.f32(float %47, float %49, float %69)
  %71 = fadd float %67, %70
  %72 = fsub float %71, %67
  %73 = fsub float %70, %72
  %74 = fadd float %71, 0x3FE5555540000000
  %75 = fadd float %74, 0xBFE5555540000000
  %76 = fsub float %71, %75
  %77 = fadd float %73, 0x3E2E720200000000
  %78 = fadd float %77, %76
  %79 = fadd float %74, %78
  %80 = fsub float %79, %74
  %81 = fsub float %78, %80
  %82 = fmul float %64, %79
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %64, float %79, float %83)
  %85 = tail call float @llvm.fma.f32(float %64, float %81, float %84)
  %86 = tail call float @llvm.fma.f32(float %66, float %79, float %85)
  %87 = tail call float @llvm.amdgcn.ldexp.f32(float %39, i32 1)
  %88 = fadd float %82, %86
  %89 = fsub float %88, %82
  %90 = fsub float %86, %89
  %91 = fadd float %58, %88
  %92 = fsub float %91, %58
  %93 = fsub float %88, %92
  %94 = fadd float %87, %90
  %95 = fadd float %94, %93
  %96 = fadd float %91, %95
  %97 = fsub float %96, %91
  %98 = fsub float %95, %97
  %99 = fadd float %55, %96
  %100 = fsub float %99, %55
  %101 = fsub float %99, %100
  %102 = fsub float %55, %101
  %103 = fsub float %96, %100
  %104 = fadd float %103, %102
  %105 = fadd float %57, %98
  %106 = fsub float %105, %57
  %107 = fsub float %105, %106
  %108 = fsub float %57, %107
  %109 = fsub float %98, %106
  %110 = fadd float %109, %108
  %111 = fadd float %105, %104
  %112 = fadd float %99, %111
  %113 = fsub float %112, %99
  %114 = fsub float %111, %113
  %115 = fadd float %110, %114
  %116 = fadd float %112, %115
  %117 = fsub float %116, %112
  %118 = fsub float %115, %117
  %119 = fmul float %116, 2.000000e+00
  %120 = fneg float %119
  %121 = tail call float @llvm.fma.f32(float %116, float 2.000000e+00, float %120)
  %122 = tail call float @llvm.fma.f32(float %118, float 2.000000e+00, float %121)
  %123 = fadd float %119, %122
  %124 = fsub float %123, %119
  %125 = fsub float %122, %124
  %126 = tail call float @llvm.fabs.f32(float %119) #3
  %127 = fcmp oeq float %126, 0x7FF0000000000000
  %128 = select i1 %127, float %119, float %123
  %129 = tail call float @llvm.fabs.f32(float %128) #3
  %130 = fcmp oeq float %129, 0x7FF0000000000000
  %131 = select i1 %130, float 0.000000e+00, float %125
  %132 = fcmp oeq float %128, 0x40562E4300000000
  %133 = select i1 %132, float 0x3EE0000000000000, float 0.000000e+00
  %134 = fsub float %128, %133
  %135 = fadd float %133, %131
  %136 = fmul float %134, 0x3FF7154760000000
  %137 = tail call float @llvm.rint.f32(float %136)
  %138 = fcmp ogt float %134, 0x40562E4300000000
  %139 = fcmp olt float %134, 0xC059D1DA00000000
  %140 = fneg float %136
  %141 = tail call float @llvm.fma.f32(float %134, float 0x3FF7154760000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %134, float 0x3E54AE0BE0000000, float %141)
  %143 = fsub float %136, %137
  %144 = fadd float %142, %143
  %145 = tail call float @llvm.exp2.f32(float %144)
  %146 = fptosi float %137 to i32
  %147 = tail call float @llvm.amdgcn.ldexp.f32(float %145, i32 %146)
  %148 = select i1 %139, float 0.000000e+00, float %147
  %149 = select i1 %138, float 0x7FF0000000000000, float %148
  %150 = tail call float @llvm.fma.f32(float %149, float %135, float %149)
  %151 = tail call float @llvm.fabs.f32(float %149) #3
  %152 = fcmp oeq float %151, 0x7FF0000000000000
  %153 = select i1 %152, float %149, float %150
  %154 = tail call float @llvm.fabs.f32(float %153)
  %155 = fcmp oeq float %11, 0x7FF0000000000000
  %156 = icmp eq i32 %9, 0
  %157 = select i1 %155, float 0x7FF0000000000000, float %154
  %158 = select i1 %156, float 0.000000e+00, float %157
  %159 = icmp eq i32 %9, 1
  %160 = select i1 %159, float 1.000000e+00, float %158
  %161 = fsub contract float %160, %160
  %162 = tail call float @llvm.fabs.f32(float %161)
  %163 = fptosi float %162 to i32
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %7
  store i32 %163, i32 addrspace(1)* %164, align 4, !tbaa !4
  br label %165

165:                                              ; preds = %6, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
