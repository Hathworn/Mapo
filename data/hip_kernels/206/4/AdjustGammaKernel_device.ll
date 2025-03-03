; ModuleID = '../data/hip_kernels/206/4/main.cu'
source_filename = "../data/hip_kernels/206/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@maskKernelX = protected local_unnamed_addr addrspace(4) externally_initialized global [72 x i32] zeroinitializer, align 16
@maskKernelY = protected local_unnamed_addr addrspace(4) externally_initialized global [72 x i32] zeroinitializer, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17AdjustGammaKernelPfS_iifff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 9
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = sext i32 %11 to i64
  %13 = mul nsw i32 %3, %2
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %15, label %217

15:                                               ; preds = %7
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %12
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = fsub contract float %17, %5
  %19 = fdiv contract float %18, %6
  %20 = fdiv contract float 1.000000e+00, %4
  %21 = tail call float @llvm.fabs.f32(float %19)
  %22 = tail call float @llvm.amdgcn.frexp.mant.f32(float %21)
  %23 = fcmp olt float %22, 0x3FE5555560000000
  %24 = zext i1 %23 to i32
  %25 = tail call float @llvm.amdgcn.ldexp.f32(float %22, i32 %24)
  %26 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %21)
  %27 = sub nsw i32 %26, %24
  %28 = fadd float %25, -1.000000e+00
  %29 = fadd float %25, 1.000000e+00
  %30 = fadd float %29, -1.000000e+00
  %31 = fsub float %25, %30
  %32 = tail call float @llvm.amdgcn.rcp.f32(float %29)
  %33 = fmul float %28, %32
  %34 = fmul float %29, %33
  %35 = fneg float %34
  %36 = tail call float @llvm.fma.f32(float %33, float %29, float %35)
  %37 = tail call float @llvm.fma.f32(float %33, float %31, float %36)
  %38 = fadd float %34, %37
  %39 = fsub float %38, %34
  %40 = fsub float %37, %39
  %41 = fsub float %28, %38
  %42 = fsub float %28, %41
  %43 = fsub float %42, %38
  %44 = fsub float %43, %40
  %45 = fadd float %41, %44
  %46 = fmul float %32, %45
  %47 = fadd float %33, %46
  %48 = fsub float %47, %33
  %49 = fsub float %46, %48
  %50 = fmul float %47, %47
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %47, float %47, float %51)
  %53 = fmul float %49, 2.000000e+00
  %54 = tail call float @llvm.fma.f32(float %47, float %53, float %52)
  %55 = fadd float %50, %54
  %56 = fsub float %55, %50
  %57 = fsub float %54, %56
  %58 = tail call float @llvm.fmuladd.f32(float %55, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %59 = tail call float @llvm.fmuladd.f32(float %55, float %58, float 0x3FD999BDE0000000)
  %60 = sitofp i32 %27 to float
  %61 = fmul float %60, 0x3FE62E4300000000
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %60, float 0x3FE62E4300000000, float %62)
  %64 = tail call float @llvm.fma.f32(float %60, float 0xBE205C6100000000, float %63)
  %65 = fadd float %61, %64
  %66 = fsub float %65, %61
  %67 = fsub float %64, %66
  %68 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 1)
  %69 = fmul float %47, %55
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %55, float %47, float %70)
  %72 = tail call float @llvm.fma.f32(float %55, float %49, float %71)
  %73 = tail call float @llvm.fma.f32(float %57, float %47, float %72)
  %74 = fadd float %69, %73
  %75 = fsub float %74, %69
  %76 = fsub float %73, %75
  %77 = fmul float %55, %59
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %55, float %59, float %78)
  %80 = tail call float @llvm.fma.f32(float %57, float %59, float %79)
  %81 = fadd float %77, %80
  %82 = fsub float %81, %77
  %83 = fsub float %80, %82
  %84 = fadd float %81, 0x3FE5555540000000
  %85 = fadd float %84, 0xBFE5555540000000
  %86 = fsub float %81, %85
  %87 = fadd float %83, 0x3E2E720200000000
  %88 = fadd float %87, %86
  %89 = fadd float %84, %88
  %90 = fsub float %89, %84
  %91 = fsub float %88, %90
  %92 = fmul float %74, %89
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %74, float %89, float %93)
  %95 = tail call float @llvm.fma.f32(float %74, float %91, float %94)
  %96 = tail call float @llvm.fma.f32(float %76, float %89, float %95)
  %97 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 1)
  %98 = fadd float %92, %96
  %99 = fsub float %98, %92
  %100 = fsub float %96, %99
  %101 = fadd float %68, %98
  %102 = fsub float %101, %68
  %103 = fsub float %98, %102
  %104 = fadd float %97, %100
  %105 = fadd float %104, %103
  %106 = fadd float %101, %105
  %107 = fsub float %106, %101
  %108 = fsub float %105, %107
  %109 = fadd float %65, %106
  %110 = fsub float %109, %65
  %111 = fsub float %109, %110
  %112 = fsub float %65, %111
  %113 = fsub float %106, %110
  %114 = fadd float %113, %112
  %115 = fadd float %67, %108
  %116 = fsub float %115, %67
  %117 = fsub float %115, %116
  %118 = fsub float %67, %117
  %119 = fsub float %108, %116
  %120 = fadd float %119, %118
  %121 = fadd float %115, %114
  %122 = fadd float %109, %121
  %123 = fsub float %122, %109
  %124 = fsub float %121, %123
  %125 = fadd float %120, %124
  %126 = fadd float %122, %125
  %127 = fsub float %126, %122
  %128 = fsub float %125, %127
  %129 = fmul float %20, %126
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %20, float %126, float %130)
  %132 = tail call float @llvm.fma.f32(float %20, float %128, float %131)
  %133 = fadd float %129, %132
  %134 = fsub float %133, %129
  %135 = fsub float %132, %134
  %136 = tail call float @llvm.fabs.f32(float %129) #4
  %137 = fcmp oeq float %136, 0x7FF0000000000000
  %138 = select i1 %137, float %129, float %133
  %139 = tail call float @llvm.fabs.f32(float %138) #4
  %140 = fcmp oeq float %139, 0x7FF0000000000000
  %141 = select i1 %140, float 0.000000e+00, float %135
  %142 = fcmp oeq float %138, 0x40562E4300000000
  %143 = select i1 %142, float 0x3EE0000000000000, float 0.000000e+00
  %144 = fsub float %138, %143
  %145 = fadd float %143, %141
  %146 = fmul float %144, 0x3FF7154760000000
  %147 = tail call float @llvm.rint.f32(float %146)
  %148 = fcmp ogt float %144, 0x40562E4300000000
  %149 = fcmp olt float %144, 0xC059D1DA00000000
  %150 = fneg float %146
  %151 = tail call float @llvm.fma.f32(float %144, float 0x3FF7154760000000, float %150)
  %152 = tail call float @llvm.fma.f32(float %144, float 0x3E54AE0BE0000000, float %151)
  %153 = fsub float %146, %147
  %154 = fadd float %152, %153
  %155 = tail call float @llvm.exp2.f32(float %154)
  %156 = fptosi float %147 to i32
  %157 = tail call float @llvm.amdgcn.ldexp.f32(float %155, i32 %156)
  %158 = select i1 %149, float 0.000000e+00, float %157
  %159 = select i1 %148, float 0x7FF0000000000000, float %158
  %160 = tail call float @llvm.fma.f32(float %159, float %145, float %159)
  %161 = tail call float @llvm.fabs.f32(float %159) #4
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %159, float %160
  %164 = tail call float @llvm.fabs.f32(float %20)
  %165 = tail call float @llvm.trunc.f32(float %164)
  %166 = fcmp oeq float %164, %165
  %167 = zext i1 %166 to i32
  %168 = fmul float %165, 5.000000e-01
  %169 = tail call float @llvm.amdgcn.fract.f32(float %168)
  %170 = tail call i1 @llvm.amdgcn.class.f32(float %168, i32 516)
  %171 = select i1 %170, float 0.000000e+00, float %169
  %172 = fcmp oeq float %171, 0.000000e+00
  %173 = and i1 %166, %172
  %174 = zext i1 %173 to i32
  %175 = add nuw nsw i32 %174, %167
  %176 = icmp eq i32 %175, 1
  %177 = fcmp olt float %19, 0.000000e+00
  %178 = and i1 %176, %177
  %179 = select i1 %178, float -0.000000e+00, float 0.000000e+00
  %180 = tail call float @llvm.copysign.f32(float %163, float %179)
  %181 = fcmp uge float %19, 0.000000e+00
  %182 = icmp ne i32 %175, 0
  %183 = select i1 %181, i1 true, i1 %182
  %184 = select i1 %183, float %180, float 0x7FF8000000000000
  %185 = fcmp oeq float %164, 0x7FF0000000000000
  br i1 %185, label %186, label %195

