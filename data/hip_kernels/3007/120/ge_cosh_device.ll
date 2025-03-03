; ModuleID = '../data/hip_kernels/3007/120/main.cu'
source_filename = "../data/hip_kernels/3007/120/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7ge_coshiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %158

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fadd float %36, 0xBFE62E4300000000
  %38 = fsub float %37, %36
  %39 = fsub float %38, %37
  %40 = fadd float %36, %39
  %41 = fadd float %38, 0x3FE62E4300000000
  %42 = fsub float %40, %41
  %43 = fadd float %42, 0x3E205C6100000000
  %44 = fadd float %37, %43
  %45 = fsub float %44, %37
  %46 = fsub float %43, %45
  %47 = fmul float %44, 0x3FF7154760000000
  %48 = tail call float @llvm.rint.f32(float %47)
  %49 = tail call float @llvm.fmuladd.f32(float %48, float 0xBFE62E4000000000, float %44)
  %50 = fadd float %46, %49
  %51 = fsub float %50, %49
  %52 = fsub float %46, %51
  %53 = fmul float %48, 0x3EB7F78000000000
  %54 = fsub float %50, %53
  %55 = fsub float %50, %54
  %56 = fsub float %55, %53
  %57 = fadd float %52, %56
  %58 = fadd float %54, %57
  %59 = fsub float %58, %54
  %60 = fsub float %57, %59
  %61 = fmul float %48, 0x3DD473DE60000000
  %62 = fsub float %58, %61
  %63 = fsub float %58, %62
  %64 = fsub float %63, %61
  %65 = fadd float %60, %64
  %66 = fadd float %62, %65
  %67 = fsub float %66, %62
  %68 = fsub float %65, %67
  %69 = tail call float @llvm.fmuladd.f32(float %66, float 0x3F56850E40000000, float 0x3F8123BCC0000000)
  %70 = tail call float @llvm.fmuladd.f32(float %66, float %69, float 0x3FA555B980000000)
  %71 = tail call float @llvm.fmuladd.f32(float %66, float %70, float 0x3FC55548E0000000)
  %72 = tail call float @llvm.fmuladd.f32(float %66, float %71, float 0x3FDFFFFF80000000)
  %73 = fmul float %66, %66
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %66, float %66, float %74)
  %76 = fmul float %68, 2.000000e+00
  %77 = tail call float @llvm.fma.f32(float %66, float %76, float %75)
  %78 = fadd float %73, %77
  %79 = fsub float %78, %73
  %80 = fsub float %77, %79
  %81 = fmul float %72, %78
  %82 = fneg float %81
  %83 = tail call float @llvm.fma.f32(float %78, float %72, float %82)
  %84 = tail call float @llvm.fma.f32(float %80, float %72, float %83)
  %85 = fadd float %81, %84
  %86 = fsub float %85, %81
  %87 = fsub float %84, %86
  %88 = fadd float %66, %85
  %89 = fsub float %88, %66
  %90 = fsub float %85, %89
  %91 = fadd float %68, %87
  %92 = fadd float %91, %90
  %93 = fadd float %88, %92
  %94 = fsub float %93, %88
  %95 = fsub float %92, %94
  %96 = fadd float %93, 1.000000e+00
  %97 = fadd float %96, -1.000000e+00
  %98 = fsub float %93, %97
  %99 = fadd float %95, %98
  %100 = fadd float %96, %99
  %101 = fsub float %100, %96
  %102 = fsub float %99, %101
  %103 = fptosi float %48 to i32
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %100, i32 %103)
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %102, i32 %103)
  %106 = tail call float @llvm.amdgcn.rcp.f32(float %104)
  %107 = fmul float %104, %106
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %106, float %104, float %108)
  %110 = tail call float @llvm.fma.f32(float %106, float %105, float %109)
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = fsub float 1.000000e+00, %111
  %115 = fsub float 1.000000e+00, %114
  %116 = fsub float %115, %111
  %117 = fsub float %116, %113
  %118 = fadd float %114, %117
  %119 = fmul float %106, %118
  %120 = fmul float %104, %119
  %121 = fneg float %120
  %122 = tail call float @llvm.fma.f32(float %119, float %104, float %121)
  %123 = tail call float @llvm.fma.f32(float %119, float %105, float %122)
  %124 = fsub float %118, %114
  %125 = fsub float %117, %124
  %126 = fadd float %120, %123
  %127 = fsub float %126, %120
  %128 = fsub float %123, %127
  %129 = fsub float %118, %126
  %130 = fsub float %118, %129
  %131 = fsub float %130, %126
  %132 = fadd float %125, %131
  %133 = fsub float %132, %128
  %134 = fadd float %129, %133
  %135 = fmul float %106, %134
  %136 = fadd float %106, %119
  %137 = fsub float %136, %106
  %138 = fsub float %119, %137
  %139 = fadd float %138, %135
  %140 = fadd float %136, %139
  %141 = fsub float %140, %136
  %142 = fsub float %139, %141
  %143 = tail call float @llvm.amdgcn.ldexp.f32(float %140, i32 -2)
  %144 = tail call float @llvm.amdgcn.ldexp.f32(float %142, i32 -2)
  %145 = fadd float %104, %143
  %146 = fsub float %145, %104
  %147 = fsub float %143, %146
  %148 = fadd float %105, %144
  %149 = fadd float %148, %147
  %150 = fadd float %145, %149
  %151 = fcmp ogt float %36, 0x40565A9F80000000
  %152 = select i1 %151, float 0x7FF0000000000000, float %150
  %153 = add nsw i32 %17, %6
  %154 = mul nsw i32 %25, %7
  %155 = add nsw i32 %153, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %5, i64 %156
  store float %152, float addrspace(1)* %157, align 4, !tbaa !7
  br label %158

158:                                              ; preds = %29, %8
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
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
