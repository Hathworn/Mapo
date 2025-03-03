; ModuleID = '../data/hip_kernels/3007/191/main.cu'
source_filename = "../data/hip_kernels/3007/191/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17uplo_cdf_norm_inviiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %207

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %207

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fadd float %43, %43
  %45 = fcmp ogt float %44, 6.250000e-01
  br i1 %45, label %46, label %125

46:                                               ; preds = %37
  %47 = fsub float 1.000000e+00, %44
  %48 = tail call float @llvm.fabs.f32(float %47)
  %49 = fcmp olt float %48, 3.750000e-01
  br i1 %49, label %50, label %58

50:                                               ; preds = %46
  %51 = fmul float %47, %47
  %52 = tail call float @llvm.fmuladd.f32(float %51, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %53 = tail call float @llvm.fmuladd.f32(float %51, float %52, float 0x3FB65B0B40000000)
  %54 = tail call float @llvm.fmuladd.f32(float %51, float %53, float 0x3FB5581AE0000000)
  %55 = tail call float @llvm.fmuladd.f32(float %51, float %54, float 0x3FC05AA560000000)
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %55, float 0x3FCDB27480000000)
  %57 = tail call float @llvm.fmuladd.f32(float %51, float %56, float 0x3FEC5BF8A0000000)
  br label %117

58:                                               ; preds = %46
  %59 = fneg float %48
  %60 = tail call float @llvm.fma.f32(float %59, float %48, float 1.000000e+00)
  %61 = tail call i1 @llvm.amdgcn.class.f32(float %60, i32 144)
  %62 = select i1 %61, float 0x41F0000000000000, float 1.000000e+00
  %63 = fmul float %60, %62
  %64 = tail call float @llvm.log2.f32(float %63)
  %65 = fmul float %64, 0x3FE62E42E0000000
  %66 = tail call i1 @llvm.amdgcn.class.f32(float %64, i32 519)
  %67 = fneg float %65
  %68 = tail call float @llvm.fma.f32(float %64, float 0x3FE62E42E0000000, float %67)
  %69 = tail call float @llvm.fma.f32(float %64, float 0x3E6EFA39E0000000, float %68)
  %70 = fadd float %65, %69
  %71 = select i1 %66, float %64, float %70
  %72 = select i1 %61, float 0x40362E4300000000, float 0.000000e+00
  %73 = fsub float %71, %72
  %74 = fcmp ogt float %73, -5.000000e+00
  br i1 %74, label %75, label %85

