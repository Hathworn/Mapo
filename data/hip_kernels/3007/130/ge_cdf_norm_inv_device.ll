; ModuleID = '../data/hip_kernels/3007/130/main.cu'
source_filename = "../data/hip_kernels/3007/130/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15ge_cdf_norm_inviiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %199

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd float %35, %35
  %37 = fcmp ogt float %36, 6.250000e-01
  br i1 %37, label %38, label %117

38:                                               ; preds = %29
  %39 = fsub float 1.000000e+00, %36
  %40 = tail call float @llvm.fabs.f32(float %39)
  %41 = fcmp olt float %40, 3.750000e-01
  br i1 %41, label %42, label %50

42:                                               ; preds = %38
  %43 = fmul float %39, %39
  %44 = tail call float @llvm.fmuladd.f32(float %43, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float 0x3FB65B0B40000000)
  %46 = tail call float @llvm.fmuladd.f32(float %43, float %45, float 0x3FB5581AE0000000)
  %47 = tail call float @llvm.fmuladd.f32(float %43, float %46, float 0x3FC05AA560000000)
  %48 = tail call float @llvm.fmuladd.f32(float %43, float %47, float 0x3FCDB27480000000)
  %49 = tail call float @llvm.fmuladd.f32(float %43, float %48, float 0x3FEC5BF8A0000000)
  br label %109

50:                                               ; preds = %38
  %51 = fneg float %40
  %52 = tail call float @llvm.fma.f32(float %51, float %40, float 1.000000e+00)
  %53 = tail call i1 @llvm.amdgcn.class.f32(float %52, i32 144)
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.log2.f32(float %55)
  %57 = fmul float %56, 0x3FE62E42E0000000
  %58 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 519)
  %59 = fneg float %57
  %60 = tail call float @llvm.fma.f32(float %56, float 0x3FE62E42E0000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %56, float 0x3E6EFA39E0000000, float %60)
  %62 = fadd float %57, %61
  %63 = select i1 %58, float %56, float %62
  %64 = select i1 %53, float 0x40362E4300000000, float 0.000000e+00
  %65 = fsub float %63, %64
  %66 = fcmp ogt float %65, -5.000000e+00
  br i1 %66, label %67, label %77

