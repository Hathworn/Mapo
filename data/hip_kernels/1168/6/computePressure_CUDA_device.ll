; ModuleID = '../data/hip_kernels/1168/6/main.cu'
source_filename = "../data/hip_kernels/1168/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20computePressure_CUDAPfS_iff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = shl i32 %6, 8
  %13 = ashr exact i32 %12, 8
  %14 = mul nsw i32 %13, %11
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp ult i32 %16, %2
  br i1 %17, label %18, label %184

18:                                               ; preds = %5
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = fdiv contract float %21, %3
  %23 = tail call float @llvm.fabs.f32(float %22)
  %24 = tail call float @llvm.amdgcn.frexp.mant.f32(float %23)
  %25 = fcmp olt float %24, 0x3FE5555560000000
  %26 = zext i1 %25 to i32
  %27 = tail call float @llvm.amdgcn.ldexp.f32(float %24, i32 %26)
  %28 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %23)
  %29 = sub nsw i32 %28, %26
  %30 = fadd float %27, -1.000000e+00
  %31 = fadd float %27, 1.000000e+00
  %32 = fadd float %31, -1.000000e+00
  %33 = fsub float %27, %32
  %34 = tail call float @llvm.amdgcn.rcp.f32(float %31)
  %35 = fmul float %30, %34
  %36 = fmul float %31, %35
  %37 = fneg float %36
  %38 = tail call float @llvm.fma.f32(float %35, float %31, float %37)
  %39 = tail call float @llvm.fma.f32(float %35, float %33, float %38)
  %40 = fadd float %36, %39
  %41 = fsub float %40, %36
  %42 = fsub float %39, %41
  %43 = fsub float %30, %40
  %44 = fsub float %30, %43
  %45 = fsub float %44, %40
  %46 = fsub float %45, %42
  %47 = fadd float %43, %46
  %48 = fmul float %34, %47
  %49 = fadd float %35, %48
  %50 = fsub float %49, %35
  %51 = fsub float %48, %50
  %52 = fmul float %49, %49
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %49, float %49, float %53)
  %55 = fmul float %51, 2.000000e+00
  %56 = tail call float @llvm.fma.f32(float %49, float %55, float %54)
  %57 = fadd float %52, %56
  %58 = fsub float %57, %52
  %59 = fsub float %56, %58
  %60 = tail call float @llvm.fmuladd.f32(float %57, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %61 = tail call float @llvm.fmuladd.f32(float %57, float %60, float 0x3FD999BDE0000000)
  %62 = sitofp i32 %29 to float
  %63 = fmul float %62, 0x3FE62E4300000000
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %62, float 0x3FE62E4300000000, float %64)
  %66 = tail call float @llvm.fma.f32(float %62, float 0xBE205C6100000000, float %65)
  %67 = fadd float %63, %66
  %68 = fsub float %67, %63
  %69 = fsub float %66, %68
  %70 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 1)
  %71 = fmul float %49, %57
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %57, float %49, float %72)
  %74 = tail call float @llvm.fma.f32(float %57, float %51, float %73)
  %75 = tail call float @llvm.fma.f32(float %59, float %49, float %74)
  %76 = fadd float %71, %75
  %77 = fsub float %76, %71
  %78 = fsub float %75, %77
  %79 = fmul float %57, %61
  %80 = fneg float %79
  %81 = tail call float @llvm.fma.f32(float %57, float %61, float %80)
  %82 = tail call float @llvm.fma.f32(float %59, float %61, float %81)
  %83 = fadd float %79, %82
  %84 = fsub float %83, %79
  %85 = fsub float %82, %84
  %86 = fadd float %83, 0x3FE5555540000000
  %87 = fadd float %86, 0xBFE5555540000000
  %88 = fsub float %83, %87
  %89 = fadd float %85, 0x3E2E720200000000
  %90 = fadd float %89, %88
  %91 = fadd float %86, %90
  %92 = fsub float %91, %86
  %93 = fsub float %90, %92
  %94 = fmul float %76, %91
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %76, float %91, float %95)
  %97 = tail call float @llvm.fma.f32(float %76, float %93, float %96)
  %98 = tail call float @llvm.fma.f32(float %78, float %91, float %97)
  %99 = tail call float @llvm.amdgcn.ldexp.f32(float %51, i32 1)
  %100 = fadd float %94, %98
  %101 = fsub float %100, %94
  %102 = fsub float %98, %101
  %103 = fadd float %70, %100
  %104 = fsub float %103, %70
  %105 = fsub float %100, %104
  %106 = fadd float %99, %102
  %107 = fadd float %106, %105
  %108 = fadd float %103, %107
  %109 = fsub float %108, %103
  %110 = fsub float %107, %109
  %111 = fadd float %67, %108
  %112 = fsub float %111, %67
  %113 = fsub float %111, %112
  %114 = fsub float %67, %113
  %115 = fsub float %108, %112
  %116 = fadd float %115, %114
  %117 = fadd float %69, %110
  %118 = fsub float %117, %69
  %119 = fsub float %117, %118
  %120 = fsub float %69, %119
  %121 = fsub float %110, %118
  %122 = fadd float %121, %120
  %123 = fadd float %117, %116
  %124 = fadd float %111, %123
  %125 = fsub float %124, %111
  %126 = fsub float %123, %125
  %127 = fadd float %122, %126
  %128 = fadd float %124, %127
  %129 = fsub float %128, %124
  %130 = fsub float %127, %129
  %131 = fmul float %128, 7.000000e+00
  %132 = fneg float %131
  %133 = tail call float @llvm.fma.f32(float %128, float 7.000000e+00, float %132)
  %134 = tail call float @llvm.fma.f32(float %130, float 7.000000e+00, float %133)
  %135 = fadd float %131, %134
  %136 = fsub float %135, %131
  %137 = fsub float %134, %136
  %138 = tail call float @llvm.fabs.f32(float %131) #3
  %139 = fcmp oeq float %138, 0x7FF0000000000000
  %140 = select i1 %139, float %131, float %135
  %141 = tail call float @llvm.fabs.f32(float %140) #3
  %142 = fcmp oeq float %141, 0x7FF0000000000000
  %143 = select i1 %142, float 0.000000e+00, float %137
  %144 = fcmp oeq float %140, 0x40562E4300000000
  %145 = select i1 %144, float 0x3EE0000000000000, float 0.000000e+00
  %146 = fsub float %140, %145
  %147 = fadd float %145, %143
  %148 = fmul float %146, 0x3FF7154760000000
  %149 = tail call float @llvm.rint.f32(float %148)
  %150 = fcmp ogt float %146, 0x40562E4300000000
  %151 = fcmp olt float %146, 0xC059D1DA00000000
  %152 = fneg float %148
  %153 = tail call float @llvm.fma.f32(float %146, float 0x3FF7154760000000, float %152)
  %154 = tail call float @llvm.fma.f32(float %146, float 0x3E54AE0BE0000000, float %153)
  %155 = fsub float %148, %149
  %156 = fadd float %154, %155
  %157 = tail call float @llvm.exp2.f32(float %156)
  %158 = fptosi float %149 to i32
  %159 = tail call float @llvm.amdgcn.ldexp.f32(float %157, i32 %158)
  %160 = select i1 %151, float 0.000000e+00, float %159
  %161 = select i1 %150, float 0x7FF0000000000000, float %160
  %162 = tail call float @llvm.fma.f32(float %161, float %147, float %161)
  %163 = tail call float @llvm.fabs.f32(float %161) #3
  %164 = fcmp oeq float %163, 0x7FF0000000000000
  %165 = select i1 %164, float %161, float %162
  %166 = fcmp olt float %22, 0.000000e+00
  %167 = select i1 %166, float -0.000000e+00, float 0.000000e+00
  %168 = tail call float @llvm.copysign.f32(float %165, float %167)
  %169 = fcmp oeq float %23, 0x7FF0000000000000
  %170 = fcmp oeq float %22, 0.000000e+00
  %171 = or i1 %170, %169
  %172 = select i1 %170, float 0.000000e+00, float 0x7FF0000000000000
  %173 = tail call float @llvm.copysign.f32(float %172, float %22)
  %174 = select i1 %171, float %173, float %168
  %175 = fcmp uno float %22, 0.000000e+00
  %176 = fcmp oeq float %22, 1.000000e+00
  %177 = fadd contract float %174, -1.000000e+00
  %178 = select i1 %175, float 0x7FF8000000000000, float %177
  %179 = select i1 %176, float 0.000000e+00, float %178
  %180 = fmul contract float %179, %4
  %181 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %182 = fcmp contract olt float %180, 0.000000e+00
  %183 = select i1 %182, float 0.000000e+00, float %180
  store float %183, float addrspace(1)* %181, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %5, %18
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
