; ModuleID = '../data/hip_kernels/2272/36/main.cu'
source_filename = "../data/hip_kernels/2272/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20fast_variance_kernelPfS_iiiS_E5local = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20fast_variance_kernelPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %7
  store float 0.000000e+00, float addrspace(3)* %8, align 4, !tbaa !5
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp sgt i32 %2, 0
  br i1 %10, label %11, label %196

11:                                               ; preds = %6
  %12 = icmp sgt i32 %4, 0
  %13 = sext i32 %9 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  br label %15

15:                                               ; preds = %11, %192
  %16 = phi float [ 0.000000e+00, %11 ], [ %193, %192 ]
  %17 = phi i32 [ 0, %11 ], [ %194, %192 ]
  br i1 %12, label %18, label %192

18:                                               ; preds = %15
  %19 = mul i32 %17, %3
  %20 = add i32 %19, %9
  %21 = mul i32 %20, %4
  br label %22

22:                                               ; preds = %18, %186
  %23 = phi float [ %16, %18 ], [ %188, %186 ]
  %24 = phi i32 [ 0, %18 ], [ %189, %186 ]
  %25 = add nuw nsw i32 %24, %7
  %26 = icmp slt i32 %25, %4
  br i1 %26, label %27, label %186

27:                                               ; preds = %22
  %28 = add i32 %25, %21
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %33 = fsub contract float %31, %32
  %34 = tail call float @llvm.fabs.f32(float %33)
  %35 = tail call float @llvm.amdgcn.frexp.mant.f32(float %34)
  %36 = fcmp olt float %35, 0x3FE5555560000000
  %37 = zext i1 %36 to i32
  %38 = tail call float @llvm.amdgcn.ldexp.f32(float %35, i32 %37)
  %39 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %34)
  %40 = sub nsw i32 %39, %37
  %41 = fadd float %38, -1.000000e+00
  %42 = fadd float %38, 1.000000e+00
  %43 = fadd float %42, -1.000000e+00
  %44 = fsub float %38, %43
  %45 = tail call float @llvm.amdgcn.rcp.f32(float %42)
  %46 = fmul float %41, %45
  %47 = fmul float %42, %46
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %46, float %42, float %48)
  %50 = tail call float @llvm.fma.f32(float %46, float %44, float %49)
  %51 = fadd float %47, %50
  %52 = fsub float %51, %47
  %53 = fsub float %50, %52
  %54 = fsub float %41, %51
  %55 = fsub float %41, %54
  %56 = fsub float %55, %51
  %57 = fsub float %56, %53
  %58 = fadd float %54, %57
  %59 = fmul float %45, %58
  %60 = fadd float %46, %59
  %61 = fsub float %60, %46
  %62 = fsub float %59, %61
  %63 = fmul float %60, %60
  %64 = fneg float %63
  %65 = tail call float @llvm.fma.f32(float %60, float %60, float %64)
  %66 = fmul float %62, 2.000000e+00
  %67 = tail call float @llvm.fma.f32(float %60, float %66, float %65)
  %68 = fadd float %63, %67
  %69 = fsub float %68, %63
  %70 = fsub float %67, %69
  %71 = tail call float @llvm.fmuladd.f32(float %68, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %72 = tail call float @llvm.fmuladd.f32(float %68, float %71, float 0x3FD999BDE0000000)
  %73 = sitofp i32 %40 to float
  %74 = fmul float %73, 0x3FE62E4300000000
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %73, float 0x3FE62E4300000000, float %75)
  %77 = tail call float @llvm.fma.f32(float %73, float 0xBE205C6100000000, float %76)
  %78 = fadd float %74, %77
  %79 = fsub float %78, %74
  %80 = fsub float %77, %79
  %81 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 1)
  %82 = fmul float %60, %68
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %68, float %60, float %83)
  %85 = tail call float @llvm.fma.f32(float %68, float %62, float %84)
  %86 = tail call float @llvm.fma.f32(float %70, float %60, float %85)
  %87 = fadd float %82, %86
  %88 = fsub float %87, %82
  %89 = fsub float %86, %88
  %90 = fmul float %68, %72
  %91 = fneg float %90
  %92 = tail call float @llvm.fma.f32(float %68, float %72, float %91)
  %93 = tail call float @llvm.fma.f32(float %70, float %72, float %92)
  %94 = fadd float %90, %93
  %95 = fsub float %94, %90
  %96 = fsub float %93, %95
  %97 = fadd float %94, 0x3FE5555540000000
  %98 = fadd float %97, 0xBFE5555540000000
  %99 = fsub float %94, %98
  %100 = fadd float %96, 0x3E2E720200000000
  %101 = fadd float %100, %99
  %102 = fadd float %97, %101
  %103 = fsub float %102, %97
  %104 = fsub float %101, %103
  %105 = fmul float %87, %102
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %87, float %102, float %106)
  %108 = tail call float @llvm.fma.f32(float %87, float %104, float %107)
  %109 = tail call float @llvm.fma.f32(float %89, float %102, float %108)
  %110 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 1)
  %111 = fadd float %105, %109
  %112 = fsub float %111, %105
  %113 = fsub float %109, %112
  %114 = fadd float %81, %111
  %115 = fsub float %114, %81
  %116 = fsub float %111, %115
  %117 = fadd float %110, %113
  %118 = fadd float %117, %116
  %119 = fadd float %114, %118
  %120 = fsub float %119, %114
  %121 = fsub float %118, %120
  %122 = fadd float %78, %119
  %123 = fsub float %122, %78
  %124 = fsub float %122, %123
  %125 = fsub float %78, %124
  %126 = fsub float %119, %123
  %127 = fadd float %126, %125
  %128 = fadd float %80, %121
  %129 = fsub float %128, %80
  %130 = fsub float %128, %129
  %131 = fsub float %80, %130
  %132 = fsub float %121, %129
  %133 = fadd float %132, %131
  %134 = fadd float %128, %127
  %135 = fadd float %122, %134
  %136 = fsub float %135, %122
  %137 = fsub float %134, %136
  %138 = fadd float %133, %137
  %139 = fadd float %135, %138
  %140 = fsub float %139, %135
  %141 = fsub float %138, %140
  %142 = fmul float %139, 2.000000e+00
  %143 = fneg float %142
  %144 = tail call float @llvm.fma.f32(float %139, float 2.000000e+00, float %143)
  %145 = tail call float @llvm.fma.f32(float %141, float 2.000000e+00, float %144)
  %146 = fadd float %142, %145
  %147 = fsub float %146, %142
  %148 = fsub float %145, %147
  %149 = tail call float @llvm.fabs.f32(float %142) #4
  %150 = fcmp oeq float %149, 0x7FF0000000000000
  %151 = select i1 %150, float %142, float %146
  %152 = tail call float @llvm.fabs.f32(float %151) #4
  %153 = fcmp oeq float %152, 0x7FF0000000000000
  %154 = select i1 %153, float 0.000000e+00, float %148
  %155 = fcmp oeq float %151, 0x40562E4300000000
  %156 = select i1 %155, float 0x3EE0000000000000, float 0.000000e+00
  %157 = fsub float %151, %156
  %158 = fadd float %156, %154
  %159 = fmul float %157, 0x3FF7154760000000
  %160 = tail call float @llvm.rint.f32(float %159)
  %161 = fcmp ogt float %157, 0x40562E4300000000
  %162 = fcmp olt float %157, 0xC059D1DA00000000
  %163 = fneg float %159
  %164 = tail call float @llvm.fma.f32(float %157, float 0x3FF7154760000000, float %163)
  %165 = tail call float @llvm.fma.f32(float %157, float 0x3E54AE0BE0000000, float %164)
  %166 = fsub float %159, %160
  %167 = fadd float %165, %166
  %168 = tail call float @llvm.exp2.f32(float %167)
  %169 = fptosi float %160 to i32
  %170 = tail call float @llvm.amdgcn.ldexp.f32(float %168, i32 %169)
  %171 = select i1 %162, float 0.000000e+00, float %170
  %172 = select i1 %161, float 0x7FF0000000000000, float %171
  %173 = tail call float @llvm.fma.f32(float %172, float %158, float %172)
  %174 = tail call float @llvm.fabs.f32(float %172) #4
  %175 = fcmp oeq float %174, 0x7FF0000000000000
  %176 = select i1 %175, float %172, float %173
  %177 = tail call float @llvm.fabs.f32(float %176)
  %178 = fcmp oeq float %34, 0x7FF0000000000000
  %179 = fcmp oeq float %33, 0.000000e+00
  %180 = select i1 %178, float 0x7FF0000000000000, float %177
  %181 = select i1 %179, float 0.000000e+00, float %180
  %182 = fcmp uno float %33, 0.000000e+00
  %183 = select i1 %182, float 0x7FF8000000000000, float %181
  %184 = fcmp oeq float %33, 1.000000e+00
  %185 = select i1 %184, float 1.000000e+00, float %183
  br label %186