67:                                               ; preds = %50
  %68 = fsub float -2.500000e+00, %65
  %69 = tail call float @llvm.fmuladd.f32(float %68, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %70 = tail call float @llvm.fmuladd.f32(float %68, float %69, float 0xBECD8E6AE0000000)
  %71 = tail call float @llvm.fmuladd.f32(float %68, float %70, float 0xBED26B5820000000)
  %72 = tail call float @llvm.fmuladd.f32(float %68, float %71, float 0x3F2CA65B60000000)
  %73 = tail call float @llvm.fmuladd.f32(float %68, float %72, float 0xBF548A8100000000)
  %74 = tail call float @llvm.fmuladd.f32(float %68, float %73, float 0xBF711C9DE0000000)
  %75 = tail call float @llvm.fmuladd.f32(float %68, float %74, float 0x3FCF91EC60000000)
  %76 = tail call float @llvm.fmuladd.f32(float %68, float %75, float 0x3FF805C5E0000000)
  br label %109

77:                                               ; preds = %50
  %78 = fneg float %65
  %79 = fcmp ogt float %65, 0xB9F0000000000000
  %80 = select i1 %79, float 0x41F0000000000000, float 1.000000e+00
  %81 = fmul float %80, %78
  %82 = tail call float @llvm.sqrt.f32(float %81)
  %83 = bitcast float %82 to i32
  %84 = add nsw i32 %83, -1
  %85 = bitcast i32 %84 to float
  %86 = add nsw i32 %83, 1
  %87 = bitcast i32 %86 to float
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %88, float %82, float %81)
  %90 = fcmp ogt float %89, 0.000000e+00
  %91 = fneg float %85
  %92 = tail call float @llvm.fma.f32(float %91, float %82, float %81)
  %93 = fcmp ole float %92, 0.000000e+00
  %94 = select i1 %93, float %85, float %82
  %95 = select i1 %90, float %87, float %94
  %96 = select i1 %79, float 0x3EF0000000000000, float 1.000000e+00
  %97 = fmul float %96, %95
  %98 = tail call i1 @llvm.amdgcn.class.f32(float %81, i32 608)
  %99 = select i1 %98, float %81, float %97
  %100 = fadd float %99, -3.000000e+00
  %101 = tail call float @llvm.fmuladd.f32(float %100, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %102 = tail call float @llvm.fmuladd.f32(float %100, float %101, float 0x3F561B8E40000000)
  %103 = tail call float @llvm.fmuladd.f32(float %100, float %102, float 0xBF6E17BCE0000000)
  %104 = tail call float @llvm.fmuladd.f32(float %100, float %103, float 0x3F77824F60000000)
  %105 = tail call float @llvm.fmuladd.f32(float %100, float %104, float 0xBF7F38BAE0000000)
  %106 = tail call float @llvm.fmuladd.f32(float %100, float %105, float 0x3F8354AFC0000000)
  %107 = tail call float @llvm.fmuladd.f32(float %100, float %106, float 0x3FF006DB60000000)
  %108 = tail call float @llvm.fmuladd.f32(float %100, float %107, float 0x4006A9EFC0000000)
  br label %109

109:                                              ; preds = %77, %67, %42
  %110 = phi float [ %49, %42 ], [ %76, %67 ], [ %108, %77 ]
  %111 = fmul float %40, %110
  %112 = fcmp ogt float %40, 1.000000e+00
  %113 = select i1 %112, float 0x7FF8000000000000, float %111
  %114 = fcmp oeq float %40, 1.000000e+00
  %115 = select i1 %114, float 0x7FF0000000000000, float %113
  %116 = tail call float @llvm.copysign.f32(float %115, float %39)
  br label %183

117:                                              ; preds = %29
  %118 = fcmp ogt float %36, 0x3F50000000000000
  br i1 %118, label %119, label %148

119:                                              ; preds = %117
  %120 = fsub float 2.000000e+00, %36
  %121 = fmul float %36, %120
  %122 = tail call i1 @llvm.amdgcn.class.f32(float %121, i32 144)
  %123 = select i1 %122, float 0x41F0000000000000, float 1.000000e+00
  %124 = fmul float %121, %123
  %125 = tail call float @llvm.log2.f32(float %124)
  %126 = fmul float %125, 0x3FE62E42E0000000
  %127 = tail call i1 @llvm.amdgcn.class.f32(float %125, i32 519)
  %128 = fneg float %126
  %129 = tail call float @llvm.fma.f32(float %125, float 0x3FE62E42E0000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %125, float 0x3E6EFA39E0000000, float %129)
  %131 = fadd float %126, %130
  %132 = select i1 %127, float %125, float %131
  %133 = select i1 %122, float 0x40362E4300000000, float 0.000000e+00
  %134 = fsub float %133, %132
  %135 = fadd float %134, -3.125000e+00
  %136 = tail call float @llvm.fmuladd.f32(float %135, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %137 = tail call float @llvm.fmuladd.f32(float %135, float %136, float 0xBE5B638F00000000)
  %138 = tail call float @llvm.fmuladd.f32(float %135, float %137, float 0x3E9C9CCC60000000)
  %139 = tail call float @llvm.fmuladd.f32(float %135, float %138, float 0xBEB72F8AE0000000)
  %140 = tail call float @llvm.fmuladd.f32(float %135, float %139, float 0xBEED21AA60000000)
  %141 = tail call float @llvm.fmuladd.f32(float %135, float %140, float 0x3F287AEBC0000000)
  %142 = tail call float @llvm.fmuladd.f32(float %135, float %141, float 0xBF48455D40000000)
  %143 = tail call float @llvm.fmuladd.f32(float %135, float %142, float 0xBF78B6CA40000000)
  %144 = tail call float @llvm.fmuladd.f32(float %135, float %143, float 0x3FCEBD80C0000000)
  %145 = tail call float @llvm.fmuladd.f32(float %135, float %144, float 0x3FFA755E80000000)
  %146 = fneg float %36
  %147 = tail call float @llvm.fmuladd.f32(float %146, float %145, float %145)
  br label %183

148:                                              ; preds = %117
  %149 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 144)
  %150 = select i1 %149, float 0x41F0000000000000, float 1.000000e+00
  %151 = fmul float %36, %150
  %152 = tail call float @llvm.log2.f32(float %151)
  %153 = fmul float %152, 0x3FE62E42E0000000
  %154 = tail call i1 @llvm.amdgcn.class.f32(float %152, i32 519)
  %155 = fneg float %153
  %156 = tail call float @llvm.fma.f32(float %152, float 0x3FE62E42E0000000, float %155)
  %157 = tail call float @llvm.fma.f32(float %152, float 0x3E6EFA39E0000000, float %156)
  %158 = fadd float %153, %157
  %159 = select i1 %154, float %152, float %158
  %160 = select i1 %149, float 0x40362E4300000000, float 0.000000e+00
  %161 = fsub float %159, %160
  %162 = fneg float %161
  %163 = tail call float @llvm.sqrt.f32(float %162)
  %164 = tail call float @llvm.amdgcn.rcp.f32(float %163)
  %165 = fcmp ogt float %36, 0x3D50000000000000
  br i1 %165, label %166, label %173

166:                                              ; preds = %148
  %167 = tail call float @llvm.fmuladd.f32(float %164, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %168 = tail call float @llvm.fmuladd.f32(float %164, float %167, float 0xC0098DD400000000)
  %169 = tail call float @llvm.fmuladd.f32(float %164, float %168, float 0x4002C90660000000)
  %170 = tail call float @llvm.fmuladd.f32(float %164, float %169, float 0xBFF3A07EA0000000)
  %171 = tail call float @llvm.fmuladd.f32(float %164, float %170, float 0xBFABA546C0000000)
  %172 = tail call float @llvm.fmuladd.f32(float %164, float %171, float 0x3FF004E660000000)
  br label %180

173:                                              ; preds = %148
  %174 = tail call float @llvm.fmuladd.f32(float %164, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %175 = tail call float @llvm.fmuladd.f32(float %164, float %174, float 0xC02A112D80000000)
  %176 = tail call float @llvm.fmuladd.f32(float %164, float %175, float 0x401309D980000000)
  %177 = tail call float @llvm.fmuladd.f32(float %164, float %176, float 0xBFF9194880000000)
  %178 = tail call float @llvm.fmuladd.f32(float %164, float %177, float 0xBF9C084EC0000000)
  %179 = tail call float @llvm.fmuladd.f32(float %164, float %178, float 0x3FF00143E0000000)
  br label %180

180:                                              ; preds = %173, %166
  %181 = phi float [ %172, %166 ], [ %179, %173 ]
  %182 = fmul float %163, %181
  br label %183

183:                                              ; preds = %109, %119, %180
  %184 = phi float [ %116, %109 ], [ %147, %119 ], [ %182, %180 ]
  %185 = fcmp oeq float %36, 2.000000e+00
  %186 = fcmp oeq float %36, 0.000000e+00
  %187 = fcmp olt float %36, 0.000000e+00
  %188 = fcmp ogt float %36, 2.000000e+00
  %189 = or i1 %187, %188
  %190 = fmul float %184, 0xBFF6A09E60000000
  %191 = select i1 %189, float 0x7FF8000000000000, float %190
  %192 = select i1 %186, float 0xFFF0000000000000, float %191
  %193 = select i1 %185, float 0x7FF0000000000000, float %192
  %194 = add nsw i32 %17, %6
  %195 = mul nsw i32 %25, %7
  %196 = add nsw i32 %194, %195
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %5, i64 %197
  store float %193, float addrspace(1)* %198, align 4, !tbaa !7
  br label %199

199:                                              ; preds = %183, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
