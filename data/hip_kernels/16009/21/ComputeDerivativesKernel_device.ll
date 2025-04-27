; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/21/ComputeDerivativesKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/21/ComputeDerivativesKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24ComputeDerivativesKerneliiiPfS_S_P13__hip_textureS1_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture writeonly %5, %struct.__hip_texture addrspace(1)* readonly %6, %struct.__hip_texture addrspace(1)* readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = add i32 %24, %18
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %248

29:                                               ; preds = %8
  %30 = sitofp i32 %0 to float
  %31 = fdiv contract float 1.000000e+00, %30
  %32 = sitofp i32 %1 to float
  %33 = fdiv contract float 1.000000e+00, %32
  %34 = sitofp i32 %17 to float
  %35 = fadd contract float %34, 5.000000e-01
  %36 = fmul contract float %31, %35
  %37 = sitofp i32 %25 to float
  %38 = fadd contract float %37, 5.000000e-01
  %39 = fmul contract float %33, %38
  %40 = fmul contract float %31, 2.000000e+00
  %41 = fadd contract float %40, %36
  %42 = bitcast %struct.__hip_texture addrspace(1)* %6 to i32 addrspace(1)*
  %43 = addrspacecast i32 addrspace(1)* %42 to i32 addrspace(4)*
  %44 = getelementptr inbounds i32, i32 addrspace(4)* %43, i64 12
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %43, i64 10
  %46 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7, !amdgpu.noclobber !6
  %47 = uitofp i32 %46 to float
  %48 = getelementptr inbounds i32, i32 addrspace(4)* %43, i64 2
  %49 = load i32, i32 addrspace(4)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = lshr i32 %49, 14
  %51 = and i32 %50, 16383
  %52 = add nuw nsw i32 %51, 1
  %53 = uitofp i32 %52 to float
  %54 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %55 = and i32 %54, 32768
  %56 = icmp eq i32 %55, 0
  %57 = select i1 %56, float %47, float 1.000000e+00
  %58 = select i1 %56, float %53, float 1.000000e+00
  %59 = getelementptr inbounds i32, i32 addrspace(4)* %43, i64 14
  %60 = load i32, i32 addrspace(4)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %61 = and i32 %60, 1048576
  %62 = icmp eq i32 %61, 0
  %63 = bitcast i32 addrspace(4)* %44 to <4 x i32> addrspace(4)*
  %64 = load <4 x i32>, <4 x i32> addrspace(4)* %63, align 16, !tbaa !11, !amdgpu.noclobber !6
  %65 = bitcast %struct.__hip_texture addrspace(1)* %6 to <8 x i32> addrspace(1)*
  %66 = addrspacecast <8 x i32> addrspace(1)* %65 to <8 x i32> addrspace(4)*
  %67 = load <8 x i32>, <8 x i32> addrspace(4)* %66, align 32, !tbaa !11, !amdgpu.noclobber !6
  %68 = tail call float @llvm.amdgcn.rcp.f32(float %58)
  %69 = fmul float %39, %58
  %70 = tail call float @llvm.floor.f32(float %69)
  %71 = fmul float %68, %70
  %72 = select i1 %62, float %71, float %39
  %73 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %74 = fmul float %41, %57
  %75 = tail call float @llvm.floor.f32(float %74)
  %76 = fmul float %73, %75
  %77 = select i1 %62, float %76, float %41
  %78 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %77, float %72, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %79 = fadd contract float %31, %36
  %80 = fmul float %79, %57
  %81 = tail call float @llvm.floor.f32(float %80)
  %82 = fmul float %73, %81
  %83 = select i1 %62, float %82, float %79
  %84 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %83, float %72, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %85 = fmul contract float %84, 8.000000e+00
  %86 = fsub contract float %78, %85
  %87 = fsub contract float %36, %31
  %88 = fmul float %87, %57
  %89 = tail call float @llvm.floor.f32(float %88)
  %90 = fmul float %73, %89
  %91 = select i1 %62, float %90, float %87
  %92 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %91, float %72, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %93 = fmul contract float %92, 8.000000e+00
  %94 = fadd contract float %86, %93
  %95 = fsub contract float %36, %40
  %96 = fmul float %95, %57
  %97 = tail call float @llvm.floor.f32(float %96)
  %98 = fmul float %73, %97
  %99 = select i1 %62, float %98, float %95
  %100 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %99, float %72, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %101 = fsub contract float %94, %100
  %102 = fdiv contract float %101, 1.200000e+01
  %103 = bitcast %struct.__hip_texture addrspace(1)* %7 to i32 addrspace(1)*
  %104 = addrspacecast i32 addrspace(1)* %103 to i32 addrspace(4)*
  %105 = getelementptr inbounds i32, i32 addrspace(4)* %104, i64 12
  %106 = getelementptr inbounds i32, i32 addrspace(4)* %104, i64 10
  %107 = load i32, i32 addrspace(4)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = uitofp i32 %107 to float
  %109 = getelementptr inbounds i32, i32 addrspace(4)* %104, i64 2
  %110 = load i32, i32 addrspace(4)* %109, align 4, !tbaa !7, !amdgpu.noclobber !6
  %111 = lshr i32 %110, 14
  %112 = and i32 %111, 16383
  %113 = add nuw nsw i32 %112, 1
  %114 = uitofp i32 %113 to float
  %115 = load i32, i32 addrspace(4)* %105, align 4, !tbaa !7, !amdgpu.noclobber !6
  %116 = and i32 %115, 32768
  %117 = icmp eq i32 %116, 0
  %118 = select i1 %117, float %108, float 1.000000e+00
  %119 = select i1 %117, float %114, float 1.000000e+00
  %120 = getelementptr inbounds i32, i32 addrspace(4)* %104, i64 14
  %121 = load i32, i32 addrspace(4)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = and i32 %121, 1048576
  %123 = icmp eq i32 %122, 0
  %124 = bitcast i32 addrspace(4)* %105 to <4 x i32> addrspace(4)*
  %125 = load <4 x i32>, <4 x i32> addrspace(4)* %124, align 16, !tbaa !11, !amdgpu.noclobber !6
  %126 = bitcast %struct.__hip_texture addrspace(1)* %7 to <8 x i32> addrspace(1)*
  %127 = addrspacecast <8 x i32> addrspace(1)* %126 to <8 x i32> addrspace(4)*
  %128 = load <8 x i32>, <8 x i32> addrspace(4)* %127, align 32, !tbaa !11, !amdgpu.noclobber !6
  %129 = tail call float @llvm.amdgcn.rcp.f32(float %119)
  %130 = fmul float %39, %119
  %131 = tail call float @llvm.floor.f32(float %130)
  %132 = fmul float %129, %131
  %133 = select i1 %123, float %132, float %39
  %134 = tail call float @llvm.amdgcn.rcp.f32(float %118)
  %135 = fmul float %41, %118
  %136 = tail call float @llvm.floor.f32(float %135)
  %137 = fmul float %134, %136
  %138 = select i1 %123, float %137, float %41
  %139 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %138, float %133, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %140 = fmul float %79, %118
  %141 = tail call float @llvm.floor.f32(float %140)
  %142 = fmul float %134, %141
  %143 = select i1 %123, float %142, float %79
  %144 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %143, float %133, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %145 = fmul contract float %144, 8.000000e+00
  %146 = fsub contract float %139, %145
  %147 = fmul float %87, %118
  %148 = tail call float @llvm.floor.f32(float %147)
  %149 = fmul float %134, %148
  %150 = select i1 %123, float %149, float %87
  %151 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %150, float %133, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %152 = fmul contract float %151, 8.000000e+00
  %153 = fadd contract float %146, %152
  %154 = fmul float %95, %118
  %155 = tail call float @llvm.floor.f32(float %154)
  %156 = fmul float %134, %155
  %157 = select i1 %123, float %156, float %95
  %158 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %157, float %133, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %159 = fsub contract float %153, %158
  %160 = fdiv contract float %159, 1.200000e+01
  %161 = fadd contract float %102, %160
  %162 = fmul contract float %161, 5.000000e-01
  %163 = bitcast float addrspace(1)* %3 to i8 addrspace(1)*
  %164 = mul nsw i32 %25, %2
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8, i8 addrspace(1)* %163, i64 %165
  %167 = bitcast i8 addrspace(1)* %166 to float addrspace(1)*
  %168 = sext i32 %17 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %167, i64 %168
  store float %162, float addrspace(1)* %169, align 4, !tbaa !12
  %170 = fmul float %36, %57
  %171 = tail call float @llvm.floor.f32(float %170)
  %172 = fmul float %73, %171
  %173 = select i1 %62, float %172, float %36
  %174 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %173, float %72, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %175 = fmul float %36, %118
  %176 = tail call float @llvm.floor.f32(float %175)
  %177 = fmul float %134, %176
  %178 = select i1 %123, float %177, float %36
  %179 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %178, float %133, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %180 = fsub contract float %174, %179
  %181 = bitcast float addrspace(1)* %5 to i8 addrspace(1)*
  %182 = getelementptr inbounds i8, i8 addrspace(1)* %181, i64 %165
  %183 = bitcast i8 addrspace(1)* %182 to float addrspace(1)*
  %184 = getelementptr inbounds float, float addrspace(1)* %183, i64 %168
  store float %180, float addrspace(1)* %184, align 4, !tbaa !12
  %185 = fmul contract float %33, 2.000000e+00
  %186 = fadd contract float %185, %39
  %187 = fmul float %186, %58
  %188 = tail call float @llvm.floor.f32(float %187)
  %189 = fmul float %68, %188
  %190 = select i1 %62, float %189, float %186
  %191 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %173, float %190, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %192 = fadd contract float %33, %39
  %193 = fmul float %192, %58
  %194 = tail call float @llvm.floor.f32(float %193)
  %195 = fmul float %68, %194
  %196 = select i1 %62, float %195, float %192
  %197 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %173, float %196, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %198 = fmul contract float %197, 8.000000e+00
  %199 = fsub contract float %191, %198
  %200 = fsub contract float %39, %33
  %201 = fmul float %200, %58
  %202 = tail call float @llvm.floor.f32(float %201)
  %203 = fmul float %68, %202
  %204 = select i1 %62, float %203, float %200
  %205 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %173, float %204, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %206 = fmul contract float %205, 8.000000e+00
  %207 = fadd contract float %199, %206
  %208 = fsub contract float %39, %185
  %209 = fmul float %208, %58
  %210 = tail call float @llvm.floor.f32(float %209)
  %211 = fmul float %68, %210
  %212 = select i1 %62, float %211, float %208
  %213 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %173, float %212, <8 x i32> %67, <4 x i32> %64, i1 false, i32 0, i32 0)
  %214 = fsub contract float %207, %213
  %215 = fdiv contract float %214, 1.200000e+01
  %216 = fmul float %186, %119
  %217 = tail call float @llvm.floor.f32(float %216)
  %218 = fmul float %129, %217
  %219 = select i1 %123, float %218, float %186
  %220 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %178, float %219, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %221 = fmul float %192, %119
  %222 = tail call float @llvm.floor.f32(float %221)
  %223 = fmul float %129, %222
  %224 = select i1 %123, float %223, float %192
  %225 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %178, float %224, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %226 = fmul contract float %225, 8.000000e+00
  %227 = fsub contract float %220, %226
  %228 = fmul float %200, %119
  %229 = tail call float @llvm.floor.f32(float %228)
  %230 = fmul float %129, %229
  %231 = select i1 %123, float %230, float %200
  %232 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %178, float %231, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %233 = fmul contract float %232, 8.000000e+00
  %234 = fadd contract float %227, %233
  %235 = fmul float %208, %119
  %236 = tail call float @llvm.floor.f32(float %235)
  %237 = fmul float %129, %236
  %238 = select i1 %123, float %237, float %208
  %239 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %178, float %238, <8 x i32> %128, <4 x i32> %125, i1 false, i32 0, i32 0)
  %240 = fsub contract float %234, %239
  %241 = fdiv contract float %240, 1.200000e+01
  %242 = fadd contract float %215, %241
  %243 = fmul contract float %242, 5.000000e-01
  %244 = bitcast float addrspace(1)* %4 to i8 addrspace(1)*
  %245 = getelementptr inbounds i8, i8 addrspace(1)* %244, i64 %165
  %246 = bitcast i8 addrspace(1)* %245 to float addrspace(1)*
  %247 = getelementptr inbounds float, float addrspace(1)* %246, i64 %168
  store float %243, float addrspace(1)* %247, align 4, !tbaa !12
  br label %248

248:                                              ; preds = %8, %29
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly willreturn }

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
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
