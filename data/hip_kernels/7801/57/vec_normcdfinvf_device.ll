; ModuleID = '../data/hip_kernels/7801/57/main.cu'
source_filename = "../data/hip_kernels/7801/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_normcdfinvf(i64 %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %14, label %15, label %177

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fadd float %17, %17
  %19 = fcmp ogt float %18, 6.250000e-01
  br i1 %19, label %20, label %99

20:                                               ; preds = %15
  %21 = fsub float 1.000000e+00, %18
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = fcmp olt float %22, 3.750000e-01
  br i1 %23, label %24, label %32

24:                                               ; preds = %20
  %25 = fmul float %21, %21
  %26 = tail call float @llvm.fmuladd.f32(float %25, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %27 = tail call float @llvm.fmuladd.f32(float %25, float %26, float 0x3FB65B0B40000000)
  %28 = tail call float @llvm.fmuladd.f32(float %25, float %27, float 0x3FB5581AE0000000)
  %29 = tail call float @llvm.fmuladd.f32(float %25, float %28, float 0x3FC05AA560000000)
  %30 = tail call float @llvm.fmuladd.f32(float %25, float %29, float 0x3FCDB27480000000)
  %31 = tail call float @llvm.fmuladd.f32(float %25, float %30, float 0x3FEC5BF8A0000000)
  br label %91

32:                                               ; preds = %20
  %33 = fneg float %22
  %34 = tail call float @llvm.fma.f32(float %33, float %22, float 1.000000e+00)
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %34, i32 144)
  %36 = select i1 %35, float 0x41F0000000000000, float 1.000000e+00
  %37 = fmul float %34, %36
  %38 = tail call float @llvm.log2.f32(float %37)
  %39 = fmul float %38, 0x3FE62E42E0000000
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %38, i32 519)
  %41 = fneg float %39
  %42 = tail call float @llvm.fma.f32(float %38, float 0x3FE62E42E0000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %38, float 0x3E6EFA39E0000000, float %42)
  %44 = fadd float %39, %43
  %45 = select i1 %40, float %38, float %44
  %46 = select i1 %35, float 0x40362E4300000000, float 0.000000e+00
  %47 = fsub float %45, %46
  %48 = fcmp ogt float %47, -5.000000e+00
  br i1 %48, label %49, label %59

49:                                               ; preds = %32
  %50 = fsub float -2.500000e+00, %47
  %51 = tail call float @llvm.fmuladd.f32(float %50, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %52 = tail call float @llvm.fmuladd.f32(float %50, float %51, float 0xBECD8E6AE0000000)
  %53 = tail call float @llvm.fmuladd.f32(float %50, float %52, float 0xBED26B5820000000)
  %54 = tail call float @llvm.fmuladd.f32(float %50, float %53, float 0x3F2CA65B60000000)
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %54, float 0xBF548A8100000000)
  %56 = tail call float @llvm.fmuladd.f32(float %50, float %55, float 0xBF711C9DE0000000)
  %57 = tail call float @llvm.fmuladd.f32(float %50, float %56, float 0x3FCF91EC60000000)
  %58 = tail call float @llvm.fmuladd.f32(float %50, float %57, float 0x3FF805C5E0000000)
  br label %91

