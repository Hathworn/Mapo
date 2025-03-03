; ModuleID = '../data/hip_kernels/15412/112/main.cu'
source_filename = "../data/hip_kernels/15412/112/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25mult_inverse_array_kernelPKfPfif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %193

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = fcmp contract olt float %18, 0.000000e+00
  %20 = tail call float @llvm.fabs.f32(float %18)
  %21 = tail call float @llvm.amdgcn.frexp.mant.f32(float %20)
  %22 = fcmp olt float %21, 0x3FE5555560000000
  %23 = zext i1 %22 to i32
  %24 = tail call float @llvm.amdgcn.ldexp.f32(float %21, i32 %23)
  %25 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %20)
  %26 = sub nsw i32 %25, %23
  %27 = fadd float %24, -1.000000e+00
  %28 = fadd float %24, 1.000000e+00
  %29 = fadd float %28, -1.000000e+00
  %30 = fsub float %24, %29
  %31 = tail call float @llvm.amdgcn.rcp.f32(float %28)
  %32 = fmul float %27, %31
  %33 = fmul float %28, %32
  %34 = fneg float %33
  %35 = tail call float @llvm.fma.f32(float %32, float %28, float %34)
  %36 = tail call float @llvm.fma.f32(float %32, float %30, float %35)
  %37 = fadd float %33, %36
  %38 = fsub float %37, %33
  %39 = fsub float %36, %38
  %40 = fsub float %27, %37
  %41 = fsub float %27, %40
  %42 = fsub float %41, %37
  %43 = fsub float %42, %39
  %44 = fadd float %40, %43
  %45 = fmul float %31, %44
  %46 = fadd float %32, %45
  %47 = fsub float %46, %32
  %48 = fsub float %45, %47
  %49 = fmul float %46, %46
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %46, float %46, float %50)
  %52 = fmul float %48, 2.000000e+00
  %53 = tail call float @llvm.fma.f32(float %46, float %52, float %51)
  %54 = fadd float %49, %53
  %55 = fsub float %54, %49
  %56 = fsub float %53, %55
  %57 = tail call float @llvm.fmuladd.f32(float %54, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %58 = tail call float @llvm.fmuladd.f32(float %54, float %57, float 0x3FD999BDE0000000)
  %59 = sitofp i32 %26 to float
  %60 = fmul float %59, 0x3FE62E4300000000
  %61 = fneg float %60
  %62 = tail call float @llvm.fma.f32(float %59, float 0x3FE62E4300000000, float %61)
  %63 = tail call float @llvm.fma.f32(float %59, float 0xBE205C6100000000, float %62)
  %64 = fadd float %60, %63
  %65 = fsub float %64, %60
  %66 = fsub float %63, %65
  %67 = tail call float @llvm.amdgcn.ldexp.f32(float %46, i32 1)
  %68 = fmul float %46, %54
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %54, float %46, float %69)
  %71 = tail call float @llvm.fma.f32(float %54, float %48, float %70)
  %72 = tail call float @llvm.fma.f32(float %56, float %46, float %71)
  %73 = fadd float %68, %72
  %74 = fsub float %73, %68
  %75 = fsub float %72, %74
  %76 = fmul float %54, %58
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %54, float %58, float %77)
  %79 = tail call float @llvm.fma.f32(float %56, float %58, float %78)
  %80 = fadd float %76, %79
  %81 = fsub float %80, %76
  %82 = fsub float %79, %81
  %83 = fadd float %80, 0x3FE5555540000000
  %84 = fadd float %83, 0xBFE5555540000000
  %85 = fsub float %80, %84
  %86 = fadd float %82, 0x3E2E720200000000
  %87 = fadd float %86, %85
  %88 = fadd float %83, %87
  %89 = fsub float %88, %83
  %90 = fsub float %87, %89
  %91 = fmul float %73, %88
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %73, float %88, float %92)
  %94 = tail call float @llvm.fma.f32(float %73, float %90, float %93)
  %95 = tail call float @llvm.fma.f32(float %75, float %88, float %94)
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 1)
  %97 = fadd float %91, %95
  %98 = fsub float %97, %91
  %99 = fsub float %95, %98
  %100 = fadd float %67, %97
  %101 = fsub float %100, %67
  %102 = fsub float %97, %101
  %103 = fadd float %96, %99
  %104 = fadd float %103, %102
  %105 = fadd float %100, %104
  %106 = fsub float %105, %100
  %107 = fsub float %104, %106
  %108 = fadd float %64, %105
  %109 = fsub float %108, %64
  %110 = fsub float %108, %109
  %111 = fsub float %64, %110
  %112 = fsub float %105, %109
  %113 = fadd float %112, %111
  %114 = fadd float %66, %107
  %115 = fsub float %114, %66
  %116 = fsub float %114, %115
  %117 = fsub float %66, %116
  %118 = fsub float %107, %115
  %119 = fadd float %118, %117
  %120 = fadd float %114, %113
  %121 = fadd float %108, %120
  %122 = fsub float %121, %108
  %123 = fsub float %120, %122
  %124 = fadd float %119, %123
  %125 = fadd float %121, %124
  %126 = fsub float %125, %121
  %127 = fsub float %124, %126
  %128 = fmul float %125, %3
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %3, float %125, float %129)
  %131 = tail call float @llvm.fma.f32(float %3, float %127, float %130)
  %132 = fadd float %128, %131
  %133 = fsub float %132, %128
  %134 = fsub float %131, %133
  %135 = tail call float @llvm.fabs.f32(float %128) #3
  %136 = fcmp oeq float %135, 0x7FF0000000000000
  %137 = select i1 %136, float %128, float %132
  %138 = tail call float @llvm.fabs.f32(float %137) #3
  %139 = fcmp oeq float %138, 0x7FF0000000000000
  %140 = select i1 %139, float 0.000000e+00, float %134
  %141 = fcmp oeq float %137, 0x40562E4300000000
  %142 = select i1 %141, float 0x3EE0000000000000, float 0.000000e+00
  %143 = fsub float %137, %142
  %144 = fadd float %142, %140
  %145 = fmul float %143, 0x3FF7154760000000
  %146 = tail call float @llvm.rint.f32(float %145)
  %147 = fcmp ogt float %143, 0x40562E4300000000
  %148 = fcmp olt float %143, 0xC059D1DA00000000
  %149 = fneg float %145
  %150 = tail call float @llvm.fma.f32(float %143, float 0x3FF7154760000000, float %149)
  %151 = tail call float @llvm.fma.f32(float %143, float 0x3E54AE0BE0000000, float %150)
  %152 = fsub float %145, %146
  %153 = fadd float %151, %152
  %154 = tail call float @llvm.exp2.f32(float %153)
  %155 = fptosi float %146 to i32
  %156 = tail call float @llvm.amdgcn.ldexp.f32(float %154, i32 %155)
  %157 = select i1 %148, float 0.000000e+00, float %156
  %158 = select i1 %147, float 0x7FF0000000000000, float %157
  %159 = tail call float @llvm.fma.f32(float %158, float %144, float %158)
  %160 = tail call float @llvm.fabs.f32(float %158) #3
  %161 = fcmp oeq float %160, 0x7FF0000000000000
  %162 = select i1 %161, float %158, float %159
  %163 = tail call float @llvm.fabs.f32(float %3)
  %164 = tail call float @llvm.fabs.f32(float %162)
  %165 = fcmp oeq float %163, 0x7FF0000000000000
  br i1 %165, label %166, label %175

