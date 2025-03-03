; ModuleID = '../data/hip_kernels/4223/52/main.cu'
source_filename = "../data/hip_kernels/4223/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19softmax_tree_kernelPfiiifS_iPiS0_(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float %4, float addrspace(1)* nocapture %5, i32 %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
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
  %30 = mul nsw i32 %2, %1
  %31 = mul nsw i32 %30, %6
  %32 = icmp slt i32 %29, %31
  br i1 %32, label %33, label %301

33:                                               ; preds = %9
  %34 = freeze i32 %29
  %35 = freeze i32 %1
  %36 = sdiv i32 %34, %35
  %37 = mul i32 %36, %35
  %38 = sub i32 %34, %37
  %39 = freeze i32 %6
  %40 = sdiv i32 %36, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %36, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !14
  %46 = mul nsw i32 %45, %1
  %47 = mul nsw i32 %40, %3
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %49, i64 %50
  %52 = sext i32 %38 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %51, i64 %52
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %43
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !14
  %56 = getelementptr inbounds float, float addrspace(1)* %5, i64 %48
  %57 = getelementptr inbounds float, float addrspace(1)* %56, i64 %50
  %58 = getelementptr inbounds float, float addrspace(1)* %57, i64 %52
  %59 = icmp sgt i32 %55, 0
  br i1 %59, label %60, label %85

60:                                               ; preds = %33
  %61 = and i32 %55, 7
  %62 = icmp ult i32 %55, 8
  br i1 %62, label %65, label %63

63:                                               ; preds = %60
  %64 = and i32 %55, -8
  br label %93

65:                                               ; preds = %93, %60
  %66 = phi float [ undef, %60 ], [ %167, %93 ]
  %67 = phi i32 [ 0, %60 ], [ %168, %93 ]
  %68 = phi float [ 0xFFF0000000000000, %60 ], [ %167, %93 ]
  %69 = icmp eq i32 %61, 0
  br i1 %69, label %85, label %70

70:                                               ; preds = %65, %70
  %71 = phi i32 [ %82, %70 ], [ %67, %65 ]
  %72 = phi float [ %81, %70 ], [ %68, %65 ]
  %73 = phi i32 [ %83, %70 ], [ 0, %65 ]
  %74 = mul nsw i32 %71, %1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %53, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !20, !amdgpu.noclobber !14
  %78 = fptosi float %77 to i32
  %79 = sitofp i32 %78 to float
  %80 = fcmp contract olt float %72, %79
  %81 = select contract i1 %80, float %79, float %72
  %82 = add nuw nsw i32 %71, 1
  %83 = add i32 %73, 1
  %84 = icmp eq i32 %83, %61
  br i1 %84, label %85, label %70, !llvm.loop !22

85:                                               ; preds = %65, %70, %33
  %86 = phi float [ 0xFFF0000000000000, %33 ], [ %66, %65 ], [ %81, %70 ]
  br i1 %59, label %87, label %199

87:                                               ; preds = %85
  %88 = fdiv contract float %86, %4
  %89 = and i32 %55, 1
  %90 = icmp eq i32 %55, 1
  br i1 %90, label %171, label %91

91:                                               ; preds = %87
  %92 = and i32 %55, -2
  br label %206

