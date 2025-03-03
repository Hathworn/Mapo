; ModuleID = '../data/hip_kernels/6493/29/main.cu'
source_filename = "../data/hip_kernels/6493/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8returnQ1iiPKfS0_S0_S0_S0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = icmp slt i32 %17, %1
  br i1 %18, label %19, label %252

19:                                               ; preds = %8
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds float, float addrspace(1)* %4, i64 %20
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = fadd contract float %22, %24
  %26 = getelementptr inbounds float, float addrspace(1)* %5, i64 %20
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = fsub contract float %25, %27
  %29 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = fsub contract float %28, %30
  %32 = fpext float %31 to double
  %33 = fmul contract double %32, -5.000000e-01
  %34 = fcmp contract olt double %33, -1.000000e+01
  br i1 %34, label %249, label %35

35:                                               ; preds = %19
  %36 = fcmp contract ogt double %33, 1.000000e+01
  br i1 %36, label %249, label %37

37:                                               ; preds = %35
  %38 = fptrunc double %33 to float
  %39 = fmul float %38, 0x3FF7154760000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = fcmp ogt float %38, 0x40562E4300000000
  %42 = fcmp olt float %38, 0xC059D1DA00000000
  %43 = fneg float %39
  %44 = tail call float @llvm.fma.f32(float %38, float 0x3FF7154760000000, float %43)
  %45 = tail call float @llvm.fma.f32(float %38, float 0x3E54AE0BE0000000, float %44)
  %46 = fsub float %39, %40
  %47 = fadd float %45, %46
  %48 = tail call float @llvm.exp2.f32(float %47)
  %49 = fptosi float %40 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %48, i32 %49)
  %51 = select i1 %42, float 0.000000e+00, float %50
  %52 = select i1 %41, float 0x7FF0000000000000, float %51
  %53 = getelementptr inbounds float, float addrspace(1)* %6, i64 %20
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = add nsw i32 %0, -1
  %56 = sitofp i32 %55 to float
  %57 = tail call float @llvm.fabs.f32(float %54)
  %58 = tail call float @llvm.amdgcn.frexp.mant.f32(float %57)
  %59 = fcmp olt float %58, 0x3FE5555560000000
  %60 = zext i1 %59 to i32
  %61 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 %60)
  %62 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %57)
  %63 = sub nsw i32 %62, %60
  %64 = fadd float %61, -1.000000e+00
  %65 = fadd float %61, 1.000000e+00
  %66 = fadd float %65, -1.000000e+00
  %67 = fsub float %61, %66
  %68 = tail call float @llvm.amdgcn.rcp.f32(float %65)
  %69 = fmul float %64, %68
  %70 = fmul float %65, %69
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %69, float %65, float %71)
  %73 = tail call float @llvm.fma.f32(float %69, float %67, float %72)
  %74 = fadd float %70, %73
  %75 = fsub float %74, %70
  %76 = fsub float %73, %75
  %77 = fsub float %64, %74
  %78 = fsub float %64, %77
  %79 = fsub float %78, %74
  %80 = fsub float %79, %76
  %81 = fadd float %77, %80
  %82 = fmul float %68, %81
  %83 = fadd float %69, %82
  %84 = fsub float %83, %69
  %85 = fsub float %82, %84
  %86 = fmul float %83, %83
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %83, float %83, float %87)
  %89 = fmul float %85, 2.000000e+00
  %90 = tail call float @llvm.fma.f32(float %83, float %89, float %88)
  %91 = fadd float %86, %90
  %92 = fsub float %91, %86
  %93 = fsub float %90, %92
  %94 = tail call float @llvm.fmuladd.f32(float %91, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %95 = tail call float @llvm.fmuladd.f32(float %91, float %94, float 0x3FD999BDE0000000)
  %96 = sitofp i32 %63 to float
  %97 = fmul float %96, 0x3FE62E4300000000
  %98 = fneg float %97
  %99 = tail call float @llvm.fma.f32(float %96, float 0x3FE62E4300000000, float %98)
  %100 = tail call float @llvm.fma.f32(float %96, float 0xBE205C6100000000, float %99)
  %101 = fadd float %97, %100
  %102 = fsub float %101, %97
  %103 = fsub float %100, %102
  %104 = tail call float @llvm.amdgcn.ldexp.f32(float %83, i32 1)
  %105 = fmul float %83, %91
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %91, float %83, float %106)
  %108 = tail call float @llvm.fma.f32(float %91, float %85, float %107)
  %109 = tail call float @llvm.fma.f32(float %93, float %83, float %108)
  %110 = fadd float %105, %109
  %111 = fsub float %110, %105
  %112 = fsub float %109, %111
  %113 = fmul float %91, %95
  %114 = fneg float %113
  %115 = tail call float @llvm.fma.f32(float %91, float %95, float %114)
  %116 = tail call float @llvm.fma.f32(float %93, float %95, float %115)
  %117 = fadd float %113, %116
  %118 = fsub float %117, %113
  %119 = fsub float %116, %118
  %120 = fadd float %117, 0x3FE5555540000000
  %121 = fadd float %120, 0xBFE5555540000000
  %122 = fsub float %117, %121
  %123 = fadd float %119, 0x3E2E720200000000
  %124 = fadd float %123, %122
  %125 = fadd float %120, %124
  %126 = fsub float %125, %120
  %127 = fsub float %124, %126
  %128 = fmul float %110, %125
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %110, float %125, float %129)
  %131 = tail call float @llvm.fma.f32(float %110, float %127, float %130)
  %132 = tail call float @llvm.fma.f32(float %112, float %125, float %131)
  %133 = tail call float @llvm.amdgcn.ldexp.f32(float %85, i32 1)
  %134 = fadd float %128, %132
  %135 = fsub float %134, %128
  %136 = fsub float %132, %135
  %137 = fadd float %104, %134
  %138 = fsub float %137, %104
  %139 = fsub float %134, %138
  %140 = fadd float %133, %136
  %141 = fadd float %140, %139
  %142 = fadd float %137, %141
  %143 = fsub float %142, %137
  %144 = fsub float %141, %143
  %145 = fadd float %101, %142
  %146 = fsub float %145, %101
  %147 = fsub float %145, %146
  %148 = fsub float %101, %147
  %149 = fsub float %142, %146
  %150 = fadd float %149, %148
  %151 = fadd float %103, %144
  %152 = fsub float %151, %103
  %153 = fsub float %151, %152
  %154 = fsub float %103, %153
  %155 = fsub float %144, %152
  %156 = fadd float %155, %154
  %157 = fadd float %151, %150
  %158 = fadd float %145, %157
  %159 = fsub float %158, %145
  %160 = fsub float %157, %159
  %161 = fadd float %156, %160
  %162 = fadd float %158, %161
  %163 = fsub float %162, %158
  %164 = fsub float %161, %163
  %165 = fmul float %162, %56
  %166 = fneg float %165
  %167 = tail call float @llvm.fma.f32(float %56, float %162, float %166)
  %168 = tail call float @llvm.fma.f32(float %56, float %164, float %167)
  %169 = fadd float %165, %168
  %170 = fsub float %169, %165
  %171 = fsub float %168, %170
  %172 = tail call float @llvm.fabs.f32(float %165) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float %165, float %169
  %175 = tail call float @llvm.fabs.f32(float %174) #3
  %176 = fcmp oeq float %175, 0x7FF0000000000000
  %177 = select i1 %176, float 0.000000e+00, float %171
  %178 = fcmp oeq float %174, 0x40562E4300000000
  %179 = select i1 %178, float 0x3EE0000000000000, float 0.000000e+00
  %180 = fsub float %174, %179
  %181 = fadd float %179, %177
  %182 = fmul float %180, 0x3FF7154760000000
  %183 = tail call float @llvm.rint.f32(float %182)
  %184 = fcmp ogt float %180, 0x40562E4300000000
  %185 = fcmp olt float %180, 0xC059D1DA00000000
  %186 = fneg float %182
  %187 = tail call float @llvm.fma.f32(float %180, float 0x3FF7154760000000, float %186)
  %188 = tail call float @llvm.fma.f32(float %180, float 0x3E54AE0BE0000000, float %187)
  %189 = fsub float %182, %183
  %190 = fadd float %188, %189
  %191 = tail call float @llvm.exp2.f32(float %190)
  %192 = fptosi float %183 to i32
  %193 = tail call float @llvm.amdgcn.ldexp.f32(float %191, i32 %192)
  %194 = select i1 %185, float 0.000000e+00, float %193
  %195 = select i1 %184, float 0x7FF0000000000000, float %194
  %196 = tail call float @llvm.fma.f32(float %195, float %181, float %195)
  %197 = tail call float @llvm.fabs.f32(float %195) #3
  %198 = fcmp oeq float %197, 0x7FF0000000000000
  %199 = select i1 %198, float %195, float %196
  %200 = tail call float @llvm.fabs.f32(float %56)
  %201 = tail call float @llvm.trunc.f32(float %200)
  %202 = fcmp oeq float %200, %201
  %203 = zext i1 %202 to i32
  %204 = fmul float %201, 5.000000e-01
  %205 = tail call float @llvm.amdgcn.fract.f32(float %204)
  %206 = tail call i1 @llvm.amdgcn.class.f32(float %204, i32 516)
  %207 = select i1 %206, float 0.000000e+00, float %205
  %208 = fcmp oeq float %207, 0.000000e+00
  %209 = and i1 %202, %208
  %210 = zext i1 %209 to i32
  %211 = add nuw nsw i32 %210, %203
  %212 = icmp eq i32 %211, 1
  %213 = fcmp olt float %54, 0.000000e+00
  %214 = and i1 %212, %213
  %215 = select i1 %214, float -0.000000e+00, float 0.000000e+00
  %216 = tail call float @llvm.copysign.f32(float %199, float %215)
  %217 = fcmp uge float %54, 0.000000e+00
  %218 = icmp ne i32 %211, 0
  %219 = select i1 %217, i1 true, i1 %218
  %220 = select i1 %219, float %216, float 0x7FF8000000000000
  %221 = fcmp oeq float %200, 0x7FF0000000000000
  br i1 %221, label %222, label %231