186:                                              ; preds = %22, %27
  %187 = phi contract float [ %185, %27 ], [ 0.000000e+00, %22 ]
  %188 = fadd contract float %187, %23
  %189 = add nuw nsw i32 %24, 512
  %190 = icmp slt i32 %189, %4
  br i1 %190, label %22, label %191, !llvm.loop !10

191:                                              ; preds = %186
  store float %188, float addrspace(3)* %8, align 4, !tbaa !5
  br label %192

192:                                              ; preds = %191, %15
  %193 = phi float [ %188, %191 ], [ %16, %15 ]
  %194 = add nuw nsw i32 %17, 1
  %195 = icmp eq i32 %194, %2
  br i1 %195, label %196, label %15, !llvm.loop !12

196:                                              ; preds = %192, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %197 = icmp eq i32 %7, 0
  br i1 %197, label %198, label %274

198:                                              ; preds = %196
  %199 = sext i32 %9 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %5, i64 %199
  store float 0.000000e+00, float addrspace(1)* %200, align 4, !tbaa !5
  br label %201

201:                                              ; preds = %201, %198
  %202 = phi i32 [ 0, %198 ], [ %267, %201 ]
  %203 = phi float [ 0.000000e+00, %198 ], [ %266, %201 ]
  %204 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %202
  %205 = load float, float addrspace(3)* %204, align 16, !tbaa !5
  %206 = fadd contract float %205, %203
  %207 = or i32 %202, 1
  %208 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %207
  %209 = load float, float addrspace(3)* %208, align 4, !tbaa !5
  %210 = fadd contract float %209, %206
  %211 = or i32 %202, 2
  %212 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %211
  %213 = load float, float addrspace(3)* %212, align 8, !tbaa !5
  %214 = fadd contract float %213, %210
  %215 = or i32 %202, 3
  %216 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !5
  %218 = fadd contract float %217, %214
  %219 = or i32 %202, 4
  %220 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %219
  %221 = load float, float addrspace(3)* %220, align 16, !tbaa !5
  %222 = fadd contract float %221, %218
  %223 = or i32 %202, 5
  %224 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %223
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !5
  %226 = fadd contract float %225, %222
  %227 = or i32 %202, 6
  %228 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %227
  %229 = load float, float addrspace(3)* %228, align 8, !tbaa !5
  %230 = fadd contract float %229, %226
  %231 = or i32 %202, 7
  %232 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !5
  %234 = fadd contract float %233, %230
  %235 = or i32 %202, 8
  %236 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %235
  %237 = load float, float addrspace(3)* %236, align 16, !tbaa !5
  %238 = fadd contract float %237, %234
  %239 = or i32 %202, 9
  %240 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %239
  %241 = load float, float addrspace(3)* %240, align 4, !tbaa !5
  %242 = fadd contract float %241, %238
  %243 = or i32 %202, 10
  %244 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %243
  %245 = load float, float addrspace(3)* %244, align 8, !tbaa !5
  %246 = fadd contract float %245, %242
  %247 = or i32 %202, 11
  %248 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %247
  %249 = load float, float addrspace(3)* %248, align 4, !tbaa !5
  %250 = fadd contract float %249, %246
  %251 = or i32 %202, 12
  %252 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %251
  %253 = load float, float addrspace(3)* %252, align 16, !tbaa !5
  %254 = fadd contract float %253, %250
  %255 = or i32 %202, 13
  %256 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %255
  %257 = load float, float addrspace(3)* %256, align 4, !tbaa !5
  %258 = fadd contract float %257, %254
  %259 = or i32 %202, 14
  %260 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %259
  %261 = load float, float addrspace(3)* %260, align 8, !tbaa !5
  %262 = fadd contract float %261, %258
  %263 = or i32 %202, 15
  %264 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ20fast_variance_kernelPfS_iiiS_E5local, i32 0, i32 %263
  %265 = load float, float addrspace(3)* %264, align 4, !tbaa !5
  %266 = fadd contract float %265, %262
  %267 = add nuw nsw i32 %202, 16
  %268 = icmp eq i32 %267, 512
  br i1 %268, label %269, label %201, !llvm.loop !13

269:                                              ; preds = %201
  %270 = mul nsw i32 %4, %2
  %271 = add nsw i32 %270, -1
  %272 = sitofp i32 %271 to float
  %273 = fdiv contract float %266, %272
  store float %273, float addrspace(1)* %200, align 4, !tbaa !5
  br label %274

274:                                              ; preds = %269, %196
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