93:                                               ; preds = %93, %63
  %94 = phi i32 [ 0, %63 ], [ %168, %93 ]
  %95 = phi float [ 0xFFF0000000000000, %63 ], [ %167, %93 ]
  %96 = phi i32 [ 0, %63 ], [ %169, %93 ]
  %97 = mul nsw i32 %94, %1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %53, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !20, !amdgpu.noclobber !14
  %101 = fptosi float %100 to i32
  %102 = sitofp i32 %101 to float
  %103 = fcmp contract olt float %95, %102
  %104 = select contract i1 %103, float %102, float %95
  %105 = or i32 %94, 1
  %106 = mul nsw i32 %105, %1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %53, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !20, !amdgpu.noclobber !14
  %110 = fptosi float %109 to i32
  %111 = sitofp i32 %110 to float
  %112 = fcmp contract olt float %104, %111
  %113 = select contract i1 %112, float %111, float %104
  %114 = or i32 %94, 2
  %115 = mul nsw i32 %114, %1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %53, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !20, !amdgpu.noclobber !14
  %119 = fptosi float %118 to i32
  %120 = sitofp i32 %119 to float
  %121 = fcmp contract olt float %113, %120
  %122 = select contract i1 %121, float %120, float %113
  %123 = or i32 %94, 3
  %124 = mul nsw i32 %123, %1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %53, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !20, !amdgpu.noclobber !14
  %128 = fptosi float %127 to i32
  %129 = sitofp i32 %128 to float
  %130 = fcmp contract olt float %122, %129
  %131 = select contract i1 %130, float %129, float %122
  %132 = or i32 %94, 4
  %133 = mul nsw i32 %132, %1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %53, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !20, !amdgpu.noclobber !14
  %137 = fptosi float %136 to i32
  %138 = sitofp i32 %137 to float
  %139 = fcmp contract olt float %131, %138
  %140 = select contract i1 %139, float %138, float %131
  %141 = or i32 %94, 5
  %142 = mul nsw i32 %141, %1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %53, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !20, !amdgpu.noclobber !14
  %146 = fptosi float %145 to i32
  %147 = sitofp i32 %146 to float
  %148 = fcmp contract olt float %140, %147
  %149 = select contract i1 %148, float %147, float %140
  %150 = or i32 %94, 6
  %151 = mul nsw i32 %150, %1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %53, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !20, !amdgpu.noclobber !14
  %155 = fptosi float %154 to i32
  %156 = sitofp i32 %155 to float
  %157 = fcmp contract olt float %149, %156
  %158 = select contract i1 %157, float %156, float %149
  %159 = or i32 %94, 7
  %160 = mul nsw i32 %159, %1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %53, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !20, !amdgpu.noclobber !14
  %164 = fptosi float %163 to i32
  %165 = sitofp i32 %164 to float
  %166 = fcmp contract olt float %158, %165
  %167 = select contract i1 %166, float %165, float %158
  %168 = add nuw nsw i32 %94, 8
  %169 = add i32 %96, 8
  %170 = icmp eq i32 %169, %64
  br i1 %170, label %65, label %93, !llvm.loop !24

171:                                              ; preds = %206, %87
  %172 = phi float [ undef, %87 ], [ %253, %206 ]
  %173 = phi i32 [ 0, %87 ], [ %255, %206 ]
  %174 = phi float [ 0.000000e+00, %87 ], [ %253, %206 ]
  %175 = icmp eq i32 %89, 0
  br i1 %175, label %199, label %176

176:                                              ; preds = %171
  %177 = mul nsw i32 %173, %1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %53, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !20
  %181 = fdiv contract float %180, %4
  %182 = fsub contract float %181, %88
  %183 = fmul float %182, 0x3FF7154760000000
  %184 = tail call float @llvm.rint.f32(float %183)
  %185 = fcmp ogt float %182, 0x40562E4300000000
  %186 = fcmp olt float %182, 0xC059D1DA00000000
  %187 = fneg float %183
  %188 = tail call float @llvm.fma.f32(float %182, float 0x3FF7154760000000, float %187)
  %189 = tail call float @llvm.fma.f32(float %182, float 0x3E54AE0BE0000000, float %188)
  %190 = fsub float %183, %184
  %191 = fadd float %189, %190
  %192 = tail call float @llvm.exp2.f32(float %191)
  %193 = fptosi float %184 to i32
  %194 = tail call float @llvm.amdgcn.ldexp.f32(float %192, i32 %193)
  %195 = select i1 %186, float 0.000000e+00, float %194
  %196 = select i1 %185, float 0x7FF0000000000000, float %195
  %197 = fadd contract float %174, %196
  %198 = getelementptr inbounds float, float addrspace(1)* %58, i64 %178
  store float %196, float addrspace(1)* %198, align 4, !tbaa !20
  br label %199

199:                                              ; preds = %176, %171, %85
  %200 = phi float [ 0.000000e+00, %85 ], [ %172, %171 ], [ %197, %176 ]
  br i1 %59, label %201, label %301

201:                                              ; preds = %199
  %202 = and i32 %55, 3
  %203 = icmp ult i32 %55, 4
  br i1 %203, label %287, label %204

204:                                              ; preds = %201
  %205 = and i32 %55, -4
  br label %258

