; ModuleID = '../data/hip_kernels/3007/63/main.cu'
source_filename = "../data/hip_kernels/3007/63/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_atanhiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %163

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fadd float %24, 1.000000e+00
  %26 = fsub float 1.000000e+00, %24
  %27 = fsub float 1.000000e+00, %26
  %28 = fsub float %27, %24
  %29 = tail call float @llvm.amdgcn.rcp.f32(float %26)
  %30 = fmul float %25, %29
  %31 = fmul float %26, %30
  %32 = fneg float %31
  %33 = tail call float @llvm.fma.f32(float %30, float %26, float %32)
  %34 = tail call float @llvm.fma.f32(float %30, float %28, float %33)
  %35 = fadd float %25, -1.000000e+00
  %36 = fsub float %24, %35
  %37 = fadd float %31, %34
  %38 = fsub float %37, %31
  %39 = fsub float %34, %38
  %40 = fsub float %25, %37
  %41 = fsub float %25, %40
  %42 = fsub float %41, %37
  %43 = fsub float %42, %39
  %44 = fadd float %36, %43
  %45 = fadd float %40, %44
  %46 = fmul float %29, %45
  %47 = fadd float %30, %46
  %48 = fsub float %47, %30
  %49 = fsub float %46, %48
  %50 = tail call float @llvm.amdgcn.frexp.mant.f32(float %47)
  %51 = fcmp olt float %50, 0x3FE5555560000000
  %52 = sext i1 %51 to i32
  %53 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %47)
  %54 = add i32 %53, %52
  %55 = sub nsw i32 0, %54
  %56 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %55)
  %57 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %55)
  %58 = fadd float %56, -1.000000e+00
  %59 = fadd float %58, 1.000000e+00
  %60 = fsub float %56, %59
  %61 = fadd float %57, %60
  %62 = fadd float %58, %61
  %63 = fsub float %62, %58
  %64 = fsub float %61, %63
  %65 = fadd float %56, 1.000000e+00
  %66 = fadd float %65, -1.000000e+00
  %67 = fsub float %56, %66
  %68 = fadd float %57, %67
  %69 = fadd float %65, %68
  %70 = fsub float %69, %65
  %71 = fsub float %68, %70
  %72 = tail call float @llvm.amdgcn.rcp.f32(float %69)
  %73 = fmul float %62, %72
  %74 = fmul float %69, %73
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %73, float %69, float %75)
  %77 = tail call float @llvm.fma.f32(float %73, float %71, float %76)
  %78 = fadd float %74, %77
  %79 = fsub float %78, %74
  %80 = fsub float %77, %79
  %81 = fsub float %62, %78
  %82 = fsub float %62, %81
  %83 = fsub float %82, %78
  %84 = fadd float %64, %83
  %85 = fsub float %84, %80
  %86 = fadd float %81, %85
  %87 = fmul float %72, %86
  %88 = fmul float %69, %87
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %87, float %69, float %89)
  %91 = tail call float @llvm.fma.f32(float %87, float %71, float %90)
  %92 = fsub float %86, %81
  %93 = fsub float %85, %92
  %94 = fadd float %88, %91
  %95 = fsub float %94, %88
  %96 = fsub float %91, %95
  %97 = fsub float %86, %94
  %98 = fsub float %86, %97
  %99 = fsub float %98, %94
  %100 = fadd float %93, %99
  %101 = fsub float %100, %96
  %102 = fadd float %97, %101
  %103 = fmul float %72, %102
  %104 = fadd float %73, %87
  %105 = fsub float %104, %73
  %106 = fsub float %87, %105
  %107 = fadd float %106, %103
  %108 = fadd float %104, %107
  %109 = fmul float %108, %108
  %110 = tail call float @llvm.fmuladd.f32(float %109, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %111 = tail call float @llvm.fmuladd.f32(float %109, float %110, float 0x3FE5555B40000000)
  %112 = sitofp i32 %54 to float
  %113 = fmul float %112, 0x3FE62E4300000000
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %112, float 0x3FE62E4300000000, float %114)
  %116 = tail call float @llvm.fma.f32(float %112, float 0xBE205C6100000000, float %115)
  %117 = fsub float %108, %104
  %118 = fsub float %107, %117
  %119 = fadd float %113, %116
  %120 = fsub float %119, %113
  %121 = fsub float %116, %120
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %108, i32 1)
  %123 = tail call float @llvm.amdgcn.ldexp.f32(float %118, i32 1)
  %124 = fmul float %108, %109
  %125 = fmul float %124, %111
  %126 = fadd float %122, %125
  %127 = fsub float %126, %122
  %128 = fsub float %125, %127
  %129 = fadd float %123, %128
  %130 = fadd float %126, %129
  %131 = fsub float %130, %126
  %132 = fsub float %129, %131
  %133 = fadd float %119, %130
  %134 = fsub float %133, %119
  %135 = fsub float %133, %134
  %136 = fsub float %119, %135
  %137 = fsub float %130, %134
  %138 = fadd float %137, %136
  %139 = fadd float %121, %132
  %140 = fsub float %139, %121
  %141 = fsub float %139, %140
  %142 = fsub float %121, %141
  %143 = fsub float %132, %140
  %144 = fadd float %143, %142
  %145 = fadd float %139, %138
  %146 = fadd float %133, %145
  %147 = fsub float %146, %133
  %148 = fsub float %145, %147
  %149 = fadd float %144, %148
  %150 = fadd float %146, %149
  %151 = fmul float %150, 5.000000e-01
  %152 = fcmp olt float %24, 0x3F30000000000000
  %153 = select i1 %152, float %24, float %151
  %154 = fcmp ogt float %24, 1.000000e+00
  %155 = select i1 %154, float 0x7FF8000000000000, float %153
  %156 = fcmp oeq float %24, 1.000000e+00
  %157 = select i1 %156, float 0x7FF0000000000000, float %155
  %158 = tail call float @llvm.copysign.f32(float %157, float %23)
  %159 = mul nsw i32 %16, %6
  %160 = add nsw i32 %159, %5
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %4, i64 %161
  store float %158, float addrspace(1)* %162, align 4, !tbaa !7
  br label %163

163:                                              ; preds = %18, %7
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
