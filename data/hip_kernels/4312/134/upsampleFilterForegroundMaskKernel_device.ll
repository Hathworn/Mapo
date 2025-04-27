; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/134/upsampleFilterForegroundMaskKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/134/upsampleFilterForegroundMaskKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z34upsampleFilterForegroundMaskKernelP13__hip_texturejjjfP13__hip_surfaceS2_(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, float %4, %struct.__hip_surface addrspace(1)* nocapture readonly %5, %struct.__hip_surface addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %10, %14
  %16 = add i32 %15, %8
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !5, !invariant.load !6
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = add i32 %23, %17
  %25 = icmp ult i32 %16, %2
  %26 = icmp ult i32 %24, %1
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %244

28:                                               ; preds = %7
  %29 = tail call float @llvm.ceil.f32(float %4)
  %30 = fptoui float %29 to i32
  %31 = shl i32 %30, 1
  %32 = sub nsw i32 %24, %31
  %33 = add i32 %24, %31
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %49, label %35

35:                                               ; preds = %28
  %36 = sub nsw i32 %16, %31
  %37 = add i32 %16, %31
  %38 = icmp sgt i32 %36, %37
  %39 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %40 = addrspacecast i32 addrspace(1)* %39 to i32 addrspace(4)*
  %41 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 12
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 10
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 2
  %44 = getelementptr inbounds i32, i32 addrspace(4)* %40, i64 14
  %45 = fmul contract float %4, %4
  %46 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %47 = addrspacecast <8 x i32> addrspace(1)* %46 to <8 x i32> addrspace(4)*
  %48 = bitcast i32 addrspace(4)* %41 to <4 x i32> addrspace(4)*
  br label %96

49:                                               ; preds = %129, %28
  %50 = phi float [ 0.000000e+00, %28 ], [ %130, %129 ]
  %51 = phi float [ 0.000000e+00, %28 ], [ %131, %129 ]
  %52 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %53 = addrspacecast i32 addrspace(1)* %52 to i32 addrspace(4)*
  %54 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %55 = addrspacecast <8 x i32> addrspace(1)* %54 to <8 x i32> addrspace(4)*
  %56 = udiv i32 %16, %3
  %57 = udiv i32 %24, %3
  %58 = uitofp i32 %56 to float
  %59 = uitofp i32 %57 to float
  %60 = getelementptr inbounds i32, i32 addrspace(4)* %53, i64 12
  %61 = getelementptr inbounds i32, i32 addrspace(4)* %53, i64 10
  %62 = load i32, i32 addrspace(4)* %61, align 4, !tbaa !7, !amdgpu.noclobber !6
  %63 = uitofp i32 %62 to float
  %64 = getelementptr inbounds i32, i32 addrspace(4)* %53, i64 2
  %65 = load i32, i32 addrspace(4)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = lshr i32 %65, 14
  %67 = and i32 %66, 16383
  %68 = add nuw nsw i32 %67, 1
  %69 = uitofp i32 %68 to float
  %70 = load i32, i32 addrspace(4)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = and i32 %70, 32768
  %72 = icmp eq i32 %71, 0
  %73 = select i1 %72, float %63, float 1.000000e+00
  %74 = select i1 %72, float %69, float 1.000000e+00
  %75 = getelementptr inbounds i32, i32 addrspace(4)* %53, i64 14
  %76 = load i32, i32 addrspace(4)* %75, align 4, !tbaa !7, !amdgpu.noclobber !6
  %77 = and i32 %76, 1048576
  %78 = icmp eq i32 %77, 0
  %79 = bitcast i32 addrspace(4)* %60 to <4 x i32> addrspace(4)*
  %80 = load <4 x i32>, <4 x i32> addrspace(4)* %79, align 16, !tbaa !11, !amdgpu.noclobber !6
  %81 = load <8 x i32>, <8 x i32> addrspace(4)* %55, align 32, !tbaa !11, !amdgpu.noclobber !6
  %82 = tail call float @llvm.amdgcn.rcp.f32(float %74)
  %83 = fmul float %74, %59
  %84 = tail call float @llvm.floor.f32(float %83)
  %85 = fmul float %82, %84
  %86 = select i1 %78, float %85, float %59
  %87 = tail call float @llvm.amdgcn.rcp.f32(float %73)
  %88 = fmul float %73, %58
  %89 = tail call float @llvm.floor.f32(float %88)
  %90 = fmul float %87, %89
  %91 = select i1 %78, float %90, float %58
  %92 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %91, float %86, <8 x i32> %81, <4 x i32> %80, i1 false, i32 0, i32 0)
  %93 = bitcast float %92 to i32
  %94 = and i32 %93, 255
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %173, label %176

