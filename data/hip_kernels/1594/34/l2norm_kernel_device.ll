; ModuleID = '../data/hip_kernels/1594/34/main.cu'
source_filename = "../data/hip_kernels/1594/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13l2norm_kerneliPfS_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %0
  br i1 %27, label %28, label %273

28:                                               ; preds = %6
  %29 = freeze i32 %26
  %30 = freeze i32 %5
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = icmp sgt i32 %4, 0
  br i1 %34, label %35, label %201

35:                                               ; preds = %28
  %36 = mul nsw i32 %31, %4
  br label %37

37:                                               ; preds = %35, %37
  %38 = phi i32 [ 0, %35 ], [ %199, %37 ]
  %39 = phi float [ 0.000000e+00, %35 ], [ %198, %37 ]
  %40 = add i32 %38, %36
  %41 = mul i32 %40, %5
  %42 = add nsw i32 %41, %33
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !14
  %46 = tail call float @llvm.fabs.f32(float %45)
  %47 = tail call float @llvm.amdgcn.frexp.mant.f32(float %46)
  %48 = fcmp olt float %47, 0x3FE5555560000000
  %49 = zext i1 %48 to i32
  %50 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %49)
  %51 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %46)
  %52 = sub nsw i32 %51, %49
  %53 = fadd float %50, -1.000000e+00
  %54 = fadd float %50, 1.000000e+00
  %55 = fadd float %54, -1.000000e+00
  %56 = fsub float %50, %55
  %57 = tail call float @llvm.amdgcn.rcp.f32(float %54)
  %58 = fmul float %53, %57
  %59 = fmul float %54, %58
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %58, float %54, float %60)
  %62 = tail call float @llvm.fma.f32(float %58, float %56, float %61)
  %63 = fadd float %59, %62
  %64 = fsub float %63, %59
  %65 = fsub float %62, %64
  %66 = fsub float %53, %63
  %67 = fsub float %53, %66
  %68 = fsub float %67, %63
  %69 = fsub float %68, %65
  %70 = fadd float %66, %69
  %71 = fmul float %57, %70
  %72 = fadd float %58, %71
  %73 = fsub float %72, %58
  %74 = fsub float %71, %73
  %75 = fmul float %72, %72
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %72, float %72, float %76)
  %78 = fmul float %74, 2.000000e+00
  %79 = tail call float @llvm.fma.f32(float %72, float %78, float %77)
  %80 = fadd float %75, %79
  %81 = fsub float %80, %75
  %82 = fsub float %79, %81
  %83 = tail call float @llvm.fmuladd.f32(float %80, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %84 = tail call float @llvm.fmuladd.f32(float %80, float %83, float 0x3FD999BDE0000000)
  %85 = sitofp i32 %52 to float
  %86 = fmul float %85, 0x3FE62E4300000000
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %85, float 0x3FE62E4300000000, float %87)
  %89 = tail call float @llvm.fma.f32(float %85, float 0xBE205C6100000000, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %94 = fmul float %72, %80
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %80, float %72, float %95)
  %97 = tail call float @llvm.fma.f32(float %80, float %74, float %96)
  %98 = tail call float @llvm.fma.f32(float %82, float %72, float %97)
  %99 = fadd float %94, %98
  %100 = fsub float %99, %94
  %101 = fsub float %98, %100
  %102 = fmul float %80, %84
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %80, float %84, float %103)
  %105 = tail call float @llvm.fma.f32(float %82, float %84, float %104)
  %106 = fadd float %102, %105
  %107 = fsub float %106, %102
  %108 = fsub float %105, %107
  %109 = fadd float %106, 0x3FE5555540000000
  %110 = fadd float %109, 0xBFE5555540000000
  %111 = fsub float %106, %110
  %112 = fadd float %108, 0x3E2E720200000000
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fmul float %99, %114
  %118 = fneg float %117
  %119 = tail call float @llvm.fma.f32(float %99, float %114, float %118)
  %120 = tail call float @llvm.fma.f32(float %99, float %116, float %119)
  %121 = tail call float @llvm.fma.f32(float %101, float %114, float %120)
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 1)
  %123 = fadd float %117, %121
  %124 = fsub float %123, %117
  %125 = fsub float %121, %124
  %126 = fadd float %93, %123
  %127 = fsub float %126, %93
  %128 = fsub float %123, %127
  %129 = fadd float %122, %125
  %130 = fadd float %129, %128
  %131 = fadd float %126, %130
  %132 = fsub float %131, %126
  %133 = fsub float %130, %132
  %134 = fadd float %90, %131
  %135 = fsub float %134, %90
  %136 = fsub float %134, %135
  %137 = fsub float %90, %136
  %138 = fsub float %131, %135
  %139 = fadd float %138, %137
  %140 = fadd float %92, %133
  %141 = fsub float %140, %92
  %142 = fsub float %140, %141
  %143 = fsub float %92, %142
  %144 = fsub float %133, %141
  %145 = fadd float %144, %143
  %146 = fadd float %140, %139
  %147 = fadd float %134, %146
  %148 = fsub float %147, %134
  %149 = fsub float %146, %148
  %150 = fadd float %145, %149
  %151 = fadd float %147, %150
  %152 = fsub float %151, %147
  %153 = fsub float %150, %152
  %154 = fmul float %151, 2.000000e+00
  %155 = fneg float %154
  %156 = tail call float @llvm.fma.f32(float %151, float 2.000000e+00, float %155)
  %157 = tail call float @llvm.fma.f32(float %153, float 2.000000e+00, float %156)
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = tail call float @llvm.fabs.f32(float %154) #3
  %162 = fcmp oeq float %161, 0x7FF0000000000000
  %163 = select i1 %162, float %154, float %158
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
  %190 = fcmp oeq float %46, 0x7FF0000000000000
  %191 = fcmp oeq float %45, 0.000000e+00
  %192 = select i1 %190, float 0x7FF0000000000000, float %189
  %193 = select i1 %191, float 0.000000e+00, float %192
  %194 = fcmp uno float %45, 0.000000e+00
  %195 = select i1 %194, float 0x7FF8000000000000, float %193
  %196 = fcmp oeq float %45, 1.000000e+00
  %197 = select i1 %196, float 1.000000e+00, float %195
  %198 = fadd contract float %39, %197
  %199 = add nuw nsw i32 %38, 1
  %200 = icmp eq i32 %199, %4
  br i1 %200, label %201, label %37, !llvm.loop !20

