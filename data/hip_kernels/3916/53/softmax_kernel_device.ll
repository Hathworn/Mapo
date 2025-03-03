; ModuleID = '../data/hip_kernels/3916/53/main.cu'
source_filename = "../data/hip_kernels/3916/53/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14softmax_kernelPfiiiiiifS_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, float %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !4
  %16 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !13, !invariant.load !14
  %19 = zext i16 %18 to i32
  %20 = udiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = icmp ugt i32 %15, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %10
  %27 = mul i32 %26, %19
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = mul nsw i32 %4, %2
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %288

32:                                               ; preds = %9
  %33 = freeze i32 %29
  %34 = freeze i32 %4
  %35 = sdiv i32 %33, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %33, %36
  %38 = mul nsw i32 %35, %3
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = mul nsw i32 %37, %5
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %40, i64 %42
  %44 = getelementptr inbounds float, float addrspace(1)* %8, i64 %39
  %45 = getelementptr inbounds float, float addrspace(1)* %44, i64 %42
  %46 = icmp sgt i32 %1, 0
  br i1 %46, label %47, label %72

47:                                               ; preds = %32
  %48 = and i32 %1, 7
  %49 = icmp ult i32 %1, 8
  br i1 %49, label %52, label %50

50:                                               ; preds = %47
  %51 = and i32 %1, -8
  br label %80

52:                                               ; preds = %80, %47
  %53 = phi float [ undef, %47 ], [ %154, %80 ]
  %54 = phi i32 [ 0, %47 ], [ %155, %80 ]
  %55 = phi float [ 0xFFF0000000000000, %47 ], [ %154, %80 ]
  %56 = icmp eq i32 %48, 0
  br i1 %56, label %72, label %57

57:                                               ; preds = %52, %57
  %58 = phi i32 [ %69, %57 ], [ %54, %52 ]
  %59 = phi float [ %68, %57 ], [ %55, %52 ]
  %60 = phi i32 [ %70, %57 ], [ 0, %52 ]
  %61 = mul nsw i32 %58, %6
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %43, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16, !amdgpu.noclobber !14
  %65 = fptosi float %64 to i32
  %66 = sitofp i32 %65 to float
  %67 = fcmp contract olt float %59, %66
  %68 = select contract i1 %67, float %66, float %59
  %69 = add nuw nsw i32 %58, 1
  %70 = add i32 %60, 1
  %71 = icmp eq i32 %70, %48
  br i1 %71, label %72, label %57, !llvm.loop !20

72:                                               ; preds = %52, %57, %32
  %73 = phi float [ 0xFFF0000000000000, %32 ], [ %53, %52 ], [ %68, %57 ]
  br i1 %46, label %74, label %186

74:                                               ; preds = %72
  %75 = fdiv contract float %73, %7
  %76 = and i32 %1, 1
  %77 = icmp eq i32 %1, 1
  br i1 %77, label %158, label %78

78:                                               ; preds = %74
  %79 = and i32 %1, -2
  br label %193

80:                                               ; preds = %80, %50
  %81 = phi i32 [ 0, %50 ], [ %155, %80 ]
  %82 = phi float [ 0xFFF0000000000000, %50 ], [ %154, %80 ]
  %83 = phi i32 [ 0, %50 ], [ %156, %80 ]
  %84 = mul nsw i32 %81, %6
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %43, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16, !amdgpu.noclobber !14
  %88 = fptosi float %87 to i32
  %89 = sitofp i32 %88 to float
  %90 = fcmp contract olt float %82, %89
  %91 = select contract i1 %90, float %89, float %82
  %92 = or i32 %81, 1
  %93 = mul nsw i32 %92, %6
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %43, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !14
  %97 = fptosi float %96 to i32
  %98 = sitofp i32 %97 to float
  %99 = fcmp contract olt float %91, %98
  %100 = select contract i1 %99, float %98, float %91
  %101 = or i32 %81, 2
  %102 = mul nsw i32 %101, %6
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %43, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16, !amdgpu.noclobber !14
  %106 = fptosi float %105 to i32
  %107 = sitofp i32 %106 to float
  %108 = fcmp contract olt float %100, %107
  %109 = select contract i1 %108, float %107, float %100
  %110 = or i32 %81, 3
  %111 = mul nsw i32 %110, %6
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %43, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !14
  %115 = fptosi float %114 to i32
  %116 = sitofp i32 %115 to float
  %117 = fcmp contract olt float %109, %116
  %118 = select contract i1 %117, float %116, float %109
  %119 = or i32 %81, 4
  %120 = mul nsw i32 %119, %6
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %43, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !14
  %124 = fptosi float %123 to i32
  %125 = sitofp i32 %124 to float
  %126 = fcmp contract olt float %118, %125
  %127 = select contract i1 %126, float %125, float %118
  %128 = or i32 %81, 5
  %129 = mul nsw i32 %128, %6
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %43, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !16, !amdgpu.noclobber !14
  %133 = fptosi float %132 to i32
  %134 = sitofp i32 %133 to float
  %135 = fcmp contract olt float %127, %134
  %136 = select contract i1 %135, float %134, float %127
  %137 = or i32 %81, 6
  %138 = mul nsw i32 %137, %6
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %43, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16, !amdgpu.noclobber !14
  %142 = fptosi float %141 to i32
  %143 = sitofp i32 %142 to float
  %144 = fcmp contract olt float %136, %143
  %145 = select contract i1 %144, float %143, float %136
  %146 = or i32 %81, 7
  %147 = mul nsw i32 %146, %6
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %43, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !16, !amdgpu.noclobber !14
  %151 = fptosi float %150 to i32
  %152 = sitofp i32 %151 to float
  %153 = fcmp contract olt float %145, %152
  %154 = select contract i1 %153, float %152, float %145
  %155 = add nuw nsw i32 %81, 8
  %156 = add i32 %83, 8
  %157 = icmp eq i32 %156, %51
  br i1 %157, label %52, label %80, !llvm.loop !22

