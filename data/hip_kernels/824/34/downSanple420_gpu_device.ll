; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/824/34/downSanple420_gpu.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/824/34/downSanple420_gpu.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17downSanple420_gpuP13__hip_textureS0_PhS1_mm(%struct.__hip_texture addrspace(1)* %0, %struct.__hip_texture addrspace(1)* %1, i8 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture writeonly %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = icmp ult i64 %16, %4
  br i1 %17, label %18, label %111

18:                                               ; preds = %6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = shl i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = icmp ult i64 %28, %5
  br i1 %29, label %30, label %111

30:                                               ; preds = %18
  %31 = lshr i64 %4, 1
  %32 = icmp ugt i64 %31, %16
  %33 = trunc i64 %31 to i32
  %34 = select i1 %32, i8 addrspace(1)* %2, i8 addrspace(1)* %3
  %35 = select i1 %32, %struct.__hip_texture addrspace(1)* %0, %struct.__hip_texture addrspace(1)* %1
  %36 = select i1 %32, i32 0, i32 %33
  %37 = sub i32 %15, %36
  %38 = shl i32 %37, 1
  %39 = sitofp i32 %38 to float
  %40 = sitofp i32 %27 to float
  %41 = bitcast %struct.__hip_texture addrspace(1)* %35 to i32 addrspace(1)*
  %42 = addrspacecast i32 addrspace(1)* %41 to i32 addrspace(4)*
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 12
  %44 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 10
  %45 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !7
  %46 = uitofp i32 %45 to float
  %47 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 2
  %48 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !7
  %49 = lshr i32 %48, 14
  %50 = and i32 %49, 16383
  %51 = add nuw nsw i32 %50, 1
  %52 = uitofp i32 %51 to float
  %53 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7
  %54 = and i32 %53, 32768
  %55 = icmp eq i32 %54, 0
  %56 = select i1 %55, float %46, float 1.000000e+00
  %57 = select i1 %55, float %52, float 1.000000e+00
  %58 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 14
  %59 = load i32, i32 addrspace(4)* %58, align 4, !tbaa !7
  %60 = and i32 %59, 1048576
  %61 = icmp eq i32 %60, 0
  %62 = bitcast i32 addrspace(4)* %43 to <4 x i32> addrspace(4)*
  %63 = load <4 x i32>, <4 x i32> addrspace(4)* %62, align 16, !tbaa !11
  %64 = bitcast %struct.__hip_texture addrspace(1)* %35 to <8 x i32> addrspace(1)*
  %65 = addrspacecast <8 x i32> addrspace(1)* %64 to <8 x i32> addrspace(4)*
  %66 = load <8 x i32>, <8 x i32> addrspace(4)* %65, align 32, !tbaa !11
  %67 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %68 = fmul float %57, %40
  %69 = tail call float @llvm.floor.f32(float %68)
  %70 = fmul float %67, %69
  %71 = select i1 %61, float %70, float %40
  %72 = tail call float @llvm.amdgcn.rcp.f32(float %56)
  %73 = fmul float %56, %39
  %74 = tail call float @llvm.floor.f32(float %73)
  %75 = fmul float %72, %74
  %76 = select i1 %61, float %75, float %39
  %77 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %76, float %71, <8 x i32> %66, <4 x i32> %63, i1 false, i32 0, i32 0)
  %78 = bitcast float %77 to i32
  %79 = and i32 %78, 65535
  %80 = add nuw nsw i32 %38, 1
  %81 = sitofp i32 %80 to float
  %82 = fmul float %56, %81
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %72, %83
  %85 = select i1 %61, float %84, float %81
  %86 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %85, float %71, <8 x i32> %66, <4 x i32> %63, i1 false, i32 0, i32 0)
  %87 = bitcast float %86 to i32
  %88 = add nuw nsw i32 %27, 1
  %89 = sitofp i32 %88 to float
  %90 = fmul float %57, %89
  %91 = tail call float @llvm.floor.f32(float %90)
  %92 = fmul float %67, %91
  %93 = select i1 %61, float %92, float %89
  %94 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %76, float %93, <8 x i32> %66, <4 x i32> %63, i1 false, i32 0, i32 0)
  %95 = bitcast float %94 to i32
  %96 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %85, float %93, <8 x i32> %66, <4 x i32> %63, i1 false, i32 0, i32 0)
  %97 = bitcast float %96 to i32
  %98 = add nuw nsw i32 %79, 1
  %99 = add i32 %98, %87
  %100 = add i32 %99, %95
  %101 = add i32 %100, %97
  %102 = lshr i32 %101, 2
  %103 = trunc i32 %102 to i8
  %104 = ashr exact i32 %27, 1
  %105 = sext i32 %104 to i64
  %106 = mul i64 %105, %4
  %107 = sext i32 %38 to i64
  %108 = add i64 %106, %107
  %109 = lshr i64 %108, 1
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 %109
  store i8 %103, i8 addrspace(1)* %110, align 1, !tbaa !12
  br label %111

111:                                              ; preds = %30, %18, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