201:                                              ; preds = %37, %28
  %202 = phi float [ 0.000000e+00, %28 ], [ %198, %37 ]
  %203 = fcmp olt float %202, 0x39F0000000000000
  %204 = select i1 %203, float 0x41F0000000000000, float 1.000000e+00
  %205 = fmul float %202, %204
  %206 = tail call float @llvm.sqrt.f32(float %205)
  %207 = bitcast float %206 to i32
  %208 = add nsw i32 %207, -1
  %209 = bitcast i32 %208 to float
  %210 = add nsw i32 %207, 1
  %211 = bitcast i32 %210 to float
  %212 = tail call i1 @llvm.amdgcn.class.f32(float %205, i32 608)
  %213 = select i1 %203, float 0x3EF0000000000000, float 1.000000e+00
  %214 = fneg float %211
  %215 = tail call float @llvm.fma.f32(float %214, float %206, float %205)
  %216 = fcmp ogt float %215, 0.000000e+00
  %217 = fneg float %209
  %218 = tail call float @llvm.fma.f32(float %217, float %206, float %205)
  %219 = fcmp ole float %218, 0.000000e+00
  %220 = select i1 %219, float %209, float %206
  %221 = select i1 %216, float %211, float %220
  %222 = fmul float %213, %221
  %223 = select i1 %212, float %205, float %222
  %224 = fcmp contract oeq float %223, 0.000000e+00
  %225 = select i1 %224, float 1.000000e+00, float %223
  br i1 %34, label %226, label %273

226:                                              ; preds = %201
  %227 = mul nsw i32 %31, %4
  %228 = and i32 %4, 1
  %229 = icmp eq i32 %4, 1
  br i1 %229, label %259, label %230

230:                                              ; preds = %226
  %231 = and i32 %4, -2
  br label %232

232:                                              ; preds = %232, %230
  %233 = phi i32 [ 0, %230 ], [ %256, %232 ]
  %234 = phi i32 [ 0, %230 ], [ %257, %232 ]
  %235 = add i32 %233, %227
  %236 = mul i32 %235, %5
  %237 = add nsw i32 %236, %33
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %1, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !16
  %241 = fdiv contract float %240, %225
  store float %241, float addrspace(1)* %239, align 4, !tbaa !16
  %242 = fsub contract float 1.000000e+00, %241
  %243 = fdiv contract float %242, %225
  %244 = getelementptr inbounds float, float addrspace(1)* %2, i64 %238
  store float %243, float addrspace(1)* %244, align 4, !tbaa !16
  %245 = or i32 %233, 1
  %246 = add i32 %245, %227
  %247 = mul i32 %246, %5
  %248 = add nsw i32 %247, %33
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %1, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !16
  %252 = fdiv contract float %251, %225
  store float %252, float addrspace(1)* %250, align 4, !tbaa !16
  %253 = fsub contract float 1.000000e+00, %252
  %254 = fdiv contract float %253, %225
  %255 = getelementptr inbounds float, float addrspace(1)* %2, i64 %249
  store float %254, float addrspace(1)* %255, align 4, !tbaa !16
  %256 = add nuw nsw i32 %233, 2
  %257 = add i32 %234, 2
  %258 = icmp eq i32 %257, %231
  br i1 %258, label %259, label %232, !llvm.loop !22

259:                                              ; preds = %232, %226
  %260 = phi i32 [ 0, %226 ], [ %256, %232 ]
  %261 = icmp eq i32 %228, 0
  br i1 %261, label %273, label %262

262:                                              ; preds = %259
  %263 = add i32 %260, %227
  %264 = mul i32 %263, %5
  %265 = add nsw i32 %264, %33
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds float, float addrspace(1)* %1, i64 %266
  %268 = load float, float addrspace(1)* %267, align 4, !tbaa !16
  %269 = fdiv contract float %268, %225
  store float %269, float addrspace(1)* %267, align 4, !tbaa !16
  %270 = fsub contract float 1.000000e+00, %269
  %271 = fdiv contract float %270, %225
  %272 = getelementptr inbounds float, float addrspace(1)* %2, i64 %266
  store float %271, float addrspace(1)* %272, align 4, !tbaa !16
  br label %273

273:                                              ; preds = %262, %259, %201, %6
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
