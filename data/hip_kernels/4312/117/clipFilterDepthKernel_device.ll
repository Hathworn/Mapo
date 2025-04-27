; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/117/clipFilterDepthKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/117/clipFilterDepthKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque
%struct.__hip_surface = type opaque

@_ZZL17__hipGetPixelAddriiiE9FormatLUT = internal unnamed_addr addrspace(4) constant [16 x i32] [i32 0, i32 1, i32 0, i32 1, i32 3, i32 1, i32 1, i32 1, i32 0, i32 1, i32 2, i32 0, i32 1, i32 2, i32 1, i32 2], align 16
@_ZZL17__hipGetPixelAddriiiE8OrderLUT = internal unnamed_addr addrspace(4) constant [20 x i32] [i32 0, i32 0, i32 1, i32 1, i32 3, i32 1, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 3, i32 2, i32 2, i32 2, i32 0, i32 0, i32 0, i32 0], align 16

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21clipFilterDepthKernelP13__hip_texturejjjjffP13__hip_surface(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 %4, float %5, float %6, %struct.__hip_surface addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %11, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp ult i32 %25, %1
  %27 = icmp ult i32 %17, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %204

29:                                               ; preds = %8
  %30 = add i32 %17, 20
  %31 = add i32 %25, 20
  %32 = uitofp i32 %30 to float
  %33 = uitofp i32 %31 to float
  %34 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %35 = addrspacecast i32 addrspace(1)* %34 to i32 addrspace(4)*
  %36 = getelementptr inbounds i32, i32 addrspace(4)* %35, i64 12
  %37 = getelementptr inbounds i32, i32 addrspace(4)* %35, i64 10
  %38 = load i32, i32 addrspace(4)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = uitofp i32 %38 to float
  %40 = getelementptr inbounds i32, i32 addrspace(4)* %35, i64 2
  %41 = load i32, i32 addrspace(4)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = lshr i32 %41, 14
  %43 = and i32 %42, 16383
  %44 = add nuw nsw i32 %43, 1
  %45 = uitofp i32 %44 to float
  %46 = load i32, i32 addrspace(4)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = and i32 %46, 32768
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, float %39, float 1.000000e+00
  %50 = select i1 %48, float %45, float 1.000000e+00
  %51 = getelementptr inbounds i32, i32 addrspace(4)* %35, i64 14
  %52 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = and i32 %52, 1048576
  %54 = icmp eq i32 %53, 0
  %55 = bitcast i32 addrspace(4)* %36 to <4 x i32> addrspace(4)*
  %56 = load <4 x i32>, <4 x i32> addrspace(4)* %55, align 16, !tbaa !11, !amdgpu.noclobber !6
  %57 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %58 = addrspacecast <8 x i32> addrspace(1)* %57 to <8 x i32> addrspace(4)*
  %59 = load <8 x i32>, <8 x i32> addrspace(4)* %58, align 32, !tbaa !11, !amdgpu.noclobber !6
  %60 = tail call float @llvm.amdgcn.rcp.f32(float %50)
  %61 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %62 = add i32 %25, 15
  %63 = add i32 %25, 25
  %64 = icmp ugt i32 %62, %63
  br i1 %64, label %84, label %65

65:                                               ; preds = %29
  %66 = fmul float %49, %32
  %67 = tail call float @llvm.floor.f32(float %66)
  %68 = fmul float %61, %67
  %69 = select i1 %54, float %68, float %32
  %70 = fmul float %50, %33
  %71 = tail call float @llvm.floor.f32(float %70)
  %72 = fmul float %60, %71
  %73 = select i1 %54, float %72, float %33
  %74 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %69, float %73, <8 x i32> %59, <4 x i32> %56, i1 false, i32 0, i32 0)
  %75 = bitcast float %74 to i32
  %76 = add i32 %17, 15
  %77 = add i32 %17, 25
  %78 = icmp ugt i32 %76, %77
  %79 = and i32 %75, 65535
  %80 = fneg contract float %5
  %81 = fneg contract float %6
  br label %127

82:                                               ; preds = %139
  %83 = fdiv contract float %141, %140
  br label %84

84:                                               ; preds = %82, %29
  %85 = phi float [ %83, %82 ], [ 0x7FF8000000000000, %29 ]
  %86 = tail call float @llvm.rint.f32(float %85)
  %87 = fptoui float %86 to i32
  %88 = and i32 %87, 65535
  %89 = icmp ult i32 %88, %3
  %90 = icmp ugt i32 %88, %4
  %91 = select i1 %89, i1 true, i1 %90
  %92 = shl i32 %17, 1
  %93 = bitcast %struct.__hip_surface addrspace(1)* %7 to i32 addrspace(1)*
  %94 = addrspacecast i32 addrspace(1)* %93 to i32 addrspace(4)*
  %95 = getelementptr inbounds i32, i32 addrspace(4)* %94, i64 8
  %96 = load i32, i32 addrspace(4)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  %97 = getelementptr inbounds i32, i32 addrspace(4)* %94, i64 9
  %98 = load i32, i32 addrspace(4)* %97, align 4, !tbaa !7, !amdgpu.noclobber !6
  %99 = icmp eq i32 %96, 4
  br i1 %99, label %100, label %102

100:                                              ; preds = %84
  %101 = sdiv i32 %92, 3
  br label %107

102:                                              ; preds = %84
  %103 = sext i32 %96 to i64
  %104 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE9FormatLUT, i64 0, i64 %103
  %105 = load i32, i32 addrspace(4)* %104, align 4, !tbaa !12
  %106 = ashr i32 %92, %105
  br label %107

