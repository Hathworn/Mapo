; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/124/filterDensityMapKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/124/filterDensityMapKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22filterDensityMapKernelP13__hip_texturejjP13__hip_surface(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, %struct.__hip_surface addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp ult i32 %13, %2
  %23 = icmp ult i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %185

25:                                               ; preds = %4
  %26 = uitofp i32 %13 to float
  %27 = uitofp i32 %21 to float
  %28 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %29 = addrspacecast i32 addrspace(1)* %28 to i32 addrspace(4)*
  %30 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 12
  %31 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 10
  %32 = load i32, i32 addrspace(4)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = uitofp i32 %32 to float
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 2
  %35 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = lshr i32 %35, 14
  %37 = and i32 %36, 16383
  %38 = add nuw nsw i32 %37, 1
  %39 = uitofp i32 %38 to float
  %40 = load i32, i32 addrspace(4)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = and i32 %40, 32768
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, float %33, float 1.000000e+00
  %44 = select i1 %42, float %39, float 1.000000e+00
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %29, i64 14
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = and i32 %46, 1048576
  %48 = icmp eq i32 %47, 0
  %49 = bitcast i32 addrspace(4)* %30 to <4 x i32> addrspace(4)*
  %50 = load <4 x i32>, <4 x i32> addrspace(4)* %49, align 16, !tbaa !11, !amdgpu.noclobber !6
  %51 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %52 = addrspacecast <8 x i32> addrspace(1)* %51 to <8 x i32> addrspace(4)*
  %53 = load <8 x i32>, <8 x i32> addrspace(4)* %52, align 32, !tbaa !11, !amdgpu.noclobber !6
  %54 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %55 = fmul float %44, %27
  %56 = tail call float @llvm.floor.f32(float %55)
  %57 = fmul float %54, %56
  %58 = select i1 %48, float %57, float %27
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %43)
  %60 = fmul float %43, %26
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fmul float %59, %61
  %63 = select i1 %48, float %62, float %26
  %64 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %58, <8 x i32> %53, <4 x i32> %50, i1 false, i32 0, i32 0)
  %65 = add i32 %21, -5
  %66 = add i32 %21, 5
  %67 = icmp ugt i32 %65, %66
  br i1 %67, label %74, label %68

68:                                               ; preds = %25
  %69 = add i32 %13, -5
  %70 = add i32 %13, 5
  %71 = icmp ugt i32 %69, %70
  br label %88

72:                                               ; preds = %100
  %73 = fdiv contract float %102, %101
  br label %74

74:                                               ; preds = %72, %25
  %75 = phi float [ %73, %72 ], [ 0x7FF8000000000000, %25 ]
  %76 = fcmp contract ult float %75, 1.000000e+00
  %77 = fcmp contract oge float %75, 0.000000e+00
  %78 = select contract i1 %77, float %75, float 0.000000e+00
  %79 = select i1 %76, float %78, float 1.000000e+00
  %80 = shl i32 %13, 2
  %81 = bitcast %struct.__hip_surface addrspace(1)* %3 to i32 addrspace(1)*
  %82 = addrspacecast i32 addrspace(1)* %81 to i32 addrspace(4)*
  %83 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 8
  %84 = load i32, i32 addrspace(4)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %85 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 9
  %86 = load i32, i32 addrspace(4)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = icmp eq i32 %84, 4
  br i1 %87, label %160, label %162

88:                                               ; preds = %68, %100
  %89 = phi float [ 0.000000e+00, %68 ], [ %102, %100 ]
  %90 = phi float [ 0.000000e+00, %68 ], [ %101, %100 ]
  %91 = phi i32 [ %65, %68 ], [ %103, %100 ]
  br i1 %71, label %100, label %92

92:                                               ; preds = %88
  %93 = uitofp i32 %91 to float
  %94 = fmul float %44, %93
  %95 = tail call float @llvm.floor.f32(float %94)
  %96 = fmul float %54, %95
  %97 = select i1 %48, float %96, float %93
  %98 = sub i32 %91, %21
  %99 = mul i32 %98, %98
  br label %105

100:                                              ; preds = %105, %88
  %101 = phi float [ %90, %88 ], [ %155, %105 ]
  %102 = phi float [ %89, %88 ], [ %157, %105 ]
  %103 = add i32 %91, 1
  %104 = icmp ugt i32 %103, %66
  br i1 %104, label %72, label %88, !llvm.loop !12

