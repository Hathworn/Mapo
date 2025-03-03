; ModuleID = '../data/hip_kernels/3007/128/main.cu'
source_filename = "../data/hip_kernels/3007/128/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11ge_erfc_inviiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %197

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fcmp ogt float %35, 6.250000e-01
  br i1 %36, label %37, label %116

37:                                               ; preds = %29
  %38 = fsub float 1.000000e+00, %35
  %39 = tail call float @llvm.fabs.f32(float %38)
  %40 = fcmp olt float %39, 3.750000e-01
  br i1 %40, label %41, label %49

41:                                               ; preds = %37
  %42 = fmul float %38, %38
  %43 = tail call float @llvm.fmuladd.f32(float %42, float 0x3FC48B6CA0000000, float 0xBF9A2930A0000000)
  %44 = tail call float @llvm.fmuladd.f32(float %42, float %43, float 0x3FB65B0B40000000)
  %45 = tail call float @llvm.fmuladd.f32(float %42, float %44, float 0x3FB5581AE0000000)
  %46 = tail call float @llvm.fmuladd.f32(float %42, float %45, float 0x3FC05AA560000000)
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %46, float 0x3FCDB27480000000)
  %48 = tail call float @llvm.fmuladd.f32(float %42, float %47, float 0x3FEC5BF8A0000000)
  br label %108

49:                                               ; preds = %37
  %50 = fneg float %39
  %51 = tail call float @llvm.fma.f32(float %50, float %39, float 1.000000e+00)
  %52 = tail call i1 @llvm.amdgcn.class.f32(float %51, i32 144)
  %53 = select i1 %52, float 0x41F0000000000000, float 1.000000e+00
  %54 = fmul float %51, %53
  %55 = tail call float @llvm.log2.f32(float %54)
  %56 = fmul float %55, 0x3FE62E42E0000000
  %57 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 519)
  %58 = fneg float %56
  %59 = tail call float @llvm.fma.f32(float %55, float 0x3FE62E42E0000000, float %58)
  %60 = tail call float @llvm.fma.f32(float %55, float 0x3E6EFA39E0000000, float %59)
  %61 = fadd float %56, %60
  %62 = select i1 %57, float %55, float %61
  %63 = select i1 %52, float 0x40362E4300000000, float 0.000000e+00
  %64 = fsub float %62, %63
  %65 = fcmp ogt float %64, -5.000000e+00
  br i1 %65, label %66, label %76

66:                                               ; preds = %49
  %67 = fsub float -2.500000e+00, %64
  %68 = tail call float @llvm.fmuladd.f32(float %67, float 0x3E5E2CB100000000, float 0x3E970966C0000000)
  %69 = tail call float @llvm.fmuladd.f32(float %67, float %68, float 0xBECD8E6AE0000000)
  %70 = tail call float @llvm.fmuladd.f32(float %67, float %69, float 0xBED26B5820000000)
  %71 = tail call float @llvm.fmuladd.f32(float %67, float %70, float 0x3F2CA65B60000000)
  %72 = tail call float @llvm.fmuladd.f32(float %67, float %71, float 0xBF548A8100000000)
  %73 = tail call float @llvm.fmuladd.f32(float %67, float %72, float 0xBF711C9DE0000000)
  %74 = tail call float @llvm.fmuladd.f32(float %67, float %73, float 0x3FCF91EC60000000)
  %75 = tail call float @llvm.fmuladd.f32(float %67, float %74, float 0x3FF805C5E0000000)
  br label %108

