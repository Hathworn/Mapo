; ModuleID = '../data/hip_kernels/5224/0/main.cu'
source_filename = "../data/hip_kernels/5224/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.texture = type { %struct.textureReference }
%struct.textureReference = type { i32, i32, i32, [3 x i32], %struct.hipChannelFormatDesc, i32, i32, i32, float, float, float, %struct.__hip_texture*, i32, i32, [7 x i32], i32 }
%struct.hipChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.__hip_texture = type opaque

@tex_img = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@tex_kernel = protected addrspace(1) externally_initialized global %struct.texture undef, align 8
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @tex_img to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (%struct.texture addrspace(1)* @tex_kernel to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8convolveiiiPf(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %1
  %23 = icmp slt i32 %13, %0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %132

25:                                               ; preds = %4
  %26 = sub i32 0, %2
  %27 = icmp slt i32 %2, 0
  br i1 %27, label %102, label %28

28:                                               ; preds = %25
  %29 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @tex_img, i64 0, i32 0, i32 11), align 8
  %30 = bitcast %struct.__hip_texture* %29 to i32*
  %31 = addrspacecast i32* %30 to i32 addrspace(4)*
  %32 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 12
  %33 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 10
  %34 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 2
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %31, i64 14
  %36 = bitcast i32 addrspace(4)* %32 to <4 x i32> addrspace(4)*
  %37 = bitcast %struct.__hip_texture* %29 to <8 x i32>*
  %38 = addrspacecast <8 x i32>* %37 to <8 x i32> addrspace(4)*
  %39 = load %struct.__hip_texture*, %struct.__hip_texture* addrspace(1)* getelementptr inbounds (%struct.texture, %struct.texture addrspace(1)* @tex_kernel, i64 0, i32 0, i32 11), align 8
  %40 = bitcast %struct.__hip_texture* %39 to i32*
  %41 = addrspacecast i32* %40 to i32 addrspace(4)*
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 12
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 10
  %44 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 2
  %45 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 14
  %46 = bitcast i32 addrspace(4)* %42 to <4 x i32> addrspace(4)*
  %47 = bitcast %struct.__hip_texture* %39 to <8 x i32>*
  %48 = addrspacecast <8 x i32>* %47 to <8 x i32> addrspace(4)*
  %49 = load i32, i32 addrspace(4)* %33, align 4, !tbaa !7
  %50 = uitofp i32 %49 to float
  %51 = load i32, i32 addrspace(4)* %34, align 4, !tbaa !7
  %52 = lshr i32 %51, 14
  %53 = and i32 %52, 16383
  %54 = add nuw nsw i32 %53, 1
  %55 = uitofp i32 %54 to float
  %56 = load i32, i32 addrspace(4)* %32, align 4, !tbaa !7
  %57 = and i32 %56, 32768
  %58 = icmp eq i32 %57, 0
  %59 = select i1 %58, float %50, float 1.000000e+00
  %60 = select i1 %58, float %55, float 1.000000e+00
  %61 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !7
  %62 = and i32 %61, 1048576
  %63 = icmp eq i32 %62, 0
  %64 = load <4 x i32>, <4 x i32> addrspace(4)* %36, align 16, !tbaa !11
  %65 = load <8 x i32>, <8 x i32> addrspace(4)* %38, align 32, !tbaa !11
  %66 = tail call float @llvm.amdgcn.rcp.f32(float %60)
  %67 = tail call float @llvm.amdgcn.rcp.f32(float %59)
  %68 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7
  %69 = uitofp i32 %68 to float
  %70 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !7
  %71 = lshr i32 %70, 14
  %72 = and i32 %71, 16383
  %73 = add nuw nsw i32 %72, 1
  %74 = uitofp i32 %73 to float
  %75 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %76 = and i32 %75, 32768
  %77 = icmp eq i32 %76, 0
  %78 = select i1 %77, float %69, float 1.000000e+00
  %79 = select i1 %77, float %74, float 1.000000e+00
  %80 = load i32, i32 addrspace(4)* %45, align 4, !tbaa !7
  %81 = and i32 %80, 1048576
  %82 = icmp eq i32 %81, 0
  %83 = load <4 x i32>, <4 x i32> addrspace(4)* %46, align 16, !tbaa !11
  %84 = load <8 x i32>, <8 x i32> addrspace(4)* %48, align 32, !tbaa !11
  %85 = tail call float @llvm.amdgcn.rcp.f32(float %79)
  %86 = tail call float @llvm.amdgcn.rcp.f32(float %78)
  br label %87

87:                                               ; preds = %28, %108
  %88 = phi float [ 0.000000e+00, %28 ], [ %129, %108 ]
  %89 = phi i32 [ %26, %28 ], [ %109, %108 ]
  %90 = add nsw i32 %89, %21
  %91 = sitofp i32 %90 to float
  %92 = fmul float %60, %91
  %93 = tail call float @llvm.floor.f32(float %92)
  %94 = fmul float %66, %93
  %95 = select i1 %63, float %94, float %91
  %96 = add nsw i32 %89, %2
  %97 = sitofp i32 %96 to float
  %98 = fmul float %79, %97
  %99 = tail call float @llvm.floor.f32(float %98)
  %100 = fmul float %85, %99
  %101 = select i1 %82, float %100, float %97
  br label %111

102:                                              ; preds = %108, %25
  %103 = phi float [ 0.000000e+00, %25 ], [ %129, %108 ]
  %104 = mul nsw i32 %21, %0
  %105 = add nsw i32 %104, %13
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %3, i64 %106
  store float %103, float addrspace(1)* %107, align 4, !tbaa !12
  br label %132

108:                                              ; preds = %111
  %109 = add i32 %89, 1
  %110 = icmp eq i32 %89, %2
  br i1 %110, label %102, label %87, !llvm.loop !16

111:                                              ; preds = %87, %111
  %112 = phi float [ %88, %87 ], [ %129, %111 ]
  %113 = phi i32 [ %26, %87 ], [ %130, %111 ]
  %114 = add nsw i32 %113, %13
  %115 = sitofp i32 %114 to float
  %116 = fmul float %59, %115
  %117 = tail call float @llvm.floor.f32(float %116)
  %118 = fmul float %67, %117
  %119 = select i1 %63, float %118, float %115
  %120 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %119, float %95, <8 x i32> %65, <4 x i32> %64, i1 false, i32 0, i32 0)
  %121 = add nsw i32 %113, %2
  %122 = sitofp i32 %121 to float
  %123 = fmul float %78, %122
  %124 = tail call float @llvm.floor.f32(float %123)
  %125 = fmul float %86, %124
  %126 = select i1 %82, float %125, float %122
  %127 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %126, float %101, <8 x i32> %84, <4 x i32> %83, i1 false, i32 0, i32 0)
  %128 = fmul contract float %120, %127
  %129 = fadd contract float %112, %128
  %130 = add i32 %113, 1
  %131 = icmp eq i32 %113, %2
  br i1 %131, label %108, label %111, !llvm.loop !18

132:                                              ; preds = %102, %4
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
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
