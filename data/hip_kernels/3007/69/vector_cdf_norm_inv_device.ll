; ModuleID = '../data/hip_kernels/3007/69/main.cu'
source_filename = "../data/hip_kernels/3007/69/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19vector_cdf_norm_inviPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %186

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fadd float %23, %23
  %25 = fcmp ogt float %24, 6.250000e-01
  br i1 %25, label %26, label %105

26:                                               ; preds = %18
  %27 = fsub float 1.000000e+00, %24
  %28 = tail call float @llvm.fabs.f32(float %27)
  %29 = fcmp olt float %28, 3.750000e-01
  br i1 %29, label %30, label %38

30:                                               ; preds = %26
  %31 = fmul float %27, %27
  %32 = tail call float @llvm.fmuladd.f32(float %31, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float 0x3FB65B0B40000000)
  %34 = tail call float @llvm.fmuladd.f32(float %31, float %33, float 0x3FB5581AE0000000)
  %35 = tail call float @llvm.fmuladd.f32(float %31, float %34, float 0x3FC05AA560000000)
  %36 = tail call float @llvm.fmuladd.f32(float %31, float %35, float 0x3FCDB27480000000)
  %37 = tail call float @llvm.fmuladd.f32(float %31, float %36, float 0x3FEC5BF8A0000000)
  br label %97

38:                                               ; preds = %26
  %39 = fneg float %28
  %40 = tail call float @llvm.fma.f32(float %39, float %28, float 1.000000e+00)
  %41 = tail call i1 @llvm.amdgcn.class.f32(float %40, i32 144)
  %42 = select i1 %41, float 0x41F0000000000000, float 1.000000e+00
  %43 = fmul float %40, %42
  %44 = tail call float @llvm.log2.f32(float %43)
  %45 = fmul float %44, 0x3FE62E42E0000000
  %46 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 519)
  %47 = fneg float %45
  %48 = tail call float @llvm.fma.f32(float %44, float 0x3FE62E42E0000000, float %47)
  %49 = tail call float @llvm.fma.f32(float %44, float 0x3E6EFA39E0000000, float %48)
  %50 = fadd float %45, %49
  %51 = select i1 %46, float %44, float %50
  %52 = select i1 %41, float 0x40362E4300000000, float 0.000000e+00
  %53 = fsub float %51, %52
  %54 = fcmp ogt float %53, -5.000000e+00
  br i1 %54, label %55, label %65

