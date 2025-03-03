; ModuleID = '../data/hip_kernels/3531/4/main.cu'
source_filename = "../data/hip_kernels/3531/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3powPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = load float, float addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %5 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %6 = tail call float @llvm.fabs.f32(float %4)
  %7 = tail call float @llvm.amdgcn.frexp.mant.f32(float %6)
  %8 = fcmp olt float %7, 0x3FE5555560000000
  %9 = zext i1 %8 to i32
  %10 = tail call float @llvm.amdgcn.ldexp.f32(float %7, i32 %9)
  %11 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %6)
  %12 = sub nsw i32 %11, %9
  %13 = fadd float %10, -1.000000e+00
  %14 = fadd float %10, 1.000000e+00
  %15 = fadd float %14, -1.000000e+00
  %16 = fsub float %10, %15
  %17 = tail call float @llvm.amdgcn.rcp.f32(float %14)
  %18 = fmul float %13, %17
  %19 = fmul float %14, %18
  %20 = fneg float %19
  %21 = tail call float @llvm.fma.f32(float %18, float %14, float %20)
  %22 = tail call float @llvm.fma.f32(float %18, float %16, float %21)
  %23 = fadd float %19, %22
  %24 = fsub float %23, %19
  %25 = fsub float %22, %24
  %26 = fsub float %13, %23
  %27 = fsub float %13, %26
  %28 = fsub float %27, %23
  %29 = fsub float %28, %25
  %30 = fadd float %26, %29
  %31 = fmul float %17, %30
  %32 = fadd float %18, %31
  %33 = fsub float %32, %18
  %34 = fsub float %31, %33
  %35 = fmul float %32, %32
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %32, float %32, float %36)
  %38 = fmul float %34, 2.000000e+00
  %39 = tail call float @llvm.fma.f32(float %32, float %38, float %37)
  %40 = fadd float %35, %39
  %41 = fsub float %40, %35
  %42 = fsub float %39, %41
  %43 = tail call float @llvm.fmuladd.f32(float %40, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %44 = tail call float @llvm.fmuladd.f32(float %40, float %43, float 0x3FD999BDE0000000)
  %45 = sitofp i32 %12 to float
  %46 = fmul float %45, 0x3FE62E4300000000
  %47 = fneg float %46
  %48 = tail call float @llvm.fma.f32(float %45, float 0x3FE62E4300000000, float %47)
  %49 = tail call float @llvm.fma.f32(float %45, float 0xBE205C6100000000, float %48)
  %50 = fadd float %46, %49
  %51 = fsub float %50, %46
  %52 = fsub float %49, %51
  %53 = tail call float @llvm.amdgcn.ldexp.f32(float %32, i32 1)
  %54 = fmul float %32, %40
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %40, float %32, float %55)
  %57 = tail call float @llvm.fma.f32(float %40, float %34, float %56)
  %58 = tail call float @llvm.fma.f32(float %42, float %32, float %57)
  %59 = fadd float %54, %58
  %60 = fsub float %59, %54
  %61 = fsub float %58, %60
  %62 = fmul float %40, %44
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %40, float %44, float %63)
  %65 = tail call float @llvm.fma.f32(float %42, float %44, float %64)
  %66 = fadd float %62, %65
  %67 = fsub float %66, %62
  %68 = fsub float %65, %67
  %69 = fadd float %66, 0x3FE5555540000000
  %70 = fadd float %69, 0xBFE5555540000000
  %71 = fsub float %66, %70
  %72 = fadd float %68, 0x3E2E720200000000
  %73 = fadd float %72, %71
  %74 = fadd float %69, %73
  %75 = fsub float %74, %69
  %76 = fsub float %73, %75
  %77 = fmul float %59, %74
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %59, float %74, float %78)
  %80 = tail call float @llvm.fma.f32(float %59, float %76, float %79)
  %81 = tail call float @llvm.fma.f32(float %61, float %74, float %80)
  %82 = tail call float @llvm.amdgcn.ldexp.f32(float %34, i32 1)
  %83 = fadd float %77, %81
  %84 = fsub float %83, %77
  %85 = fsub float %81, %84
  %86 = fadd float %53, %83
  %87 = fsub float %86, %53
  %88 = fsub float %83, %87
  %89 = fadd float %82, %85
  %90 = fadd float %89, %88
  %91 = fadd float %86, %90
  %92 = fsub float %91, %86
  %93 = fsub float %90, %92
  %94 = fadd float %50, %91
  %95 = fsub float %94, %50
  %96 = fsub float %94, %95
  %97 = fsub float %50, %96
  %98 = fsub float %91, %95
  %99 = fadd float %98, %97
  %100 = fadd float %52, %93
  %101 = fsub float %100, %52
  %102 = fsub float %100, %101
  %103 = fsub float %52, %102
  %104 = fsub float %93, %101
  %105 = fadd float %104, %103
  %106 = fadd float %100, %99
  %107 = fadd float %94, %106
  %108 = fsub float %107, %94
  %109 = fsub float %106, %108
  %110 = fadd float %105, %109
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = fmul float %5, %111
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %5, float %111, float %115)
  %117 = tail call float @llvm.fma.f32(float %5, float %113, float %116)
  %118 = fadd float %114, %117
  %119 = fsub float %118, %114
  %120 = fsub float %117, %119
  %121 = tail call float @llvm.fabs.f32(float %114) #3
  %122 = fcmp oeq float %121, 0x7FF0000000000000
  %123 = select i1 %122, float %114, float %118
  %124 = tail call float @llvm.fabs.f32(float %123) #3
  %125 = fcmp oeq float %124, 0x7FF0000000000000
  %126 = select i1 %125, float 0.000000e+00, float %120
  %127 = fcmp oeq float %123, 0x40562E4300000000
  %128 = select i1 %127, float 0x3EE0000000000000, float 0.000000e+00
  %129 = fsub float %123, %128
  %130 = fadd float %128, %126
  %131 = fmul float %129, 0x3FF7154760000000
  %132 = tail call float @llvm.rint.f32(float %131)
  %133 = fcmp ogt float %129, 0x40562E4300000000
  %134 = fcmp olt float %129, 0xC059D1DA00000000
  %135 = fneg float %131
  %136 = tail call float @llvm.fma.f32(float %129, float 0x3FF7154760000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %129, float 0x3E54AE0BE0000000, float %136)
  %138 = fsub float %131, %132
  %139 = fadd float %137, %138
  %140 = tail call float @llvm.exp2.f32(float %139)
  %141 = fptosi float %132 to i32
  %142 = tail call float @llvm.amdgcn.ldexp.f32(float %140, i32 %141)
  %143 = select i1 %134, float 0.000000e+00, float %142
  %144 = select i1 %133, float 0x7FF0000000000000, float %143
  %145 = tail call float @llvm.fma.f32(float %144, float %130, float %144)
  %146 = tail call float @llvm.fabs.f32(float %144) #3
  %147 = fcmp oeq float %146, 0x7FF0000000000000
  %148 = select i1 %147, float %144, float %145
  %149 = tail call float @llvm.fabs.f32(float %5)
  %150 = tail call float @llvm.trunc.f32(float %149)
  %151 = fcmp oeq float %149, %150
  %152 = zext i1 %151 to i32
  %153 = fmul float %150, 5.000000e-01
  %154 = tail call float @llvm.amdgcn.fract.f32(float %153)
  %155 = tail call i1 @llvm.amdgcn.class.f32(float %153, i32 516)
  %156 = select i1 %155, float 0.000000e+00, float %154
  %157 = fcmp oeq float %156, 0.000000e+00
  %158 = and i1 %151, %157
  %159 = zext i1 %158 to i32
  %160 = add nuw nsw i32 %159, %152
  %161 = icmp eq i32 %160, 1
  %162 = fcmp olt float %4, 0.000000e+00
  %163 = and i1 %162, %161
  %164 = select i1 %163, float -0.000000e+00, float 0.000000e+00
  %165 = tail call float @llvm.copysign.f32(float %148, float %164)
  %166 = fcmp uge float %4, 0.000000e+00
  %167 = icmp ne i32 %160, 0
  %168 = select i1 %166, i1 true, i1 %167
  %169 = select i1 %168, float %165, float 0x7FF8000000000000
  %170 = fcmp oeq float %149, 0x7FF0000000000000
  br i1 %170, label %171, label %180

