; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/135/filterForegroundMaskKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/135/filterForegroundMaskKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26filterForegroundMaskKernelP13__hip_texturejjfP13__hip_surface(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float %3, %struct.__hip_surface addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp ult i32 %14, %2
  %24 = icmp ult i32 %22, %1
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %205

26:                                               ; preds = %5
  %27 = tail call float @llvm.ceil.f32(float %3)
  %28 = fptoui float %27 to i32
  %29 = shl i32 %28, 1
  %30 = sub nsw i32 %22, %29
  %31 = add i32 %22, %29
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %47, label %33

33:                                               ; preds = %26
  %34 = sub nsw i32 %14, %29
  %35 = add i32 %14, %29
  %36 = icmp sgt i32 %34, %35
  %37 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %38 = addrspacecast i32 addrspace(1)* %37 to i32 addrspace(4)*
  %39 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 12
  %40 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 10
  %41 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 2
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %38, i64 14
  %43 = fmul contract float %3, %3
  %44 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %45 = addrspacecast <8 x i32> addrspace(1)* %44 to <8 x i32> addrspace(4)*
  %46 = bitcast i32 addrspace(4)* %39 to <4 x i32> addrspace(4)*
  br label %92

47:                                               ; preds = %124, %26
  %48 = phi float [ 0.000000e+00, %26 ], [ %125, %124 ]
  %49 = phi float [ 0.000000e+00, %26 ], [ %126, %124 ]
  %50 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %51 = addrspacecast i32 addrspace(1)* %50 to i32 addrspace(4)*
  %52 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %53 = addrspacecast <8 x i32> addrspace(1)* %52 to <8 x i32> addrspace(4)*
  %54 = sitofp i32 %14 to float
  %55 = sitofp i32 %22 to float
  %56 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 12
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 10
  %58 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !7, !amdgpu.noclobber !6
  %59 = uitofp i32 %58 to float
  %60 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 2
  %61 = load i32, i32 addrspace(4)* %60, align 4, !tbaa !7, !amdgpu.noclobber !6
  %62 = lshr i32 %61, 14
  %63 = and i32 %62, 16383
  %64 = add nuw nsw i32 %63, 1
  %65 = uitofp i32 %64 to float
  %66 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = and i32 %66, 32768
  %68 = icmp eq i32 %67, 0
  %69 = select i1 %68, float %59, float 1.000000e+00
  %70 = select i1 %68, float %65, float 1.000000e+00
  %71 = getelementptr inbounds i32, i32 addrspace(4)* %51, i64 14
  %72 = load i32, i32 addrspace(4)* %71, align 4, !tbaa !7, !amdgpu.noclobber !6
  %73 = and i32 %72, 1048576
  %74 = icmp eq i32 %73, 0
  %75 = bitcast i32 addrspace(4)* %56 to <4 x i32> addrspace(4)*
  %76 = load <4 x i32>, <4 x i32> addrspace(4)* %75, align 16, !tbaa !11, !amdgpu.noclobber !6
  %77 = load <8 x i32>, <8 x i32> addrspace(4)* %53, align 32, !tbaa !11, !amdgpu.noclobber !6
  %78 = tail call float @llvm.amdgcn.rcp.f32(float %70)
  %79 = fmul float %70, %55
  %80 = tail call float @llvm.floor.f32(float %79)
  %81 = fmul float %78, %80
  %82 = select i1 %74, float %81, float %55
  %83 = tail call float @llvm.amdgcn.rcp.f32(float %69)
  %84 = fmul float %69, %54
  %85 = tail call float @llvm.floor.f32(float %84)
  %86 = fmul float %83, %85
  %87 = select i1 %74, float %86, float %54
  %88 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %87, float %82, <8 x i32> %77, <4 x i32> %76, i1 false, i32 0, i32 0)
  %89 = bitcast float %88 to i32
  %90 = and i32 %89, 255
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %167, label %170

92:                                               ; preds = %33, %124
  %93 = phi float [ 0.000000e+00, %33 ], [ %126, %124 ]
  %94 = phi float [ 0.000000e+00, %33 ], [ %125, %124 ]
  %95 = phi i32 [ %30, %33 ], [ %127, %124 ]
  br i1 %36, label %124, label %96

96:                                               ; preds = %92
  %97 = sitofp i32 %95 to float
  %98 = load i32, i32 addrspace(4)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = uitofp i32 %98 to float
  %100 = load i32, i32 addrspace(4)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  %101 = lshr i32 %100, 14
  %102 = and i32 %101, 16383
  %103 = add nuw nsw i32 %102, 1
  %104 = uitofp i32 %103 to float
  %105 = load i32, i32 addrspace(4)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %106 = and i32 %105, 32768
  %107 = icmp eq i32 %106, 0
  %108 = select i1 %107, float %99, float 1.000000e+00
  %109 = select i1 %107, float %104, float 1.000000e+00
  %110 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = and i32 %110, 1048576
  %112 = icmp eq i32 %111, 0
  %113 = sub nsw i32 %95, %22
  %114 = mul nsw i32 %113, %113
  %115 = sitofp i32 %114 to float
  %116 = tail call float @llvm.amdgcn.rcp.f32(float %108)
  %117 = tail call float @llvm.amdgcn.rcp.f32(float %109)
  %118 = fmul float %109, %97
  %119 = tail call float @llvm.floor.f32(float %118)
  %120 = fmul float %117, %119
  %121 = select i1 %112, float %120, float %97
  %122 = icmp sgt i32 %95, -1
  %123 = icmp ult i32 %95, %1
  br label %129