96:                                               ; preds = %35, %129
  %97 = phi float [ 0.000000e+00, %35 ], [ %131, %129 ]
  %98 = phi float [ 0.000000e+00, %35 ], [ %130, %129 ]
  %99 = phi i32 [ %32, %35 ], [ %132, %129 ]
  br i1 %38, label %129, label %100

100:                                              ; preds = %96
  %101 = udiv i32 %99, %3
  %102 = uitofp i32 %101 to float
  %103 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = uitofp i32 %103 to float
  %105 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = lshr i32 %105, 14
  %107 = and i32 %106, 16383
  %108 = add nuw nsw i32 %107, 1
  %109 = uitofp i32 %108 to float
  %110 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = and i32 %110, 32768
  %112 = icmp eq i32 %111, 0
  %113 = select i1 %112, float %104, float 1.000000e+00
  %114 = select i1 %112, float %109, float 1.000000e+00
  %115 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = and i32 %115, 1048576
  %117 = icmp eq i32 %116, 0
  %118 = sub nsw i32 %99, %24
  %119 = mul nsw i32 %118, %118
  %120 = sitofp i32 %119 to float
  %121 = tail call float @llvm.amdgcn.rcp.f32(float %113)
  %122 = tail call float @llvm.amdgcn.rcp.f32(float %114)
  %123 = fmul float %114, %102
  %124 = tail call float @llvm.floor.f32(float %123)
  %125 = fmul float %122, %124
  %126 = select i1 %117, float %125, float %102
  %127 = icmp sgt i32 %99, -1
  %128 = icmp ult i32 %99, %1
  br label %134

129:                                              ; preds = %168, %96
  %130 = phi float [ %98, %96 ], [ %169, %168 ]
  %131 = phi float [ %97, %96 ], [ %170, %168 ]
  %132 = add i32 %99, 1
  %133 = icmp eq i32 %99, %33
  br i1 %133, label %49, label %96, !llvm.loop !12

134:                                              ; preds = %100, %168
  %135 = phi float [ %97, %100 ], [ %170, %168 ]
  %136 = phi float [ %98, %100 ], [ %169, %168 ]
  %137 = phi i32 [ %36, %100 ], [ %171, %168 ]
  %138 = udiv i32 %137, %3
  %139 = uitofp i32 %138 to float
  %140 = sub nsw i32 %137, %16
  %141 = mul nsw i32 %140, %140
  %142 = sitofp i32 %141 to float
  %143 = fadd contract float %120, %142
  %144 = fmul contract float %143, 5.000000e-01
  %145 = fdiv contract float %144, %45
  %146 = tail call float @llvm.exp.f32(float %145)
  %147 = icmp sgt i32 %137, -1
  br i1 %147, label %148, label %168

148:                                              ; preds = %134
  %149 = fmul float %113, %139
  %150 = tail call float @llvm.floor.f32(float %149)
  %151 = fmul float %121, %150
  %152 = select i1 %117, float %151, float %139
  %153 = load <8 x i32>, <8 x i32> addrspace(4)* %47, align 32, !tbaa !11, !amdgpu.noclobber !6
  %154 = load <4 x i32>, <4 x i32> addrspace(4)* %48, align 16, !tbaa !11, !amdgpu.noclobber !6
  %155 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %152, float %126, <8 x i32> %153, <4 x i32> %154, i1 false, i32 0, i32 0)
  %156 = bitcast float %155 to i32
  %157 = icmp ult i32 %137, %2
  %158 = select i1 %157, i1 %127, i1 false
  %159 = select i1 %158, i1 %128, i1 false
  %160 = and i32 %156, 255
  %161 = sub nsw i32 1, %160
  %162 = sitofp i32 %161 to float
  %163 = fmul contract float %146, %162
  %164 = select i1 %159, float %163, float -0.000000e+00
  %165 = fadd contract float %136, %164
  %166 = select i1 %159, float %146, float -0.000000e+00
  %167 = fadd contract float %135, %166
  br label %168

168:                                              ; preds = %148, %134
  %169 = phi float [ %136, %134 ], [ %165, %148 ]
  %170 = phi float [ %135, %134 ], [ %167, %148 ]
  %171 = add i32 %137, 1
  %172 = icmp eq i32 %137, %37
  br i1 %172, label %129, label %134, !llvm.loop !14

173:                                              ; preds = %49
  %174 = fadd contract float %51, 0x3F50624DE0000000
  %175 = fdiv contract float %50, %174
  br label %176