171:                                              ; preds = %3
  %172 = fcmp oeq float %6, 1.000000e+00
  %173 = fadd float %6, -1.000000e+00
  %174 = bitcast float %5 to i32
  %175 = bitcast float %173 to i32
  %176 = xor i32 %175, %174
  %177 = icmp sgt i32 %176, -1
  %178 = select i1 %177, float 0x7FF0000000000000, float 0.000000e+00
  %179 = select i1 %172, float %6, float %178
  br label %180

180:                                              ; preds = %3, %171
  %181 = phi float [ %169, %3 ], [ %179, %171 ]
  %182 = fcmp oeq float %6, 0x7FF0000000000000
  %183 = fcmp oeq float %4, 0.000000e+00
  %184 = or i1 %183, %182
  %185 = fcmp olt float %5, 0.000000e+00
  %186 = xor i1 %183, %185
  %187 = select i1 %186, float 0.000000e+00, float 0x7FF0000000000000
  %188 = select i1 %161, float %4, float 0.000000e+00
  %189 = tail call float @llvm.copysign.f32(float %187, float %188)
  %190 = select i1 %184, float %189, float %181
  %191 = fcmp uno float %4, %5
  %192 = select i1 %191, float 0x7FF8000000000000, float %190
  %193 = fcmp oeq float %4, 1.000000e+00
  %194 = fcmp oeq float %5, 0.000000e+00
  %195 = or i1 %193, %194
  %196 = select i1 %195, float 1.000000e+00, float %192
  store float %196, float addrspace(1)* %2, align 4, !tbaa !4
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
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
