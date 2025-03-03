; ModuleID = '../data/hip_kernels/538/2/main.cu'
source_filename = "../data/hip_kernels/538/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8potForcePfiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nsw i32 %5, 10
  %8 = or i32 %7, %6
  %9 = mul nsw i32 %1, %1
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %211

11:                                               ; preds = %4
  %12 = sext i32 %8 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = load float, float addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = add nsw i32 %9, %8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = shl nuw nsw i32 %9, 1
  %20 = add nsw i32 %19, %8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !5, !amdgpu.noclobber !9
  %24 = fmul contract float %14, %14
  %25 = fmul contract float %18, %18
  %26 = fadd contract float %24, %25
  %27 = fmul contract float %23, %23
  %28 = fadd contract float %26, %27
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = tail call float @llvm.amdgcn.frexp.mant.f32(float %29)
  %31 = fcmp olt float %30, 0x3FE5555560000000
  %32 = zext i1 %31 to i32
  %33 = tail call float @llvm.amdgcn.ldexp.f32(float %30, i32 %32)
  %34 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %29)
  %35 = sub nsw i32 %34, %32
  %36 = fadd float %33, -1.000000e+00
  %37 = fadd float %33, 1.000000e+00
  %38 = fadd float %37, -1.000000e+00
  %39 = fsub float %33, %38
  %40 = tail call float @llvm.amdgcn.rcp.f32(float %37)
  %41 = fmul float %36, %40
  %42 = fmul float %37, %41
  %43 = fneg float %42
  %44 = tail call float @llvm.fma.f32(float %41, float %37, float %43)
  %45 = tail call float @llvm.fma.f32(float %41, float %39, float %44)
  %46 = fadd float %42, %45
  %47 = fsub float %46, %42
  %48 = fsub float %45, %47
  %49 = fsub float %36, %46
  %50 = fsub float %36, %49
  %51 = fsub float %50, %46
  %52 = fsub float %51, %48
  %53 = fadd float %49, %52
  %54 = fmul float %40, %53
  %55 = fadd float %41, %54
  %56 = fsub float %55, %41
  %57 = fsub float %54, %56
  %58 = fmul float %55, %55
  %59 = fneg float %58
  %60 = tail call float @llvm.fma.f32(float %55, float %55, float %59)
  %61 = fmul float %57, 2.000000e+00
  %62 = tail call float @llvm.fma.f32(float %55, float %61, float %60)
  %63 = fadd float %58, %62
  %64 = fsub float %63, %58
  %65 = fsub float %62, %64
  %66 = tail call float @llvm.fmuladd.f32(float %63, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %67 = tail call float @llvm.fmuladd.f32(float %63, float %66, float 0x3FD999BDE0000000)
  %68 = sitofp i32 %35 to float
  %69 = fmul float %68, 0x3FE62E4300000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %68, float 0x3FE62E4300000000, float %70)
  %72 = tail call float @llvm.fma.f32(float %68, float 0xBE205C6100000000, float %71)
  %73 = fadd float %69, %72
  %74 = fsub float %73, %69
  %75 = fsub float %72, %74
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 1)
  %77 = fmul float %55, %63
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %63, float %55, float %78)
  %80 = tail call float @llvm.fma.f32(float %63, float %57, float %79)
  %81 = tail call float @llvm.fma.f32(float %65, float %55, float %80)
  %82 = fadd float %77, %81
  %83 = fsub float %82, %77
  %84 = fsub float %81, %83
  %85 = fmul float %63, %67
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %63, float %67, float %86)
  %88 = tail call float @llvm.fma.f32(float %65, float %67, float %87)
  %89 = fadd float %85, %88
  %90 = fsub float %89, %85
  %91 = fsub float %88, %90
  %92 = fadd float %89, 0x3FE5555540000000
  %93 = fadd float %92, 0xBFE5555540000000
  %94 = fsub float %89, %93
  %95 = fadd float %91, 0x3E2E720200000000
  %96 = fadd float %95, %94
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %82, %97
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %82, float %97, float %101)
  %103 = tail call float @llvm.fma.f32(float %82, float %99, float %102)
  %104 = tail call float @llvm.fma.f32(float %84, float %97, float %103)
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 1)
  %106 = fadd float %100, %104
  %107 = fsub float %106, %100
  %108 = fsub float %104, %107
  %109 = fadd float %76, %106
  %110 = fsub float %109, %76
  %111 = fsub float %106, %110
  %112 = fadd float %105, %108
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fadd float %73, %114
  %118 = fsub float %117, %73
  %119 = fsub float %117, %118
  %120 = fsub float %73, %119
  %121 = fsub float %114, %118
  %122 = fadd float %121, %120
  %123 = fadd float %75, %116
  %124 = fsub float %123, %75
  %125 = fsub float %123, %124
  %126 = fsub float %75, %125
  %127 = fsub float %116, %124
  %128 = fadd float %127, %126
  %129 = fadd float %123, %122
  %130 = fadd float %117, %129
  %131 = fsub float %130, %117
  %132 = fsub float %129, %131
  %133 = fadd float %128, %132
  %134 = fadd float %130, %133
  %135 = fsub float %134, %130
  %136 = fsub float %133, %135
  %137 = fmul float %134, -3.000000e+00
  %138 = fneg float %137
  %139 = tail call float @llvm.fma.f32(float %134, float -3.000000e+00, float %138)
  %140 = tail call float @llvm.fma.f32(float %136, float -3.000000e+00, float %139)
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = tail call float @llvm.fabs.f32(float %137) #3
  %145 = fcmp oeq float %144, 0x7FF0000000000000
  %146 = select i1 %145, float %137, float %141
  %147 = tail call float @llvm.fabs.f32(float %146) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float 0.000000e+00, float %143
  %150 = fcmp oeq float %146, 0x40562E4300000000
  %151 = select i1 %150, float 0x3EE0000000000000, float 0.000000e+00
  %152 = fsub float %146, %151
  %153 = fadd float %151, %149
  %154 = fmul float %152, 0x3FF7154760000000
  %155 = tail call float @llvm.rint.f32(float %154)
  %156 = fcmp ogt float %152, 0x40562E4300000000
  %157 = fcmp olt float %152, 0xC059D1DA00000000
  %158 = fneg float %154
  %159 = tail call float @llvm.fma.f32(float %152, float 0x3FF7154760000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %152, float 0x3E54AE0BE0000000, float %159)
  %161 = fsub float %154, %155
  %162 = fadd float %160, %161
  %163 = tail call float @llvm.exp2.f32(float %162)
  %164 = fptosi float %155 to i32
  %165 = tail call float @llvm.amdgcn.ldexp.f32(float %163, i32 %164)
  %166 = select i1 %157, float 0.000000e+00, float %165
  %167 = select i1 %156, float 0x7FF0000000000000, float %166
  %168 = tail call float @llvm.fma.f32(float %167, float %153, float %167)
  %169 = tail call float @llvm.fabs.f32(float %167) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float %167, float %168
  %172 = tail call float @llvm.fabs.f32(float %171)
  %173 = fcmp oeq float %29, 0x7FF0000000000000
  %174 = fcmp oeq float %28, 0.000000e+00
  %175 = or i1 %174, %173
  %176 = select i1 %174, float 0x7FF0000000000000, float 0.000000e+00
  %177 = tail call float @llvm.copysign.f32(float %176, float %28)
  %178 = select i1 %175, float %177, float %172
  %179 = fcmp uno float %28, 0.000000e+00
  %180 = select i1 %179, float 0x7FF8000000000000, float %178
  %181 = fcmp oeq float %28, 1.000000e+00
  %182 = select i1 %181, float 1.000000e+00, float %180
  br i1 %174, label %202, label %183

