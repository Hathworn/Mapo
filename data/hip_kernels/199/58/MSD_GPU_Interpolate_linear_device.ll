; ModuleID = '../data/hip_kernels/199/58/main.cu'
source_filename = "../data/hip_kernels/199/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26MSD_GPU_Interpolate_linearPfS_PiiS0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = icmp sgt i32 %10, %5
  br i1 %11, label %75, label %12

12:                                               ; preds = %6
  %13 = sitofp i32 %10 to float
  %14 = tail call i1 @llvm.amdgcn.class.f32(float %13, i32 144)
  %15 = select i1 %14, float 0x41F0000000000000, float 1.000000e+00
  %16 = fmul float %15, %13
  %17 = tail call float @llvm.log2.f32(float %16)
  %18 = select i1 %14, float 3.200000e+01, float 0.000000e+00
  %19 = fsub float %17, %18
  %20 = tail call float @llvm.floor.f32(float %19)
  %21 = fptosi float %20 to i32
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = sitofp i32 %24 to float
  %26 = mul nsw i32 %21, 3
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !10, !amdgpu.noclobber !9
  %30 = add nsw i32 %26, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !10, !amdgpu.noclobber !9
  %34 = add nsw i32 %3, -1
  %35 = icmp eq i32 %34, %21
  %36 = fcmp contract oeq float %25, %13
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %42

38:                                               ; preds = %12
  %39 = shl nuw nsw i32 %7, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  store float %29, float addrspace(1)* %41, align 4, !tbaa !10
  br label %69

42:                                               ; preds = %12
  %43 = add nsw i32 %21, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = sitofp i32 %46 to float
  %48 = fsub contract float %47, %25
  %49 = mul nsw i32 %43, 3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !10, !amdgpu.noclobber !9
  %53 = fsub contract float %52, %29
  %54 = add nsw i32 %49, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !10, !amdgpu.noclobber !9
  %58 = fsub contract float %57, %33
  %59 = fdiv contract float %53, %48
  %60 = fsub contract float %13, %25
  %61 = fmul contract float %60, %59
  %62 = fadd contract float %29, %61
  %63 = shl nuw nsw i32 %7, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !10
  %66 = fdiv contract float %58, %48
  %67 = fmul contract float %60, %66
  %68 = fadd contract float %33, %67
  br label %69

69:                                               ; preds = %42, %38
  %70 = phi i32 [ %39, %38 ], [ %63, %42 ]
  %71 = phi float [ %33, %38 ], [ %68, %42 ]
  %72 = or i32 %70, 1
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  store float %71, float addrspace(1)* %74, align 4, !tbaa !10
  br label %75

75:                                               ; preds = %69, %6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