158:                                              ; preds = %193, %74
  %159 = phi float [ undef, %74 ], [ %240, %193 ]
  %160 = phi i32 [ 0, %74 ], [ %242, %193 ]
  %161 = phi float [ 0.000000e+00, %74 ], [ %240, %193 ]
  %162 = icmp eq i32 %76, 0
  br i1 %162, label %186, label %163

163:                                              ; preds = %158
  %164 = mul nsw i32 %160, %6
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %43, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !16
  %168 = fdiv contract float %167, %7
  %169 = fsub contract float %168, %75
  %170 = fmul float %169, 0x3FF7154760000000
  %171 = tail call float @llvm.rint.f32(float %170)
  %172 = fcmp ogt float %169, 0x40562E4300000000
  %173 = fcmp olt float %169, 0xC059D1DA00000000
  %174 = fneg float %170
  %175 = tail call float @llvm.fma.f32(float %169, float 0x3FF7154760000000, float %174)
  %176 = tail call float @llvm.fma.f32(float %169, float 0x3E54AE0BE0000000, float %175)
  %177 = fsub float %170, %171
  %178 = fadd float %176, %177
  %179 = tail call float @llvm.exp2.f32(float %178)
  %180 = fptosi float %171 to i32
  %181 = tail call float @llvm.amdgcn.ldexp.f32(float %179, i32 %180)
  %182 = select i1 %173, float 0.000000e+00, float %181
  %183 = select i1 %172, float 0x7FF0000000000000, float %182
  %184 = fadd contract float %161, %183
  %185 = getelementptr inbounds float, float addrspace(1)* %45, i64 %165
  store float %183, float addrspace(1)* %185, align 4, !tbaa !16
  br label %186

186:                                              ; preds = %163, %158, %72
  %187 = phi float [ 0.000000e+00, %72 ], [ %159, %158 ], [ %184, %163 ]
  br i1 %46, label %188, label %288

188:                                              ; preds = %186
  %189 = and i32 %1, 3
  %190 = icmp ult i32 %1, 4
  br i1 %190, label %274, label %191

191:                                              ; preds = %188
  %192 = and i32 %1, -4
  br label %245

