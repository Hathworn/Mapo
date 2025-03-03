; ModuleID = '../data/hip_kernels/15343/7/main.cu'
source_filename = "../data/hip_kernels/15343/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z9solve_GPUiiiPiS_(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = sitofp i32 %1 to float
  %7 = tail call float @llvm.fabs.f32(float %6)
  %8 = tail call float @llvm.amdgcn.frexp.mant.f32(float %7)
  %9 = fcmp olt float %8, 0x3FE5555560000000
  %10 = zext i1 %9 to i32
  %11 = tail call float @llvm.amdgcn.ldexp.f32(float %8, i32 %10)
  %12 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %7)
  %13 = sub nsw i32 %12, %10
  %14 = fadd float %11, -1.000000e+00
  %15 = fadd float %11, 1.000000e+00
  %16 = fadd float %15, -1.000000e+00
  %17 = fsub float %11, %16
  %18 = tail call float @llvm.amdgcn.rcp.f32(float %15)
  %19 = fmul float %14, %18
  %20 = fmul float %15, %19
  %21 = fneg float %20
  %22 = tail call float @llvm.fma.f32(float %19, float %15, float %21)
  %23 = tail call float @llvm.fma.f32(float %19, float %17, float %22)
  %24 = fadd float %20, %23
  %25 = fsub float %24, %20
  %26 = fsub float %23, %25
  %27 = fsub float %14, %24
  %28 = fsub float %14, %27
  %29 = fsub float %28, %24
  %30 = fsub float %29, %26
  %31 = fadd float %27, %30
  %32 = fmul float %18, %31
  %33 = fadd float %19, %32
  %34 = fsub float %33, %19
  %35 = fsub float %32, %34
  %36 = fmul float %33, %33
  %37 = fneg float %36
  %38 = tail call float @llvm.fma.f32(float %33, float %33, float %37)
  %39 = fmul float %35, 2.000000e+00
  %40 = tail call float @llvm.fma.f32(float %33, float %39, float %38)
  %41 = fadd float %36, %40
  %42 = fsub float %41, %36
  %43 = fsub float %40, %42
  %44 = tail call float @llvm.fmuladd.f32(float %41, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %45 = tail call float @llvm.fmuladd.f32(float %41, float %44, float 0x3FD999BDE0000000)
  %46 = sitofp i32 %13 to float
  %47 = fmul float %46, 0x3FE62E4300000000
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %46, float 0x3FE62E4300000000, float %48)
  %50 = tail call float @llvm.fma.f32(float %46, float 0xBE205C6100000000, float %49)
  %51 = fadd float %47, %50
  %52 = fsub float %51, %47
  %53 = fsub float %50, %52
  %54 = tail call float @llvm.amdgcn.ldexp.f32(float %33, i32 1)
  %55 = fmul float %33, %41
  %56 = fneg float %55
  %57 = tail call float @llvm.fma.f32(float %41, float %33, float %56)
  %58 = tail call float @llvm.fma.f32(float %41, float %35, float %57)
  %59 = tail call float @llvm.fma.f32(float %43, float %33, float %58)
  %60 = fadd float %55, %59
  %61 = fsub float %60, %55
  %62 = fsub float %59, %61
  %63 = fmul float %41, %45
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %41, float %45, float %64)
  %66 = tail call float @llvm.fma.f32(float %43, float %45, float %65)
  %67 = fadd float %63, %66
  %68 = fsub float %67, %63
  %69 = fsub float %66, %68
  %70 = fadd float %67, 0x3FE5555540000000
  %71 = fadd float %70, 0xBFE5555540000000
  %72 = fsub float %67, %71
  %73 = fadd float %69, 0x3E2E720200000000
  %74 = fadd float %73, %72
  %75 = fadd float %70, %74
  %76 = fsub float %75, %70
  %77 = fsub float %74, %76
  %78 = fmul float %60, %75
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %60, float %75, float %79)
  %81 = tail call float @llvm.fma.f32(float %60, float %77, float %80)
  %82 = tail call float @llvm.fma.f32(float %62, float %75, float %81)
  %83 = tail call float @llvm.amdgcn.ldexp.f32(float %35, i32 1)
  %84 = fadd float %78, %82
  %85 = fsub float %84, %78
  %86 = fsub float %82, %85
  %87 = fadd float %54, %84
  %88 = fsub float %87, %54
  %89 = fsub float %84, %88
  %90 = fadd float %83, %86
  %91 = fadd float %90, %89
  %92 = fadd float %87, %91
  %93 = fsub float %92, %87
  %94 = fsub float %91, %93
  %95 = fadd float %51, %92
  %96 = fsub float %95, %51
  %97 = fsub float %95, %96
  %98 = fsub float %51, %97
  %99 = fsub float %92, %96
  %100 = fadd float %99, %98
  %101 = fadd float %53, %94
  %102 = fsub float %101, %53
  %103 = fsub float %101, %102
  %104 = fsub float %53, %103
  %105 = fsub float %94, %102
  %106 = fadd float %105, %104
  %107 = fadd float %101, %100
  %108 = fadd float %95, %107
  %109 = fsub float %108, %95
  %110 = fsub float %107, %109
  %111 = fadd float %106, %110
  %112 = fadd float %108, %111
  %113 = fsub float %112, %108
  %114 = fsub float %111, %113
  %115 = fmul float %112, 2.000000e+00
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %112, float 2.000000e+00, float %116)
  %118 = tail call float @llvm.fma.f32(float %114, float 2.000000e+00, float %117)
  %119 = fadd float %115, %118
  %120 = fsub float %119, %115
  %121 = fsub float %118, %120
  %122 = tail call float @llvm.fabs.f32(float %115) #3
  %123 = fcmp oeq float %122, 0x7FF0000000000000
  %124 = select i1 %123, float %115, float %119
  %125 = tail call float @llvm.fabs.f32(float %124) #3
  %126 = fcmp oeq float %125, 0x7FF0000000000000
  %127 = select i1 %126, float 0.000000e+00, float %121
  %128 = fcmp oeq float %124, 0x40562E4300000000
  %129 = select i1 %128, float 0x3EE0000000000000, float 0.000000e+00
  %130 = fsub float %124, %129
  %131 = fadd float %129, %127
  %132 = fmul float %130, 0x3FF7154760000000
  %133 = tail call float @llvm.rint.f32(float %132)
  %134 = fcmp ogt float %130, 0x40562E4300000000
  %135 = fcmp olt float %130, 0xC059D1DA00000000
  %136 = fneg float %132
  %137 = tail call float @llvm.fma.f32(float %130, float 0x3FF7154760000000, float %136)
  %138 = tail call float @llvm.fma.f32(float %130, float 0x3E54AE0BE0000000, float %137)
  %139 = fsub float %132, %133
  %140 = fadd float %138, %139
  %141 = tail call float @llvm.exp2.f32(float %140)
  %142 = fptosi float %133 to i32
  %143 = tail call float @llvm.amdgcn.ldexp.f32(float %141, i32 %142)
  %144 = select i1 %135, float 0.000000e+00, float %143
  %145 = select i1 %134, float 0x7FF0000000000000, float %144
  %146 = tail call float @llvm.fma.f32(float %145, float %131, float %145)
  %147 = tail call float @llvm.fabs.f32(float %145) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float %145, float %146
  %150 = tail call float @llvm.fabs.f32(float %149)
  %151 = fcmp oeq float %7, 0x7FF0000000000000
  %152 = icmp eq i32 %1, 0
  %153 = select i1 %151, float 0x7FF0000000000000, float %150
  %154 = select i1 %152, float 0.000000e+00, float %153
  %155 = icmp eq i32 %1, 1
  %156 = select i1 %155, float 1.000000e+00, float %154
  %157 = shl nsw i32 %0, 2
  %158 = mul nsw i32 %157, %2
  %159 = sitofp i32 %158 to float
  %160 = fsub contract float %156, %159
  %161 = fptosi float %160 to i32
  %162 = sdiv i32 %1, -2
  %163 = mul nsw i32 %162, %0
  %164 = shl nsw i32 %0, 1
  %165 = sitofp i32 %163 to float
  %166 = sitofp i32 %161 to float
  %167 = icmp slt i32 %161, 1
  %168 = select i1 %167, float 0x41F0000000000000, float 1.000000e+00
  %169 = fmul float %168, %166
  %170 = tail call float @llvm.sqrt.f32(float %169)
  %171 = bitcast float %170 to i32
  %172 = add nsw i32 %171, -1
  %173 = bitcast i32 %172 to float
  %174 = add nsw i32 %171, 1
  %175 = bitcast i32 %174 to float
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %169, i32 608)
  %177 = select i1 %167, float 0x3EF0000000000000, float 1.000000e+00
  %178 = fneg float %175
  %179 = tail call float @llvm.fma.f32(float %178, float %170, float %169)
  %180 = fcmp ogt float %179, 0.000000e+00
  %181 = fneg float %173
  %182 = tail call float @llvm.fma.f32(float %181, float %170, float %169)
  %183 = fcmp ole float %182, 0.000000e+00
  %184 = select i1 %183, float %173, float %170
  %185 = select i1 %180, float %175, float %184
  %186 = fmul float %177, %185
  %187 = select i1 %176, float %169, float %186
  %188 = sitofp i32 %164 to float
  %189 = fdiv contract float %187, %188
  %190 = fadd contract float %189, %165
  %191 = fptosi float %190 to i32
  store i32 %191, i32 addrspace(1)* %3, align 4, !tbaa !4
  %192 = fsub contract float %165, %189
  %193 = fptosi float %192 to i32
  store i32 %193, i32 addrspace(1)* %4, align 4, !tbaa !4
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
