; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/119/foregroundMaskUpsampleFilterKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/119/foregroundMaskUpsampleFilterKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z34foregroundMaskUpsampleFilterKernelP13__hip_texturejjfP13__hip_surfaceS2_(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float %3, %struct.__hip_surface addrspace(1)* nocapture readonly %4, %struct.__hip_surface addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %9, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp ult i32 %15, %2
  %25 = icmp ult i32 %23, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %243

27:                                               ; preds = %6
  %28 = tail call float @llvm.ceil.f32(float %3)
  %29 = fptoui float %28 to i32
  %30 = shl i32 %29, 1
  %31 = sub nsw i32 %23, %30
  %32 = add i32 %23, %30
  %33 = icmp sgt i32 %31, %32
  br i1 %33, label %48, label %34

34:                                               ; preds = %27
  %35 = sub nsw i32 %15, %30
  %36 = add i32 %15, %30
  %37 = icmp sgt i32 %35, %36
  %38 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %39 = addrspacecast i32 addrspace(1)* %38 to i32 addrspace(4)*
  %40 = getelementptr inbounds i32, i32 addrspace(4)* %39, i64 12
  %41 = getelementptr inbounds i32, i32 addrspace(4)* %39, i64 10
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %39, i64 2
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %39, i64 14
  %44 = fmul contract float %3, %3
  %45 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %46 = addrspacecast <8 x i32> addrspace(1)* %45 to <8 x i32> addrspace(4)*
  %47 = bitcast i32 addrspace(4)* %40 to <4 x i32> addrspace(4)*
  br label %95

48:                                               ; preds = %128, %27
  %49 = phi float [ 0.000000e+00, %27 ], [ %129, %128 ]
  %50 = phi float [ 0.000000e+00, %27 ], [ %130, %128 ]
  %51 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %52 = addrspacecast i32 addrspace(1)* %51 to i32 addrspace(4)*
  %53 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %54 = addrspacecast <8 x i32> addrspace(1)* %53 to <8 x i32> addrspace(4)*
  %55 = sdiv i32 %15, 2
  %56 = sdiv i32 %23, 2
  %57 = sitofp i32 %55 to float
  %58 = sitofp i32 %56 to float
  %59 = getelementptr inbounds i32, i32 addrspace(4)* %52, i64 12
  %60 = getelementptr inbounds i32, i32 addrspace(4)* %52, i64 10
  %61 = load i32, i32 addrspace(4)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = uitofp i32 %61 to float
  %63 = getelementptr inbounds i32, i32 addrspace(4)* %52, i64 2
  %64 = load i32, i32 addrspace(4)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = lshr i32 %64, 14
  %66 = and i32 %65, 16383
  %67 = add nuw nsw i32 %66, 1
  %68 = uitofp i32 %67 to float
  %69 = load i32, i32 addrspace(4)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = and i32 %69, 32768
  %71 = icmp eq i32 %70, 0
  %72 = select i1 %71, float %62, float 1.000000e+00
  %73 = select i1 %71, float %68, float 1.000000e+00
  %74 = getelementptr inbounds i32, i32 addrspace(4)* %52, i64 14
  %75 = load i32, i32 addrspace(4)* %74, align 4, !tbaa !7, !amdgpu.noclobber !6
  %76 = and i32 %75, 1048576
  %77 = icmp eq i32 %76, 0
  %78 = bitcast i32 addrspace(4)* %59 to <4 x i32> addrspace(4)*
  %79 = load <4 x i32>, <4 x i32> addrspace(4)* %78, align 16, !tbaa !11, !amdgpu.noclobber !6
  %80 = load <8 x i32>, <8 x i32> addrspace(4)* %54, align 32, !tbaa !11, !amdgpu.noclobber !6
  %81 = tail call float @llvm.amdgcn.rcp.f32(float %73)
  %82 = fmul float %73, %58
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %81, %83
  %85 = select i1 %77, float %84, float %58
  %86 = tail call float @llvm.amdgcn.rcp.f32(float %72)
  %87 = fmul float %72, %57
  %88 = tail call float @llvm.floor.f32(float %87)
  %89 = fmul float %86, %88
  %90 = select i1 %77, float %89, float %57
  %91 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %90, float %85, <8 x i32> %80, <4 x i32> %79, i1 false, i32 0, i32 0)
  %92 = bitcast float %91 to i32
  %93 = and i32 %92, 255
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %172, label %175

95:                                               ; preds = %34, %128
  %96 = phi float [ 0.000000e+00, %34 ], [ %130, %128 ]
  %97 = phi float [ 0.000000e+00, %34 ], [ %129, %128 ]
  %98 = phi i32 [ %31, %34 ], [ %131, %128 ]
  br i1 %37, label %128, label %99

