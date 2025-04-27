; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/6176/1/compute_distance_texture.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/6176/1/compute_distance_texture.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24compute_distance_textureP13__hip_textureiPfiiiS1_(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp ult i32 %16, %3
  %26 = icmp ult i32 %24, %1
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %226

28:                                               ; preds = %7
  %29 = icmp sgt i32 %5, 0
  br i1 %29, label %30, label %94

30:                                               ; preds = %28
  %31 = uitofp i32 %24 to float
  %32 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %33 = addrspacecast i32 addrspace(1)* %32 to i32 addrspace(4)*
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 12
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 10
  %36 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = uitofp i32 %36 to float
  %38 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 2
  %39 = load i32, i32 addrspace(4)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = lshr i32 %39, 14
  %41 = and i32 %40, 16383
  %42 = add nuw nsw i32 %41, 1
  %43 = uitofp i32 %42 to float
  %44 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = and i32 %44, 32768
  %46 = icmp eq i32 %45, 0
  %47 = select i1 %46, float %37, float 1.000000e+00
  %48 = select i1 %46, float %43, float 1.000000e+00
  %49 = getelementptr inbounds i32, i32 addrspace(4)* %33, i64 14
  %50 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = and i32 %50, 1048576
  %52 = icmp eq i32 %51, 0
  %53 = bitcast i32 addrspace(4)* %34 to <4 x i32> addrspace(4)*
  %54 = load <4 x i32>, <4 x i32> addrspace(4)* %53, align 16, !tbaa !11, !amdgpu.noclobber !5
  %55 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %56 = addrspacecast <8 x i32> addrspace(1)* %55 to <8 x i32> addrspace(4)*
  %57 = load <8 x i32>, <8 x i32> addrspace(4)* %56, align 32, !tbaa !11, !amdgpu.noclobber !5
  %58 = tail call float @llvm.amdgcn.rcp.f32(float %48)
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %47)
  %60 = fmul float %47, %31
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fmul float %59, %61
  %63 = select i1 %52, float %62, float %31
  %64 = and i32 %5, 7
  %65 = icmp ult i32 %5, 8
  br i1 %65, label %68, label %66

66:                                               ; preds = %30
  %67 = and i32 %5, -8
  br label %100

68:                                               ; preds = %100, %30
  %69 = phi float [ undef, %30 ], [ %222, %100 ]
  %70 = phi float [ 0.000000e+00, %30 ], [ %222, %100 ]
  %71 = phi i32 [ 0, %30 ], [ %223, %100 ]
  %72 = icmp eq i32 %64, 0
  br i1 %72, label %94, label %73

73:                                               ; preds = %68, %73
  %74 = phi float [ %90, %73 ], [ %70, %68 ]
  %75 = phi i32 [ %91, %73 ], [ %71, %68 ]
  %76 = phi i32 [ %92, %73 ], [ 0, %68 ]
  %77 = sitofp i32 %75 to float
  %78 = fmul float %48, %77
  %79 = tail call float @llvm.floor.f32(float %78)
  %80 = fmul float %58, %79
  %81 = select i1 %52, float %80, float %77
  %82 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %81, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %83 = mul nsw i32 %75, %4
  %84 = add i32 %83, %16
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !12, !amdgpu.noclobber !5
  %88 = fsub contract float %82, %87
  %89 = fmul contract float %88, %88
  %90 = fadd contract float %74, %89
  %91 = add nuw nsw i32 %75, 1
  %92 = add i32 %76, 1
  %93 = icmp eq i32 %92, %64
  br i1 %93, label %94, label %73, !llvm.loop !16

94:                                               ; preds = %68, %73, %28
  %95 = phi float [ 0.000000e+00, %28 ], [ %69, %68 ], [ %90, %73 ]
  %96 = mul i32 %24, %4
  %97 = add i32 %96, %16
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 %98
  store float %95, float addrspace(1)* %99, align 4, !tbaa !12
  br label %226

