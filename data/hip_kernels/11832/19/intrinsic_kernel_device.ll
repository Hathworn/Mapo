; ModuleID = '../data/hip_kernels/11832/19/main.cu'
source_filename = "../data/hip_kernels/11832/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16intrinsic_kernelfPfi(float %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = sub nsw i32 0, %11
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %171

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %169

16:                                               ; preds = %14
  %17 = tail call float @llvm.fabs.f32(float %0)
  %18 = tail call float @llvm.amdgcn.frexp.mant.f32(float %17)
  %19 = fcmp olt float %18, 0x3FE5555560000000
  %20 = zext i1 %19 to i32
  %21 = tail call float @llvm.amdgcn.ldexp.f32(float %18, i32 %20)
  %22 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %17)
  %23 = sub nsw i32 %22, %20
  %24 = fadd float %21, -1.000000e+00
  %25 = fadd float %21, 1.000000e+00
  %26 = fadd float %25, -1.000000e+00
  %27 = fsub float %21, %26
  %28 = tail call float @llvm.amdgcn.rcp.f32(float %25)
  %29 = fmul float %24, %28
  %30 = fmul float %25, %29
  %31 = fneg float %30
  %32 = tail call float @llvm.fma.f32(float %29, float %25, float %31)
  %33 = tail call float @llvm.fma.f32(float %29, float %27, float %32)
  %34 = fadd float %30, %33
  %35 = fsub float %34, %30
  %36 = fsub float %33, %35
  %37 = fsub float %24, %34
  %38 = fsub float %24, %37
  %39 = fsub float %38, %34
  %40 = fsub float %39, %36
  %41 = fadd float %37, %40
  %42 = fmul float %28, %41
  %43 = fadd float %29, %42
  %44 = fsub float %43, %29
  %45 = fsub float %42, %44
  %46 = fmul float %43, %43
  %47 = fneg float %46
  %48 = tail call float @llvm.fma.f32(float %43, float %43, float %47)
  %49 = fmul float %45, 2.000000e+00
  %50 = tail call float @llvm.fma.f32(float %43, float %49, float %48)
  %51 = fadd float %46, %50
  %52 = fsub float %51, %46
  %53 = fsub float %50, %52
  %54 = tail call float @llvm.fmuladd.f32(float %51, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %55 = tail call float @llvm.fmuladd.f32(float %51, float %54, float 0x3FD999BDE0000000)
  %56 = sitofp i32 %23 to float
  %57 = fmul float %56, 0x3FE62E4300000000
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %56, float 0x3FE62E4300000000, float %58)
  %60 = tail call float @llvm.fma.f32(float %56, float 0xBE205C6100000000, float %59)
  %61 = fadd float %57, %60
  %62 = fsub float %61, %57
  %63 = fsub float %60, %62
  %64 = tail call float @llvm.amdgcn.ldexp.f32(float %43, i32 1)
  %65 = fmul float %43, %51
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %51, float %43, float %66)
  %68 = tail call float @llvm.fma.f32(float %51, float %45, float %67)
  %69 = tail call float @llvm.fma.f32(float %53, float %43, float %68)
  %70 = fadd float %65, %69
  %71 = fsub float %70, %65
  %72 = fsub float %69, %71
  %73 = fmul float %51, %55
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %51, float %55, float %74)
  %76 = tail call float @llvm.fma.f32(float %53, float %55, float %75)
  %77 = fadd float %73, %76
  %78 = fsub float %77, %73
  %79 = fsub float %76, %78
  %80 = fadd float %77, 0x3FE5555540000000
  %81 = fadd float %80, 0xBFE5555540000000
  %82 = fsub float %77, %81
  %83 = fadd float %79, 0x3E2E720200000000
  %84 = fadd float %83, %82
  %85 = fadd float %80, %84
  %86 = fsub float %85, %80
  %87 = fsub float %84, %86
  %88 = fmul float %70, %85
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %70, float %85, float %89)
  %91 = tail call float @llvm.fma.f32(float %70, float %87, float %90)
  %92 = tail call float @llvm.fma.f32(float %72, float %85, float %91)
  %93 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 1)
  %94 = fadd float %88, %92
  %95 = fsub float %94, %88
  %96 = fsub float %92, %95
  %97 = fadd float %64, %94
  %98 = fsub float %97, %64
  %99 = fsub float %94, %98
  %100 = fadd float %93, %96
  %101 = fadd float %100, %99
  %102 = fadd float %97, %101
  %103 = fsub float %102, %97
  %104 = fsub float %101, %103
  %105 = fadd float %61, %102
  %106 = fsub float %105, %61
  %107 = fsub float %105, %106
  %108 = fsub float %61, %107
  %109 = fsub float %102, %106
  %110 = fadd float %109, %108
  %111 = fadd float %63, %104
  %112 = fsub float %111, %63
  %113 = fsub float %111, %112
  %114 = fsub float %63, %113
  %115 = fsub float %104, %112
  %116 = fadd float %115, %114
  %117 = fadd float %111, %110
  %118 = fadd float %105, %117
  %119 = fsub float %118, %105
  %120 = fsub float %117, %119
  %121 = fadd float %116, %120
  %122 = fadd float %118, %121
  %123 = fsub float %122, %118
  %124 = fsub float %121, %123
  %125 = fmul float %122, 2.000000e+00
  %126 = fneg float %125
  %127 = tail call float @llvm.fma.f32(float %122, float 2.000000e+00, float %126)
  %128 = tail call float @llvm.fma.f32(float %124, float 2.000000e+00, float %127)
  %129 = fadd float %125, %128
  %130 = fsub float %129, %125
  %131 = fsub float %128, %130
  %132 = tail call float @llvm.fabs.f32(float %125) #3
  %133 = fcmp oeq float %132, 0x7FF0000000000000
  %134 = select i1 %133, float %125, float %129
  %135 = tail call float @llvm.fabs.f32(float %134) #3
  %136 = fcmp oeq float %135, 0x7FF0000000000000
  %137 = select i1 %136, float 0.000000e+00, float %131
  %138 = fcmp oeq float %134, 0x40562E4300000000
  %139 = select i1 %138, float 0x3EE0000000000000, float 0.000000e+00
  %140 = fsub float %134, %139
  %141 = fadd float %139, %137
  %142 = fmul float %140, 0x3FF7154760000000
  %143 = tail call float @llvm.rint.f32(float %142)
  %144 = fcmp ogt float %140, 0x40562E4300000000
  %145 = fcmp olt float %140, 0xC059D1DA00000000
  %146 = fneg float %142
  %147 = tail call float @llvm.fma.f32(float %140, float 0x3FF7154760000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %140, float 0x3E54AE0BE0000000, float %147)
  %149 = fsub float %142, %143
  %150 = fadd float %148, %149
  %151 = tail call float @llvm.exp2.f32(float %150)
  %152 = fptosi float %143 to i32
  %153 = tail call float @llvm.amdgcn.ldexp.f32(float %151, i32 %152)
  %154 = select i1 %145, float 0.000000e+00, float %153
  %155 = select i1 %144, float 0x7FF0000000000000, float %154
  %156 = tail call float @llvm.fma.f32(float %155, float %141, float %155)
  %157 = tail call float @llvm.fabs.f32(float %155) #3
  %158 = fcmp oeq float %157, 0x7FF0000000000000
  %159 = select i1 %158, float %155, float %156
  %160 = tail call float @llvm.fabs.f32(float %159)
  %161 = fcmp oeq float %17, 0x7FF0000000000000
  %162 = fcmp oeq float %0, 0.000000e+00
  %163 = select i1 %161, float 0x7FF0000000000000, float %160
  %164 = select i1 %162, float 0.000000e+00, float %163
  %165 = fcmp uno float %0, 0.000000e+00
  %166 = select i1 %165, float 0x7FF8000000000000, float %164
  %167 = fcmp oeq float %0, 1.000000e+00
  %168 = select i1 %167, float 1.000000e+00, float %166
  br label %169

169:                                              ; preds = %16, %14
  %170 = phi float [ %168, %16 ], [ undef, %14 ]
  store float %170, float addrspace(1)* %1, align 4, !tbaa !7
  br label %171

171:                                              ; preds = %169, %3
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