107:                                              ; preds = %102, %100
  %108 = phi i32 [ %101, %100 ], [ %106, %102 ]
  %109 = sext i32 %98 to i64
  %110 = lshr i64 4176, %109
  %111 = and i64 %110, 1
  %112 = icmp eq i64 %111, 0
  br i1 %112, label %115, label %113

113:                                              ; preds = %107
  %114 = sdiv i32 %108, 3
  br label %119

115:                                              ; preds = %107
  %116 = getelementptr inbounds [20 x i32], [20 x i32] addrspace(4)* @_ZZL17__hipGetPixelAddriiiE8OrderLUT, i64 0, i64 %109
  %117 = load i32, i32 addrspace(4)* %116, align 4, !tbaa !12
  %118 = ashr i32 %108, %117
  br label %119

119:                                              ; preds = %113, %115
  %120 = phi i32 [ %114, %113 ], [ %118, %115 ]
  %121 = bitcast i32 %88 to float
  %122 = select i1 %91, float 0.000000e+00, float %121
  %123 = insertelement <4 x float> <float poison, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00>, float %122, i64 0
  %124 = bitcast %struct.__hip_surface addrspace(1)* %7 to <8 x i32> addrspace(1)*
  %125 = addrspacecast <8 x i32> addrspace(1)* %124 to <8 x i32> addrspace(4)*
  %126 = load <8 x i32>, <8 x i32> addrspace(4)* %125, align 32, !tbaa !11, !amdgpu.noclobber !6
  tail call void @llvm.amdgcn.image.store.2d.v4f32.i32(<4 x float> %123, i32 15, i32 %120, i32 %25, <8 x i32> %126, i32 0, i32 0)
  br label %204

127:                                              ; preds = %65, %139
  %128 = phi float [ 0.000000e+00, %65 ], [ %141, %139 ]
  %129 = phi float [ 0.000000e+00, %65 ], [ %140, %139 ]
  %130 = phi i32 [ %62, %65 ], [ %142, %139 ]
  br i1 %78, label %139, label %131

131:                                              ; preds = %127
  %132 = uitofp i32 %130 to float
  %133 = fmul float %50, %132
  %134 = tail call float @llvm.floor.f32(float %133)
  %135 = fmul float %60, %134
  %136 = select i1 %54, float %135, float %132
  %137 = sub i32 %130, %31
  %138 = mul i32 %137, %137
  br label %144

139:                                              ; preds = %144, %127
  %140 = phi float [ %129, %127 ], [ %198, %144 ]
  %141 = phi float [ %128, %127 ], [ %201, %144 ]
  %142 = add i32 %130, 1
  %143 = icmp ugt i32 %142, %63
  br i1 %143, label %82, label %127, !llvm.loop !16

144:                                              ; preds = %131, %144
  %145 = phi float [ %128, %131 ], [ %201, %144 ]
  %146 = phi float [ %129, %131 ], [ %198, %144 ]
  %147 = phi i32 [ %76, %131 ], [ %202, %144 ]
  %148 = uitofp i32 %147 to float
  %149 = fmul float %49, %148
  %150 = tail call float @llvm.floor.f32(float %149)
  %151 = fmul float %61, %150
  %152 = select i1 %54, float %151, float %148
  %153 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %152, float %136, <8 x i32> %59, <4 x i32> %56, i1 false, i32 0, i32 0)
  %154 = bitcast float %153 to i32
  %155 = trunc i32 %154 to i16
  %156 = and i32 %154, 65535
  %157 = sub nsw i32 %156, %79
  %158 = mul nsw i32 %157, %157
  %159 = sitofp i32 %158 to float
  %160 = sub i32 %147, %30
  %161 = mul i32 %160, %160
  %162 = add i32 %161, %138
  %163 = uitofp i32 %162 to float
  %164 = icmp ne i16 %155, 0
  %165 = uitofp i1 %164 to float
  %166 = fmul contract float %80, %163
  %167 = fmul float %166, 0x3FF7154760000000
  %168 = tail call float @llvm.rint.f32(float %167)
  %169 = fcmp ogt float %166, 0x40562E4300000000
  %170 = fcmp olt float %166, 0xC059D1DA00000000
  %171 = fneg float %167
  %172 = tail call float @llvm.fma.f32(float %166, float 0x3FF7154760000000, float %171)
  %173 = tail call float @llvm.fma.f32(float %166, float 0x3E54AE0BE0000000, float %172)
  %174 = fsub float %167, %168
  %175 = fadd float %173, %174
  %176 = tail call float @llvm.exp2.f32(float %175)
  %177 = fptosi float %168 to i32
  %178 = tail call float @llvm.amdgcn.ldexp.f32(float %176, i32 %177)
  %179 = select i1 %170, float 0.000000e+00, float %178
  %180 = select i1 %169, float 0x7FF0000000000000, float %179
  %181 = fmul contract float %180, %165
  %182 = fmul contract float %81, %159
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
  %197 = fmul contract float %181, %196
  %198 = fadd contract float %146, %197
  %199 = uitofp i16 %155 to float
  %200 = fmul contract float %197, %199
  %201 = fadd contract float %145, %200
  %202 = add i32 %147, 1
  %203 = icmp ugt i32 %202, %77
  br i1 %203, label %139, label %144, !llvm.loop !18

204:                                              ; preds = %8, %119
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
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
