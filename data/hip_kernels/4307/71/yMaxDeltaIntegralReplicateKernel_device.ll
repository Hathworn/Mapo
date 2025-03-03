; ModuleID = '../data/hip_kernels/4307/71/main.cu'
source_filename = "../data/hip_kernels/4307/71/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z32yMaxDeltaIntegralReplicateKernelPKfPfiiiS0_S0_S0_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = add nsw i32 %3, -1
  %12 = add i32 %11, %8
  %13 = sdiv i32 %12, %8
  %14 = add nsw i32 %4, -1
  %15 = add i32 %14, %9
  %16 = sdiv i32 %15, %9
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = shl i32 %17, 4
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = add i32 %18, %19
  %21 = freeze i32 %20
  %22 = freeze i32 %16
  %23 = sdiv i32 %21, %22
  %24 = mul i32 %23, %22
  %25 = sub i32 %21, %24
  %26 = freeze i32 %13
  %27 = sdiv i32 %23, %26
  %28 = mul i32 %27, %26
  %29 = sub i32 %23, %28
  %30 = icmp slt i32 %27, %2
  %31 = icmp sgt i32 %13, -1
  %32 = and i1 %31, %30
  %33 = icmp sgt i32 %16, -1
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %102

35:                                               ; preds = %10
  %36 = mul nsw i32 %29, %8
  %37 = add nsw i32 %36, 1
  %38 = mul nsw i32 %25, %9
  %39 = add nsw i32 %38, 1
  %40 = mul i32 %16, %13
  %41 = mul i32 %40, %27
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %44 = sext i32 %27 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %5, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = fadd contract float %46, -1.000000e+00
  %48 = tail call float @llvm.ceil.f32(float %47)
  %49 = fptosi float %48 to i32
  %50 = getelementptr inbounds float, float addrspace(1)* %6, i64 %44
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = tail call float @llvm.floor.f32(float %51)
  %53 = fptosi float %52 to i32
  %54 = getelementptr inbounds float, float addrspace(1)* %7, i64 %44
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = tail call float @llvm.floor.f32(float %55)
  %57 = fptosi float %56 to i32
  %58 = add nsw i32 %37, %53
  %59 = tail call i32 @llvm.smin.i32(i32 %58, i32 %3)
  %60 = tail call i32 @llvm.smax.i32(i32 %59, i32 0)
  %61 = add nsw i32 %4, 1
  %62 = mul nsw i32 %60, %61
  %63 = add nsw i32 %39, %57
  %64 = add nsw i32 %63, 1
  %65 = tail call i32 @llvm.smin.i32(i32 %64, i32 %4)
  %66 = tail call i32 @llvm.smax.i32(i32 %65, i32 1)
  %67 = add nsw i32 %66, %62
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !5, !amdgpu.noclobber !9
  %71 = fadd contract float %70, 0.000000e+00
  %72 = tail call i32 @llvm.smin.i32(i32 %63, i32 %4)
  %73 = tail call i32 @llvm.smax.i32(i32 %72, i32 0)
  %74 = add nsw i32 %62, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = fsub contract float %71, %77
  %79 = add nsw i32 %37, %49
  %80 = tail call i32 @llvm.smin.i32(i32 %79, i32 %3)
  %81 = tail call i32 @llvm.smax.i32(i32 %80, i32 0)
  %82 = mul nsw i32 %81, %61
  %83 = add nsw i32 %66, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  %87 = fsub contract float %78, %86
  %88 = add nsw i32 %82, %73
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = fadd contract float %87, %91
  %93 = icmp sgt i32 %63, 0
  %94 = icmp slt i32 %63, %4
  %95 = uitofp i1 %94 to float
  %96 = select i1 %93, float %95, float 0.000000e+00
  %97 = fmul contract float %92, %96
  %98 = mul nsw i32 %29, %16
  %99 = add nsw i32 %98, %25
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %43, i64 %100
  store float %97, float addrspace(1)* %101, align 4, !tbaa !5
  br label %102

102:                                              ; preds = %35, %10
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