124:                                              ; preds = %162, %92
  %125 = phi float [ %94, %92 ], [ %163, %162 ]
  %126 = phi float [ %93, %92 ], [ %164, %162 ]
  %127 = add i32 %95, 1
  %128 = icmp eq i32 %95, %31
  br i1 %128, label %47, label %92, !llvm.loop !12

129:                                              ; preds = %96, %162
  %130 = phi float [ %93, %96 ], [ %164, %162 ]
  %131 = phi float [ %94, %96 ], [ %163, %162 ]
  %132 = phi i32 [ %34, %96 ], [ %165, %162 ]
  %133 = sitofp i32 %132 to float
  %134 = sub nsw i32 %132, %14
  %135 = mul nsw i32 %134, %134
  %136 = sitofp i32 %135 to float
  %137 = fadd contract float %115, %136
  %138 = fmul contract float %137, 5.000000e-01
  %139 = fdiv contract float %138, %43
  %140 = tail call float @llvm.exp.f32(float %139)
  %141 = icmp sgt i32 %132, -1
  br i1 %141, label %142, label %162

142:                                              ; preds = %129
  %143 = fmul float %108, %133
  %144 = tail call float @llvm.floor.f32(float %143)
  %145 = fmul float %116, %144
  %146 = select i1 %112, float %145, float %133
  %147 = load <8 x i32>, <8 x i32> addrspace(4)* %45, align 32, !tbaa !11, !amdgpu.noclobber !6
  %148 = load <4 x i32>, <4 x i32> addrspace(4)* %46, align 16, !tbaa !11, !amdgpu.noclobber !6
  %149 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %146, float %121, <8 x i32> %147, <4 x i32> %148, i1 false, i32 0, i32 0)
  %150 = bitcast float %149 to i32
  %151 = icmp ult i32 %132, %2
  %152 = select i1 %151, i1 %122, i1 false
  %153 = select i1 %152, i1 %123, i1 false
  %154 = and i32 %150, 255
  %155 = sub nsw i32 1, %154
  %156 = sitofp i32 %155 to float
  %157 = fmul contract float %140, %156
  %158 = select i1 %153, float %157, float -0.000000e+00
  %159 = fadd contract float %131, %158
  %160 = select i1 %153, float %140, float -0.000000e+00
  %161 = fadd contract float %130, %160
  br label %162

162:                                              ; preds = %142, %129
  %163 = phi float [ %131, %129 ], [ %159, %142 ]
  %164 = phi float [ %130, %129 ], [ %161, %142 ]
  %165 = add i32 %132, 1
  %166 = icmp eq i32 %132, %35
  br i1 %166, label %124, label %129, !llvm.loop !14

167:                                              ; preds = %47
  %168 = fadd contract float %49, 0x3F50624DE0000000
  %169 = fdiv contract float %48, %168
  br label %170

170:                                              ; preds = %167, %47
  %171 = phi float [ %169, %167 ], [ 0.000000e+00, %47 ]
  %172 = shl i32 %14, 2
  %173 = bitcast %struct.__hip_surface addrspace(1)* %4 to i32 addrspace(1)*
  %174 = addrspacecast i32 addrspace(1)* %173 to i32 addrspace(4)*
  %175 = getelementptr inbounds i32, i32 addrspace(4)* %174, i64 8
  %176 = load i32, i32 addrspace(4)* %175, align 4, !tbaa !7, !amdgpu.noclobber !6
  %177 = getelementptr inbounds i32, i32 addrspace(4)* %174, i64 9
  %178 = load i32, i32 addrspace(4)* %177, align 4, !tbaa !7, !amdgpu.noclobber !6
  %179 = icmp eq i32 %176, 4
  br i1 %179, label %180, label %182

180:                                              ; preds = %170
  %181 = sdiv i32 %172, 3
  br label %187

182:                                              ; preds = %170
  %183 = sext i32 %176 to i64
  %184 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %183
  %185 = load i32, i32 addrspace(4)* %184, align 4, !tbaa !15
  %186 = ashr i32 %172, %185
  br label %187

187:                                              ; preds = %182, %180
  %188 = phi i32 [ %181, %180 ], [ %186, %182 ]
  %189 = sext i32 %178 to i64
  %190 = lshr i64 4176, %189
  %191 = and i64 %190, 1
  %192 = icmp eq i64 %191, 0
  br i1 %192, label %195, label %193

193:                                              ; preds = %187
  %194 = sdiv i32 %188, 3
  br label %199

195:                                              ; preds = %187
  %196 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %189
  %197 = load i32, i32 addrspace(4)* %196, align 4, !tbaa !15
  %198 = ashr i32 %188, %197
  br label %199

199:                                              ; preds = %193, %195
  %200 = phi i32 [ %194, %193 ], [ %198, %195 ]
  %201 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %171, i64 0
  %202 = bitcast %struct.__hip_surface addrspace(1)* %4 to <8 x i32> addrspace(1)*
  %203 = addrspacecast <8 x i32> addrspace(1)* %202 to <8 x i32> addrspace(4)*
  %204 = load <8 x i32>, <8 x i32> addrspace(4)* %203, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %201, i32 15, i32 %200, i32 %22, <8 x i32> %204, i32 0, i32 0)
  br label %205

205:                                              ; preds = %5, %199
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