76:                                               ; preds = %49
  %77 = fneg float %64
  %78 = fcmp ogt float %64, 0xB9F0000000000000
  %79 = select i1 %78, float 0x41F0000000000000, float 1.000000e+00
  %80 = fmul float %79, %77
  %81 = tail call float @llvm.sqrt.f32(float %80)
  %82 = bitcast float %81 to i32
  %83 = add nsw i32 %82, -1
  %84 = bitcast i32 %83 to float
  %85 = add nsw i32 %82, 1
  %86 = bitcast i32 %85 to float
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %87, float %81, float %80)
  %89 = fcmp ogt float %88, 0.000000e+00
  %90 = fneg float %84
  %91 = tail call float @llvm.fma.f32(float %90, float %81, float %80)
  %92 = fcmp ole float %91, 0.000000e+00
  %93 = select i1 %92, float %84, float %81
  %94 = select i1 %89, float %86, float %93
  %95 = select i1 %78, float 0x3EF0000000000000, float 1.000000e+00
  %96 = fmul float %95, %94
  %97 = tail call i1 @llvm.amdgcn.class.f32(float %80, i32 608)
  %98 = select i1 %97, float %80, float %96
  %99 = fadd float %98, -3.000000e+00
  %100 = tail call float @llvm.fmuladd.f32(float %99, float 0xBF2A3E1360000000, float 0x3F1A76AD60000000)
  %101 = tail call float @llvm.fmuladd.f32(float %99, float %100, float 0x3F561B8E40000000)
  %102 = tail call float @llvm.fmuladd.f32(float %99, float %101, float 0xBF6E17BCE0000000)
  %103 = tail call float @llvm.fmuladd.f32(float %99, float %102, float 0x3F77824F60000000)
  %104 = tail call float @llvm.fmuladd.f32(float %99, float %103, float 0xBF7F38BAE0000000)
  %105 = tail call float @llvm.fmuladd.f32(float %99, float %104, float 0x3F8354AFC0000000)
  %106 = tail call float @llvm.fmuladd.f32(float %99, float %105, float 0x3FF006DB60000000)
  %107 = tail call float @llvm.fmuladd.f32(float %99, float %106, float 0x4006A9EFC0000000)
  br label %108

108:                                              ; preds = %76, %66, %41
  %109 = phi float [ %48, %41 ], [ %75, %66 ], [ %107, %76 ]
  %110 = fmul float %39, %109
  %111 = fcmp ogt float %39, 1.000000e+00
  %112 = select i1 %111, float 0x7FF8000000000000, float %110
  %113 = fcmp oeq float %39, 1.000000e+00
  %114 = select i1 %113, float 0x7FF0000000000000, float %112
  %115 = tail call float @llvm.copysign.f32(float %114, float %38)
  br label %182

116:                                              ; preds = %29
  %117 = fcmp ogt float %35, 0x3F50000000000000
  br i1 %117, label %118, label %147

118:                                              ; preds = %116
  %119 = fsub float 2.000000e+00, %35
  %120 = fmul float %35, %119
  %121 = tail call i1 @llvm.amdgcn.class.f32(float %120, i32 144)
  %122 = select i1 %121, float 0x41F0000000000000, float 1.000000e+00
  %123 = fmul float %120, %122
  %124 = tail call float @llvm.log2.f32(float %123)
  %125 = fmul float %124, 0x3FE62E42E0000000
  %126 = tail call i1 @llvm.amdgcn.class.f32(float %124, i32 519)
  %127 = fneg float %125
  %128 = tail call float @llvm.fma.f32(float %124, float 0x3FE62E42E0000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %124, float 0x3E6EFA39E0000000, float %128)
  %130 = fadd float %125, %129
  %131 = select i1 %126, float %124, float %130
  %132 = select i1 %121, float 0x40362E4300000000, float 0.000000e+00
  %133 = fsub float %132, %131
  %134 = fadd float %133, -3.125000e+00
  %135 = tail call float @llvm.fmuladd.f32(float %134, float 0x3E07EE6620000000, float 0xBE33F5A800000000)
  %136 = tail call float @llvm.fmuladd.f32(float %134, float %135, float 0xBE5B638F00000000)
  %137 = tail call float @llvm.fmuladd.f32(float %134, float %136, float 0x3E9C9CCC60000000)
  %138 = tail call float @llvm.fmuladd.f32(float %134, float %137, float 0xBEB72F8AE0000000)
  %139 = tail call float @llvm.fmuladd.f32(float %134, float %138, float 0xBEED21AA60000000)
  %140 = tail call float @llvm.fmuladd.f32(float %134, float %139, float 0x3F287AEBC0000000)
  %141 = tail call float @llvm.fmuladd.f32(float %134, float %140, float 0xBF48455D40000000)
  %142 = tail call float @llvm.fmuladd.f32(float %134, float %141, float 0xBF78B6CA40000000)
  %143 = tail call float @llvm.fmuladd.f32(float %134, float %142, float 0x3FCEBD80C0000000)
  %144 = tail call float @llvm.fmuladd.f32(float %134, float %143, float 0x3FFA755E80000000)
  %145 = fneg float %35
  %146 = tail call float @llvm.fmuladd.f32(float %145, float %144, float %144)
  br label %182

