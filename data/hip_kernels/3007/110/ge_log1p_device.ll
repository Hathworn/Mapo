; ModuleID = '../data/hip_kernels/3007/110/main.cu'
source_filename = "../data/hip_kernels/3007/110/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_log1piiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %157

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd float %35, 1.000000e+00
  %37 = fadd float %36, -1.000000e+00
  %38 = fsub float %37, %36
  %39 = fadd float %38, 1.000000e+00
  %40 = fsub float %35, %37
  %41 = fadd float %40, %39
  %42 = tail call float @llvm.amdgcn.frexp.mant.f32(float %36)
  %43 = fcmp olt float %42, 0x3FE5555560000000
  %44 = sext i1 %43 to i32
  %45 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %36)
  %46 = add i32 %45, %44
  %47 = sub nsw i32 0, %46
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %36, i32 %47)
  %49 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %47)
  %50 = fadd float %48, -1.000000e+00
  %51 = fadd float %50, 1.000000e+00
  %52 = fsub float %48, %51
  %53 = fadd float %49, %52
  %54 = fadd float %50, %53
  %55 = fsub float %54, %50
  %56 = fsub float %53, %55
  %57 = fadd float %48, 1.000000e+00
  %58 = fadd float %57, -1.000000e+00
  %59 = fsub float %48, %58
  %60 = fadd float %49, %59
  %61 = fadd float %57, %60
  %62 = fsub float %61, %57
  %63 = fsub float %60, %62
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %61)
  %65 = fmul float %54, %64
  %66 = fmul float %61, %65
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %65, float %61, float %67)
  %69 = tail call float @llvm.fma.f32(float %65, float %63, float %68)
  %70 = fadd float %66, %69
  %71 = fsub float %70, %66
  %72 = fsub float %69, %71
  %73 = fsub float %54, %70
  %74 = fsub float %54, %73
  %75 = fsub float %74, %70
  %76 = fadd float %56, %75
  %77 = fsub float %76, %72
  %78 = fadd float %73, %77
  %79 = fmul float %64, %78
  %80 = fmul float %61, %79
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %79, float %61, float %81)
  %83 = tail call float @llvm.fma.f32(float %79, float %63, float %82)
  %84 = fsub float %78, %73
  %85 = fsub float %77, %84
  %86 = fadd float %80, %83
  %87 = fsub float %86, %80
  %88 = fsub float %83, %87
  %89 = fsub float %78, %86
  %90 = fsub float %78, %89
  %91 = fsub float %90, %86
  %92 = fadd float %85, %91
  %93 = fsub float %92, %88
  %94 = fadd float %89, %93
  %95 = fmul float %64, %94
  %96 = fadd float %65, %79
  %97 = fsub float %96, %65
  %98 = fsub float %79, %97
  %99 = fadd float %98, %95
  %100 = fadd float %96, %99
  %101 = fmul float %100, %100
  %102 = tail call float @llvm.fmuladd.f32(float %101, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %103 = tail call float @llvm.fmuladd.f32(float %101, float %102, float 0x3FE5555B40000000)
  %104 = sitofp i32 %46 to float
  %105 = fmul float %104, 0x3FE62E4300000000
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %104, float 0x3FE62E4300000000, float %106)
  %108 = tail call float @llvm.fma.f32(float %104, float 0xBE205C6100000000, float %107)
  %109 = fsub float %100, %96
  %110 = fsub float %99, %109
  %111 = fadd float %105, %108
  %112 = fsub float %111, %105
  %113 = fsub float %108, %112
  %114 = tail call float @llvm.amdgcn.ldexp.f32(float %100, i32 1)
  %115 = tail call float @llvm.amdgcn.ldexp.f32(float %110, i32 1)
  %116 = fmul float %100, %101
  %117 = fmul float %116, %103
  %118 = fadd float %114, %117
  %119 = fsub float %118, %114
  %120 = fsub float %117, %119
  %121 = fadd float %115, %120
  %122 = fadd float %118, %121
  %123 = fsub float %122, %118
  %124 = fsub float %121, %123
  %125 = fadd float %111, %122
  %126 = fsub float %125, %111
  %127 = fsub float %125, %126
  %128 = fsub float %111, %127
  %129 = fsub float %122, %126
  %130 = fadd float %129, %128
  %131 = fadd float %113, %124
  %132 = fsub float %131, %113
  %133 = fsub float %131, %132
  %134 = fsub float %113, %133
  %135 = fsub float %124, %132
  %136 = fadd float %135, %134
  %137 = fadd float %131, %130
  %138 = fadd float %125, %137
  %139 = fsub float %138, %125
  %140 = fsub float %137, %139
  %141 = fadd float %136, %140
  %142 = fadd float %138, %141
  %143 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 512)
  %144 = select i1 %143, float %35, float %142
  %145 = fcmp olt float %35, -1.000000e+00
  %146 = select i1 %145, float 0x7FF8000000000000, float %144
  %147 = fcmp oeq float %35, -1.000000e+00
  %148 = select i1 %147, float 0xFFF0000000000000, float %146
  %149 = tail call float @llvm.fabs.f32(float %35)
  %150 = fcmp olt float %149, 0x3E70000000000000
  %151 = select i1 %150, float %35, float %148
  %152 = add nsw i32 %17, %6
  %153 = mul nsw i32 %25, %7
  %154 = add nsw i32 %152, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %5, i64 %155
  store float %151, float addrspace(1)* %156, align 4, !tbaa !7
  br label %157

157:                                              ; preds = %29, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