186:                                              ; preds = %15
  %187 = fcmp oeq float %21, 1.000000e+00
  %188 = fadd float %21, -1.000000e+00
  %189 = bitcast float %20 to i32
  %190 = bitcast float %188 to i32
  %191 = xor i32 %190, %189
  %192 = icmp sgt i32 %191, -1
  %193 = select i1 %192, float 0x7FF0000000000000, float 0.000000e+00
  %194 = select i1 %187, float %21, float %193
  br label %195

195:                                              ; preds = %15, %186
  %196 = phi float [ %184, %15 ], [ %194, %186 ]
  %197 = fcmp oeq float %21, 0x7FF0000000000000
  %198 = fcmp oeq float %19, 0.000000e+00
  %199 = or i1 %198, %197
  %200 = fcmp olt float %20, 0.000000e+00
  %201 = xor i1 %200, %198
  %202 = select i1 %201, float 0.000000e+00, float 0x7FF0000000000000
  %203 = select i1 %176, float %19, float 0.000000e+00
  %204 = tail call float @llvm.copysign.f32(float %202, float %203)
  %205 = select i1 %199, float %204, float %196
  %206 = fcmp uno float %19, %20
  %207 = select i1 %206, float 0x7FF8000000000000, float %205
  %208 = fcmp oeq float %19, 1.000000e+00
  %209 = fcmp oeq float %20, 0.000000e+00
  %210 = or i1 %209, %208
  %211 = select i1 %210, float 1.000000e+00, float %207
  %212 = fcmp contract olt float %211, 0.000000e+00
  %213 = fcmp contract ogt float %211, 1.000000e+00
  %214 = select i1 %213, float 1.000000e+00, float %211
  %215 = select i1 %212, float 0.000000e+00, float %214
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  store float %215, float addrspace(1)* %216, align 4, !tbaa !5
  br label %217

217:                                              ; preds = %195, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

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