147:                                              ; preds = %116
  %148 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 144)
  %149 = select i1 %148, float 0x41F0000000000000, float 1.000000e+00
  %150 = fmul float %35, %149
  %151 = tail call float @llvm.log2.f32(float %150)
  %152 = fmul float %151, 0x3FE62E42E0000000
  %153 = tail call i1 @llvm.amdgcn.class.f32(float %151, i32 519)
  %154 = fneg float %152
  %155 = tail call float @llvm.fma.f32(float %151, float 0x3FE62E42E0000000, float %154)
  %156 = tail call float @llvm.fma.f32(float %151, float 0x3E6EFA39E0000000, float %155)
  %157 = fadd float %152, %156
  %158 = select i1 %153, float %151, float %157
  %159 = select i1 %148, float 0x40362E4300000000, float 0.000000e+00
  %160 = fsub float %158, %159
  %161 = fneg float %160
  %162 = tail call float @llvm.sqrt.f32(float %161)
  %163 = tail call float @llvm.amdgcn.rcp.f32(float %162)
  %164 = fcmp ogt float %35, 0x3D50000000000000
  br i1 %164, label %165, label %172

165:                                              ; preds = %147
  %166 = tail call float @llvm.fmuladd.f32(float %163, float 0xBFF57221E0000000, float 0x4007F61440000000)
  %167 = tail call float @llvm.fmuladd.f32(float %163, float %166, float 0xC0098DD400000000)
  %168 = tail call float @llvm.fmuladd.f32(float %163, float %167, float 0x4002C90660000000)
  %169 = tail call float @llvm.fmuladd.f32(float %163, float %168, float 0xBFF3A07EA0000000)
  %170 = tail call float @llvm.fmuladd.f32(float %163, float %169, float 0xBFABA546C0000000)
  %171 = tail call float @llvm.fmuladd.f32(float %163, float %170, float 0x3FF004E660000000)
  br label %179

172:                                              ; preds = %147
  %173 = tail call float @llvm.fmuladd.f32(float %163, float 0xC03649C6A0000000, float 0x4038FA8FA0000000)
  %174 = tail call float @llvm.fmuladd.f32(float %163, float %173, float 0xC02A112D80000000)
  %175 = tail call float @llvm.fmuladd.f32(float %163, float %174, float 0x401309D980000000)
  %176 = tail call float @llvm.fmuladd.f32(float %163, float %175, float 0xBFF9194880000000)
  %177 = tail call float @llvm.fmuladd.f32(float %163, float %176, float 0xBF9C084EC0000000)
  %178 = tail call float @llvm.fmuladd.f32(float %163, float %177, float 0x3FF00143E0000000)
  br label %179

179:                                              ; preds = %172, %165
  %180 = phi float [ %171, %165 ], [ %178, %172 ]
  %181 = fmul float %162, %180
  br label %182

182:                                              ; preds = %108, %118, %179
  %183 = phi float [ %115, %108 ], [ %146, %118 ], [ %181, %179 ]
  %184 = fcmp oeq float %35, 2.000000e+00
  %185 = fcmp oeq float %35, 0.000000e+00
  %186 = fcmp olt float %35, 0.000000e+00
  %187 = fcmp ogt float %35, 2.000000e+00
  %188 = or i1 %186, %187
  %189 = select i1 %188, float 0x7FF8000000000000, float %183
  %190 = select i1 %185, float 0x7FF0000000000000, float %189
  %191 = select i1 %184, float 0xFFF0000000000000, float %190
  %192 = add nsw i32 %17, %6
  %193 = mul nsw i32 %25, %7
  %194 = add nsw i32 %192, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %5, i64 %195
  store float %191, float addrspace(1)* %196, align 4, !tbaa !7
  br label %197

197:                                              ; preds = %182, %8
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