176:                                              ; preds = %173, %49
  %177 = phi float [ %175, %173 ], [ 0.000000e+00, %49 ]
  %178 = bitcast %struct.__hip_surface addrspace(1)* %5 to i32 addrspace(1)*
  %179 = addrspacecast i32 addrspace(1)* %178 to i32 addrspace(4)*
  %180 = getelementptr inbounds i32, i32 addrspace(4)* %179, i64 8
  %181 = load i32, i32 addrspace(4)* %180, align 4, !tbaa !7, !amdgpu.noclobber !6
  %182 = getelementptr inbounds i32, i32 addrspace(4)* %179, i64 9
  %183 = load i32, i32 addrspace(4)* %182, align 4, !tbaa !7, !amdgpu.noclobber !6
  %184 = icmp eq i32 %181, 4
  br i1 %184, label %185, label %187

185:                                              ; preds = %176
  %186 = sdiv i32 %16, 3
  br label %192

187:                                              ; preds = %176
  %188 = sext i32 %181 to i64
  %189 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %188
  %190 = load i32, i32 addrspace(4)* %189, align 4, !tbaa !15
  %191 = ashr i32 %16, %190
  br label %192

192:                                              ; preds = %187, %185
  %193 = phi i32 [ %186, %185 ], [ %191, %187 ]
  %194 = sext i32 %183 to i64
  %195 = lshr i64 4176, %194
  %196 = and i64 %195, 1
  %197 = icmp eq i64 %196, 0
  br i1 %197, label %200, label %198

198:                                              ; preds = %192
  %199 = sdiv i32 %193, 3
  br label %204

200:                                              ; preds = %192
  %201 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %194
  %202 = load i32, i32 addrspace(4)* %201, align 4, !tbaa !15
  %203 = ashr i32 %193, %202
  br label %204

204:                                              ; preds = %198, %200
  %205 = phi i32 [ %199, %198 ], [ %203, %200 ]
  %206 = bitcast i32 %94 to float
  %207 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %206, i64 0
  %208 = bitcast %struct.__hip_surface addrspace(1)* %5 to <8 x i32> addrspace(1)*
  %209 = addrspacecast <8 x i32> addrspace(1)* %208 to <8 x i32> addrspace(4)*
  %210 = load <8 x i32>, <8 x i32> addrspace(4)* %209, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %207, i32 15, i32 %205, i32 %24, <8 x i32> %210, i32 0, i32 0)
  %211 = shl i32 %16, 2
  %212 = bitcast %struct.__hip_surface addrspace(1)* %6 to i32 addrspace(1)*
  %213 = addrspacecast i32 addrspace(1)* %212 to i32 addrspace(4)*
  %214 = getelementptr inbounds i32, i32 addrspace(4)* %213, i64 8
  %215 = load i32, i32 addrspace(4)* %214, align 4, !tbaa !7, !amdgpu.noclobber !6
  %216 = getelementptr inbounds i32, i32 addrspace(4)* %213, i64 9
  %217 = load i32, i32 addrspace(4)* %216, align 4, !tbaa !7, !amdgpu.noclobber !6
  %218 = icmp eq i32 %215, 4
  br i1 %218, label %219, label %221

219:                                              ; preds = %204
  %220 = sdiv i32 %211, 3
  br label %226

221:                                              ; preds = %204
  %222 = sext i32 %215 to i64
  %223 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %222
  %224 = load i32, i32 addrspace(4)* %223, align 4, !tbaa !15
  %225 = ashr i32 %211, %224
  br label %226

226:                                              ; preds = %221, %219
  %227 = phi i32 [ %220, %219 ], [ %225, %221 ]
  %228 = sext i32 %217 to i64
  %229 = lshr i64 4176, %228
  %230 = and i64 %229, 1
  %231 = icmp eq i64 %230, 0
  br i1 %231, label %234, label %232

232:                                              ; preds = %226
  %233 = sdiv i32 %227, 3
  br label %238

234:                                              ; preds = %226
  %235 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %228
  %236 = load i32, i32 addrspace(4)* %235, align 4, !tbaa !15
  %237 = ashr i32 %227, %236
  br label %238

238:                                              ; preds = %232, %234
  %239 = phi i32 [ %233, %232 ], [ %237, %234 ]
  %240 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %177, i64 0
  %241 = bitcast %struct.__hip_surface addrspace(1)* %6 to <8 x i32> addrspace(1)*
  %242 = addrspacecast <8 x i32> addrspace(1)* %241 to <8 x i32> addrspace(4)*
  %243 = load <8 x i32>, <8 x i32> addrspace(4)* %242, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %240, i32 15, i32 %239, i32 %24, <8 x i32> %243, i32 0, i32 0)
  br label %244

244:                                              ; preds = %7, %238
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nounwind willreturn writeonly
declare void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float>, i32 immarg, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #4

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn }

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
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
