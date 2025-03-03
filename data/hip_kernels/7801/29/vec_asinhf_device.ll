; ModuleID = '../data/hip_kernels/7801/29/main.cu'
source_filename = "../data/hip_kernels/7801/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_asinhf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = icmp ult i64 %13, %0
  br i1 %14, label %15, label %173

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = fcmp oge float %18, 0x43F0000000000000
  %20 = select i1 %19, float 0x3BF0000000000000, float 1.000000e+00
  %21 = fmul float %18, %20
  %22 = fmul float %21, %21
  %23 = fneg float %22
  %24 = tail call float @llvm.fma.f32(float %21, float %21, float %23)
  %25 = select i1 %19, float 0x37F0000000000000, float 1.000000e+00
  %26 = fadd float %25, %22
  %27 = fsub float %26, %22
  %28 = fsub float %26, %27
  %29 = fsub float %22, %28
  %30 = fsub float %25, %27
  %31 = fadd float %30, %29
  %32 = fadd float %24, %31
  %33 = fadd float %26, %32
  %34 = tail call float @llvm.sqrt.f32(float %33)
  %35 = fmul float %34, %34
  %36 = fneg float %35
  %37 = tail call float @llvm.fma.f32(float %34, float %34, float %36)
  %38 = fsub float %33, %26
  %39 = fsub float %32, %38
  %40 = fsub float %33, %35
  %41 = fsub float %33, %40
  %42 = fsub float %41, %35
  %43 = fadd float %39, %42
  %44 = fsub float %43, %37
  %45 = fadd float %40, %44
  %46 = fmul float %34, 2.000000e+00
  %47 = tail call float @llvm.amdgcn.rcp.f32(float %46)
  %48 = fmul float %47, %45
  %49 = fcmp oeq float %33, 0.000000e+00
  %50 = select i1 %49, float 0.000000e+00, float %48
  %51 = fadd float %34, %50
  %52 = fsub float %51, %34
  %53 = fsub float %50, %52
  %54 = fadd float %21, %51
  %55 = fsub float %54, %21
  %56 = fsub float %54, %55
  %57 = fsub float %21, %56
  %58 = fsub float %51, %55
  %59 = fadd float %58, %57
  %60 = fadd float %53, %59
  %61 = fadd float %54, %60
  %62 = fsub float %61, %54
  %63 = fsub float %60, %62
  %64 = select i1 %19, i32 64, i32 0
  %65 = tail call float @llvm.amdgcn.frexp.mant.f32(float %61)
  %66 = fcmp olt float %65, 0x3FE5555560000000
  %67 = sext i1 %66 to i32
  %68 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %61)
  %69 = add i32 %68, %67
  %70 = sub nsw i32 0, %69
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %70)
  %72 = tail call float @llvm.amdgcn.ldexp.f32(float %63, i32 %70)
  %73 = fadd float %71, -1.000000e+00
  %74 = fadd float %73, 1.000000e+00
  %75 = fsub float %71, %74
  %76 = fadd float %72, %75
  %77 = fadd float %73, %76
  %78 = fsub float %77, %73
  %79 = fsub float %76, %78
  %80 = fadd float %71, 1.000000e+00
  %81 = fadd float %80, -1.000000e+00
  %82 = fsub float %71, %81
  %83 = fadd float %72, %82
  %84 = fadd float %80, %83
  %85 = fsub float %84, %80
  %86 = fsub float %83, %85
  %87 = tail call float @llvm.amdgcn.rcp.f32(float %84)
  %88 = fmul float %77, %87
  %89 = fmul float %84, %88
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %88, float %84, float %90)
  %92 = tail call float @llvm.fma.f32(float %88, float %86, float %91)
  %93 = fadd float %89, %92
  %94 = fsub float %93, %89
  %95 = fsub float %92, %94
  %96 = fsub float %77, %93
  %97 = fsub float %77, %96
  %98 = fsub float %97, %93
  %99 = fadd float %79, %98
  %100 = fsub float %99, %95
  %101 = fadd float %96, %100
  %102 = fmul float %87, %101
  %103 = fmul float %84, %102
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %102, float %84, float %104)
  %106 = tail call float @llvm.fma.f32(float %102, float %86, float %105)
  %107 = fsub float %101, %96
  %108 = fsub float %100, %107
  %109 = fadd float %103, %106
  %110 = fsub float %109, %103
  %111 = fsub float %106, %110
  %112 = fsub float %101, %109
  %113 = fsub float %101, %112
  %114 = fsub float %113, %109
  %115 = fadd float %108, %114
  %116 = fsub float %115, %111
  %117 = fadd float %112, %116
  %118 = fmul float %87, %117
  %119 = fadd float %88, %102
  %120 = fsub float %119, %88
  %121 = fsub float %102, %120
  %122 = fadd float %121, %118
  %123 = fadd float %119, %122
  %124 = fmul float %123, %123
  %125 = tail call float @llvm.fmuladd.f32(float %124, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %126 = tail call float @llvm.fmuladd.f32(float %124, float %125, float 0x3FE5555B40000000)
  %127 = add nsw i32 %69, %64
  %128 = sitofp i32 %127 to float
  %129 = fmul float %128, 0x3FE62E4300000000
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %128, float 0x3FE62E4300000000, float %130)
  %132 = tail call float @llvm.fma.f32(float %128, float 0xBE205C6100000000, float %131)
  %133 = fsub float %123, %119
  %134 = fsub float %122, %133
  %135 = fadd float %129, %132
  %136 = fsub float %135, %129
  %137 = fsub float %132, %136
  %138 = tail call float @llvm.amdgcn.ldexp.f32(float %123, i32 1)
  %139 = tail call float @llvm.amdgcn.ldexp.f32(float %134, i32 1)
  %140 = fmul float %123, %124
  %141 = fmul float %140, %126
  %142 = fadd float %138, %141
  %143 = fsub float %142, %138
  %144 = fsub float %141, %143
  %145 = fadd float %139, %144
  %146 = fadd float %142, %145
  %147 = fsub float %146, %142
  %148 = fsub float %145, %147
  %149 = fadd float %135, %146
  %150 = fsub float %149, %135
  %151 = fsub float %149, %150
  %152 = fsub float %135, %151
  %153 = fsub float %146, %150
  %154 = fadd float %153, %152
  %155 = fadd float %137, %148
  %156 = fsub float %155, %137
  %157 = fsub float %155, %156
  %158 = fsub float %137, %157
  %159 = fsub float %148, %156
  %160 = fadd float %159, %158
  %161 = fadd float %155, %154
  %162 = fadd float %149, %161
  %163 = fsub float %162, %149
  %164 = fsub float %161, %163
  %165 = fadd float %160, %164
  %166 = fadd float %162, %165
  %167 = fcmp olt float %18, 0x3F30000000000000
  %168 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 512)
  %169 = select i1 %168, i1 true, i1 %167
  %170 = select i1 %169, float %18, float %166
  %171 = tail call float @llvm.copysign.f32(float %170, float %17)
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %171, float addrspace(1)* %172, align 4, !tbaa !7
  br label %173

173:                                              ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