100:                                              ; preds = %100, %66
  %101 = phi float [ 0.000000e+00, %66 ], [ %222, %100 ]
  %102 = phi i32 [ 0, %66 ], [ %223, %100 ]
  %103 = phi i32 [ 0, %66 ], [ %224, %100 ]
  %104 = sitofp i32 %102 to float
  %105 = fmul float %48, %104
  %106 = tail call float @llvm.floor.f32(float %105)
  %107 = fmul float %58, %106
  %108 = select i1 %52, float %107, float %104
  %109 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %108, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %110 = mul nsw i32 %102, %4
  %111 = add i32 %110, %16
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !12, !amdgpu.noclobber !5
  %115 = fsub contract float %109, %114
  %116 = fmul contract float %115, %115
  %117 = fadd contract float %101, %116
  %118 = or i32 %102, 1
  %119 = sitofp i32 %118 to float
  %120 = fmul float %48, %119
  %121 = tail call float @llvm.floor.f32(float %120)
  %122 = fmul float %58, %121
  %123 = select i1 %52, float %122, float %119
  %124 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %123, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %125 = mul nsw i32 %118, %4
  %126 = add i32 %125, %16
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !12, !amdgpu.noclobber !5
  %130 = fsub contract float %124, %129
  %131 = fmul contract float %130, %130
  %132 = fadd contract float %117, %131
  %133 = or i32 %102, 2
  %134 = sitofp i32 %133 to float
  %135 = fmul float %48, %134
  %136 = tail call float @llvm.floor.f32(float %135)
  %137 = fmul float %58, %136
  %138 = select i1 %52, float %137, float %134
  %139 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %138, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %140 = mul nsw i32 %133, %4
  %141 = add i32 %140, %16
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %2, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !12, !amdgpu.noclobber !5
  %145 = fsub contract float %139, %144
  %146 = fmul contract float %145, %145
  %147 = fadd contract float %132, %146
  %148 = or i32 %102, 3
  %149 = sitofp i32 %148 to float
  %150 = fmul float %48, %149
  %151 = tail call float @llvm.floor.f32(float %150)
  %152 = fmul float %58, %151
  %153 = select i1 %52, float %152, float %149
  %154 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %153, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %155 = mul nsw i32 %148, %4
  %156 = add i32 %155, %16
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %2, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !12, !amdgpu.noclobber !5
  %160 = fsub contract float %154, %159
  %161 = fmul contract float %160, %160
  %162 = fadd contract float %147, %161
  %163 = or i32 %102, 4
  %164 = sitofp i32 %163 to float
  %165 = fmul float %48, %164
  %166 = tail call float @llvm.floor.f32(float %165)
  %167 = fmul float %58, %166
  %168 = select i1 %52, float %167, float %164
  %169 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %168, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %170 = mul nsw i32 %163, %4
  %171 = add i32 %170, %16
  %172 = zext i32 %171 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %2, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !12, !amdgpu.noclobber !5
  %175 = fsub contract float %169, %174
  %176 = fmul contract float %175, %175
  %177 = fadd contract float %162, %176
  %178 = or i32 %102, 5
  %179 = sitofp i32 %178 to float
  %180 = fmul float %48, %179
  %181 = tail call float @llvm.floor.f32(float %180)
  %182 = fmul float %58, %181
  %183 = select i1 %52, float %182, float %179
  %184 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %183, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %185 = mul nsw i32 %178, %4
  %186 = add i32 %185, %16
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds float, float addrspace(1)* %2, i64 %187
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !12, !amdgpu.noclobber !5
  %190 = fsub contract float %184, %189
  %191 = fmul contract float %190, %190
  %192 = fadd contract float %177, %191
  %193 = or i32 %102, 6
  %194 = sitofp i32 %193 to float
  %195 = fmul float %48, %194
  %196 = tail call float @llvm.floor.f32(float %195)
  %197 = fmul float %58, %196
  %198 = select i1 %52, float %197, float %194
  %199 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %198, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %200 = mul nsw i32 %193, %4
  %201 = add i32 %200, %16
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !12, !amdgpu.noclobber !5
  %205 = fsub contract float %199, %204
  %206 = fmul contract float %205, %205
  %207 = fadd contract float %192, %206
  %208 = or i32 %102, 7
  %209 = sitofp i32 %208 to float
  %210 = fmul float %48, %209
  %211 = tail call float @llvm.floor.f32(float %210)
  %212 = fmul float %58, %211
  %213 = select i1 %52, float %212, float %209
  %214 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %63, float %213, <8 x i32> %57, <4 x i32> %54, i1 false, i32 0, i32 0)
  %215 = mul nsw i32 %208, %4
  %216 = add i32 %215, %16
  %217 = zext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %2, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !12, !amdgpu.noclobber !5
  %220 = fsub contract float %214, %219
  %221 = fmul contract float %220, %220
  %222 = fadd contract float %207, %221
  %223 = add nuw nsw i32 %102, 8
  %224 = add i32 %103, 8
  %225 = icmp eq i32 %224, %67
  br i1 %225, label %68, label %100, !llvm.loop !18

226:                                              ; preds = %94, %7
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

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"float", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