99:                                               ; preds = %95
  %100 = sdiv i32 %98, 2
  %101 = sitofp i32 %100 to float
  %102 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %103 = uitofp i32 %102 to float
  %104 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %105 = lshr i32 %104, 14
  %106 = and i32 %105, 16383
  %107 = add nuw nsw i32 %106, 1
  %108 = uitofp i32 %107 to float
  %109 = load i32, i32 addrspace(4)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %110 = and i32 %109, 32768
  %111 = icmp eq i32 %110, 0
  %112 = select i1 %111, float %103, float 1.000000e+00
  %113 = select i1 %111, float %108, float 1.000000e+00
  %114 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %115 = and i32 %114, 1048576
  %116 = icmp eq i32 %115, 0
  %117 = sub nsw i32 %98, %23
  %118 = mul nsw i32 %117, %117
  %119 = sitofp i32 %118 to float
  %120 = tail call float @llvm.amdgcn.rcp.f32(float %112)
  %121 = tail call float @llvm.amdgcn.rcp.f32(float %113)
  %122 = fmul float %113, %101
  %123 = tail call float @llvm.floor.f32(float %122)
  %124 = fmul float %121, %123
  %125 = select i1 %116, float %124, float %101
  %126 = icmp sgt i32 %98, -1
  %127 = icmp ult i32 %98, %1
  br label %133

128:                                              ; preds = %167, %95
  %129 = phi float [ %97, %95 ], [ %168, %167 ]
  %130 = phi float [ %96, %95 ], [ %169, %167 ]
  %131 = add i32 %98, 1
  %132 = icmp eq i32 %98, %32
  br i1 %132, label %48, label %95, !llvm.loop !12

133:                                              ; preds = %99, %167
  %134 = phi float [ %96, %99 ], [ %169, %167 ]
  %135 = phi float [ %97, %99 ], [ %168, %167 ]
  %136 = phi i32 [ %35, %99 ], [ %170, %167 ]
  %137 = sdiv i32 %136, 2
  %138 = sitofp i32 %137 to float
  %139 = sub nsw i32 %136, %15
  %140 = mul nsw i32 %139, %139
  %141 = sitofp i32 %140 to float
  %142 = fadd contract float %119, %141
  %143 = fmul contract float %142, 5.000000e-01
  %144 = fdiv contract float %143, %44
  %145 = tail call float @llvm.exp.f32(float %144)
  %146 = icmp sgt i32 %136, -1
  br i1 %146, label %147, label %167

147:                                              ; preds = %133
  %148 = fmul float %112, %138
  %149 = tail call float @llvm.floor.f32(float %148)
  %150 = fmul float %120, %149
  %151 = select i1 %116, float %150, float %138
  %152 = load <8 x i32>, <8 x i32> addrspace(4)* %46, align 32, !tbaa !11, !amdgpu.noclobber !6
  %153 = load <4 x i32>, <4 x i32> addrspace(4)* %47, align 16, !tbaa !11, !amdgpu.noclobber !6
  %154 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %151, float %125, <8 x i32> %152, <4 x i32> %153, i1 false, i32 0, i32 0)
  %155 = bitcast float %154 to i32
  %156 = icmp ult i32 %136, %2
  %157 = select i1 %156, i1 %126, i1 false
  %158 = select i1 %157, i1 %127, i1 false
  %159 = and i32 %155, 255
  %160 = sub nsw i32 1, %159
  %161 = sitofp i32 %160 to float
  %162 = fmul contract float %145, %161
  %163 = select i1 %158, float %162, float -0.000000e+00
  %164 = fadd contract float %135, %163
  %165 = select i1 %158, float %145, float -0.000000e+00
  %166 = fadd contract float %134, %165
  br label %167

167:                                              ; preds = %147, %133
  %168 = phi float [ %135, %133 ], [ %164, %147 ]
  %169 = phi float [ %134, %133 ], [ %166, %147 ]
  %170 = add i32 %136, 1
  %171 = icmp eq i32 %136, %36
  br i1 %171, label %128, label %133, !llvm.loop !14

172:                                              ; preds = %48
  %173 = fadd contract float %50, 0x3F50624DE0000000
  %174 = fdiv contract float %49, %173
  br label %175