75:                                               ; preds = %58
  %76 = fsub float -2.500000e+00, %73
  %77 = tail call float @llvm.fmuladd.f32(float %76, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %78 = tail call float @llvm.fmuladd.f32(float %76, float %77, float 0xBECD8E6AE0000000)
  %79 = tail call float @llvm.fmuladd.f32(float %76, float %78, float 0xBED26B5820000000)
  %80 = tail call float @llvm.fmuladd.f32(float %76, float %79, float 0x3F2CA65B60000000)
  %81 = tail call float @llvm.fmuladd.f32(float %76, float %80, float 0xBF548A8100000000)
  %82 = tail call float @llvm.fmuladd.f32(float %76, float %81, float 0xBF711C9DE0000000)
  %83 = tail call float @llvm.fmuladd.f32(float %76, float %82, float 0x3FCF91EC60000000)
  %84 = tail call float @llvm.fmuladd.f32(float %76, float %83, float 0x3FF805C5E0000000)
  br label %117

85:                                               ; preds = %58
  %86 = fneg float %73
  %87 = fcmp ogt float %73, 0xB9F0000000000000
  %88 = select i1 %87, float 0x41F0000000000000, float 1.000000e+00
  %89 = fmul float %88, %86
  %90 = tail call float @llvm.sqrt.f32(float %89)
  %91 = bitcast float %90 to i32
  %92 = add nsw i32 %91, -1
  %93 = bitcast i32 %92 to float
  %94 = add nsw i32 %91, 1
  %95 = bitcast i32 %94 to float
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %96, float %90, float %89)
  %98 = fcmp ogt float %97, 0.000000e+00
  %99 = fneg float %93
  %100 = tail call float @llvm.fma.f32(float %99, float %90, float %89)
  %101 = fcmp ole float %100, 0.000000e+00
  %102 = select i1 %101, float %93, float %90
  %103 = select i1 %98, float %95, float %102
  %104 = select i1 %87, float 0x3EF0000000000000, float 1.000000e+00
  %105 = fmul float %104, %103
  %106 = tail call i1 @llvm.amdgcn.class.f32(float %89, i32 608)
  %107 = select i1 %106, float %89, float %105
  %108 = fadd float %107, -3.000000e+00
  %109 = tail call float @llvm.fmuladd.f32(float %108, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %110 = tail call float @llvm.fmuladd.f32(float %108, float %109, float 0x3F561B8E40000000)
  %111 = tail call float @llvm.fmuladd.f32(float %108, float %110, float 0xBF6E17BCE0000000)
  %112 = tail call float @llvm.fmuladd.f32(float %108, float %111, float 0x3F77824F60000000)
  %113 = tail call float @llvm.fmuladd.f32(float %108, float %112, float 0xBF7F38BAE0000000)
  %114 = tail call float @llvm.fmuladd.f32(float %108, float %113, float 0x3F8354AFC0000000)
  %115 = tail call float @llvm.fmuladd.f32(float %108, float %114, float 0x3FF006DB60000000)
  %116 = tail call float @llvm.fmuladd.f32(float %108, float %115, float 0x4006A9EFC0000000)
  br label %117

117:                                              ; preds = %85, %75, %50
  %118 = phi float [ %57, %50 ], [ %84, %75 ], [ %116, %85 ]
  %119 = fmul float %48, %118
  %120 = fcmp ogt float %48, 1.000000e+00
  %121 = select i1 %120, float 0x7FF8000000000000, float %119
  %122 = fcmp oeq float %48, 1.000000e+00
  %123 = select i1 %122, float 0x7FF0000000000000, float %121
  %124 = tail call float @llvm.copysign.f32(float %123, float %47)
  br label %191

125:                                              ; preds = %37
  %126 = fcmp ogt float %44, 0x3F50000000000000
  br i1 %126, label %127, label %156

127:                                              ; preds = %125
  %128 = fsub float 2.000000e+00, %44
  %129 = fmul float %44, %128
  %130 = tail call i1 @llvm.amdgcn.class.f32(float %129, i32 144)
  %131 = select i1 %130, float 0x41F0000000000000, float 1.000000e+00
  %132 = fmul float %129, %131
  %133 = tail call float @llvm.log2.f32(float %132)
  %134 = fmul float %133, 0x3FE62E42E0000000
  %135 = tail call i1 @llvm.amdgcn.class.f32(float %133, i32 519)
  %136 = fneg float %134
  %137 = tail call float @llvm.fma.f32(float %133, float 0x3FE62E42E0000000, float %136)
  %138 = tail call float @llvm.fma.f32(float %133, float 0x3E6EFA39E0000000, float %137)
  %139 = fadd float %134, %138
  %140 = select i1 %135, float %133, float %139
  %141 = select i1 %130, float 0x40362E4300000000, float 0.000000e+00
  %142 = fsub float %141, %140
  %143 = fadd float %142, -3.125000e+00
  %144 = tail call float @llvm.fmuladd.f32(float %143, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %145 = tail call float @llvm.fmuladd.f32(float %143, float %144, float 0xBE5B638F00000000)
  %146 = tail call float @llvm.fmuladd.f32(float %143, float %145, float 0x3E9C9CCC60000000)
  %147 = tail call float @llvm.fmuladd.f32(float %143, float %146, float 0xBEB72F8AE0000000)
  %148 = tail call float @llvm.fmuladd.f32(float %143, float %147, float 0xBEED21AA60000000)
  %149 = tail call float @llvm.fmuladd.f32(float %143, float %148, float 0x3F287AEBC0000000)
  %150 = tail call float @llvm.fmuladd.f32(float %143, float %149, float 0xBF48455D40000000)
  %151 = tail call float @llvm.fmuladd.f32(float %143, float %150, float 0xBF78B6CA40000000)
  %152 = tail call float @llvm.fmuladd.f32(float %143, float %151, float 0x3FCEBD80C0000000)
  %153 = tail call float @llvm.fmuladd.f32(float %143, float %152, float 0x3FFA755E80000000)
  %154 = fneg float %44
  %155 = tail call float @llvm.fmuladd.f32(float %154, float %153, float %153)
  br label %191

156:                                              ; preds = %125
  %157 = tail call i1 @llvm.amdgcn.class.f32(float %44, i32 144)
  %158 = select i1 %157, float 0x41F0000000000000, float 1.000000e+00
  %159 = fmul float %44, %158
  %160 = tail call float @llvm.log2.f32(float %159)
  %161 = fmul float %160, 0x3FE62E42E0000000
  %162 = tail call i1 @llvm.amdgcn.class.f32(float %160, i32 519)
  %163 = fneg float %161
  %164 = tail call float @llvm.fma.f32(float %160, float 0x3FE62E42E0000000, float %163)
  %165 = tail call float @llvm.fma.f32(float %160, float 0x3E6EFA39E0000000, float %164)
  %166 = fadd float %161, %165
  %167 = select i1 %162, float %160, float %166
  %168 = select i1 %157, float 0x40362E4300000000, float 0.000000e+00
  %169 = fsub float %167, %168
  %170 = fneg float %169
  %171 = tail call float @llvm.sqrt.f32(float %170)
  %172 = tail call float @llvm.amdgcn.rcp.f32(float %171)
  %173 = fcmp ogt float %44, 0x3D50000000000000
  br i1 %173, label %174, label %181

174:                                              ; preds = %156
  %175 = tail call float @llvm.fmuladd.f32(float %172, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %176 = tail call float @llvm.fmuladd.f32(float %172, float %175, float 0xC0098DD400000000)
  %177 = tail call float @llvm.fmuladd.f32(float %172, float %176, float 0x4002C90660000000)
  %178 = tail call float @llvm.fmuladd.f32(float %172, float %177, float 0xBFF3A07EA0000000)
  %179 = tail call float @llvm.fmuladd.f32(float %172, float %178, float 0xBFABA546C0000000)
  %180 = tail call float @llvm.fmuladd.f32(float %172, float %179, float 0x3FF004E660000000)
  br label %188

181:                                              ; preds = %156
  %182 = tail call float @llvm.fmuladd.f32(float %172, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %183 = tail call float @llvm.fmuladd.f32(float %172, float %182, float 0xC02A112D80000000)
  %184 = tail call float @llvm.fmuladd.f32(float %172, float %183, float 0x401309D980000000)
  %185 = tail call float @llvm.fmuladd.f32(float %172, float %184, float 0xBFF9194880000000)
  %186 = tail call float @llvm.fmuladd.f32(float %172, float %185, float 0xBF9C084EC0000000)
  %187 = tail call float @llvm.fmuladd.f32(float %172, float %186, float 0x3FF00143E0000000)
  br label %188

188:                                              ; preds = %181, %174
  %189 = phi float [ %180, %174 ], [ %187, %181 ]
  %190 = fmul float %171, %189
  br label %191

191:                                              ; preds = %117, %127, %188
  %192 = phi float [ %124, %117 ], [ %155, %127 ], [ %190, %188 ]
  %193 = fcmp oeq float %44, 2.000000e+00
  %194 = fcmp oeq float %44, 0.000000e+00
  %195 = fcmp olt float %44, 0.000000e+00
  %196 = fcmp ogt float %44, 2.000000e+00
  %197 = or i1 %195, %196
  %198 = fmul float %192, 0xBFF6A09E60000000
  %199 = select i1 %197, float 0x7FF8000000000000, float %198
  %200 = select i1 %194, float 0xFFF0000000000000, float %199
  %201 = select i1 %193, float 0x7FF0000000000000, float %200
  %202 = add nsw i32 %18, %7
  %203 = mul nsw i32 %26, %8
  %204 = add nsw i32 %202, %203
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %6, i64 %205
  store float %201, float addrspace(1)* %206, align 4, !tbaa !7
  br label %207

207:                                              ; preds = %9, %191, %30
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
