; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/824/47/downSanple422_gpu.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/824/47/downSanple422_gpu.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17downSanple422_gpuP13__hip_textureS0_PsS1_mm(%struct.__hip_texture addrspace(1)* %0, %struct.__hip_texture addrspace(1)* %1, i16 addrspace(1)* nocapture writeonly %2, i16 addrspace(1)* nocapture writeonly %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sext i32 %15 to i64
  %25 = icmp ult i64 %24, %4
  %26 = sext i32 %23 to i64
  %27 = icmp ult i64 %26, %5
  %28 = select i1 %25, i1 %27, i1 false
  br i1 %28, label %29, label %98

29:                                               ; preds = %6
  %30 = lshr i64 %4, 1
  %31 = icmp ugt i64 %30, %24
  %32 = trunc i64 %30 to i32
  %33 = select i1 %31, i16 addrspace(1)* %2, i16 addrspace(1)* %3
  %34 = select i1 %31, %struct.__hip_texture addrspace(1)* %0, %struct.__hip_texture addrspace(1)* %1
  %35 = select i1 %31, i32 0, i32 %32
  %36 = sub i32 %15, %35
  %37 = shl i32 %36, 1
  %38 = sitofp i32 %37 to float
  %39 = sitofp i32 %23 to float
  %40 = bitcast %struct.__hip_texture addrspace(1)* %34 to i32 addrspace(1)*
  %41 = addrspacecast i32 addrspace(1)* %40 to i32 addrspace(4)*
  %42 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 12
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 10
  %44 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !7
  %45 = uitofp i32 %44 to float
  %46 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 2
  %47 = load i32, i32 addrspace(4)* %46, align 4, !tbaa !7
  %48 = lshr i32 %47, 14
  %49 = and i32 %48, 16383
  %50 = add nuw nsw i32 %49, 1
  %51 = uitofp i32 %50 to float
  %52 = load i32, i32 addrspace(4)* %42, align 4, !tbaa !7
  %53 = and i32 %52, 32768
  %54 = icmp eq i32 %53, 0
  %55 = select i1 %54, float %45, float 1.000000e+00
  %56 = select i1 %54, float %51, float 1.000000e+00
  %57 = getelementptr inbounds i32, i32 addrspace(4)* %41, i64 14
  %58 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !7
  %59 = and i32 %58, 1048576
  %60 = icmp eq i32 %59, 0
  %61 = bitcast i32 addrspace(4)* %42 to <4 x i32> addrspace(4)*
  %62 = load <4 x i32>, <4 x i32> addrspace(4)* %61, align 16, !tbaa !11
  %63 = bitcast %struct.__hip_texture addrspace(1)* %34 to <8 x i32> addrspace(1)*
  %64 = addrspacecast <8 x i32> addrspace(1)* %63 to <8 x i32> addrspace(4)*
  %65 = load <8 x i32>, <8 x i32> addrspace(4)* %64, align 32, !tbaa !11
  %66 = tail call float @llvm.amdgcn.rcp.f32(float %56)
  %67 = fmul float %56, %39
  %68 = tail call float @llvm.floor.f32(float %67)
  %69 = fmul float %66, %68
  %70 = select i1 %60, float %69, float %39
  %71 = tail call float @llvm.amdgcn.rcp.f32(float %55)
  %72 = fmul float %55, %38
  %73 = tail call float @llvm.floor.f32(float %72)
  %74 = fmul float %71, %73
  %75 = select i1 %60, float %74, float %38
  %76 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %75, float %70, <8 x i32> %65, <4 x i32> %62, i1 false, i32 0, i32 0)
  %77 = bitcast float %76 to i32
  %78 = shl i32 %77, 16
  %79 = ashr exact i32 %78, 16
  %80 = add nuw nsw i32 %37, 1
  %81 = sitofp i32 %80 to float
  %82 = fmul float %55, %81
  %83 = tail call float @llvm.floor.f32(float %82)
  %84 = fmul float %71, %83
  %85 = select i1 %60, float %84, float %81
  %86 = tail call float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 1, float %85, float %70, <8 x i32> %65, <4 x i32> %62, i1 false, i32 0, i32 0)
  %87 = bitcast float %86 to i32
  %88 = shl i32 %87, 16
  %89 = ashr exact i32 %88, 16
  %90 = add nsw i32 %89, %79
  %91 = lshr i32 %90, 1
  %92 = trunc i32 %91 to i16
  %93 = mul i64 %26, %4
  %94 = ashr exact i32 %37, 1
  %95 = sext i32 %94 to i64
  %96 = add i64 %93, %95
  %97 = getelementptr inbounds i16, i16 addrspace(1)* %33, i64 %96
  store i16 %92, i16 addrspace(1)* %97, align 2, !tbaa !12
  br label %98

98:                                               ; preds = %29, %6
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
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C++ TBAA"}