193:                                              ; preds = %193, %78
  %194 = phi i32 [ 0, %78 ], [ %242, %193 ]
  %195 = phi float [ 0.000000e+00, %78 ], [ %240, %193 ]
  %196 = phi i32 [ 0, %78 ], [ %243, %193 ]
  %197 = mul nsw i32 %194, %6
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %43, i64 %198
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !16
  %201 = fdiv contract float %200, %7
  %202 = fsub contract float %201, %75
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = tail call float @llvm.rint.f32(float %203)
  %205 = fcmp ogt float %202, 0x40562E4300000000
  %206 = fcmp olt float %202, 0xC059D1DA00000000
  %207 = fneg float %203
  %208 = tail call float @llvm.fma.f32(float %202, float 0x3FF7154760000000, float %207)
  %209 = tail call float @llvm.fma.f32(float %202, float 0x3E54AE0BE0000000, float %208)
  %210 = fsub float %203, %204
  %211 = fadd float %209, %210
  %212 = tail call float @llvm.exp2.f32(float %211)
  %213 = fptosi float %204 to i32
  %214 = tail call float @llvm.amdgcn.ldexp.f32(float %212, i32 %213)
  %215 = select i1 %206, float 0.000000e+00, float %214
  %216 = select i1 %205, float 0x7FF0000000000000, float %215
  %217 = fadd contract float %195, %216
  %218 = getelementptr inbounds float, float addrspace(1)* %45, i64 %198
  store float %216, float addrspace(1)* %218, align 4, !tbaa !16
  %219 = or i32 %194, 1
  %220 = mul nsw i32 %219, %6
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %43, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !16
  %224 = fdiv contract float %223, %7
  %225 = fsub contract float %224, %75
  %226 = fmul float %225, 0x3FF7154760000000
  %227 = tail call float @llvm.rint.f32(float %226)
  %228 = fcmp ogt float %225, 0x40562E4300000000
  %229 = fcmp olt float %225, 0xC059D1DA00000000
  %230 = fneg float %226
  %231 = tail call float @llvm.fma.f32(float %225, float 0x3FF7154760000000, float %230)
  %232 = tail call float @llvm.fma.f32(float %225, float 0x3E54AE0BE0000000, float %231)
  %233 = fsub float %226, %227
  %234 = fadd float %232, %233
  %235 = tail call float @llvm.exp2.f32(float %234)
  %236 = fptosi float %227 to i32
  %237 = tail call float @llvm.amdgcn.ldexp.f32(float %235, i32 %236)
  %238 = select i1 %229, float 0.000000e+00, float %237
  %239 = select i1 %228, float 0x7FF0000000000000, float %238
  %240 = fadd contract float %217, %239
  %241 = getelementptr inbounds float, float addrspace(1)* %45, i64 %221
  store float %239, float addrspace(1)* %241, align 4, !tbaa !16
  %242 = add nuw nsw i32 %194, 2
  %243 = add i32 %196, 2
  %244 = icmp eq i32 %243, %79
  br i1 %244, label %158, label %193, !llvm.loop !24

245:                                              ; preds = %245, %191
  %246 = phi i32 [ 0, %191 ], [ %271, %245 ]
  %247 = phi i32 [ 0, %191 ], [ %272, %245 ]
  %248 = mul nsw i32 %246, %6
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %45, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !16
  %252 = fdiv contract float %251, %187
  store float %252, float addrspace(1)* %250, align 4, !tbaa !16
  %253 = or i32 %246, 1
  %254 = mul nsw i32 %253, %6
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %45, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !16
  %258 = fdiv contract float %257, %187
  store float %258, float addrspace(1)* %256, align 4, !tbaa !16
  %259 = or i32 %246, 2
  %260 = mul nsw i32 %259, %6
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %45, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !16
  %264 = fdiv contract float %263, %187
  store float %264, float addrspace(1)* %262, align 4, !tbaa !16
  %265 = or i32 %246, 3
  %266 = mul nsw i32 %265, %6
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %45, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !16
  %270 = fdiv contract float %269, %187
  store float %270, float addrspace(1)* %268, align 4, !tbaa !16
  %271 = add nuw nsw i32 %246, 4
  %272 = add i32 %247, 4
  %273 = icmp eq i32 %272, %192
  br i1 %273, label %274, label %245, !llvm.loop !25

274:                                              ; preds = %245, %188
  %275 = phi i32 [ 0, %188 ], [ %271, %245 ]
  %276 = icmp eq i32 %189, 0
  br i1 %276, label %288, label %277

277:                                              ; preds = %274, %277
  %278 = phi i32 [ %285, %277 ], [ %275, %274 ]
  %279 = phi i32 [ %286, %277 ], [ 0, %274 ]
  %280 = mul nsw i32 %278, %6
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds float, float addrspace(1)* %45, i64 %281
  %283 = load float, float addrspace(1)* %282, align 4, !tbaa !16
  %284 = fdiv contract float %283, %187
  store float %284, float addrspace(1)* %282, align 4, !tbaa !16
  %285 = add nuw nsw i32 %278, 1
  %286 = add i32 %279, 1
  %287 = icmp eq i32 %286, %189
  br i1 %287, label %288, label %277, !llvm.loop !26

288:                                              ; preds = %274, %277, %186, %9
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
!25 = distinct !{!25, !23}
!26 = distinct !{!26, !21}
