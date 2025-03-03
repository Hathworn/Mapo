; ModuleID = '../data/hip_kernels/7801/27/main.cu'
source_filename = "../data/hip_kernels/7801/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_acoshf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %171

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fcmp oge float %17, 0x43F0000000000000
  %19 = select i1 %18, float 0x3BF0000000000000, float 1.000000e+00
  %20 = fmul float %17, %19
  %21 = fmul float %20, %20
  %22 = fneg float %21
  %23 = tail call float @llvm.fma.f32(float %20, float %20, float %22)
  %24 = select i1 %18, float 0x37F0000000000000, float 1.000000e+00
  %25 = fsub float %21, %24
  %26 = fsub float %25, %21
  %27 = fsub float %25, %26
  %28 = fsub float %21, %27
  %29 = fadd float %24, %26
  %30 = fsub float %28, %29
  %31 = fadd float %23, %30
  %32 = fadd float %25, %31
  %33 = tail call float @llvm.sqrt.f32(float %32)
  %34 = fmul float %33, %33
  %35 = fneg float %34
  %36 = tail call float @llvm.fma.f32(float %33, float %33, float %35)
  %37 = fsub float %32, %25
  %38 = fsub float %31, %37
  %39 = fsub float %32, %34
  %40 = fsub float %32, %39
  %41 = fsub float %40, %34
  %42 = fadd float %38, %41
  %43 = fsub float %42, %36
  %44 = fadd float %39, %43
  %45 = fmul float %33, 2.000000e+00
  %46 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %47 = fmul float %46, %44
  %48 = fcmp oeq float %32, 0.000000e+00
  %49 = select i1 %48, float 0.000000e+00, float %47
  %50 = fadd float %33, %49
  %51 = fsub float %50, %33
  %52 = fsub float %49, %51
  %53 = fadd float %20, %50
  %54 = fsub float %53, %20
  %55 = fsub float %53, %54
  %56 = fsub float %20, %55
  %57 = fsub float %50, %54
  %58 = fadd float %57, %56
  %59 = fadd float %52, %58
  %60 = fadd float %53, %59
  %61 = fsub float %60, %53
  %62 = fsub float %59, %61
  %63 = select i1 %18, i32 64, i32 0
  %64 = tail call float @llvm.amdgcn.frexp.mant.f32(float %60)
  %65 = fcmp olt float %64, 0x3FE5555560000000
  %66 = sext i1 %65 to i32
  %67 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %60)
  %68 = add i32 %67, %66
  %69 = sub nsw i32 0, %68
  %70 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 %69)
  %71 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 %69)
  %72 = fadd float %70, -1.000000e+00
  %73 = fadd float %72, 1.000000e+00
  %74 = fsub float %70, %73
  %75 = fadd float %71, %74
  %76 = fadd float %72, %75
  %77 = fsub float %76, %72
  %78 = fsub float %75, %77
  %79 = fadd float %70, 1.000000e+00
  %80 = fadd float %79, -1.000000e+00
  %81 = fsub float %70, %80
  %82 = fadd float %71, %81
  %83 = fadd float %79, %82
  %84 = fsub float %83, %79
  %85 = fsub float %82, %84
  %86 = tail call float @llvm.amdgcn.rcp.f32(float %83)
  %87 = fmul float %76, %86
  %88 = fmul float %83, %87
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %87, float %83, float %89)
  %91 = tail call float @llvm.fma.f32(float %87, float %85, float %90)
  %92 = fadd float %88, %91
  %93 = fsub float %92, %88
  %94 = fsub float %91, %93
  %95 = fsub float %76, %92
  %96 = fsub float %76, %95
  %97 = fsub float %96, %92
  %98 = fadd float %78, %97
  %99 = fsub float %98, %94
  %100 = fadd float %95, %99
  %101 = fmul float %86, %100
  %102 = fmul float %83, %101
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %101, float %83, float %103)
  %105 = tail call float @llvm.fma.f32(float %101, float %85, float %104)
  %106 = fsub float %100, %95
  %107 = fsub float %99, %106
  %108 = fadd float %102, %105
  %109 = fsub float %108, %102
  %110 = fsub float %105, %109
  %111 = fsub float %100, %108
  %112 = fsub float %100, %111
  %113 = fsub float %112, %108
  %114 = fadd float %107, %113
  %115 = fsub float %114, %110
  %116 = fadd float %111, %115
  %117 = fmul float %86, %116
  %118 = fadd float %87, %101
  %119 = fsub float %118, %87
  %120 = fsub float %101, %119
  %121 = fadd float %120, %117
  %122 = fadd float %118, %121
  %123 = fmul float %122, %122
  %124 = tail call float @llvm.fmuladd.f32(float %123, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %125 = tail call float @llvm.fmuladd.f32(float %123, float %124, float 0x3FE5555B40000000)
  %126 = add nsw i32 %68, %63
  %127 = sitofp i32 %126 to float
  %128 = fmul float %127, 0x3FE62E4300000000
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %127, float 0x3FE62E4300000000, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float 0xBE205C6100000000, float %130)
  %132 = fsub float %122, %118
  %133 = fsub float %121, %132
  %134 = fadd float %128, %131
  %135 = fsub float %134, %128
  %136 = fsub float %131, %135
  %137 = tail call float @llvm.amdgcn.ldexp.f32(float %122, i32 1)
  %138 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 1)
  %139 = fmul float %122, %123
  %140 = fmul float %139, %125
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = fadd float %138, %143
  %145 = fadd float %141, %144
  %146 = fsub float %145, %141
  %147 = fsub float %144, %146
  %148 = fadd float %134, %145
  %149 = fsub float %148, %134
  %150 = fsub float %148, %149
  %151 = fsub float %134, %150
  %152 = fsub float %145, %149
  %153 = fadd float %152, %151
  %154 = fadd float %136, %147
  %155 = fsub float %154, %136
  %156 = fsub float %154, %155
  %157 = fsub float %136, %156
  %158 = fsub float %147, %155
  %159 = fadd float %158, %157
  %160 = fadd float %154, %153
  %161 = fadd float %148, %160
  %162 = fsub float %161, %148
  %163 = fsub float %160, %162
  %164 = fadd float %159, %163
  %165 = fadd float %161, %164
  %166 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 512)
  %167 = select i1 %166, float %17, float %165
  %168 = fcmp olt float %17, 1.000000e+00
  %169 = select i1 %168, float 0x7FF8000000000000, float %167
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %169, float addrspace(1)* %170, align 4, !tbaa !7
  br label %171

171:                                              ; preds = %15, %3
  ret void
}

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