59:                                               ; preds = %32
  %60 = fneg float %47
  %61 = fcmp ogt float %47, 0xB9F0000000000000
  %62 = select i1 %61, float 0x41F0000000000000, float 1.000000e+00
  %63 = fmul float %62, %60
  %64 = tail call float @llvm.sqrt.f32(float %63)
  %65 = bitcast float %64 to i32
  %66 = add nsw i32 %65, -1
  %67 = bitcast i32 %66 to float
  %68 = add nsw i32 %65, 1
  %69 = bitcast i32 %68 to float
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %70, float %64, float %63)
  %72 = fcmp ogt float %71, 0.000000e+00
  %73 = fneg float %67
  %74 = tail call float @llvm.fma.f32(float %73, float %64, float %63)
  %75 = fcmp ole float %74, 0.000000e+00
  %76 = select i1 %75, float %67, float %64
  %77 = select i1 %72, float %69, float %76
  %78 = select i1 %61, float 0x3EF0000000000000, float 1.000000e+00
  %79 = fmul float %78, %77
  %80 = tail call i1 @llvm.amdgcn.class.f32(float %63, i32 608)
  %81 = select i1 %80, float %63, float %79
  %82 = fadd float %81, -3.000000e+00
  %83 = tail call float @llvm.fmuladd.f32(float %82, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %84 = tail call float @llvm.fmuladd.f32(float %82, float %83, float 0x3F561B8E40000000)
  %85 = tail call float @llvm.fmuladd.f32(float %82, float %84, float 0xBF6E17BCE0000000)
  %86 = tail call float @llvm.fmuladd.f32(float %82, float %85, float 0x3F77824F60000000)
  %87 = tail call float @llvm.fmuladd.f32(float %82, float %86, float 0xBF7F38BAE0000000)
  %88 = tail call float @llvm.fmuladd.f32(float %82, float %87, float 0x3F8354AFC0000000)
  %89 = tail call float @llvm.fmuladd.f32(float %82, float %88, float 0x3FF006DB60000000)
  %90 = tail call float @llvm.fmuladd.f32(float %82, float %89, float 0x4006A9EFC0000000)
  br label %91

91:                                               ; preds = %59, %49, %24
  %92 = phi float [ %31, %24 ], [ %58, %49 ], [ %90, %59 ]
  %93 = fmul float %22, %92
  %94 = fcmp ogt float %22, 1.000000e+00
  %95 = select i1 %94, float 0x7FF8000000000000, float %93
  %96 = fcmp oeq float %22, 1.000000e+00
  %97 = select i1 %96, float 0x7FF0000000000000, float %95
  %98 = tail call float @llvm.copysign.f32(float %97, float %21)
  br label %165

99:                                               ; preds = %15
  %100 = fcmp ogt float %18, 0x3F50000000000000
  br i1 %100, label %101, label %130

101:                                              ; preds = %99
  %102 = fsub float 2.000000e+00, %18
  %103 = fmul float %18, %102
  %104 = tail call i1 @llvm.amdgcn.class.f32(float %103, i32 144)
  %105 = select i1 %104, float 0x41F0000000000000, float 1.000000e+00
  %106 = fmul float %103, %105
  %107 = tail call float @llvm.log2.f32(float %106)
  %108 = fmul float %107, 0x3FE62E42E0000000
  %109 = tail call i1 @llvm.amdgcn.class.f32(float %107, i32 519)
  %110 = fneg float %108
  %111 = tail call float @llvm.fma.f32(float %107, float 0x3FE62E42E0000000, float %110)
  %112 = tail call float @llvm.fma.f32(float %107, float 0x3E6EFA39E0000000, float %111)
  %113 = fadd float %108, %112
  %114 = select i1 %109, float %107, float %113
  %115 = select i1 %104, float 0x40362E4300000000, float 0.000000e+00
  %116 = fsub float %115, %114
  %117 = fadd float %116, -3.125000e+00
  %118 = tail call float @llvm.fmuladd.f32(float %117, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %119 = tail call float @llvm.fmuladd.f32(float %117, float %118, float 0xBE5B638F00000000)
  %120 = tail call float @llvm.fmuladd.f32(float %117, float %119, float 0x3E9C9CCC60000000)
  %121 = tail call float @llvm.fmuladd.f32(float %117, float %120, float 0xBEB72F8AE0000000)
  %122 = tail call float @llvm.fmuladd.f32(float %117, float %121, float 0xBEED21AA60000000)
  %123 = tail call float @llvm.fmuladd.f32(float %117, float %122, float 0x3F287AEBC0000000)
  %124 = tail call float @llvm.fmuladd.f32(float %117, float %123, float 0xBF48455D40000000)
  %125 = tail call float @llvm.fmuladd.f32(float %117, float %124, float 0xBF78B6CA40000000)
  %126 = tail call float @llvm.fmuladd.f32(float %117, float %125, float 0x3FCEBD80C0000000)
  %127 = tail call float @llvm.fmuladd.f32(float %117, float %126, float 0x3FFA755E80000000)
  %128 = fneg float %18
  %129 = tail call float @llvm.fmuladd.f32(float %128, float %127, float %127)
  br label %165

130:                                              ; preds = %99
  %131 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %132 = select i1 %131, float 0x41F0000000000000, float 1.000000e+00
  %133 = fmul float %18, %132
  %134 = tail call float @llvm.log2.f32(float %133)
  %135 = fmul float %134, 0x3FE62E42E0000000
  %136 = tail call i1 @llvm.amdgcn.class.f32(float %134, i32 519)
  %137 = fneg float %135
  %138 = tail call float @llvm.fma.f32(float %134, float 0x3FE62E42E0000000, float %137)
  %139 = tail call float @llvm.fma.f32(float %134, float 0x3E6EFA39E0000000, float %138)
  %140 = fadd float %135, %139
  %141 = select i1 %136, float %134, float %140
  %142 = select i1 %131, float 0x40362E4300000000, float 0.000000e+00
  %143 = fsub float %141, %142
  %144 = fneg float %143
  %145 = tail call float @llvm.sqrt.f32(float %144)
  %146 = tail call float @llvm.amdgcn.rcp.f32(float %145)
  %147 = fcmp ogt float %18, 0x3D50000000000000
  br i1 %147, label %148, label %155

148:                                              ; preds = %130
  %149 = tail call float @llvm.fmuladd.f32(float %146, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %150 = tail call float @llvm.fmuladd.f32(float %146, float %149, float 0xC0098DD400000000)
  %151 = tail call float @llvm.fmuladd.f32(float %146, float %150, float 0x4002C90660000000)
  %152 = tail call float @llvm.fmuladd.f32(float %146, float %151, float 0xBFF3A07EA0000000)
  %153 = tail call float @llvm.fmuladd.f32(float %146, float %152, float 0xBFABA546C0000000)
  %154 = tail call float @llvm.fmuladd.f32(float %146, float %153, float 0x3FF004E660000000)
  br label %162

155:                                              ; preds = %130
  %156 = tail call float @llvm.fmuladd.f32(float %146, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %157 = tail call float @llvm.fmuladd.f32(float %146, float %156, float 0xC02A112D80000000)
  %158 = tail call float @llvm.fmuladd.f32(float %146, float %157, float 0x401309D980000000)
  %159 = tail call float @llvm.fmuladd.f32(float %146, float %158, float 0xBFF9194880000000)
  %160 = tail call float @llvm.fmuladd.f32(float %146, float %159, float 0xBF9C084EC0000000)
  %161 = tail call float @llvm.fmuladd.f32(float %146, float %160, float 0x3FF00143E0000000)
  br label %162

162:                                              ; preds = %155, %148
  %163 = phi float [ %154, %148 ], [ %161, %155 ]
  %164 = fmul float %145, %163
  br label %165

165:                                              ; preds = %91, %101, %162
  %166 = phi float [ %98, %91 ], [ %129, %101 ], [ %164, %162 ]
  %167 = fcmp oeq float %18, 2.000000e+00
  %168 = fcmp oeq float %18, 0.000000e+00
  %169 = fcmp olt float %18, 0.000000e+00
  %170 = fcmp ogt float %18, 2.000000e+00
  %171 = or i1 %169, %170
  %172 = fmul float %166, 0xBFF6A09E60000000
  %173 = select i1 %171, float 0x7FF8000000000000, float %172
  %174 = select i1 %168, float 0xFFF0000000000000, float %173
  %175 = select i1 %167, float 0x7FF0000000000000, float %174
  %176 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %175, float addrspace(1)* %176, align 4, !tbaa !7
  br label %177

177:                                              ; preds = %165, %3
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