175:                                              ; preds = %172, %48
  %176 = phi float [ %174, %172 ], [ 0.000000e+00, %48 ]
  %177 = bitcast %struct.__hip_surface addrspace(1)* %4 to i32 addrspace(1)*
  %178 = addrspacecast i32 addrspace(1)* %177 to i32 addrspace(4)*
  %179 = getelementptr inbounds i32, i32 addrspace(4)* %178, i64 8
  %180 = load i32, i32 addrspace(4)* %179, align 4, !tbaa !7, !amdgpu.noclobber !6
  %181 = getelementptr inbounds i32, i32 addrspace(4)* %178, i64 9
  %182 = load i32, i32 addrspace(4)* %181, align 4, !tbaa !7, !amdgpu.noclobber !6
  %183 = icmp eq i32 %180, 4
  br i1 %183, label %184, label %186

184:                                              ; preds = %175
  %185 = sdiv i32 %15, 3
  br label %191

186:                                              ; preds = %175
  %187 = sext i32 %180 to i64
  %188 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %187
  %189 = load i32, i32 addrspace(4)* %188, align 4, !tbaa !15
  %190 = ashr i32 %15, %189
  br label %191

191:                                              ; preds = %186, %184
  %192 = phi i32 [ %185, %184 ], [ %190, %186 ]
  %193 = sext i32 %182 to i64
  %194 = lshr i64 4176, %193
  %195 = and i64 %194, 1
  %196 = icmp eq i64 %195, 0
  br i1 %196, label %199, label %197

197:                                              ; preds = %191
  %198 = sdiv i32 %192, 3
  br label %203

199:                                              ; preds = %191
  %200 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %193
  %201 = load i32, i32 addrspace(4)* %200, align 4, !tbaa !15
  %202 = ashr i32 %192, %201
  br label %203

203:                                              ; preds = %197, %199
  %204 = phi i32 [ %198, %197 ], [ %202, %199 ]
  %205 = bitcast i32 %93 to float
  %206 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %205, i64 0
  %207 = bitcast %struct.__hip_surface addrspace(1)* %4 to <8 x i32> addrspace(1)*
  %208 = addrspacecast <8 x i32> addrspace(1)* %207 to <8 x i32> addrspace(4)*
  %209 = load <8 x i32>, <8 x i32> addrspace(4)* %208, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %206, i32 15, i32 %204, i32 %23, <8 x i32> %209, i32 0, i32 0)
  %210 = shl i32 %15, 2
  %211 = bitcast %struct.__hip_surface addrspace(1)* %5 to i32 addrspace(1)*
  %212 = addrspacecast i32 addrspace(1)* %211 to i32 addrspace(4)*
  %213 = getelementptr inbounds i32, i32 addrspace(4)* %212, i64 8
  %214 = load i32, i32 addrspace(4)* %213, align 4, !tbaa !7, !amdgpu.noclobber !6
  %215 = getelementptr inbounds i32, i32 addrspace(4)* %212, i64 9
  %216 = load i32, i32 addrspace(4)* %215, align 4, !tbaa !7, !amdgpu.noclobber !6
  %217 = icmp eq i32 %214, 4
  br i1 %217, label %218, label %220

218:                                              ; preds = %203
  %219 = sdiv i32 %210, 3
  br label %225

220:                                              ; preds = %203
  %221 = sext i32 %214 to i64
  %222 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %221
  %223 = load i32, i32 addrspace(4)* %222, align 4, !tbaa !15
  %224 = ashr i32 %210, %223
  br label %225

225:                                              ; preds = %220, %218
  %226 = phi i32 [ %219, %218 ], [ %224, %220 ]
  %227 = sext i32 %216 to i64
  %228 = lshr i64 4176, %227
  %229 = and i64 %228, 1
  %230 = icmp eq i64 %229, 0
  br i1 %230, label %233, label %231

231:                                              ; preds = %225
  %232 = sdiv i32 %226, 3
  br label %237

233:                                              ; preds = %225
  %234 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %227
  %235 = load i32, i32 addrspace(4)* %234, align 4, !tbaa !15
  %236 = ashr i32 %226, %235
  br label %237

237:                                              ; preds = %231, %233
  %238 = phi i32 [ %232, %231 ], [ %236, %233 ]
  %239 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %176, i64 0
  %240 = bitcast %struct.__hip_surface addrspace(1)* %5 to <8 x i32> addrspace(1)*
  %241 = addrspacecast <8 x i32> addrspace(1)* %240 to <8 x i32> addrspace(4)*
  %242 = load <8 x i32>, <8 x i32> addrspace(4)* %241, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %239, i32 15, i32 %238, i32 %23, <8 x i32> %242, i32 0, i32 0)
  br label %243

243:                                              ; preds = %6, %237
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