183:                                              ; preds = %11
  %184 = fmul contract float %182, %182
  %185 = fsub contract float %184, %182
  %186 = fmul contract float %185, 4.000000e+00
  %187 = fneg contract float %14
  %188 = fdiv contract float %187, %28
  %189 = fmul contract float %188, 2.400000e+01
  %190 = fmul contract float %182, 2.000000e+00
  %191 = fmul contract float %182, %190
  %192 = fsub contract float %191, %182
  %193 = fmul contract float %189, %192
  %194 = fneg contract float %18
  %195 = fdiv contract float %194, %28
  %196 = fmul contract float %195, 2.400000e+01
  %197 = fmul contract float %196, %192
  %198 = fneg contract float %23
  %199 = fdiv contract float %198, %28
  %200 = fmul contract float %199, 2.400000e+01
  %201 = fmul contract float %200, %192
  br label %202

202:                                              ; preds = %11, %183
  %203 = phi float [ %193, %183 ], [ 0.000000e+00, %11 ]
  %204 = phi float [ %197, %183 ], [ 0.000000e+00, %11 ]
  %205 = phi float [ %201, %183 ], [ 0.000000e+00, %11 ]
  %206 = phi float [ %186, %183 ], [ 0.000000e+00, %11 ]
  %207 = getelementptr inbounds float, float addrspace(1)* %2, i64 %12
  store float %206, float addrspace(1)* %207, align 4, !tbaa !5
  %208 = getelementptr inbounds float, float addrspace(1)* %3, i64 %12
  store float %203, float addrspace(1)* %208, align 4, !tbaa !5
  %209 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  store float %204, float addrspace(1)* %209, align 4, !tbaa !5
  %210 = getelementptr inbounds float, float addrspace(1)* %3, i64 %21
  store float %205, float addrspace(1)* %210, align 4, !tbaa !5
  br label %211

211:                                              ; preds = %202, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
