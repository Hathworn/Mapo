; ModuleID = '../data/hip_kernels/3007/67/main.cu'
source_filename = "../data/hip_kernels/3007/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15vector_erfc_inviPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %184

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fcmp ogt float %23, 6.250000e-01
  br i1 %24, label %25, label %104

25:                                               ; preds = %18
  %26 = fsub float 1.000000e+00, %23
  %27 = tail call float @llvm.fabs.f32(float %26)
  %28 = fcmp olt float %27, 3.750000e-01
  br i1 %28, label %29, label %37

29:                                               ; preds = %25
  %30 = fmul float %26, %26
  %31 = tail call float @llvm.fmuladd.f32(float %30, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %32 = tail call float @llvm.fmuladd.f32(float %30, float %31, float 0x3FB65B0B40000000)
  %33 = tail call float @llvm.fmuladd.f32(float %30, float %32, float 0x3FB5581AE0000000)
  %34 = tail call float @llvm.fmuladd.f32(float %30, float %33, float 0x3FC05AA560000000)
  %35 = tail call float @llvm.fmuladd.f32(float %30, float %34, float 0x3FCDB27480000000)
  %36 = tail call float @llvm.fmuladd.f32(float %30, float %35, float 0x3FEC5BF8A0000000)
  br label %96

37:                                               ; preds = %25
  %38 = fneg float %27
  %39 = tail call float @llvm.fma.f32(float %38, float %27, float 1.000000e+00)
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %39, i32 144)
  %41 = select i1 %40, float 0x41F0000000000000, float 1.000000e+00
  %42 = fmul float %39, %41
  %43 = tail call float @llvm.log2.f32(float %42)
  %44 = fmul float %43, 0x3FE62E42E0000000
  %45 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 519)
  %46 = fneg float %44
  %47 = tail call float @llvm.fma.f32(float %43, float 0x3FE62E42E0000000, float %46)
  %48 = tail call float @llvm.fma.f32(float %43, float 0x3E6EFA39E0000000, float %47)
  %49 = fadd float %44, %48
  %50 = select i1 %45, float %43, float %49
  %51 = select i1 %40, float 0x40362E4300000000, float 0.000000e+00
  %52 = fsub float %50, %51
  %53 = fcmp ogt float %52, -5.000000e+00
  br i1 %53, label %54, label %64