105:                                              ; preds = %92, %105
  %106 = phi float [ %89, %92 ], [ %157, %105 ]
  %107 = phi float [ %90, %92 ], [ %155, %105 ]
  %108 = phi i32 [ %69, %92 ], [ %158, %105 ]
  %109 = uitofp i32 %108 to float
  %110 = fmul float %43, %109
  %111 = tail call float @llvm.floor.f32(float %110)
  %112 = fmul float %59, %111
  %113 = select i1 %48, float %112, float %109
  %114 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %113, float %97, <8 x i32> %53, <4 x i32> %50, i1 false, i32 0, i32 0)
  %115 = fsub contract float %64, %114
  %116 = fmul contract float %115, %115
  %117 = sub i32 %108, %13
  %118 = mul i32 %117, %117
  %119 = add i32 %118, %99
  %120 = uitofp i32 %119 to float
  %121 = fcmp contract ogt float %114, 0.000000e+00
  %122 = uitofp i1 %121 to float
  %123 = fmul contract float %120, 0xBFA47AE140000000
  %124 = fmul float %123, 0x3FF7154760000000
  %125 = tail call float @llvm.rint.f32(float %124)
  %126 = fcmp ogt float %123, 0x40562E4300000000
  %127 = fcmp olt float %123, 0xC059D1DA00000000
  %128 = fneg float %124
  %129 = tail call float @llvm.fma.f32(float %123, float 0x3FF7154760000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %123, float 0x3E54AE0BE0000000, float %129)
  %131 = fsub float %124, %125
  %132 = fadd float %130, %131
  %133 = tail call float @llvm.exp2.f32(float %132)
  %134 = fptosi float %125 to i32
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 %134)
  %136 = select i1 %127, float 0.000000e+00, float %135
  %137 = select i1 %126, float 0x7FF0000000000000, float %136
  %138 = fmul contract float %137, %122
  %139 = fmul contract float %116, -1.000000e+02
  %140 = fmul float %139, 0x3FF7154760000000
  %141 = tail call float @llvm.rint.f32(float %140)
  %142 = fcmp ogt float %139, 0x40562E4300000000
  %143 = fcmp olt float %139, 0xC059D1DA00000000
  %144 = fneg float %140
  %145 = tail call float @llvm.fma.f32(float %139, float 0x3FF7154760000000, float %144)
  %146 = tail call float @llvm.fma.f32(float %139, float 0x3E54AE0BE0000000, float %145)
  %147 = fsub float %140, %141
  %148 = fadd float %146, %147
  %149 = tail call float @llvm.exp2.f32(float %148)
  %150 = fptosi float %141 to i32
  %151 = tail call float @llvm.amdgcn.ldexp.f32(float %149, i32 %150)
  %152 = select i1 %143, float 0.000000e+00, float %151
  %153 = select i1 %142, float 0x7FF0000000000000, float %152
  %154 = fmul contract float %138, %153
  %155 = fadd contract float %107, %154
  %156 = fmul contract float %114, %154
  %157 = fadd contract float %106, %156
  %158 = add i32 %108, 1
  %159 = icmp ugt i32 %158, %70
  br i1 %159, label %100, label %105, !llvm.loop !14

160:                                              ; preds = %74
  %161 = sdiv i32 %80, 3
  br label %167

162:                                              ; preds = %74
  %163 = sext i32 %84 to i64
  %164 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %163
  %165 = load i32, i32 addrspace(4)* %164, align 4, !tbaa !15
  %166 = ashr i32 %80, %165
  br label %167

167:                                              ; preds = %162, %160
  %168 = phi i32 [ %161, %160 ], [ %166, %162 ]
  %169 = sext i32 %86 to i64
  %170 = lshr i64 4176, %169
  %171 = and i64 %170, 1
  %172 = icmp eq i64 %171, 0
  br i1 %172, label %175, label %173

173:                                              ; preds = %167
  %174 = sdiv i32 %168, 3
  br label %179

175:                                              ; preds = %167
  %176 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %169
  %177 = load i32, i32 addrspace(4)* %176, align 4, !tbaa !15
  %178 = ashr i32 %168, %177
  br label %179

179:                                              ; preds = %173, %175
  %180 = phi i32 [ %174, %173 ], [ %178, %175 ]
  %181 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %79, i64 0
  %182 = bitcast %struct.__hip_surface addrspace(1)* %3 to <8 x i32> addrspace(1)*
  %183 = addrspacecast <8 x i32> addrspace(1)* %182 to <8 x i32> addrspace(4)*
  %184 = load <8 x i32>, <8 x i32> addrspace(4)* %183, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %181, i32 15, i32 %180, i32 %21, <8 x i32> %184, i32 0, i32 0)
  br label %185

185:                                              ; preds = %4, %179
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
