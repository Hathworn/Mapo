; ModuleID = '../data/hip_kernels/3007/58/main.cu'
source_filename = "../data/hip_kernels/3007/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11vector_sinhiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %148

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fadd float %24, 0xBFE62E4300000000
  %26 = fsub float %25, %24
  %27 = fsub float %26, %25
  %28 = fadd float %24, %27
  %29 = fadd float %26, 0x3FE62E4300000000
  %30 = fsub float %28, %29
  %31 = fadd float %30, 0x3E205C6100000000
  %32 = fadd float %25, %31
  %33 = fsub float %32, %25
  %34 = fsub float %31, %33
  %35 = fmul float %32, 0x3FF7154760000000
  %36 = tail call float @llvm.rint.f32(float %35)
  %37 = tail call float @llvm.fmuladd.f32(float %36, float 0xBFE62E4000000000, float %32)
  %38 = fadd float %34, %37
  %39 = fsub float %38, %37
  %40 = fsub float %34, %39
  %41 = fmul float %36, 0x3EB7F78000000000
  %42 = fsub float %38, %41
  %43 = fsub float %38, %42
  %44 = fsub float %43, %41
  %45 = fadd float %40, %44
  %46 = fadd float %42, %45
  %47 = fsub float %46, %42
  %48 = fsub float %45, %47
  %49 = fmul float %36, 0x3DD473DE60000000
  %50 = fsub float %46, %49
  %51 = fsub float %46, %50
  %52 = fsub float %51, %49
  %53 = fadd float %48, %52
  %54 = fadd float %50, %53
  %55 = fsub float %54, %50
  %56 = fsub float %53, %55
  %57 = tail call float @llvm.fmuladd.f32(float %54, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %58 = tail call float @llvm.fmuladd.f32(float %54, float %57, float 0x3FA555B980000000)
  %59 = tail call float @llvm.fmuladd.f32(float %54, float %58, float 0x3FC55548E0000000)
  %60 = tail call float @llvm.fmuladd.f32(float %54, float %59, float 0x3FDFFFFF80000000)
  %61 = fmul float %54, %54
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %54, float %54, float %62)
  %64 = fmul float %56, 2.000000e+00
  %65 = tail call float @llvm.fma.f32(float %54, float %64, float %63)
  %66 = fadd float %61, %65
  %67 = fsub float %66, %61
  %68 = fsub float %65, %67
  %69 = fmul float %60, %66
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %66, float %60, float %70)
  %72 = tail call float @llvm.fma.f32(float %68, float %60, float %71)
  %73 = fadd float %69, %72
  %74 = fsub float %73, %69
  %75 = fsub float %72, %74
  %76 = fadd float %54, %73
  %77 = fsub float %76, %54
  %78 = fsub float %73, %77
  %79 = fadd float %56, %75
  %80 = fadd float %79, %78
  %81 = fadd float %76, %80
  %82 = fsub float %81, %76
  %83 = fsub float %80, %82
  %84 = fadd float %81, 1.000000e+00
  %85 = fadd float %84, -1.000000e+00
  %86 = fsub float %81, %85
  %87 = fadd float %83, %86
  %88 = fadd float %84, %87
  %89 = fsub float %88, %84
  %90 = fsub float %87, %89
  %91 = fptosi float %36 to i32
  %92 = tail call float @llvm.amdgcn.ldexp.f32(float %88, i32 %91)
  %93 = tail call float @llvm.amdgcn.ldexp.f32(float %90, i32 %91)
  %94 = tail call float @llvm.amdgcn.rcp.f32(float %92)
  %95 = fmul float %92, %94
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %94, float %92, float %96)
  %98 = tail call float @llvm.fma.f32(float %94, float %93, float %97)
  %99 = fadd float %95, %98
  %100 = fsub float %99, %95
  %101 = fsub float %98, %100
  %102 = fsub float 1.000000e+00, %99
  %103 = fsub float 1.000000e+00, %102
  %104 = fsub float %103, %99
  %105 = fsub float %104, %101
  %106 = fadd float %102, %105
  %107 = fmul float %94, %106
  %108 = fmul float %92, %107
  %109 = fneg float %108
  %110 = tail call float @llvm.fma.f32(float %107, float %92, float %109)
  %111 = tail call float @llvm.fma.f32(float %107, float %93, float %110)
  %112 = fsub float %106, %102
  %113 = fsub float %105, %112
  %114 = fadd float %108, %111
  %115 = fsub float %114, %108
  %116 = fsub float %111, %115
  %117 = fsub float %106, %114
  %118 = fsub float %106, %117
  %119 = fsub float %118, %114
  %120 = fadd float %113, %119
  %121 = fsub float %120, %116
  %122 = fadd float %117, %121
  %123 = fmul float %94, %122
  %124 = fadd float %94, %107
  %125 = fsub float %124, %94
  %126 = fsub float %107, %125
  %127 = fadd float %126, %123
  %128 = fadd float %124, %127
  %129 = fsub float %128, %124
  %130 = fsub float %127, %129
  %131 = tail call float @llvm.amdgcn.ldexp.f32(float %128, i32 -2)
  %132 = tail call float @llvm.amdgcn.ldexp.f32(float %130, i32 -2)
  %133 = fsub float %92, %131
  %134 = fsub float %92, %133
  %135 = fsub float %134, %131
  %136 = fadd float %93, %135
  %137 = fsub float %136, %132
  %138 = fadd float %133, %137
  %139 = fcmp ogt float %24, 0x40565A9F80000000
  %140 = select i1 %139, float 0x7FF0000000000000, float %138
  %141 = fcmp olt float %24, 0x3F30000000000000
  %142 = select i1 %141, float %24, float %140
  %143 = tail call float @llvm.copysign.f32(float %142, float %23)
  %144 = mul nsw i32 %16, %6
  %145 = add nsw i32 %144, %5
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %4, i64 %146
  store float %143, float addrspace(1)* %147, align 4, !tbaa !7
  br label %148

148:                                              ; preds = %18, %7
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

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
