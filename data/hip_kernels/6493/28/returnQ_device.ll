; ModuleID = '../data/hip_kernels/6493/28/main.cu'
source_filename = "../data/hip_kernels/6493/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7returnQiiPKfS0_S0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = icmp slt i32 %15, %1
  br i1 %16, label %17, label %236

17:                                               ; preds = %6
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = fsub contract float %20, %22
  %24 = fmul contract float %23, -5.000000e-01
  %25 = fmul float %24, 0x3FF7154760000000
  %26 = tail call float @llvm.rint.f32(float %25)
  %27 = fcmp ogt float %24, 0x40562E4300000000
  %28 = fcmp olt float %24, 0xC059D1DA00000000
  %29 = fneg float %25
  %30 = tail call float @llvm.fma.f32(float %24, float 0x3FF7154760000000, float %29)
  %31 = tail call float @llvm.fma.f32(float %24, float 0x3E54AE0BE0000000, float %30)
  %32 = fsub float %25, %26
  %33 = fadd float %31, %32
  %34 = tail call float @llvm.exp2.f32(float %33)
  %35 = fptosi float %26 to i32
  %36 = tail call float @llvm.amdgcn.ldexp.f32(float %34, i32 %35)
  %37 = select i1 %28, float 0.000000e+00, float %36
  %38 = select i1 %27, float 0x7FF0000000000000, float %37
  %39 = getelementptr inbounds float, float addrspace(1)* %4, i64 %18
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = add nsw i32 %0, -1
  %42 = sitofp i32 %41 to float
  %43 = tail call float @llvm.fabs.f32(float %40)
  %44 = tail call float @llvm.amdgcn.frexp.mant.f32(float %43)
  %45 = fcmp olt float %44, 0x3FE5555560000000
  %46 = zext i1 %45 to i32
  %47 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 %46)
  %48 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %43)
  %49 = sub nsw i32 %48, %46
  %50 = fadd float %47, -1.000000e+00
  %51 = fadd float %47, 1.000000e+00
  %52 = fadd float %51, -1.000000e+00
  %53 = fsub float %47, %52
  %54 = tail call float @llvm.amdgcn.rcp.f32(float %51)
  %55 = fmul float %50, %54
  %56 = fmul float %51, %55
  %57 = fneg float %56
  %58 = tail call float @llvm.fma.f32(float %55, float %51, float %57)
  %59 = tail call float @llvm.fma.f32(float %55, float %53, float %58)
  %60 = fadd float %56, %59
  %61 = fsub float %60, %56
  %62 = fsub float %59, %61
  %63 = fsub float %50, %60
  %64 = fsub float %50, %63
  %65 = fsub float %64, %60
  %66 = fsub float %65, %62
  %67 = fadd float %63, %66
  %68 = fmul float %54, %67
  %69 = fadd float %55, %68
  %70 = fsub float %69, %55
  %71 = fsub float %68, %70
  %72 = fmul float %69, %69
  %73 = fneg float %72
  %74 = tail call float @llvm.fma.f32(float %69, float %69, float %73)
  %75 = fmul float %71, 2.000000e+00
  %76 = tail call float @llvm.fma.f32(float %69, float %75, float %74)
  %77 = fadd float %72, %76
  %78 = fsub float %77, %72
  %79 = fsub float %76, %78
  %80 = tail call float @llvm.fmuladd.f32(float %77, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %81 = tail call float @llvm.fmuladd.f32(float %77, float %80, float 0x3FD999BDE0000000)
  %82 = sitofp i32 %49 to float
  %83 = fmul float %82, 0x3FE62E4300000000
  %84 = fneg float %83
  %85 = tail call float @llvm.fma.f32(float %82, float 0x3FE62E4300000000, float %84)
  %86 = tail call float @llvm.fma.f32(float %82, float 0xBE205C6100000000, float %85)
  %87 = fadd float %83, %86
  %88 = fsub float %87, %83
  %89 = fsub float %86, %88
  %90 = tail call float @llvm.amdgcn.ldexp.f32(float %69, i32 1)
  %91 = fmul float %69, %77
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %77, float %69, float %92)
  %94 = tail call float @llvm.fma.f32(float %77, float %71, float %93)
  %95 = tail call float @llvm.fma.f32(float %79, float %69, float %94)
  %96 = fadd float %91, %95
  %97 = fsub float %96, %91
  %98 = fsub float %95, %97
  %99 = fmul float %77, %81
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %77, float %81, float %100)
  %102 = tail call float @llvm.fma.f32(float %79, float %81, float %101)
  %103 = fadd float %99, %102
  %104 = fsub float %103, %99
  %105 = fsub float %102, %104
  %106 = fadd float %103, 0x3FE5555540000000
  %107 = fadd float %106, 0xBFE5555540000000
  %108 = fsub float %103, %107
  %109 = fadd float %105, 0x3E2E720200000000
  %110 = fadd float %109, %108
  %111 = fadd float %106, %110
  %112 = fsub float %111, %106
  %113 = fsub float %110, %112
  %114 = fmul float %96, %111
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %96, float %111, float %115)
  %117 = tail call float @llvm.fma.f32(float %96, float %113, float %116)
  %118 = tail call float @llvm.fma.f32(float %98, float %111, float %117)
  %119 = tail call float @llvm.amdgcn.ldexp.f32(float %71, i32 1)
  %120 = fadd float %114, %118
  %121 = fsub float %120, %114
  %122 = fsub float %118, %121
  %123 = fadd float %90, %120
  %124 = fsub float %123, %90
  %125 = fsub float %120, %124
  %126 = fadd float %119, %122
  %127 = fadd float %126, %125
  %128 = fadd float %123, %127
  %129 = fsub float %128, %123
  %130 = fsub float %127, %129
  %131 = fadd float %87, %128
  %132 = fsub float %131, %87
  %133 = fsub float %131, %132
  %134 = fsub float %87, %133
  %135 = fsub float %128, %132
  %136 = fadd float %135, %134
  %137 = fadd float %89, %130
  %138 = fsub float %137, %89
  %139 = fsub float %137, %138
  %140 = fsub float %89, %139
  %141 = fsub float %130, %138
  %142 = fadd float %141, %140
  %143 = fadd float %137, %136
  %144 = fadd float %131, %143
  %145 = fsub float %144, %131
  %146 = fsub float %143, %145
  %147 = fadd float %142, %146
  %148 = fadd float %144, %147
  %149 = fsub float %148, %144
  %150 = fsub float %147, %149
  %151 = fmul float %148, %42
  %152 = fneg float %151
  %153 = tail call float @llvm.fma.f32(float %42, float %148, float %152)
  %154 = tail call float @llvm.fma.f32(float %42, float %150, float %153)
  %155 = fadd float %151, %154
  %156 = fsub float %155, %151
  %157 = fsub float %154, %156
  %158 = tail call float @llvm.fabs.f32(float %151) #3
  %159 = fcmp oeq float %158, 0x7FF0000000000000
  %160 = select i1 %159, float %151, float %155
  %161 = tail call float @llvm.fabs.f32(float %160) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float 0.000000e+00, float %157
  %164 = fcmp oeq float %160, 0x40562E4300000000
  %165 = select i1 %164, float 0x3EE0000000000000, float 0.000000e+00
  %166 = fsub float %160, %165
  %167 = fadd float %165, %163
  %168 = fmul float %166, 0x3FF7154760000000
  %169 = tail call float @llvm.rint.f32(float %168)
  %170 = fcmp ogt float %166, 0x40562E4300000000
  %171 = fcmp olt float %166, 0xC059D1DA00000000
  %172 = fneg float %168
  %173 = tail call float @llvm.fma.f32(float %166, float 0x3FF7154760000000, float %172)
  %174 = tail call float @llvm.fma.f32(float %166, float 0x3E54AE0BE0000000, float %173)
  %175 = fsub float %168, %169
  %176 = fadd float %174, %175
  %177 = tail call float @llvm.exp2.f32(float %176)
  %178 = fptosi float %169 to i32
  %179 = tail call float @llvm.amdgcn.ldexp.f32(float %177, i32 %178)
  %180 = select i1 %171, float 0.000000e+00, float %179
  %181 = select i1 %170, float 0x7FF0000000000000, float %180
  %182 = tail call float @llvm.fma.f32(float %181, float %167, float %181)
  %183 = tail call float @llvm.fabs.f32(float %181) #3
  %184 = fcmp oeq float %183, 0x7FF0000000000000
  %185 = select i1 %184, float %181, float %182
  %186 = tail call float @llvm.fabs.f32(float %42)
  %187 = tail call float @llvm.trunc.f32(float %186)
  %188 = fcmp oeq float %186, %187
  %189 = zext i1 %188 to i32
  %190 = fmul float %187, 5.000000e-01
  %191 = tail call float @llvm.amdgcn.fract.f32(float %190)
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %190, i32 516)
  %193 = select i1 %192, float 0.000000e+00, float %191
  %194 = fcmp oeq float %193, 0.000000e+00
  %195 = and i1 %188, %194
  %196 = zext i1 %195 to i32
  %197 = add nuw nsw i32 %196, %189
  %198 = icmp eq i32 %197, 1
  %199 = fcmp olt float %40, 0.000000e+00
  %200 = and i1 %198, %199
  %201 = select i1 %200, float -0.000000e+00, float 0.000000e+00
  %202 = tail call float @llvm.copysign.f32(float %185, float %201)
  %203 = fcmp uge float %40, 0.000000e+00
  %204 = icmp ne i32 %197, 0
  %205 = select i1 %203, i1 true, i1 %204
  %206 = select i1 %205, float %202, float 0x7FF8000000000000
  %207 = fcmp oeq float %186, 0x7FF0000000000000
  br i1 %207, label %208, label %217