54:                                               ; preds = %37
  %55 = fsub float -2.500000e+00, %52
  %56 = tail call float @llvm.fmuladd.f32(float %55, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %57 = tail call float @llvm.fmuladd.f32(float %55, float %56, float 0xBECD8E6AE0000000)
  %58 = tail call float @llvm.fmuladd.f32(float %55, float %57, float 0xBED26B5820000000)
  %59 = tail call float @llvm.fmuladd.f32(float %55, float %58, float 0x3F2CA65B60000000)
  %60 = tail call float @llvm.fmuladd.f32(float %55, float %59, float 0xBF548A8100000000)
  %61 = tail call float @llvm.fmuladd.f32(float %55, float %60, float 0xBF711C9DE0000000)
  %62 = tail call float @llvm.fmuladd.f32(float %55, float %61, float 0x3FCF91EC60000000)
  %63 = tail call float @llvm.fmuladd.f32(float %55, float %62, float 0x3FF805C5E0000000)
  br label %96

64:                                               ; preds = %37
  %65 = fneg float %52
  %66 = fcmp ogt float %52, 0xB9F0000000000000
  %67 = select i1 %66, float 0x41F0000000000000, float 1.000000e+00
  %68 = fmul float %67, %65
  %69 = tail call float @llvm.sqrt.f32(float %68)
  %70 = bitcast float %69 to i32
  %71 = add nsw i32 %70, -1
  %72 = bitcast i32 %71 to float
  %73 = add nsw i32 %70, 1
  %74 = bitcast i32 %73 to float
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %75, float %69, float %68)
  %77 = fcmp ogt float %76, 0.000000e+00
  %78 = fneg float %72
  %79 = tail call float @llvm.fma.f32(float %78, float %69, float %68)
  %80 = fcmp ole float %79, 0.000000e+00
  %81 = select i1 %80, float %72, float %69
  %82 = select i1 %77, float %74, float %81
  %83 = select i1 %66, float 0x3EF0000000000000, float 1.000000e+00
  %84 = fmul float %83, %82
  %85 = tail call i1 @llvm.amdgcn.class.f32(float %68, i32 608)
  %86 = select i1 %85, float %68, float %84
  %87 = fadd float %86, -3.000000e+00
  %88 = tail call float @llvm.fmuladd.f32(float %87, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %89 = tail call float @llvm.fmuladd.f32(float %87, float %88, float 0x3F561B8E40000000)
  %90 = tail call float @llvm.fmuladd.f32(float %87, float %89, float 0xBF6E17BCE0000000)
  %91 = tail call float @llvm.fmuladd.f32(float %87, float %90, float 0x3F77824F60000000)
  %92 = tail call float @llvm.fmuladd.f32(float %87, float %91, float 0xBF7F38BAE0000000)
  %93 = tail call float @llvm.fmuladd.f32(float %87, float %92, float 0x3F8354AFC0000000)
  %94 = tail call float @llvm.fmuladd.f32(float %87, float %93, float 0x3FF006DB60000000)
  %95 = tail call float @llvm.fmuladd.f32(float %87, float %94, float 0x4006A9EFC0000000)
  br label %96

96:                                               ; preds = %64, %54, %29
  %97 = phi float [ %36, %29 ], [ %63, %54 ], [ %95, %64 ]
  %98 = fmul float %27, %97
  %99 = fcmp ogt float %27, 1.000000e+00
  %100 = select i1 %99, float 0x7FF8000000000000, float %98
  %101 = fcmp oeq float %27, 1.000000e+00
  %102 = select i1 %101, float 0x7FF0000000000000, float %100
  %103 = tail call float @llvm.copysign.f32(float %102, float %26)
  br label %170

104:                                              ; preds = %18
  %105 = fcmp ogt float %23, 0x3F50000000000000
  br i1 %105, label %106, label %135

106:                                              ; preds = %104
  %107 = fsub float 2.000000e+00, %23
  %108 = fmul float %23, %107
  %109 = tail call i1 @llvm.amdgcn.class.f32(float %108, i32 144)
  %110 = select i1 %109, float 0x41F0000000000000, float 1.000000e+00
  %111 = fmul float %108, %110
  %112 = tail call float @llvm.log2.f32(float %111)
  %113 = fmul float %112, 0x3FE62E42E0000000
  %114 = tail call i1 @llvm.amdgcn.class.f32(float %112, i32 519)
  %115 = fneg float %113
  %116 = tail call float @llvm.fma.f32(float %112, float 0x3FE62E42E0000000, float %115)
  %117 = tail call float @llvm.fma.f32(float %112, float 0x3E6EFA39E0000000, float %116)
  %118 = fadd float %113, %117
  %119 = select i1 %114, float %112, float %118
  %120 = select i1 %109, float 0x40362E4300000000, float 0.000000e+00
  %121 = fsub float %120, %119
  %122 = fadd float %121, -3.125000e+00
  %123 = tail call float @llvm.fmuladd.f32(float %122, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %124 = tail call float @llvm.fmuladd.f32(float %122, float %123, float 0xBE5B638F00000000)
  %125 = tail call float @llvm.fmuladd.f32(float %122, float %124, float 0x3E9C9CCC60000000)
  %126 = tail call float @llvm.fmuladd.f32(float %122, float %125, float 0xBEB72F8AE0000000)
  %127 = tail call float @llvm.fmuladd.f32(float %122, float %126, float 0xBEED21AA60000000)
  %128 = tail call float @llvm.fmuladd.f32(float %122, float %127, float 0x3F287AEBC0000000)
  %129 = tail call float @llvm.fmuladd.f32(float %122, float %128, float 0xBF48455D40000000)
  %130 = tail call float @llvm.fmuladd.f32(float %122, float %129, float 0xBF78B6CA40000000)
  %131 = tail call float @llvm.fmuladd.f32(float %122, float %130, float 0x3FCEBD80C0000000)
  %132 = tail call float @llvm.fmuladd.f32(float %122, float %131, float 0x3FFA755E80000000)
  %133 = fneg float %23
  %134 = tail call float @llvm.fmuladd.f32(float %133, float %132, float %132)
  br label %170

135:                                              ; preds = %104
  %136 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 144)
  %137 = select i1 %136, float 0x41F0000000000000, float 1.000000e+00
  %138 = fmul float %23, %137
  %139 = tail call float @llvm.log2.f32(float %138)
  %140 = fmul float %139, 0x3FE62E42E0000000
  %141 = tail call i1 @llvm.amdgcn.class.f32(float %139, i32 519)
  %142 = fneg float %140
  %143 = tail call float @llvm.fma.f32(float %139, float 0x3FE62E42E0000000, float %142)
  %144 = tail call float @llvm.fma.f32(float %139, float 0x3E6EFA39E0000000, float %143)
  %145 = fadd float %140, %144
  %146 = select i1 %141, float %139, float %145
  %147 = select i1 %136, float 0x40362E4300000000, float 0.000000e+00
  %148 = fsub float %146, %147
  %149 = fneg float %148
  %150 = tail call float @llvm.sqrt.f32(float %149)
  %151 = tail call float @llvm.amdgcn.rcp.f32(float %150)
  %152 = fcmp ogt float %23, 0x3D50000000000000
  br i1 %152, label %153, label %160

153:                                              ; preds = %135
  %154 = tail call float @llvm.fmuladd.f32(float %151, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %155 = tail call float @llvm.fmuladd.f32(float %151, float %154, float 0xC0098DD400000000)
  %156 = tail call float @llvm.fmuladd.f32(float %151, float %155, float 0x4002C90660000000)
  %157 = tail call float @llvm.fmuladd.f32(float %151, float %156, float 0xBFF3A07EA0000000)
  %158 = tail call float @llvm.fmuladd.f32(float %151, float %157, float 0xBFABA546C0000000)
  %159 = tail call float @llvm.fmuladd.f32(float %151, float %158, float 0x3FF004E660000000)
  br label %167

160:                                              ; preds = %135
  %161 = tail call float @llvm.fmuladd.f32(float %151, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %162 = tail call float @llvm.fmuladd.f32(float %151, float %161, float 0xC02A112D80000000)
  %163 = tail call float @llvm.fmuladd.f32(float %151, float %162, float 0x401309D980000000)
  %164 = tail call float @llvm.fmuladd.f32(float %151, float %163, float 0xBFF9194880000000)
  %165 = tail call float @llvm.fmuladd.f32(float %151, float %164, float 0xBF9C084EC0000000)
  %166 = tail call float @llvm.fmuladd.f32(float %151, float %165, float 0x3FF00143E0000000)
  br label %167

167:                                              ; preds = %160, %153
  %168 = phi float [ %159, %153 ], [ %166, %160 ]
  %169 = fmul float %150, %168
  br label %170

170:                                              ; preds = %96, %106, %167
  %171 = phi float [ %103, %96 ], [ %134, %106 ], [ %169, %167 ]
  %172 = fcmp oeq float %23, 2.000000e+00
  %173 = fcmp oeq float %23, 0.000000e+00
  %174 = fcmp olt float %23, 0.000000e+00
  %175 = fcmp ogt float %23, 2.000000e+00
  %176 = or i1 %174, %175
  %177 = select i1 %176, float 0x7FF8000000000000, float %171
  %178 = select i1 %173, float 0x7FF0000000000000, float %177
  %179 = select i1 %172, float 0xFFF0000000000000, float %178
  %180 = mul nsw i32 %16, %6
  %181 = add nsw i32 %180, %5
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %4, i64 %182
  store float %179, float addrspace(1)* %183, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %170, %7
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