222:                                              ; preds = %37
  %223 = fcmp oeq float %57, 1.000000e+00
  %224 = fadd float %57, -1.000000e+00
  %225 = bitcast float %56 to i32
  %226 = bitcast float %224 to i32
  %227 = xor i32 %226, %225
  %228 = icmp sgt i32 %227, -1
  %229 = select i1 %228, float 0x7FF0000000000000, float 0.000000e+00
  %230 = select i1 %223, float %57, float %229
  br label %231

231:                                              ; preds = %37, %222
  %232 = phi float [ %220, %37 ], [ %230, %222 ]
  %233 = fcmp oeq float %57, 0x7FF0000000000000
  %234 = fcmp oeq float %54, 0.000000e+00
  %235 = or i1 %234, %233
  %236 = icmp slt i32 %0, 1
  %237 = xor i1 %236, %234
  %238 = select i1 %237, float 0.000000e+00, float 0x7FF0000000000000
  %239 = select i1 %212, float %54, float 0.000000e+00
  %240 = tail call float @llvm.copysign.f32(float %238, float %239)
  %241 = select i1 %235, float %240, float %232
  %242 = fcmp uno float %54, 0.000000e+00
  %243 = select i1 %242, float 0x7FF8000000000000, float %241
  %244 = fcmp oeq float %54, 1.000000e+00
  %245 = icmp eq i32 %55, 0
  %246 = or i1 %245, %244
  %247 = select i1 %246, float 1.000000e+00, float %243
  %248 = fmul contract float %52, %247
  br label %249

249:                                              ; preds = %35, %19, %231
  %250 = phi float [ %248, %231 ], [ 0.000000e+00, %19 ], [ 1.000000e+10, %35 ]
  %251 = getelementptr inbounds float, float addrspace(1)* %7, i64 %20
  store float %250, float addrspace(1)* %251, align 4, !tbaa !7
  br label %252

252:                                              ; preds = %249, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
