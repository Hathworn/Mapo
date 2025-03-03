; ModuleID = '../data/hip_kernels/2890/1/main.cu'
source_filename = "../data/hip_kernels/2890/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25Compute_weightdata_KernelPfPKfS1_iiiff(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float %6, float %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %9, %15
  %17 = add i32 %16, %10
  %18 = icmp slt i32 %17, %3
  br i1 %18, label %19, label %235

19:                                               ; preds = %8
  %20 = fcmp contract oeq float %6, 2.000000e+00
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = sext i32 %17 to i64
  br label %231

23:                                               ; preds = %19
  %24 = fcmp contract oeq float %6, 1.000000e+00
  %25 = sext i32 %17 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = mul nsw i32 %17, %4
  %29 = add nsw i32 %28, %5
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = fsub contract float %27, %32
  %34 = tail call float @llvm.fabs.f32(float %33)
  %35 = fadd contract float %34, %7
  br i1 %24, label %36, label %38

36:                                               ; preds = %23
  %37 = fdiv contract float 1.000000e+00, %35
  br label %231

38:                                               ; preds = %23
  %39 = fadd contract float %6, -2.000000e+00
  %40 = tail call float @llvm.fabs.f32(float %35)
  %41 = tail call float @llvm.amdgcn.frexp.mant.f32(float %40)
  %42 = fcmp olt float %41, 0x3FE5555560000000
  %43 = zext i1 %42 to i32
  %44 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %43)
  %45 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %40)
  %46 = sub nsw i32 %45, %43
  %47 = fadd float %44, -1.000000e+00
  %48 = fadd float %44, 1.000000e+00
  %49 = fadd float %48, -1.000000e+00
  %50 = fsub float %44, %49
  %51 = tail call float @llvm.amdgcn.rcp.f32(float %48)
  %52 = fmul float %47, %51
  %53 = fmul float %48, %52
  %54 = fneg float %53
  %55 = tail call float @llvm.fma.f32(float %52, float %48, float %54)
  %56 = tail call float @llvm.fma.f32(float %52, float %50, float %55)
  %57 = fadd float %53, %56
  %58 = fsub float %57, %53
  %59 = fsub float %56, %58
  %60 = fsub float %47, %57
  %61 = fsub float %47, %60
  %62 = fsub float %61, %57
  %63 = fsub float %62, %59
  %64 = fadd float %60, %63
  %65 = fmul float %51, %64
  %66 = fadd float %52, %65
  %67 = fsub float %66, %52
  %68 = fsub float %65, %67
  %69 = fmul float %66, %66
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %66, float %66, float %70)
  %72 = fmul float %68, 2.000000e+00
  %73 = tail call float @llvm.fma.f32(float %66, float %72, float %71)
  %74 = fadd float %69, %73
  %75 = fsub float %74, %69
  %76 = fsub float %73, %75
  %77 = tail call float @llvm.fmuladd.f32(float %74, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %78 = tail call float @llvm.fmuladd.f32(float %74, float %77, float 0x3FD999BDE0000000)
  %79 = sitofp i32 %46 to float
  %80 = fmul float %79, 0x3FE62E4300000000
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %79, float 0x3FE62E4300000000, float %81)
  %83 = tail call float @llvm.fma.f32(float %79, float 0xBE205C6100000000, float %82)
  %84 = fadd float %80, %83
  %85 = fsub float %84, %80
  %86 = fsub float %83, %85
  %87 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 1)
  %88 = fmul float %66, %74
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %74, float %66, float %89)
  %91 = tail call float @llvm.fma.f32(float %74, float %68, float %90)
  %92 = tail call float @llvm.fma.f32(float %76, float %66, float %91)
  %93 = fadd float %88, %92
  %94 = fsub float %93, %88
  %95 = fsub float %92, %94
  %96 = fmul float %74, %78
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %74, float %78, float %97)
  %99 = tail call float @llvm.fma.f32(float %76, float %78, float %98)
  %100 = fadd float %96, %99
  %101 = fsub float %100, %96
  %102 = fsub float %99, %101
  %103 = fadd float %100, 0x3FE5555540000000
  %104 = fadd float %103, 0xBFE5555540000000
  %105 = fsub float %100, %104
  %106 = fadd float %102, 0x3E2E720200000000
  %107 = fadd float %106, %105
  %108 = fadd float %103, %107
  %109 = fsub float %108, %103
  %110 = fsub float %107, %109
  %111 = fmul float %93, %108
  %112 = fneg float %111
  %113 = tail call float @llvm.fma.f32(float %93, float %108, float %112)
  %114 = tail call float @llvm.fma.f32(float %93, float %110, float %113)
  %115 = tail call float @llvm.fma.f32(float %95, float %108, float %114)
  %116 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 1)
  %117 = fadd float %111, %115
  %118 = fsub float %117, %111
  %119 = fsub float %115, %118
  %120 = fadd float %87, %117
  %121 = fsub float %120, %87
  %122 = fsub float %117, %121
  %123 = fadd float %116, %119
  %124 = fadd float %123, %122
  %125 = fadd float %120, %124
  %126 = fsub float %125, %120
  %127 = fsub float %124, %126
  %128 = fadd float %84, %125
  %129 = fsub float %128, %84
  %130 = fsub float %128, %129
  %131 = fsub float %84, %130
  %132 = fsub float %125, %129
  %133 = fadd float %132, %131
  %134 = fadd float %86, %127
  %135 = fsub float %134, %86
  %136 = fsub float %134, %135
  %137 = fsub float %86, %136
  %138 = fsub float %127, %135
  %139 = fadd float %138, %137
  %140 = fadd float %134, %133
  %141 = fadd float %128, %140
  %142 = fsub float %141, %128
  %143 = fsub float %140, %142
  %144 = fadd float %139, %143
  %145 = fadd float %141, %144
  %146 = fsub float %145, %141
  %147 = fsub float %144, %146
  %148 = fmul float %39, %145
  %149 = fneg float %148
  %150 = tail call float @llvm.fma.f32(float %39, float %145, float %149)
  %151 = tail call float @llvm.fma.f32(float %39, float %147, float %150)
  %152 = fadd float %148, %151
  %153 = fsub float %152, %148
  %154 = fsub float %151, %153
  %155 = tail call float @llvm.fabs.f32(float %148) #3
  %156 = fcmp oeq float %155, 0x7FF0000000000000
  %157 = select i1 %156, float %148, float %152
  %158 = tail call float @llvm.fabs.f32(float %157) #3
  %159 = fcmp oeq float %158, 0x7FF0000000000000
  %160 = select i1 %159, float 0.000000e+00, float %154
  %161 = fcmp oeq float %157, 0x40562E4300000000
  %162 = select i1 %161, float 0x3EE0000000000000, float 0.000000e+00
  %163 = fsub float %157, %162
  %164 = fadd float %162, %160
  %165 = fmul float %163, 0x3FF7154760000000
  %166 = tail call float @llvm.rint.f32(float %165)
  %167 = fcmp ogt float %163, 0x40562E4300000000
  %168 = fcmp olt float %163, 0xC059D1DA00000000
  %169 = fneg float %165
  %170 = tail call float @llvm.fma.f32(float %163, float 0x3FF7154760000000, float %169)
  %171 = tail call float @llvm.fma.f32(float %163, float 0x3E54AE0BE0000000, float %170)
  %172 = fsub float %165, %166
  %173 = fadd float %171, %172
  %174 = tail call float @llvm.exp2.f32(float %173)
  %175 = fptosi float %166 to i32
  %176 = tail call float @llvm.amdgcn.ldexp.f32(float %174, i32 %175)
  %177 = select i1 %168, float 0.000000e+00, float %176
  %178 = select i1 %167, float 0x7FF0000000000000, float %177
  %179 = tail call float @llvm.fma.f32(float %178, float %164, float %178)
  %180 = tail call float @llvm.fabs.f32(float %178) #3
  %181 = fcmp oeq float %180, 0x7FF0000000000000
  %182 = select i1 %181, float %178, float %179
  %183 = tail call float @llvm.fabs.f32(float %39)
  %184 = tail call float @llvm.trunc.f32(float %183)
  %185 = fcmp oeq float %183, %184
  %186 = zext i1 %185 to i32
  %187 = fmul float %184, 5.000000e-01
  %188 = tail call float @llvm.amdgcn.fract.f32(float %187)
  %189 = tail call i1 @llvm.amdgcn.class.f32(float %187, i32 516)
  %190 = select i1 %189, float 0.000000e+00, float %188
  %191 = fcmp oeq float %190, 0.000000e+00
  %192 = and i1 %185, %191
  %193 = zext i1 %192 to i32
  %194 = add nuw nsw i32 %193, %186
  %195 = icmp eq i32 %194, 1
  %196 = fcmp olt float %35, 0.000000e+00
  %197 = and i1 %195, %196
  %198 = select i1 %197, float -0.000000e+00, float 0.000000e+00
  %199 = tail call float @llvm.copysign.f32(float %182, float %198)
  %200 = fcmp uge float %35, 0.000000e+00
  %201 = icmp ne i32 %194, 0
  %202 = select i1 %200, i1 true, i1 %201
  %203 = select i1 %202, float %199, float 0x7FF8000000000000
  %204 = fcmp oeq float %183, 0x7FF0000000000000
  br i1 %204, label %205, label %214

