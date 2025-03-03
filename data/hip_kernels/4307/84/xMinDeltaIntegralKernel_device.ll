; ModuleID = '../data/hip_kernels/4307/84/main.cu'
source_filename = "../data/hip_kernels/4307/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23xMinDeltaIntegralKernelPKfiPfiiiiiS0_S0_S0_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = shl i32 %12, 8
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = add i32 %13, %14
  %16 = freeze i32 %15
  %17 = freeze i32 %7
  %18 = sdiv i32 %16, %17
  %19 = mul i32 %18, %17
  %20 = sub i32 %16, %19
  %21 = add nsw i32 %20, 1
  %22 = freeze i32 %6
  %23 = sdiv i32 %18, %22
  %24 = freeze i32 %23
  %25 = freeze i32 %5
  %26 = sdiv i32 %24, %25
  %27 = mul nsw i32 %26, %1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = freeze i32 %26
  %31 = freeze i32 %4
  %32 = sdiv i32 %30, %31
  %33 = icmp slt i32 %32, %3
  br i1 %33, label %34, label %101

34:                                               ; preds = %11
  %35 = sext i32 %15 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = mul i32 %32, %31
  %38 = sub i32 %30, %37
  %39 = mul nsw i32 %38, %5
  %40 = mul i32 %26, %25
  %41 = sub i32 %24, %40
  %42 = add nsw i32 %39, %41
  %43 = mul i32 %23, %22
  %44 = sub i32 %18, %43
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %8, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = fadd contract float %47, -1.000000e+00
  %49 = tail call float @llvm.ceil.f32(float %48)
  %50 = fptosi float %49 to i32
  %51 = getelementptr inbounds float, float addrspace(1)* %9, i64 %45
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = fadd contract float %52, -1.000000e+00
  %54 = tail call float @llvm.ceil.f32(float %53)
  %55 = fptosi float %54 to i32
  %56 = getelementptr inbounds float, float addrspace(1)* %10, i64 %45
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = tail call float @llvm.floor.f32(float %57)
  %59 = fptosi float %58 to i32
  %60 = add i32 %44, %50
  %61 = add i32 %60, 1
  %62 = tail call i32 @llvm.smin.i32(i32 %61, i32 %6)
  %63 = tail call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = add nsw i32 %7, 1
  %65 = mul nsw i32 %63, %64
  %66 = add nsw i32 %21, %59
  %67 = tail call i32 @llvm.smin.i32(i32 %66, i32 %7)
  %68 = tail call i32 @llvm.smax.i32(i32 %67, i32 0)
  %69 = add nsw i32 %68, %65
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %29, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5, !amdgpu.noclobber !9
  %73 = fadd contract float %72, 0.000000e+00
  %74 = tail call i32 @llvm.smin.i32(i32 %60, i32 %6)
  %75 = tail call i32 @llvm.smax.i32(i32 %74, i32 0)
  %76 = mul nsw i32 %75, %64
  %77 = add nsw i32 %76, %68
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %29, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !5, !amdgpu.noclobber !9
  %81 = fsub contract float %73, %80
  %82 = add nsw i32 %21, %55
  %83 = tail call i32 @llvm.smin.i32(i32 %82, i32 %7)
  %84 = tail call i32 @llvm.smax.i32(i32 %83, i32 0)
  %85 = add nsw i32 %84, %65
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %29, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = fsub contract float %81, %88
  %90 = add nsw i32 %76, %84
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %29, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = fadd contract float %89, %93
  %95 = icmp ult i32 %60, 2147483647
  %96 = icmp slt i32 %61, %6
  %97 = uitofp i1 %96 to float
  %98 = select i1 %95, float %97, float 0.000000e+00
  %99 = fneg contract float %94
  %100 = fmul contract float %98, %99
  store float %100, float addrspace(1)* %36, align 4, !tbaa !5
  br label %101

101:                                              ; preds = %34, %11
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
