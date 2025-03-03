; ModuleID = '../data/hip_kernels/17141/2/main.cu'
source_filename = "../data/hip_kernels/17141/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19GaussianNBVarKernelPKfPKiS0_PfS2_jjj(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = icmp ult i32 %17, %7
  br i1 %18, label %19, label %269

19:                                               ; preds = %8
  %20 = icmp eq i32 %5, 0
  br i1 %20, label %21, label %28

21:                                               ; preds = %28, %19
  %22 = icmp eq i32 %6, 0
  br i1 %22, label %269, label %23

23:                                               ; preds = %21
  %24 = and i32 %6, 3
  %25 = icmp ult i32 %6, 4
  br i1 %25, label %250, label %26

26:                                               ; preds = %23
  %27 = and i32 %6, -4
  br label %201

28:                                               ; preds = %19, %28
  %29 = phi i32 [ %199, %28 ], [ 0, %19 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = mul i32 %29, %7
  %34 = add i32 %33, %17
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11
  %38 = mul i32 %32, %7
  %39 = add i32 %38, %17
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !11
  %43 = fsub contract float %37, %42
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = tail call float @llvm.amdgcn.frexp.mant.f32(float %44)
  %46 = fcmp olt float %45, 0x3FE5555560000000
  %47 = zext i1 %46 to i32
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 %47)
  %49 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %44)
  %50 = sub nsw i32 %49, %47
  %51 = fadd float %48, -1.000000e+00
  %52 = fadd float %48, 1.000000e+00
  %53 = fadd float %52, -1.000000e+00
  %54 = fsub float %48, %53
  %55 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %56 = fmul float %51, %55
  %57 = fmul float %52, %56
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %56, float %52, float %58)
  %60 = tail call float @llvm.fma.f32(float %56, float %54, float %59)
  %61 = fadd float %57, %60
  %62 = fsub float %61, %57
  %63 = fsub float %60, %62
  %64 = fsub float %51, %61
  %65 = fsub float %51, %64
  %66 = fsub float %65, %61
  %67 = fsub float %66, %63
  %68 = fadd float %64, %67
  %69 = fmul float %55, %68
  %70 = fadd float %56, %69
  %71 = fsub float %70, %56
  %72 = fsub float %69, %71
  %73 = fmul float %70, %70
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %70, float %70, float %74)
  %76 = fmul float %72, 2.000000e+00
  %77 = tail call float @llvm.fma.f32(float %70, float %76, float %75)
  %78 = fadd float %73, %77
  %79 = fsub float %78, %73
  %80 = fsub float %77, %79
  %81 = tail call float @llvm.fmuladd.f32(float %78, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %82 = tail call float @llvm.fmuladd.f32(float %78, float %81, float 0x3FD999BDE0000000)
  %83 = sitofp i32 %50 to float
  %84 = fmul float %83, 0x3FE62E4300000000
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %83, float 0x3FE62E4300000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %83, float 0xBE205C6100000000, float %86)
  %88 = fadd float %84, %87
  %89 = fsub float %88, %84
  %90 = fsub float %87, %89
  %91 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 1)
  %92 = fmul float %70, %78
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %78, float %70, float %93)
  %95 = tail call float @llvm.fma.f32(float %78, float %72, float %94)
  %96 = tail call float @llvm.fma.f32(float %80, float %70, float %95)
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %78, %82
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %78, float %82, float %101)
  %103 = tail call float @llvm.fma.f32(float %80, float %82, float %102)
  %104 = fadd float %100, %103
  %105 = fsub float %104, %100
  %106 = fsub float %103, %105
  %107 = fadd float %104, 0x3FE5555540000000
  %108 = fadd float %107, 0xBFE5555540000000
  %109 = fsub float %104, %108
  %110 = fadd float %106, 0x3E2E720200000000
  %111 = fadd float %110, %109
  %112 = fadd float %107, %111
  %113 = fsub float %112, %107
  %114 = fsub float %111, %113
  %115 = fmul float %97, %112
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %97, float %112, float %116)
  %118 = tail call float @llvm.fma.f32(float %97, float %114, float %117)
  %119 = tail call float @llvm.fma.f32(float %99, float %112, float %118)
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %121 = fadd float %115, %119
  %122 = fsub float %121, %115
  %123 = fsub float %119, %122
  %124 = fadd float %91, %121
  %125 = fsub float %124, %91
  %126 = fsub float %121, %125
  %127 = fadd float %120, %123
  %128 = fadd float %127, %126
  %129 = fadd float %124, %128
  %130 = fsub float %129, %124
  %131 = fsub float %128, %130
  %132 = fadd float %88, %129
  %133 = fsub float %132, %88
  %134 = fsub float %132, %133
  %135 = fsub float %88, %134
  %136 = fsub float %129, %133
  %137 = fadd float %136, %135
  %138 = fadd float %90, %131
  %139 = fsub float %138, %90
  %140 = fsub float %138, %139
  %141 = fsub float %90, %140
  %142 = fsub float %131, %139
  %143 = fadd float %142, %141
  %144 = fadd float %138, %137
  %145 = fadd float %132, %144
  %146 = fsub float %145, %132
  %147 = fsub float %144, %146
  %148 = fadd float %143, %147
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = fmul float %149, 2.000000e+00
  %153 = fneg float %152
  %154 = tail call float @llvm.fma.f32(float %149, float 2.000000e+00, float %153)
  %155 = fmul float %149, 0.000000e+00
  %156 = tail call float @llvm.fma.f32(float %151, float 2.000000e+00, float %155)
  %157 = fadd float %154, %156
  %158 = fadd float %152, %157
  %159 = fsub float %158, %152
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %152) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %152, float %158
  %164 = tail call float @llvm.fabs.f32(float %163) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float 0.000000e+00, float %160
  %167 = fcmp oeq float %163, 0x40562E4300000000
  %168 = select i1 %167, float 0x3EE0000000000000, float 0.000000e+00
  %169 = fsub float %163, %168
  %170 = fadd float %168, %166
  %171 = fmul float %169, 0x3FF7154760000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = fcmp ogt float %169, 0x40562E4300000000
  %174 = fcmp olt float %169, 0xC059D1DA00000000
  %175 = fneg float %171
  %176 = tail call float @llvm.fma.f32(float %169, float 0x3FF7154760000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %169, float 0x3E54AE0BE0000000, float %176)
  %178 = fsub float %171, %172
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.exp2.f32(float %179)
  %181 = fptosi float %172 to i32
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %180, i32 %181)
  %183 = select i1 %174, float 0.000000e+00, float %182
  %184 = select i1 %173, float 0x7FF0000000000000, float %183
  %185 = tail call float @llvm.fma.f32(float %184, float %170, float %184)
  %186 = tail call float @llvm.fabs.f32(float %184) #3
  %187 = fcmp oeq float %186, 0x7FF0000000000000
  %188 = select i1 %187, float %184, float %185
  %189 = tail call float @llvm.fabs.f32(float %188)
  %190 = fcmp oeq float %44, 0x7FF0000000000000
  %191 = fcmp oeq float %43, 0.000000e+00
  %192 = select i1 %190, float 0x7FF0000000000000, float %189
  %193 = select i1 %191, float 0.000000e+00, float %192
  %194 = fcmp uno float %43, 0.000000e+00
  %195 = select i1 %194, float 0x7FF8000000000000, float %193
  %196 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !11
  %198 = fadd contract float %197, %195
  store float %198, float addrspace(1)* %196, align 4, !tbaa !11
  %199 = add nuw i32 %29, 1
  %200 = icmp eq i32 %199, %5
  br i1 %200, label %21, label %28, !llvm.loop !13