55:                                               ; preds = %38
  %56 = fsub float -2.500000e+00, %53
  %57 = tail call float @llvm.fmuladd.f32(float %56, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %58 = tail call float @llvm.fmuladd.f32(float %56, float %57, float 0xBECD8E6AE0000000)
  %59 = tail call float @llvm.fmuladd.f32(float %56, float %58, float 0xBED26B5820000000)
  %60 = tail call float @llvm.fmuladd.f32(float %56, float %59, float 0x3F2CA65B60000000)
  %61 = tail call float @llvm.fmuladd.f32(float %56, float %60, float 0xBF548A8100000000)
  %62 = tail call float @llvm.fmuladd.f32(float %56, float %61, float 0xBF711C9DE0000000)
  %63 = tail call float @llvm.fmuladd.f32(float %56, float %62, float 0x3FCF91EC60000000)
  %64 = tail call float @llvm.fmuladd.f32(float %56, float %63, float 0x3FF805C5E0000000)
  br label %97

65:                                               ; preds = %38
  %66 = fneg float %53
  %67 = fcmp ogt float %53, 0xB9F0000000000000
  %68 = select i1 %67, float 0x41F0000000000000, float 1.000000e+00
  %69 = fmul float %68, %66
  %70 = tail call float @llvm.sqrt.f32(float %69)
  %71 = bitcast float %70 to i32
  %72 = add nsw i32 %71, -1
  %73 = bitcast i32 %72 to float
  %74 = add nsw i32 %71, 1
  %75 = bitcast i32 %74 to float
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %76, float %70, float %69)
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = fneg float %73
  %80 = tail call float @llvm.fma.f32(float %79, float %70, float %69)
  %81 = fcmp ole float %80, 0.000000e+00
  %82 = select i1 %81, float %73, float %70
  %83 = select i1 %78, float %75, float %82
  %84 = select i1 %67, float 0x3EF0000000000000, float 1.000000e+00
  %85 = fmul float %84, %83
  %86 = tail call i1 @llvm.amdgcn.class.f32(float %69, i32 608)
  %87 = select i1 %86, float %69, float %85
  %88 = fadd float %87, -3.000000e+00
  %89 = tail call float @llvm.fmuladd.f32(float %88, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %90 = tail call float @llvm.fmuladd.f32(float %88, float %89, float 0x3F561B8E40000000)
  %91 = tail call float @llvm.fmuladd.f32(float %88, float %90, float 0xBF6E17BCE0000000)
  %92 = tail call float @llvm.fmuladd.f32(float %88, float %91, float 0x3F77824F60000000)
  %93 = tail call float @llvm.fmuladd.f32(float %88, float %92, float 0xBF7F38BAE0000000)
  %94 = tail call float @llvm.fmuladd.f32(float %88, float %93, float 0x3F8354AFC0000000)
  %95 = tail call float @llvm.fmuladd.f32(float %88, float %94, float 0x3FF006DB60000000)
  %96 = tail call float @llvm.fmuladd.f32(float %88, float %95, float 0x4006A9EFC0000000)
  br label %97

97:                                               ; preds = %65, %55, %30
  %98 = phi float [ %37, %30 ], [ %64, %55 ], [ %96, %65 ]
  %99 = fmul float %28, %98
  %100 = fcmp ogt float %28, 1.000000e+00
  %101 = select i1 %100, float 0x7FF8000000000000, float %99
  %102 = fcmp oeq float %28, 1.000000e+00
  %103 = select i1 %102, float 0x7FF0000000000000, float %101
  %104 = tail call float @llvm.copysign.f32(float %103, float %27)
  br label %171

105:                                              ; preds = %18
  %106 = fcmp ogt float %24, 0x3F50000000000000
  br i1 %106, label %107, label %136

107:                                              ; preds = %105
  %108 = fsub float 2.000000e+00, %24
  %109 = fmul float %24, %108
  %110 = tail call i1 @llvm.amdgcn.class.f32(float %109, i32 144)
  %111 = select i1 %110, float 0x41F0000000000000, float 1.000000e+00
  %112 = fmul float %109, %111
  %113 = tail call float @llvm.log2.f32(float %112)
  %114 = fmul float %113, 0x3FE62E42E0000000
  %115 = tail call i1 @llvm.amdgcn.class.f32(float %113, i32 519)
  %116 = fneg float %114
  %117 = tail call float @llvm.fma.f32(float %113, float 0x3FE62E42E0000000, float %116)
  %118 = tail call float @llvm.fma.f32(float %113, float 0x3E6EFA39E0000000, float %117)
  %119 = fadd float %114, %118
  %120 = select i1 %115, float %113, float %119
  %121 = select i1 %110, float 0x40362E4300000000, float 0.000000e+00
  %122 = fsub float %121, %120
  %123 = fadd float %122, -3.125000e+00
  %124 = tail call float @llvm.fmuladd.f32(float %123, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %125 = tail call float @llvm.fmuladd.f32(float %123, float %124, float 0xBE5B638F00000000)
  %126 = tail call float @llvm.fmuladd.f32(float %123, float %125, float 0x3E9C9CCC60000000)
  %127 = tail call float @llvm.fmuladd.f32(float %123, float %126, float 0xBEB72F8AE0000000)
  %128 = tail call float @llvm.fmuladd.f32(float %123, float %127, float 0xBEED21AA60000000)
  %129 = tail call float @llvm.fmuladd.f32(float %123, float %128, float 0x3F287AEBC0000000)
  %130 = tail call float @llvm.fmuladd.f32(float %123, float %129, float 0xBF48455D40000000)
  %131 = tail call float @llvm.fmuladd.f32(float %123, float %130, float 0xBF78B6CA40000000)
  %132 = tail call float @llvm.fmuladd.f32(float %123, float %131, float 0x3FCEBD80C0000000)
  %133 = tail call float @llvm.fmuladd.f32(float %123, float %132, float 0x3FFA755E80000000)
  %134 = fneg float %24
  %135 = tail call float @llvm.fmuladd.f32(float %134, float %133, float %133)
  br label %171

136:                                              ; preds = %105
  %137 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 144)
  %138 = select i1 %137, float 0x41F0000000000000, float 1.000000e+00
  %139 = fmul float %24, %138
  %140 = tail call float @llvm.log2.f32(float %139)
  %141 = fmul float %140, 0x3FE62E42E0000000
  %142 = tail call i1 @llvm.amdgcn.class.f32(float %140, i32 519)
  %143 = fneg float %141
  %144 = tail call float @llvm.fma.f32(float %140, float 0x3FE62E42E0000000, float %143)
  %145 = tail call float @llvm.fma.f32(float %140, float 0x3E6EFA39E0000000, float %144)
  %146 = fadd float %141, %145
  %147 = select i1 %142, float %140, float %146
  %148 = select i1 %137, float 0x40362E4300000000, float 0.000000e+00
  %149 = fsub float %147, %148
  %150 = fneg float %149
  %151 = tail call float @llvm.sqrt.f32(float %150)
  %152 = tail call float @llvm.amdgcn.rcp.f32(float %151)
  %153 = fcmp ogt float %24, 0x3D50000000000000
  br i1 %153, label %154, label %161

154:                                              ; preds = %136
  %155 = tail call float @llvm.fmuladd.f32(float %152, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %156 = tail call float @llvm.fmuladd.f32(float %152, float %155, float 0xC0098DD400000000)
  %157 = tail call float @llvm.fmuladd.f32(float %152, float %156, float 0x4002C90660000000)
  %158 = tail call float @llvm.fmuladd.f32(float %152, float %157, float 0xBFF3A07EA0000000)
  %159 = tail call float @llvm.fmuladd.f32(float %152, float %158, float 0xBFABA546C0000000)
  %160 = tail call float @llvm.fmuladd.f32(float %152, float %159, float 0x3FF004E660000000)
  br label %168

161:                                              ; preds = %136
  %162 = tail call float @llvm.fmuladd.f32(float %152, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %163 = tail call float @llvm.fmuladd.f32(float %152, float %162, float 0xC02A112D80000000)
  %164 = tail call float @llvm.fmuladd.f32(float %152, float %163, float 0x401309D980000000)
  %165 = tail call float @llvm.fmuladd.f32(float %152, float %164, float 0xBFF9194880000000)
  %166 = tail call float @llvm.fmuladd.f32(float %152, float %165, float 0xBF9C084EC0000000)
  %167 = tail call float @llvm.fmuladd.f32(float %152, float %166, float 0x3FF00143E0000000)
  br label %168

168:                                              ; preds = %161, %154
  %169 = phi float [ %160, %154 ], [ %167, %161 ]
  %170 = fmul float %151, %169
  br label %171

171:                                              ; preds = %97, %107, %168
  %172 = phi float [ %104, %97 ], [ %135, %107 ], [ %170, %168 ]
  %173 = fcmp oeq float %24, 2.000000e+00
  %174 = fcmp oeq float %24, 0.000000e+00
  %175 = fcmp olt float %24, 0.000000e+00
  %176 = fcmp ogt float %24, 2.000000e+00
  %177 = or i1 %175, %176
  %178 = fmul float %172, 0xBFF6A09E60000000
  %179 = select i1 %177, float 0x7FF8000000000000, float %178
  %180 = select i1 %174, float 0xFFF0000000000000, float %179
  %181 = select i1 %173, float 0x7FF0000000000000, float %180
  %182 = mul nsw i32 %16, %6
  %183 = add nsw i32 %182, %5
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %4, i64 %184
  store float %181, float addrspace(1)* %185, align 4, !tbaa !7
  br label %186

186:                                              ; preds = %171, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