205:                                              ; preds = %38
  %206 = fcmp oeq float %40, 1.000000e+00
  %207 = fadd float %40, -1.000000e+00
  %208 = bitcast float %39 to i32
  %209 = bitcast float %207 to i32
  %210 = xor i32 %209, %208
  %211 = icmp sgt i32 %210, -1
  %212 = select i1 %211, float 0x7FF0000000000000, float 0.000000e+00
  %213 = select i1 %206, float %40, float %212
  br label %214

214:                                              ; preds = %38, %205
  %215 = phi float [ %203, %38 ], [ %213, %205 ]
  %216 = fcmp oeq float %40, 0x7FF0000000000000
  %217 = fcmp oeq float %35, 0.000000e+00
  %218 = or i1 %217, %216
  %219 = fcmp olt float %39, 0.000000e+00
  %220 = xor i1 %219, %217
  %221 = select i1 %220, float 0.000000e+00, float 0x7FF0000000000000
  %222 = select i1 %195, float %35, float 0.000000e+00
  %223 = tail call float @llvm.copysign.f32(float %221, float %222)
  %224 = select i1 %218, float %223, float %215
  %225 = fcmp uno float %35, %39
  %226 = select i1 %225, float 0x7FF8000000000000, float %224
  %227 = fcmp oeq float %35, 1.000000e+00
  %228 = fcmp oeq float %39, 0.000000e+00
  %229 = or i1 %228, %227
  %230 = select i1 %229, float 1.000000e+00, float %226
  br label %231

231:                                              ; preds = %36, %214, %21
  %232 = phi i64 [ %22, %21 ], [ %25, %214 ], [ %25, %36 ]
  %233 = phi float [ 1.000000e+00, %21 ], [ %230, %214 ], [ %37, %36 ]
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %232
  store float %233, float addrspace(1)* %234, align 4, !tbaa !7
  br label %235

235:                                              ; preds = %231, %8
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
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
