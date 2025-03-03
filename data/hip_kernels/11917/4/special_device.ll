; ModuleID = '../data/hip_kernels/11917/4/main.cu'
source_filename = "../data/hip_kernels/11917/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7specialPfS_i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %179

14:                                               ; preds = %3
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fpext float %17 to double
  %19 = fadd contract double %18, -2.300000e+00
  %20 = fdiv contract double %18, %19
  %21 = fptrunc double %20 to float
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = tail call float @llvm.amdgcn.frexp.mant.f32(float %22)
  %24 = fcmp olt float %23, 0x3FE5555560000000
  %25 = zext i1 %24 to i32
  %26 = tail call float @llvm.amdgcn.ldexp.f32(float %23, i32 %25)
  %27 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %22)
  %28 = sub nsw i32 %27, %25
  %29 = fadd float %26, -1.000000e+00
  %30 = fadd float %26, 1.000000e+00
  %31 = fadd float %30, -1.000000e+00
  %32 = fsub float %26, %31
  %33 = tail call float @llvm.amdgcn.rcp.f32(float %30)
  %34 = fmul float %29, %33
  %35 = fmul float %30, %34
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %34, float %30, float %36)
  %38 = tail call float @llvm.fma.f32(float %34, float %32, float %37)
  %39 = fadd float %35, %38
  %40 = fsub float %39, %35
  %41 = fsub float %38, %40
  %42 = fsub float %29, %39
  %43 = fsub float %29, %42
  %44 = fsub float %43, %39
  %45 = fsub float %44, %41
  %46 = fadd float %42, %45
  %47 = fmul float %33, %46
  %48 = fadd float %34, %47
  %49 = fsub float %48, %34
  %50 = fsub float %47, %49
  %51 = fmul float %48, %48
  %52 = fneg float %51
  %53 = tail call float @llvm.fma.f32(float %48, float %48, float %52)
  %54 = fmul float %50, 2.000000e+00
  %55 = tail call float @llvm.fma.f32(float %48, float %54, float %53)
  %56 = fadd float %51, %55
  %57 = fsub float %56, %51
  %58 = fsub float %55, %57
  %59 = tail call float @llvm.fmuladd.f32(float %56, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %60 = tail call float @llvm.fmuladd.f32(float %56, float %59, float 0x3FD999BDE0000000)
  %61 = sitofp i32 %28 to float
  %62 = fmul float %61, 0x3FE62E4300000000
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %61, float 0x3FE62E4300000000, float %63)
  %65 = tail call float @llvm.fma.f32(float %61, float 0xBE205C6100000000, float %64)
  %66 = fadd float %62, %65
  %67 = fsub float %66, %62
  %68 = fsub float %65, %67
  %69 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 1)
  %70 = fmul float %48, %56
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %56, float %48, float %71)
  %73 = tail call float @llvm.fma.f32(float %56, float %50, float %72)
  %74 = tail call float @llvm.fma.f32(float %58, float %48, float %73)
  %75 = fadd float %70, %74
  %76 = fsub float %75, %70
  %77 = fsub float %74, %76
  %78 = fmul float %56, %60
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %56, float %60, float %79)
  %81 = tail call float @llvm.fma.f32(float %58, float %60, float %80)
  %82 = fadd float %78, %81
  %83 = fsub float %82, %78
  %84 = fsub float %81, %83
  %85 = fadd float %82, 0x3FE5555540000000
  %86 = fadd float %85, 0xBFE5555540000000
  %87 = fsub float %82, %86
  %88 = fadd float %84, 0x3E2E720200000000
  %89 = fadd float %88, %87
  %90 = fadd float %85, %89
  %91 = fsub float %90, %85
  %92 = fsub float %89, %91
  %93 = fmul float %75, %90
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %75, float %90, float %94)
  %96 = tail call float @llvm.fma.f32(float %75, float %92, float %95)
  %97 = tail call float @llvm.fma.f32(float %77, float %90, float %96)
  %98 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 1)
  %99 = fadd float %93, %97
  %100 = fsub float %99, %93
  %101 = fsub float %97, %100
  %102 = fadd float %69, %99
  %103 = fsub float %102, %69
  %104 = fsub float %99, %103
  %105 = fadd float %98, %101
  %106 = fadd float %105, %104
  %107 = fadd float %102, %106
  %108 = fsub float %107, %102
  %109 = fsub float %106, %108
  %110 = fadd float %66, %107
  %111 = fsub float %110, %66
  %112 = fsub float %110, %111
  %113 = fsub float %66, %112
  %114 = fsub float %107, %111
  %115 = fadd float %114, %113
  %116 = fadd float %68, %109
  %117 = fsub float %116, %68
  %118 = fsub float %116, %117
  %119 = fsub float %68, %118
  %120 = fsub float %109, %117
  %121 = fadd float %120, %119
  %122 = fadd float %116, %115
  %123 = fadd float %110, %122
  %124 = fsub float %123, %110
  %125 = fsub float %122, %124
  %126 = fadd float %121, %125
  %127 = fadd float %123, %126
  %128 = fsub float %127, %123
  %129 = fsub float %126, %128
  %130 = fmul float %127, 3.000000e+00
  %131 = fneg float %130
  %132 = tail call float @llvm.fma.f32(float %127, float 3.000000e+00, float %131)
  %133 = tail call float @llvm.fma.f32(float %129, float 3.000000e+00, float %132)
  %134 = fadd float %130, %133
  %135 = fsub float %134, %130
  %136 = fsub float %133, %135
  %137 = tail call float @llvm.fabs.f32(float %130) #3
  %138 = fcmp oeq float %137, 0x7FF0000000000000
  %139 = select i1 %138, float %130, float %134
  %140 = tail call float @llvm.fabs.f32(float %139) #3
  %141 = fcmp oeq float %140, 0x7FF0000000000000
  %142 = select i1 %141, float 0.000000e+00, float %136
  %143 = fcmp oeq float %139, 0x40562E4300000000
  %144 = select i1 %143, float 0x3EE0000000000000, float 0.000000e+00
  %145 = fsub float %139, %144
  %146 = fadd float %144, %142
  %147 = fmul float %145, 0x3FF7154760000000
  %148 = tail call float @llvm.rint.f32(float %147)
  %149 = fcmp ogt float %145, 0x40562E4300000000
  %150 = fcmp olt float %145, 0xC059D1DA00000000
  %151 = fneg float %147
  %152 = tail call float @llvm.fma.f32(float %145, float 0x3FF7154760000000, float %151)
  %153 = tail call float @llvm.fma.f32(float %145, float 0x3E54AE0BE0000000, float %152)
  %154 = fsub float %147, %148
  %155 = fadd float %153, %154
  %156 = tail call float @llvm.exp2.f32(float %155)
  %157 = fptosi float %148 to i32
  %158 = tail call float @llvm.amdgcn.ldexp.f32(float %156, i32 %157)
  %159 = select i1 %150, float 0.000000e+00, float %158
  %160 = select i1 %149, float 0x7FF0000000000000, float %159
  %161 = tail call float @llvm.fma.f32(float %160, float %146, float %160)
  %162 = tail call float @llvm.fabs.f32(float %160) #3
  %163 = fcmp oeq float %162, 0x7FF0000000000000
  %164 = select i1 %163, float %160, float %161
  %165 = fcmp olt float %21, 0.000000e+00
  %166 = select i1 %165, float -0.000000e+00, float 0.000000e+00
  %167 = tail call float @llvm.copysign.f32(float %164, float %166)
  %168 = fcmp oeq float %22, 0x7FF0000000000000
  %169 = fcmp oeq float %21, 0.000000e+00
  %170 = or i1 %169, %168
  %171 = select i1 %169, float 0.000000e+00, float 0x7FF0000000000000
  %172 = tail call float @llvm.copysign.f32(float %171, float %21)
  %173 = select i1 %170, float %172, float %167
  %174 = fcmp uno float %21, 0.000000e+00
  %175 = select i1 %174, float 0x7FF8000000000000, float %173
  %176 = fcmp oeq float %21, 1.000000e+00
  %177 = select i1 %176, float 1.000000e+00, float %175
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  store float %177, float addrspace(1)* %178, align 4, !tbaa !7
  br label %179

179:                                              ; preds = %14, %3
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
