; ModuleID = '../data/hip_kernels/3007/189/main.cu'
source_filename = "../data/hip_kernels/3007/189/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13uplo_erfc_inviiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %205

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %205

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fcmp ogt float %43, 6.250000e-01
  br i1 %44, label %45, label %124

45:                                               ; preds = %37
  %46 = fsub float 1.000000e+00, %43
  %47 = tail call float @llvm.fabs.f32(float %46)
  %48 = fcmp olt float %47, 3.750000e-01
  br i1 %48, label %49, label %57

49:                                               ; preds = %45
  %50 = fmul float %46, %46
  %51 = tail call float @llvm.fmuladd.f32(float %50, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float 0x3FB65B0B40000000)
  %53 = tail call float @llvm.fmuladd.f32(float %50, float %52, float 0x3FB5581AE0000000)
  %54 = tail call float @llvm.fmuladd.f32(float %50, float %53, float 0x3FC05AA560000000)
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %54, float 0x3FCDB27480000000)
  %56 = tail call float @llvm.fmuladd.f32(float %50, float %55, float 0x3FEC5BF8A0000000)
  br label %116

57:                                               ; preds = %45
  %58 = fneg float %47
  %59 = tail call float @llvm.fma.f32(float %58, float %47, float 1.000000e+00)
  %60 = tail call i1 @llvm.amdgcn.class.f32(float %59, i32 144)
  %61 = select i1 %60, float 0x41F0000000000000, float 1.000000e+00
  %62 = fmul float %59, %61
  %63 = tail call float @llvm.log2.f32(float %62)
  %64 = fmul float %63, 0x3FE62E42E0000000
  %65 = tail call i1 @llvm.amdgcn.class.f32(float %63, i32 519)
  %66 = fneg float %64
  %67 = tail call float @llvm.fma.f32(float %63, float 0x3FE62E42E0000000, float %66)
  %68 = tail call float @llvm.fma.f32(float %63, float 0x3E6EFA39E0000000, float %67)
  %69 = fadd float %64, %68
  %70 = select i1 %65, float %63, float %69
  %71 = select i1 %60, float 0x40362E4300000000, float 0.000000e+00
  %72 = fsub float %70, %71
  %73 = fcmp ogt float %72, -5.000000e+00
  br i1 %73, label %74, label %84

