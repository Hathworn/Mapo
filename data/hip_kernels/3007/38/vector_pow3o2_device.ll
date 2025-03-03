; ModuleID = '../data/hip_kernels/3007/38/main.cu'
source_filename = "../data/hip_kernels/3007/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13vector_pow3o2iPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %182

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = tail call float @llvm.amdgcn.frexp.mant.f32(float %24)
  %26 = fcmp olt float %25, 0x3FE5555560000000
  %27 = zext i1 %26 to i32
  %28 = tail call float @llvm.amdgcn.ldexp.f32(float %25, i32 %27)
  %29 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %24)
  %30 = sub nsw i32 %29, %27
  %31 = fadd float %28, -1.000000e+00
  %32 = fadd float %28, 1.000000e+00
  %33 = fadd float %32, -1.000000e+00
  %34 = fsub float %28, %33
  %35 = tail call float @llvm.amdgcn.rcp.f32(float %32)
  %36 = fmul float %31, %35
  %37 = fmul float %32, %36
  %38 = fneg float %37
  %39 = tail call float @llvm.fma.f32(float %36, float %32, float %38)
  %40 = tail call float @llvm.fma.f32(float %36, float %34, float %39)
  %41 = fadd float %37, %40
  %42 = fsub float %41, %37
  %43 = fsub float %40, %42
  %44 = fsub float %31, %41
  %45 = fsub float %31, %44
  %46 = fsub float %45, %41
  %47 = fsub float %46, %43
  %48 = fadd float %44, %47
  %49 = fmul float %35, %48
  %50 = fadd float %36, %49
  %51 = fsub float %50, %36
  %52 = fsub float %49, %51
  %53 = fmul float %50, %50
  %54 = fneg float %53
  %55 = tail call float @llvm.fma.f32(float %50, float %50, float %54)
  %56 = fmul float %52, 2.000000e+00
  %57 = tail call float @llvm.fma.f32(float %50, float %56, float %55)
  %58 = fadd float %53, %57
  %59 = fsub float %58, %53
  %60 = fsub float %57, %59
  %61 = tail call float @llvm.fmuladd.f32(float %58, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %62 = tail call float @llvm.fmuladd.f32(float %58, float %61, float 0x3FD999BDE0000000)
  %63 = sitofp i32 %30 to float
  %64 = fmul float %63, 0x3FE62E4300000000
  %65 = fneg float %64
  %66 = tail call float @llvm.fma.f32(float %63, float 0x3FE62E4300000000, float %65)
  %67 = tail call float @llvm.fma.f32(float %63, float 0xBE205C6100000000, float %66)
  %68 = fadd float %64, %67
  %69 = fsub float %68, %64
  %70 = fsub float %67, %69
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 1)
  %72 = fmul float %50, %58
  %73 = fneg float %72
  %74 = tail call float @llvm.fma.f32(float %58, float %50, float %73)
  %75 = tail call float @llvm.fma.f32(float %58, float %52, float %74)
  %76 = tail call float @llvm.fma.f32(float %60, float %50, float %75)
  %77 = fadd float %72, %76
  %78 = fsub float %77, %72
  %79 = fsub float %76, %78
  %80 = fmul float %58, %62
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %58, float %62, float %81)
  %83 = tail call float @llvm.fma.f32(float %60, float %62, float %82)
  %84 = fadd float %80, %83
  %85 = fsub float %84, %80
  %86 = fsub float %83, %85
  %87 = fadd float %84, 0x3FE5555540000000
  %88 = fadd float %87, 0xBFE5555540000000
  %89 = fsub float %84, %88
  %90 = fadd float %86, 0x3E2E720200000000
  %91 = fadd float %90, %89
  %92 = fadd float %87, %91
  %93 = fsub float %92, %87
  %94 = fsub float %91, %93
  %95 = fmul float %77, %92
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %77, float %92, float %96)
  %98 = tail call float @llvm.fma.f32(float %77, float %94, float %97)
  %99 = tail call float @llvm.fma.f32(float %79, float %92, float %98)
  %100 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 1)
  %101 = fadd float %95, %99
  %102 = fsub float %101, %95
  %103 = fsub float %99, %102
  %104 = fadd float %71, %101
  %105 = fsub float %104, %71
  %106 = fsub float %101, %105
  %107 = fadd float %100, %103
  %108 = fadd float %107, %106
  %109 = fadd float %104, %108
  %110 = fsub float %109, %104
  %111 = fsub float %108, %110
  %112 = fadd float %68, %109
  %113 = fsub float %112, %68
  %114 = fsub float %112, %113
  %115 = fsub float %68, %114
  %116 = fsub float %109, %113
  %117 = fadd float %116, %115
  %118 = fadd float %70, %111
  %119 = fsub float %118, %70
  %120 = fsub float %118, %119
  %121 = fsub float %70, %120
  %122 = fsub float %111, %119
  %123 = fadd float %122, %121
  %124 = fadd float %118, %117
  %125 = fadd float %112, %124
  %126 = fsub float %125, %112
  %127 = fsub float %124, %126
  %128 = fadd float %123, %127
  %129 = fadd float %125, %128
  %130 = fsub float %129, %125
  %131 = fsub float %128, %130
  %132 = fmul float %129, 1.500000e+00
  %133 = fneg float %132
  %134 = tail call float @llvm.fma.f32(float %129, float 1.500000e+00, float %133)
  %135 = tail call float @llvm.fma.f32(float %131, float 1.500000e+00, float %134)
  %136 = fadd float %132, %135
  %137 = fsub float %136, %132
  %138 = fsub float %135, %137
  %139 = tail call float @llvm.fabs.f32(float %132) #3
  %140 = fcmp oeq float %139, 0x7FF0000000000000
  %141 = select i1 %140, float %132, float %136
  %142 = tail call float @llvm.fabs.f32(float %141) #3
  %143 = fcmp oeq float %142, 0x7FF0000000000000
  %144 = select i1 %143, float 0.000000e+00, float %138
  %145 = fcmp oeq float %141, 0x40562E4300000000
  %146 = select i1 %145, float 0x3EE0000000000000, float 0.000000e+00
  %147 = fsub float %141, %146
  %148 = fadd float %146, %144
  %149 = fmul float %147, 0x3FF7154760000000
  %150 = tail call float @llvm.rint.f32(float %149)
  %151 = fcmp ogt float %147, 0x40562E4300000000
  %152 = fcmp olt float %147, 0xC059D1DA00000000
  %153 = fneg float %149
  %154 = tail call float @llvm.fma.f32(float %147, float 0x3FF7154760000000, float %153)
  %155 = tail call float @llvm.fma.f32(float %147, float 0x3E54AE0BE0000000, float %154)
  %156 = fsub float %149, %150
  %157 = fadd float %155, %156
  %158 = tail call float @llvm.exp2.f32(float %157)
  %159 = fptosi float %150 to i32
  %160 = tail call float @llvm.amdgcn.ldexp.f32(float %158, i32 %159)
  %161 = select i1 %152, float 0.000000e+00, float %160
  %162 = select i1 %151, float 0x7FF0000000000000, float %161
  %163 = tail call float @llvm.fma.f32(float %162, float %148, float %162)
  %164 = tail call float @llvm.fabs.f32(float %162) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float %162, float %163
  %167 = fcmp uge float %23, 0.000000e+00
  %168 = tail call float @llvm.fabs.f32(float %166)
  %169 = select i1 %167, float %168, float 0x7FF8000000000000
  %170 = fcmp oeq float %24, 0x7FF0000000000000
  %171 = fcmp oeq float %23, 0.000000e+00
  %172 = select i1 %170, float 0x7FF0000000000000, float %169
  %173 = select i1 %171, float 0.000000e+00, float %172
  %174 = fcmp uno float %23, 0.000000e+00
  %175 = select i1 %174, float 0x7FF8000000000000, float %173
  %176 = fcmp oeq float %23, 1.000000e+00
  %177 = select i1 %176, float 1.000000e+00, float %175
  %178 = mul nsw i32 %16, %6
  %179 = add nsw i32 %178, %5
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %4, i64 %180
  store float %177, float addrspace(1)* %181, align 4, !tbaa !7
  br label %182

182:                                              ; preds = %18, %7
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
