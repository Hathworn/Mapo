; ModuleID = '../data/hip_kernels/7801/38/main.cu'
source_filename = "../data/hip_kernels/7801/38/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erfcinvf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %175

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fcmp ogt float %17, 6.250000e-01
  br i1 %18, label %19, label %98

19:                                               ; preds = %15
  %20 = fsub float 1.000000e+00, %17
  %21 = tail call float @llvm.fabs.f32(float %20)
  %22 = fcmp olt float %21, 3.750000e-01
  br i1 %22, label %23, label %31

23:                                               ; preds = %19
  %24 = fmul float %20, %20
  %25 = tail call float @llvm.fmuladd.f32(float %24, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float 0x3FB65B0B40000000)
  %27 = tail call float @llvm.fmuladd.f32(float %24, float %26, float 0x3FB5581AE0000000)
  %28 = tail call float @llvm.fmuladd.f32(float %24, float %27, float 0x3FC05AA560000000)
  %29 = tail call float @llvm.fmuladd.f32(float %24, float %28, float 0x3FCDB27480000000)
  %30 = tail call float @llvm.fmuladd.f32(float %24, float %29, float 0x3FEC5BF8A0000000)
  br label %90

31:                                               ; preds = %19
  %32 = fneg float %21
  %33 = tail call float @llvm.fma.f32(float %32, float %21, float 1.000000e+00)
  %34 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 144)
  %35 = select i1 %34, float 0x41F0000000000000, float 1.000000e+00
  %36 = fmul float %33, %35
  %37 = tail call float @llvm.log2.f32(float %36)
  %38 = fmul float %37, 0x3FE62E42E0000000
  %39 = tail call i1 @llvm.amdgcn.class.f32(float %37, i32 519)
  %40 = fneg float %38
  %41 = tail call float @llvm.fma.f32(float %37, float 0x3FE62E42E0000000, float %40)
  %42 = tail call float @llvm.fma.f32(float %37, float 0x3E6EFA39E0000000, float %41)
  %43 = fadd float %38, %42
  %44 = select i1 %39, float %37, float %43
  %45 = select i1 %34, float 0x40362E4300000000, float 0.000000e+00
  %46 = fsub float %44, %45
  %47 = fcmp ogt float %46, -5.000000e+00
  br i1 %47, label %48, label %58