74:                                               ; preds = %57
  %75 = fsub float -2.500000e+00, %72
  %76 = tail call float @llvm.fmuladd.f32(float %75, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %77 = tail call float @llvm.fmuladd.f32(float %75, float %76, float 0xBECD8E6AE0000000)
  %78 = tail call float @llvm.fmuladd.f32(float %75, float %77, float 0xBED26B5820000000)
  %79 = tail call float @llvm.fmuladd.f32(float %75, float %78, float 0x3F2CA65B60000000)
  %80 = tail call float @llvm.fmuladd.f32(float %75, float %79, float 0xBF548A8100000000)
  %81 = tail call float @llvm.fmuladd.f32(float %75, float %80, float 0xBF711C9DE0000000)
  %82 = tail call float @llvm.fmuladd.f32(float %75, float %81, float 0x3FCF91EC60000000)
  %83 = tail call float @llvm.fmuladd.f32(float %75, float %82, float 0x3FF805C5E0000000)
  br label %116

84:                                               ; preds = %57
  %85 = fneg float %72
  %86 = fcmp ogt float %72, 0xB9F0000000000000
  %87 = select i1 %86, float 0x41F0000000000000, float 1.000000e+00
  %88 = fmul float %87, %85
  %89 = tail call float @llvm.sqrt.f32(float %88)
  %90 = bitcast float %89 to i32
  %91 = add nsw i32 %90, -1
  %92 = bitcast i32 %91 to float
  %93 = add nsw i32 %90, 1
  %94 = bitcast i32 %93 to float
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %95, float %89, float %88)
  %97 = fcmp ogt float %96, 0.000000e+00
  %98 = fneg float %92
  %99 = tail call float @llvm.fma.f32(float %98, float %89, float %88)
  %100 = fcmp ole float %99, 0.000000e+00
  %101 = select i1 %100, float %92, float %89
  %102 = select i1 %97, float %94, float %101
  %103 = select i1 %86, float 0x3EF0000000000000, float 1.000000e+00
  %104 = fmul float %103, %102
  %105 = tail call i1 @llvm.amdgcn.class.f32(float %88, i32 608)
  %106 = select i1 %105, float %88, float %104
  %107 = fadd float %106, -3.000000e+00
  %108 = tail call float @llvm.fmuladd.f32(float %107, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %109 = tail call float @llvm.fmuladd.f32(float %107, float %108, float 0x3F561B8E40000000)
  %110 = tail call float @llvm.fmuladd.f32(float %107, float %109, float 0xBF6E17BCE0000000)
  %111 = tail call float @llvm.fmuladd.f32(float %107, float %110, float 0x3F77824F60000000)
  %112 = tail call float @llvm.fmuladd.f32(float %107, float %111, float 0xBF7F38BAE0000000)
  %113 = tail call float @llvm.fmuladd.f32(float %107, float %112, float 0x3F8354AFC0000000)
  %114 = tail call float @llvm.fmuladd.f32(float %107, float %113, float 0x3FF006DB60000000)
  %115 = tail call float @llvm.fmuladd.f32(float %107, float %114, float 0x4006A9EFC0000000)
  br label %116

116:                                              ; preds = %84, %74, %49
  %117 = phi float [ %56, %49 ], [ %83, %74 ], [ %115, %84 ]
  %118 = fmul float %47, %117
  %119 = fcmp ogt float %47, 1.000000e+00
  %120 = select i1 %119, float 0x7FF8000000000000, float %118
  %121 = fcmp oeq float %47, 1.000000e+00
  %122 = select i1 %121, float 0x7FF0000000000000, float %120
  %123 = tail call float @llvm.copysign.f32(float %122, float %46)
  br label %190

124:                                              ; preds = %37
  %125 = fcmp ogt float %43, 0x3F50000000000000
  br i1 %125, label %126, label %155

126:                                              ; preds = %124
  %127 = fsub float 2.000000e+00, %43
  %128 = fmul float %43, %127
  %129 = tail call i1 @llvm.amdgcn.class.f32(float %128, i32 144)
  %130 = select i1 %129, float 0x41F0000000000000, float 1.000000e+00
  %131 = fmul float %128, %130
  %132 = tail call float @llvm.log2.f32(float %131)
  %133 = fmul float %132, 0x3FE62E42E0000000
  %134 = tail call i1 @llvm.amdgcn.class.f32(float %132, i32 519)
  %135 = fneg float %133
  %136 = tail call float @llvm.fma.f32(float %132, float 0x3FE62E42E0000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %132, float 0x3E6EFA39E0000000, float %136)
  %138 = fadd float %133, %137
  %139 = select i1 %134, float %132, float %138
  %140 = select i1 %129, float 0x40362E4300000000, float 0.000000e+00
  %141 = fsub float %140, %139
  %142 = fadd float %141, -3.125000e+00
  %143 = tail call float @llvm.fmuladd.f32(float %142, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %144 = tail call float @llvm.fmuladd.f32(float %142, float %143, float 0xBE5B638F00000000)
  %145 = tail call float @llvm.fmuladd.f32(float %142, float %144, float 0x3E9C9CCC60000000)
  %146 = tail call float @llvm.fmuladd.f32(float %142, float %145, float 0xBEB72F8AE0000000)
  %147 = tail call float @llvm.fmuladd.f32(float %142, float %146, float 0xBEED21AA60000000)
  %148 = tail call float @llvm.fmuladd.f32(float %142, float %147, float 0x3F287AEBC0000000)
  %149 = tail call float @llvm.fmuladd.f32(float %142, float %148, float 0xBF48455D40000000)
  %150 = tail call float @llvm.fmuladd.f32(float %142, float %149, float 0xBF78B6CA40000000)
  %151 = tail call float @llvm.fmuladd.f32(float %142, float %150, float 0x3FCEBD80C0000000)
  %152 = tail call float @llvm.fmuladd.f32(float %142, float %151, float 0x3FFA755E80000000)
  %153 = fneg float %43
  %154 = tail call float @llvm.fmuladd.f32(float %153, float %152, float %152)
  br label %190

155:                                              ; preds = %124
  %156 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 144)
  %157 = select i1 %156, float 0x41F0000000000000, float 1.000000e+00
  %158 = fmul float %43, %157
  %159 = tail call float @llvm.log2.f32(float %158)
  %160 = fmul float %159, 0x3FE62E42E0000000
  %161 = tail call i1 @llvm.amdgcn.class.f32(float %159, i32 519)
  %162 = fneg float %160
  %163 = tail call float @llvm.fma.f32(float %159, float 0x3FE62E42E0000000, float %162)
  %164 = tail call float @llvm.fma.f32(float %159, float 0x3E6EFA39E0000000, float %163)
  %165 = fadd float %160, %164
  %166 = select i1 %161, float %159, float %165
  %167 = select i1 %156, float 0x40362E4300000000, float 0.000000e+00
  %168 = fsub float %166, %167
  %169 = fneg float %168
  %170 = tail call float @llvm.sqrt.f32(float %169)
  %171 = tail call float @llvm.amdgcn.rcp.f32(float %170)
  %172 = fcmp ogt float %43, 0x3D50000000000000
  br i1 %172, label %173, label %180

173:                                              ; preds = %155
  %174 = tail call float @llvm.fmuladd.f32(float %171, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %175 = tail call float @llvm.fmuladd.f32(float %171, float %174, float 0xC0098DD400000000)
  %176 = tail call float @llvm.fmuladd.f32(float %171, float %175, float 0x4002C90660000000)
  %177 = tail call float @llvm.fmuladd.f32(float %171, float %176, float 0xBFF3A07EA0000000)
  %178 = tail call float @llvm.fmuladd.f32(float %171, float %177, float 0xBFABA546C0000000)
  %179 = tail call float @llvm.fmuladd.f32(float %171, float %178, float 0x3FF004E660000000)
  br label %187

180:                                              ; preds = %155
  %181 = tail call float @llvm.fmuladd.f32(float %171, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %182 = tail call float @llvm.fmuladd.f32(float %171, float %181, float 0xC02A112D80000000)
  %183 = tail call float @llvm.fmuladd.f32(float %171, float %182, float 0x401309D980000000)
  %184 = tail call float @llvm.fmuladd.f32(float %171, float %183, float 0xBFF9194880000000)
  %185 = tail call float @llvm.fmuladd.f32(float %171, float %184, float 0xBF9C084EC0000000)
  %186 = tail call float @llvm.fmuladd.f32(float %171, float %185, float 0x3FF00143E0000000)
  br label %187

187:                                              ; preds = %180, %173
  %188 = phi float [ %179, %173 ], [ %186, %180 ]
  %189 = fmul float %170, %188
  br label %190

190:                                              ; preds = %116, %126, %187
  %191 = phi float [ %123, %116 ], [ %154, %126 ], [ %189, %187 ]
  %192 = fcmp oeq float %43, 2.000000e+00
  %193 = fcmp oeq float %43, 0.000000e+00
  %194 = fcmp olt float %43, 0.000000e+00
  %195 = fcmp ogt float %43, 2.000000e+00
  %196 = or i1 %194, %195
  %197 = select i1 %196, float 0x7FF8000000000000, float %191
  %198 = select i1 %193, float 0x7FF0000000000000, float %197
  %199 = select i1 %192, float 0xFFF0000000000000, float %198
  %200 = add nsw i32 %18, %7
  %201 = mul nsw i32 %26, %8
  %202 = add nsw i32 %200, %201
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %6, i64 %203
  store float %199, float addrspace(1)* %204, align 4, !tbaa !7
  br label %205

205:                                              ; preds = %9, %190, %30
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