201:                                              ; preds = %201, %26
  %202 = phi i32 [ 0, %26 ], [ %247, %201 ]
  %203 = phi i32 [ 0, %26 ], [ %248, %201 ]
  %204 = zext i32 %202 to i64
  %205 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %204
  %206 = load i32, i32 addrspace(1)* %205, align 4, !tbaa !7, !amdgpu.noclobber !6
  %207 = sitofp i32 %206 to float
  %208 = mul i32 %202, %7
  %209 = add i32 %208, %17
  %210 = zext i32 %209 to i64
  %211 = getelementptr inbounds float, float addrspace(1)* %3, i64 %210
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !11
  %213 = fdiv contract float %212, %207
  store float %213, float addrspace(1)* %211, align 4, !tbaa !11
  %214 = or i32 %202, 1
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %215
  %217 = load i32, i32 addrspace(1)* %216, align 4, !tbaa !7, !amdgpu.noclobber !6
  %218 = sitofp i32 %217 to float
  %219 = mul i32 %214, %7
  %220 = add i32 %219, %17
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %3, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !11
  %224 = fdiv contract float %223, %218
  store float %224, float addrspace(1)* %222, align 4, !tbaa !11
  %225 = or i32 %202, 2
  %226 = zext i32 %225 to i64
  %227 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %226
  %228 = load i32, i32 addrspace(1)* %227, align 4, !tbaa !7, !amdgpu.noclobber !6
  %229 = sitofp i32 %228 to float
  %230 = mul i32 %225, %7
  %231 = add i32 %230, %17
  %232 = zext i32 %231 to i64
  %233 = getelementptr inbounds float, float addrspace(1)* %3, i64 %232
  %234 = load float, float addrspace(1)* %233, align 4, !tbaa !11
  %235 = fdiv contract float %234, %229
  store float %235, float addrspace(1)* %233, align 4, !tbaa !11
  %236 = or i32 %202, 3
  %237 = zext i32 %236 to i64
  %238 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %237
  %239 = load i32, i32 addrspace(1)* %238, align 4, !tbaa !7, !amdgpu.noclobber !6
  %240 = sitofp i32 %239 to float
  %241 = mul i32 %236, %7
  %242 = add i32 %241, %17
  %243 = zext i32 %242 to i64
  %244 = getelementptr inbounds float, float addrspace(1)* %3, i64 %243
  %245 = load float, float addrspace(1)* %244, align 4, !tbaa !11
  %246 = fdiv contract float %245, %240
  store float %246, float addrspace(1)* %244, align 4, !tbaa !11
  %247 = add nuw i32 %202, 4
  %248 = add i32 %203, 4
  %249 = icmp eq i32 %248, %27
  br i1 %249, label %250, label %201, !llvm.loop !15

250:                                              ; preds = %201, %23
  %251 = phi i32 [ 0, %23 ], [ %247, %201 ]
  %252 = icmp eq i32 %24, 0
  br i1 %252, label %269, label %253

253:                                              ; preds = %250, %253
  %254 = phi i32 [ %266, %253 ], [ %251, %250 ]
  %255 = phi i32 [ %267, %253 ], [ 0, %250 ]
  %256 = zext i32 %254 to i64
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %256
  %258 = load i32, i32 addrspace(1)* %257, align 4, !tbaa !7, !amdgpu.noclobber !6
  %259 = sitofp i32 %258 to float
  %260 = mul i32 %254, %7
  %261 = add i32 %260, %17
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %3, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !11
  %265 = fdiv contract float %264, %259
  store float %265, float addrspace(1)* %263, align 4, !tbaa !11
  %266 = add nuw i32 %254, 1
  %267 = add i32 %255, 1
  %268 = icmp eq i32 %267, %24
  br i1 %268, label %269, label %253, !llvm.loop !16

269:                                              ; preds = %250, %253, %21, %8
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