48:                                               ; preds = %31
  %49 = fsub float -2.500000e+00, %46
  %50 = tail call float @llvm.fmuladd.f32(float %49, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %51 = tail call float @llvm.fmuladd.f32(float %49, float %50, float 0xBECD8E6AE0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %49, float %51, float 0xBED26B5820000000)
  %53 = tail call float @llvm.fmuladd.f32(float %49, float %52, float 0x3F2CA65B60000000)
  %54 = tail call float @llvm.fmuladd.f32(float %49, float %53, float 0xBF548A8100000000)
  %55 = tail call float @llvm.fmuladd.f32(float %49, float %54, float 0xBF711C9DE0000000)
  %56 = tail call float @llvm.fmuladd.f32(float %49, float %55, float 0x3FCF91EC60000000)
  %57 = tail call float @llvm.fmuladd.f32(float %49, float %56, float 0x3FF805C5E0000000)
  br label %90

58:                                               ; preds = %31
  %59 = fneg float %46
  %60 = fcmp ogt float %46, 0xB9F0000000000000
  %61 = select i1 %60, float 0x41F0000000000000, float 1.000000e+00
  %62 = fmul float %61, %59
  %63 = tail call float @llvm.sqrt.f32(float %62)
  %64 = bitcast float %63 to i32
  %65 = add nsw i32 %64, -1
  %66 = bitcast i32 %65 to float
  %67 = add nsw i32 %64, 1
  %68 = bitcast i32 %67 to float
  %69 = fneg float %68
  %70 = tail call float @llvm.fma.f32(float %69, float %63, float %62)
  %71 = fcmp ogt float %70, 0.000000e+00
  %72 = fneg float %66
  %73 = tail call float @llvm.fma.f32(float %72, float %63, float %62)
  %74 = fcmp ole float %73, 0.000000e+00
  %75 = select i1 %74, float %66, float %63
  %76 = select i1 %71, float %68, float %75
  %77 = select i1 %60, float 0x3EF0000000000000, float 1.000000e+00
  %78 = fmul float %77, %76
  %79 = tail call i1 @llvm.amdgcn.class.f32(float %62, i32 608)
  %80 = select i1 %79, float %62, float %78
  %81 = fadd float %80, -3.000000e+00
  %82 = tail call float @llvm.fmuladd.f32(float %81, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %83 = tail call float @llvm.fmuladd.f32(float %81, float %82, float 0x3F561B8E40000000)
  %84 = tail call float @llvm.fmuladd.f32(float %81, float %83, float 0xBF6E17BCE0000000)
  %85 = tail call float @llvm.fmuladd.f32(float %81, float %84, float 0x3F77824F60000000)
  %86 = tail call float @llvm.fmuladd.f32(float %81, float %85, float 0xBF7F38BAE0000000)
  %87 = tail call float @llvm.fmuladd.f32(float %81, float %86, float 0x3F8354AFC0000000)
  %88 = tail call float @llvm.fmuladd.f32(float %81, float %87, float 0x3FF006DB60000000)
  %89 = tail call float @llvm.fmuladd.f32(float %81, float %88, float 0x4006A9EFC0000000)
  br label %90

90:                                               ; preds = %58, %48, %23
  %91 = phi float [ %30, %23 ], [ %57, %48 ], [ %89, %58 ]
  %92 = fmul float %21, %91
  %93 = fcmp ogt float %21, 1.000000e+00
  %94 = select i1 %93, float 0x7FF8000000000000, float %92
  %95 = fcmp oeq float %21, 1.000000e+00
  %96 = select i1 %95, float 0x7FF0000000000000, float %94
  %97 = tail call float @llvm.copysign.f32(float %96, float %20)
  br label %164

98:                                               ; preds = %15
  %99 = fcmp ogt float %17, 0x3F50000000000000
  br i1 %99, label %100, label %129

100:                                              ; preds = %98
  %101 = fsub float 2.000000e+00, %17
  %102 = fmul float %17, %101
  %103 = tail call i1 @llvm.amdgcn.class.f32(float %102, i32 144)
  %104 = select i1 %103, float 0x41F0000000000000, float 1.000000e+00
  %105 = fmul float %102, %104
  %106 = tail call float @llvm.log2.f32(float %105)
  %107 = fmul float %106, 0x3FE62E42E0000000
  %108 = tail call i1 @llvm.amdgcn.class.f32(float %106, i32 519)
  %109 = fneg float %107
  %110 = tail call float @llvm.fma.f32(float %106, float 0x3FE62E42E0000000, float %109)
  %111 = tail call float @llvm.fma.f32(float %106, float 0x3E6EFA39E0000000, float %110)
  %112 = fadd float %107, %111
  %113 = select i1 %108, float %106, float %112
  %114 = select i1 %103, float 0x40362E4300000000, float 0.000000e+00
  %115 = fsub float %114, %113
  %116 = fadd float %115, -3.125000e+00
  %117 = tail call float @llvm.fmuladd.f32(float %116, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %118 = tail call float @llvm.fmuladd.f32(float %116, float %117, float 0xBE5B638F00000000)
  %119 = tail call float @llvm.fmuladd.f32(float %116, float %118, float 0x3E9C9CCC60000000)
  %120 = tail call float @llvm.fmuladd.f32(float %116, float %119, float 0xBEB72F8AE0000000)
  %121 = tail call float @llvm.fmuladd.f32(float %116, float %120, float 0xBEED21AA60000000)
  %122 = tail call float @llvm.fmuladd.f32(float %116, float %121, float 0x3F287AEBC0000000)
  %123 = tail call float @llvm.fmuladd.f32(float %116, float %122, float 0xBF48455D40000000)
  %124 = tail call float @llvm.fmuladd.f32(float %116, float %123, float 0xBF78B6CA40000000)
  %125 = tail call float @llvm.fmuladd.f32(float %116, float %124, float 0x3FCEBD80C0000000)
  %126 = tail call float @llvm.fmuladd.f32(float %116, float %125, float 0x3FFA755E80000000)
  %127 = fneg float %17
  %128 = tail call float @llvm.fmuladd.f32(float %127, float %126, float %126)
  br label %164

129:                                              ; preds = %98
  %130 = tail call i1 @llvm.amdgcn.class.f32(float %17, i32 144)
  %131 = select i1 %130, float 0x41F0000000000000, float 1.000000e+00
  %132 = fmul float %17, %131
  %133 = tail call float @llvm.log2.f32(float %132)
  %134 = fmul float %133, 0x3FE62E42E0000000
  %135 = tail call i1 @llvm.amdgcn.class.f32(float %133, i32 519)
  %136 = fneg float %134
  %137 = tail call float @llvm.fma.f32(float %133, float 0x3FE62E42E0000000, float %136)
  %138 = tail call float @llvm.fma.f32(float %133, float 0x3E6EFA39E0000000, float %137)
  %139 = fadd float %134, %138
  %140 = select i1 %135, float %133, float %139
  %141 = select i1 %130, float 0x40362E4300000000, float 0.000000e+00
  %142 = fsub float %140, %141
  %143 = fneg float %142
  %144 = tail call float @llvm.sqrt.f32(float %143)
  %145 = tail call float @llvm.amdgcn.rcp.f32(float %144)
  %146 = fcmp ogt float %17, 0x3D50000000000000
  br i1 %146, label %147, label %154

147:                                              ; preds = %129
  %148 = tail call float @llvm.fmuladd.f32(float %145, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %149 = tail call float @llvm.fmuladd.f32(float %145, float %148, float 0xC0098DD400000000)
  %150 = tail call float @llvm.fmuladd.f32(float %145, float %149, float 0x4002C90660000000)
  %151 = tail call float @llvm.fmuladd.f32(float %145, float %150, float 0xBFF3A07EA0000000)
  %152 = tail call float @llvm.fmuladd.f32(float %145, float %151, float 0xBFABA546C0000000)
  %153 = tail call float @llvm.fmuladd.f32(float %145, float %152, float 0x3FF004E660000000)
  br label %161

154:                                              ; preds = %129
  %155 = tail call float @llvm.fmuladd.f32(float %145, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %156 = tail call float @llvm.fmuladd.f32(float %145, float %155, float 0xC02A112D80000000)
  %157 = tail call float @llvm.fmuladd.f32(float %145, float %156, float 0x401309D980000000)
  %158 = tail call float @llvm.fmuladd.f32(float %145, float %157, float 0xBFF9194880000000)
  %159 = tail call float @llvm.fmuladd.f32(float %145, float %158, float 0xBF9C084EC0000000)
  %160 = tail call float @llvm.fmuladd.f32(float %145, float %159, float 0x3FF00143E0000000)
  br label %161

161:                                              ; preds = %154, %147
  %162 = phi float [ %153, %147 ], [ %160, %154 ]
  %163 = fmul float %144, %162
  br label %164

164:                                              ; preds = %90, %100, %161
  %165 = phi float [ %97, %90 ], [ %128, %100 ], [ %163, %161 ]
  %166 = fcmp oeq float %17, 2.000000e+00
  %167 = fcmp oeq float %17, 0.000000e+00
  %168 = fcmp olt float %17, 0.000000e+00
  %169 = fcmp ogt float %17, 2.000000e+00
  %170 = or i1 %168, %169
  %171 = select i1 %170, float 0x7FF8000000000000, float %165
  %172 = select i1 %167, float 0x7FF0000000000000, float %171
  %173 = select i1 %166, float 0xFFF0000000000000, float %172
  %174 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %173, float addrspace(1)* %174, align 4, !tbaa !7
  br label %175

175:                                              ; preds = %164, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