206:                                              ; preds = %206, %91
  %207 = phi i32 [ 0, %91 ], [ %255, %206 ]
  %208 = phi float [ 0.000000e+00, %91 ], [ %253, %206 ]
  %209 = phi i32 [ 0, %91 ], [ %256, %206 ]
  %210 = mul nsw i32 %207, %1
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %53, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !20
  %214 = fdiv contract float %213, %4
  %215 = fsub contract float %214, %88
  %216 = fmul float %215, 0x3FF7154760000000
  %217 = tail call float @llvm.rint.f32(float %216)
  %218 = fcmp ogt float %215, 0x40562E4300000000
  %219 = fcmp olt float %215, 0xC059D1DA00000000
  %220 = fneg float %216
  %221 = tail call float @llvm.fma.f32(float %215, float 0x3FF7154760000000, float %220)
  %222 = tail call float @llvm.fma.f32(float %215, float 0x3E54AE0BE0000000, float %221)
  %223 = fsub float %216, %217
  %224 = fadd float %222, %223
  %225 = tail call float @llvm.exp2.f32(float %224)
  %226 = fptosi float %217 to i32
  %227 = tail call float @llvm.amdgcn.ldexp.f32(float %225, i32 %226)
  %228 = select i1 %219, float 0.000000e+00, float %227
  %229 = select i1 %218, float 0x7FF0000000000000, float %228
  %230 = fadd contract float %208, %229
  %231 = getelementptr inbounds float, float addrspace(1)* %58, i64 %211
  store float %229, float addrspace(1)* %231, align 4, !tbaa !20
  %232 = or i32 %207, 1
  %233 = mul nsw i32 %232, %1
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %53, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !20
  %237 = fdiv contract float %236, %4
  %238 = fsub contract float %237, %88
  %239 = fmul float %238, 0x3FF7154760000000
  %240 = tail call float @llvm.rint.f32(float %239)
  %241 = fcmp ogt float %238, 0x40562E4300000000
  %242 = fcmp olt float %238, 0xC059D1DA00000000
  %243 = fneg float %239
  %244 = tail call float @llvm.fma.f32(float %238, float 0x3FF7154760000000, float %243)
  %245 = tail call float @llvm.fma.f32(float %238, float 0x3E54AE0BE0000000, float %244)
  %246 = fsub float %239, %240
  %247 = fadd float %245, %246
  %248 = tail call float @llvm.exp2.f32(float %247)
  %249 = fptosi float %240 to i32
  %250 = tail call float @llvm.amdgcn.ldexp.f32(float %248, i32 %249)
  %251 = select i1 %242, float 0.000000e+00, float %250
  %252 = select i1 %241, float 0x7FF0000000000000, float %251
  %253 = fadd contract float %230, %252
  %254 = getelementptr inbounds float, float addrspace(1)* %58, i64 %234
  store float %252, float addrspace(1)* %254, align 4, !tbaa !20
  %255 = add nuw nsw i32 %207, 2
  %256 = add i32 %209, 2
  %257 = icmp eq i32 %256, %92
  br i1 %257, label %171, label %206, !llvm.loop !26

258:                                              ; preds = %258, %204
  %259 = phi i32 [ 0, %204 ], [ %284, %258 ]
  %260 = phi i32 [ 0, %204 ], [ %285, %258 ]
  %261 = mul nsw i32 %259, %1
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds float, float addrspace(1)* %58, i64 %262
  %264 = load float, float addrspace(1)* %263, align 4, !tbaa !20
  %265 = fdiv contract float %264, %200
  store float %265, float addrspace(1)* %263, align 4, !tbaa !20
  %266 = or i32 %259, 1
  %267 = mul nsw i32 %266, %1
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %58, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !20
  %271 = fdiv contract float %270, %200
  store float %271, float addrspace(1)* %269, align 4, !tbaa !20
  %272 = or i32 %259, 2
  %273 = mul nsw i32 %272, %1
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds float, float addrspace(1)* %58, i64 %274
  %276 = load float, float addrspace(1)* %275, align 4, !tbaa !20
  %277 = fdiv contract float %276, %200
  store float %277, float addrspace(1)* %275, align 4, !tbaa !20
  %278 = or i32 %259, 3
  %279 = mul nsw i32 %278, %1
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds float, float addrspace(1)* %58, i64 %280
  %282 = load float, float addrspace(1)* %281, align 4, !tbaa !20
  %283 = fdiv contract float %282, %200
  store float %283, float addrspace(1)* %281, align 4, !tbaa !20
  %284 = add nuw nsw i32 %259, 4
  %285 = add i32 %260, 4
  %286 = icmp eq i32 %285, %205
  br i1 %286, label %287, label %258, !llvm.loop !27

287:                                              ; preds = %258, %201
  %288 = phi i32 [ 0, %201 ], [ %284, %258 ]
  %289 = icmp eq i32 %202, 0
  br i1 %289, label %301, label %290

290:                                              ; preds = %287, %290
  %291 = phi i32 [ %298, %290 ], [ %288, %287 ]
  %292 = phi i32 [ %299, %290 ], [ 0, %287 ]
  %293 = mul nsw i32 %291, %1
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds float, float addrspace(1)* %58, i64 %294
  %296 = load float, float addrspace(1)* %295, align 4, !tbaa !20
  %297 = fdiv contract float %296, %200
  store float %297, float addrspace(1)* %295, align 4, !tbaa !20
  %298 = add nuw nsw i32 %291, 1
  %299 = add i32 %292, 1
  %300 = icmp eq i32 %299, %202
  br i1 %300, label %301, label %290, !llvm.loop !28

301:                                              ; preds = %287, %290, %199, %9
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
!26 = distinct !{!26, !25}
!27 = distinct !{!27, !25}
!28 = distinct !{!28, !23}
