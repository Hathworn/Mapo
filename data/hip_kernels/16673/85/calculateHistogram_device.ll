; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16673/85/calculateHistogram.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16673/85/calculateHistogram.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.__hip_texture = type opaque

@_ZZ18calculateHistogramPjjjP13__hip_textureE13histo_private = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z18calculateHistogramPjjjP13__hip_texture(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, %struct.__hip_texture addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %24 = add i32 %22, %23
  %25 = mul nuw nsw i32 %23, %10
  %26 = add nuw nsw i32 %25, %15
  %27 = udiv i32 %13, %10
  %28 = mul i32 %27, %10
  %29 = icmp ugt i32 %13, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %17
  %33 = add i32 %32, %5
  %34 = shl i32 %33, 8
  %35 = icmp ult i32 %26, 256
  br i1 %35, label %36, label %38

36:                                               ; preds = %4
  %37 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ18calculateHistogramPjjjP13__hip_textureE13histo_private, i32 0, i32 %26
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !16
  br label %38

38:                                               ; preds = %36, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = uitofp i32 %16 to float
  %40 = uitofp i32 %24 to float
  %41 = bitcast %struct.__hip_texture addrspace(1)* %3 to i32 addrspace(1)*
  %42 = addrspacecast i32 addrspace(1)* %41 to i32 addrspace(4)*
  %43 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 12
  %44 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 10
  %45 = load i32, i32 addrspace(4)* %44, align 4, !tbaa !20, !amdgpu.noclobber !5
  %46 = uitofp i32 %45 to float
  %47 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 2
  %48 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !20, !amdgpu.noclobber !5
  %49 = lshr i32 %48, 14
  %50 = and i32 %49, 16383
  %51 = add nuw nsw i32 %50, 1
  %52 = uitofp i32 %51 to float
  %53 = load i32, i32 addrspace(4)* %43, align 4, !tbaa !20, !amdgpu.noclobber !5
  %54 = and i32 %53, 32768
  %55 = icmp eq i32 %54, 0
  %56 = select i1 %55, float %46, float 1.000000e+00
  %57 = select i1 %55, float %52, float 1.000000e+00
  %58 = getelementptr inbounds i32, i32 addrspace(4)* %42, i64 14
  %59 = load i32, i32 addrspace(4)* %58, align 4, !tbaa !20, !amdgpu.noclobber !5
  %60 = and i32 %59, 1048576
  %61 = icmp eq i32 %60, 0
  %62 = bitcast i32 addrspace(4)* %43 to <4 x i32> addrspace(4)*
  %63 = load <4 x i32>, <4 x i32> addrspace(4)* %62, align 16, !tbaa !21, !amdgpu.noclobber !5
  %64 = bitcast %struct.__hip_texture addrspace(1)* %3 to <8 x i32> addrspace(1)*
  %65 = addrspacecast <8 x i32> addrspace(1)* %64 to <8 x i32> addrspace(4)*
  %66 = load <8 x i32>, <8 x i32> addrspace(4)* %65, align 32, !tbaa !21, !amdgpu.noclobber !5
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
  %79 = and i32 %78, 255
  %80 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ18calculateHistogramPjjjP13__hip_textureE13histo_private, i32 0, i32 %79
  %81 = atomicrmw add i32 addrspace(3)* %80, i32 1 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %35, label %82, label %88

82:                                               ; preds = %38
  %83 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ18calculateHistogramPjjjP13__hip_textureE13histo_private, i32 0, i32 %26
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !16
  %85 = add nuw i32 %34, %26
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  store i32 %84, i32 addrspace(1)* %87, align 4, !tbaa !16
  br label %88

88:                                               ; preds = %82, %38
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nounwind readonly willreturn
declare float @llvm.amdgcn.image.sample.lz.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!11, !11, i64 0}
!21 = !{!9, !9, i64 0}
