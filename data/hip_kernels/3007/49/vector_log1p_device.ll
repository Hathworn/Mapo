; ModuleID = '../data/hip_kernels/3007/49/main.cu'
source_filename = "../data/hip_kernels/3007/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_log1piPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %144

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fadd float %23, 1.000000e+00
  %25 = fadd float %24, -1.000000e+00
  %26 = fsub float %25, %24
  %27 = fadd float %26, 1.000000e+00
  %28 = fsub float %23, %25
  %29 = fadd float %28, %27
  %30 = tail call float @llvm.amdgcn.frexp.mant.f32(float %24)
  %31 = fcmp olt float %30, 0x3FE5555560000000
  %32 = sext i1 %31 to i32
  %33 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %24)
  %34 = add i32 %33, %32
  %35 = sub nsw i32 0, %34
  %36 = tail call float @llvm.amdgcn.ldexp.f32(float %24, i32 %35)
  %37 = tail call float @llvm.amdgcn.ldexp.f32(float %29, i32 %35)
  %38 = fadd float %36, -1.000000e+00
  %39 = fadd float %38, 1.000000e+00
  %40 = fsub float %36, %39
  %41 = fadd float %37, %40
  %42 = fadd float %38, %41
  %43 = fsub float %42, %38
  %44 = fsub float %41, %43
  %45 = fadd float %36, 1.000000e+00
  %46 = fadd float %45, -1.000000e+00
  %47 = fsub float %36, %46
  %48 = fadd float %37, %47
  %49 = fadd float %45, %48
  %50 = fsub float %49, %45
  %51 = fsub float %48, %50
  %52 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %53 = fmul float %42, %52
  %54 = fmul float %49, %53
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %53, float %49, float %55)
  %57 = tail call float @llvm.fma.f32(float %53, float %51, float %56)
  %58 = fadd float %54, %57
  %59 = fsub float %58, %54
  %60 = fsub float %57, %59
  %61 = fsub float %42, %58
  %62 = fsub float %42, %61
  %63 = fsub float %62, %58
  %64 = fadd float %44, %63
  %65 = fsub float %64, %60
  %66 = fadd float %61, %65
  %67 = fmul float %52, %66
  %68 = fmul float %49, %67
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %67, float %49, float %69)
  %71 = tail call float @llvm.fma.f32(float %67, float %51, float %70)
  %72 = fsub float %66, %61
  %73 = fsub float %65, %72
  %74 = fadd float %68, %71
  %75 = fsub float %74, %68
  %76 = fsub float %71, %75
  %77 = fsub float %66, %74
  %78 = fsub float %66, %77
  %79 = fsub float %78, %74
  %80 = fadd float %73, %79
  %81 = fsub float %80, %76
  %82 = fadd float %77, %81
  %83 = fmul float %52, %82
  %84 = fadd float %53, %67
  %85 = fsub float %84, %53
  %86 = fsub float %67, %85
  %87 = fadd float %86, %83
  %88 = fadd float %84, %87
  %89 = fmul float %88, %88
  %90 = tail call float @llvm.fmuladd.f32(float %89, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %91 = tail call float @llvm.fmuladd.f32(float %89, float %90, float 0x3FE5555B40000000)
  %92 = sitofp i32 %34 to float
  %93 = fmul float %92, 0x3FE62E4300000000
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %92, float 0x3FE62E4300000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %92, float 0xBE205C6100000000, float %95)
  %97 = fsub float %88, %84
  %98 = fsub float %87, %97
  %99 = fadd float %93, %96
  %100 = fsub float %99, %93
  %101 = fsub float %96, %100
  %102 = tail call float @llvm.amdgcn.ldexp.f32(float %88, i32 1)
  %103 = tail call float @llvm.amdgcn.ldexp.f32(float %98, i32 1)
  %104 = fmul float %88, %89
  %105 = fmul float %104, %91
  %106 = fadd float %102, %105
  %107 = fsub float %106, %102
  %108 = fsub float %105, %107
  %109 = fadd float %103, %108
  %110 = fadd float %106, %109
  %111 = fsub float %110, %106
  %112 = fsub float %109, %111
  %113 = fadd float %99, %110
  %114 = fsub float %113, %99
  %115 = fsub float %113, %114
  %116 = fsub float %99, %115
  %117 = fsub float %110, %114
  %118 = fadd float %117, %116
  %119 = fadd float %101, %112
  %120 = fsub float %119, %101
  %121 = fsub float %119, %120
  %122 = fsub float %101, %121
  %123 = fsub float %112, %120
  %124 = fadd float %123, %122
  %125 = fadd float %119, %118
  %126 = fadd float %113, %125
  %127 = fsub float %126, %113
  %128 = fsub float %125, %127
  %129 = fadd float %124, %128
  %130 = fadd float %126, %129
  %131 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 512)
  %132 = select i1 %131, float %23, float %130
  %133 = fcmp olt float %23, -1.000000e+00
  %134 = select i1 %133, float 0x7FF8000000000000, float %132
  %135 = fcmp oeq float %23, -1.000000e+00
  %136 = select i1 %135, float 0xFFF0000000000000, float %134
  %137 = tail call float @llvm.fabs.f32(float %23)
  %138 = fcmp olt float %137, 0x3E70000000000000
  %139 = select i1 %138, float %23, float %136
  %140 = mul nsw i32 %16, %6
  %141 = add nsw i32 %140, %5
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %4, i64 %142
  store float %139, float addrspace(1)* %143, align 4, !tbaa !7
  br label %144

144:                                              ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