208:                                              ; preds = %17
  %209 = fcmp oeq float %43, 1.000000e+00
  %210 = fadd float %43, -1.000000e+00
  %211 = bitcast float %42 to i32
  %212 = bitcast float %210 to i32
  %213 = xor i32 %212, %211
  %214 = icmp sgt i32 %213, -1
  %215 = select i1 %214, float 0x7FF0000000000000, float 0.000000e+00
  %216 = select i1 %209, float %43, float %215
  br label %217

217:                                              ; preds = %17, %208
  %218 = phi float [ %206, %17 ], [ %216, %208 ]
  %219 = fcmp oeq float %43, 0x7FF0000000000000
  %220 = fcmp oeq float %40, 0.000000e+00
  %221 = or i1 %220, %219
  %222 = icmp slt i32 %0, 1
  %223 = xor i1 %222, %220
  %224 = select i1 %223, float 0.000000e+00, float 0x7FF0000000000000
  %225 = select i1 %198, float %40, float 0.000000e+00
  %226 = tail call float @llvm.copysign.f32(float %224, float %225)
  %227 = select i1 %221, float %226, float %218
  %228 = fcmp uno float %40, 0.000000e+00
  %229 = select i1 %228, float 0x7FF8000000000000, float %227
  %230 = fcmp oeq float %40, 1.000000e+00
  %231 = icmp eq i32 %41, 0
  %232 = or i1 %231, %230
  %233 = select i1 %232, float 1.000000e+00, float %229
  %234 = fmul contract float %38, %233
  %235 = getelementptr inbounds float, float addrspace(1)* %5, i64 %18
  store float %234, float addrspace(1)* %235, align 4, !tbaa !7
  br label %236

236:                                              ; preds = %217, %6
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