166:                                              ; preds = %15
  %167 = fcmp oeq float %20, 1.000000e+00
  %168 = fadd float %20, -1.000000e+00
  %169 = bitcast float %3 to i32
  %170 = bitcast float %168 to i32
  %171 = xor i32 %170, %169
  %172 = icmp sgt i32 %171, -1
  %173 = select i1 %172, float 0x7FF0000000000000, float 0.000000e+00
  %174 = select i1 %167, float %20, float %173
  br label %175

175:                                              ; preds = %15, %166
  %176 = phi float [ %164, %15 ], [ %174, %166 ]
  %177 = fcmp oeq float %20, 0x7FF0000000000000
  %178 = fcmp oeq float %18, 0.000000e+00
  %179 = or i1 %178, %177
  %180 = fcmp olt float %3, 0.000000e+00
  %181 = xor i1 %180, %178
  %182 = select i1 %181, float 0.000000e+00, float 0x7FF0000000000000
  %183 = select i1 %179, float %182, float %176
  %184 = fcmp uno float %20, %3
  %185 = select i1 %184, float 0x7FF8000000000000, float %183
  %186 = fcmp oeq float %20, 1.000000e+00
  %187 = fcmp oeq float %3, 0.000000e+00
  %188 = or i1 %187, %186
  %189 = select i1 %188, float 1.000000e+00, float %185
  %190 = fneg contract float %189
  %191 = select contract i1 %19, float %190, float %189
  %192 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  store float %191, float addrspace(1)* %192, align 4, !tbaa !7
  br label %193

193:                                              ; preds = %175, %4
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
