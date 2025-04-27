; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/116/markValidIndexMapPixelKernel.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/4312/116/markValidIndexMapPixelKernel.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z28markValidIndexMapPixelKernelP13__hip_textureijjPh(%struct.__hip_texture addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i8 addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
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
  %23 = icmp ult i32 %14, %3
  %24 = icmp ult i32 %22, %2
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %140

26:                                               ; preds = %5
  %27 = mul i32 %22, %3
  %28 = add i32 %27, %14
  %29 = icmp slt i32 %1, 1
  br i1 %29, label %30, label %73

30:                                               ; preds = %26
  %31 = uitofp i32 %14 to float
  %32 = uitofp i32 %22 to float
  %33 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %34 = addrspacecast i32 addrspace(1)* %33 to i32 addrspace(4)*
  %35 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 12
  %36 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 10
  %37 = load i32, i32 addrspace(4)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = uitofp i32 %37 to float
  %39 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 2
  %40 = load i32, i32 addrspace(4)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = lshr i32 %40, 14
  %42 = and i32 %41, 16383
  %43 = add nuw nsw i32 %42, 1
  %44 = uitofp i32 %43 to float
  %45 = load i32, i32 addrspace(4)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = and i32 %45, 32768
  %47 = icmp eq i32 %46, 0
  %48 = select i1 %47, float %38, float 1.000000e+00
  %49 = select i1 %47, float %44, float 1.000000e+00
  %50 = getelementptr inbounds i32, i32 addrspace(4)* %34, i64 14
  %51 = load i32, i32 addrspace(4)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = and i32 %51, 1048576
  %53 = icmp eq i32 %52, 0
  %54 = bitcast i32 addrspace(4)* %35 to <4 x i32> addrspace(4)*
  %55 = load <4 x i32>, <4 x i32> addrspace(4)* %54, align 16, !tbaa !11, !amdgpu.noclobber !6
  %56 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %57 = addrspacecast <8 x i32> addrspace(1)* %56 to <8 x i32> addrspace(4)*
  %58 = load <8 x i32>, <8 x i32> addrspace(4)* %57, align 32, !tbaa !11, !amdgpu.noclobber !6
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %49)
  %60 = fmul float %49, %32
  %61 = tail call float @llvm.floor.f32(float %60)
  %62 = fmul float %59, %61
  %63 = select i1 %53, float %62, float %32
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %48)
  %65 = fmul float %48, %31
  %66 = tail call float @llvm.floor.f32(float %65)
  %67 = fmul float %64, %66
  %68 = select i1 %53, float %67, float %31
  %69 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %68, float %63, <8 x i32> %58, <4 x i32> %55, i1 false, i32 0, i32 0)
  %70 = bitcast float %69 to i32
  %71 = icmp ne i32 %70, -1
  %72 = zext i1 %71 to i8
  br label %136

73:                                               ; preds = %26
  %74 = sub i32 %22, %1
  %75 = add i32 %22, %1
  %76 = icmp ugt i32 %74, %75
  br i1 %76, label %136, label %77

77:                                               ; preds = %73
  %78 = sub i32 %14, %1
  %79 = add i32 %14, %1
  %80 = icmp ugt i32 %78, %79
  %81 = bitcast %struct.__hip_texture addrspace(1)* %0 to i32 addrspace(1)*
  %82 = addrspacecast i32 addrspace(1)* %81 to i32 addrspace(4)*
  %83 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 12
  %84 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 10
  %85 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 2
  %86 = getelementptr inbounds i32, i32 addrspace(4)* %82, i64 14
  %87 = bitcast i32 addrspace(4)* %83 to <4 x i32> addrspace(4)*
  %88 = bitcast %struct.__hip_texture addrspace(1)* %0 to <8 x i32> addrspace(1)*
  %89 = addrspacecast <8 x i32> addrspace(1)* %88 to <8 x i32> addrspace(4)*
  br label %90

90:                                               ; preds = %77, %118
  %91 = phi i32 [ %74, %77 ], [ %120, %118 ]
  %92 = phi i8 [ 1, %77 ], [ %119, %118 ]
  br i1 %80, label %118, label %93

93:                                               ; preds = %90
  %94 = uitofp i32 %91 to float
  %95 = load i32, i32 addrspace(4)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %96 = uitofp i32 %95 to float
  %97 = load i32, i32 addrspace(4)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = lshr i32 %97, 14
  %99 = and i32 %98, 16383
  %100 = add nuw nsw i32 %99, 1
  %101 = uitofp i32 %100 to float
  %102 = load i32, i32 addrspace(4)* %83, align 4, !tbaa !7, !amdgpu.noclobber !6
  %103 = and i32 %102, 32768
  %104 = icmp eq i32 %103, 0
  %105 = select i1 %104, float %96, float 1.000000e+00
  %106 = select i1 %104, float %101, float 1.000000e+00
  %107 = load i32, i32 addrspace(4)* %86, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = and i32 %107, 1048576
  %109 = icmp eq i32 %108, 0
  %110 = load <4 x i32>, <4 x i32> addrspace(4)* %87, align 16, !tbaa !11, !amdgpu.noclobber !6
  %111 = load <8 x i32>, <8 x i32> addrspace(4)* %89, align 32, !tbaa !11, !amdgpu.noclobber !6
  %112 = tail call float @llvm.amdgcn.rcp.f32(float %106)
  %113 = fmul float %106, %94
  %114 = tail call float @llvm.floor.f32(float %113)
  %115 = fmul float %112, %114
  %116 = select i1 %109, float %115, float %94
  %117 = tail call float @llvm.amdgcn.rcp.f32(float %105)
  br label %122

118:                                              ; preds = %122, %90
  %119 = phi i8 [ %92, %90 ], [ %133, %122 ]
  %120 = add i32 %91, 1
  %121 = icmp ugt i32 %120, %75
  br i1 %121, label %136, label %90, !llvm.loop !12

122:                                              ; preds = %93, %122
  %123 = phi i32 [ %78, %93 ], [ %134, %122 ]
  %124 = phi i8 [ %92, %93 ], [ %133, %122 ]
  %125 = uitofp i32 %123 to float
  %126 = fmul float %105, %125
  %127 = tail call float @llvm.floor.f32(float %126)
  %128 = fmul float %117, %127
  %129 = select i1 %109, float %128, float %125
  %130 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %129, float %116, <8 x i32> %111, <4 x i32> %110, i1 false, i32 0, i32 0)
  %131 = bitcast float %130 to i32
  %132 = icmp eq i32 %131, -1
  %133 = select i1 %132, i8 0, i8 %124
  %134 = add i32 %123, 1
  %135 = icmp ugt i32 %134, %79
  br i1 %135, label %118, label %122, !llvm.loop !14

136:                                              ; preds = %118, %73, %30
  %137 = phi i8 [ %72, %30 ], [ 1, %73 ], [ %119, %118 ]
  %138 = zext i32 %28 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %138
  store i8 %137, i8 addrspace(1)* %139, align 1, !tbaa !15
  br label %140

140:                                              ; preds = %136, %5
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
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
