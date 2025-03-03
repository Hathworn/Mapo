; ModuleID = '../data/hip_kernels/4307/56/main.cu'
source_filename = "../data/hip_kernels/4307/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23xMinDeltaIntegralKernelPKfPfiiiS0_S0_S0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = shl i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = add i32 %10, %11
  %13 = freeze i32 %12
  %14 = freeze i32 %4
  %15 = sdiv i32 %13, %14
  %16 = mul i32 %15, %14
  %17 = sub i32 %13, %16
  %18 = add nsw i32 %17, 1
  %19 = freeze i32 %3
  %20 = sdiv i32 %15, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %15, %21
  %23 = icmp slt i32 %20, %2
  %24 = icmp sgt i32 %3, -1
  %25 = and i1 %24, %23
  %26 = icmp sgt i32 %4, -1
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %96

28:                                               ; preds = %8
  %29 = mul i32 %4, %3
  %30 = mul i32 %29, %20
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %33 = sext i32 %20 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %5, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !5, !amdgpu.noclobber !9
  %36 = fadd contract float %35, -1.000000e+00
  %37 = tail call float @llvm.ceil.f32(float %36)
  %38 = fptosi float %37 to i32
  %39 = getelementptr inbounds float, float addrspace(1)* %6, i64 %33
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !5, !amdgpu.noclobber !9
  %41 = fadd contract float %40, -1.000000e+00
  %42 = tail call float @llvm.ceil.f32(float %41)
  %43 = fptosi float %42 to i32
  %44 = getelementptr inbounds float, float addrspace(1)* %7, i64 %33
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = tail call float @llvm.floor.f32(float %45)
  %47 = fptosi float %46 to i32
  %48 = add i32 %22, %38
  %49 = add i32 %48, 1
  %50 = add nsw i32 %3, -1
  %51 = tail call i32 @llvm.smin.i32(i32 %49, i32 %50)
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = add nuw nsw i32 %4, 1
  %54 = mul nsw i32 %52, %53
  %55 = add nsw i32 %18, %47
  %56 = tail call i32 @llvm.smin.i32(i32 %55, i32 %4)
  %57 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %58 = add nsw i32 %57, %54
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = fadd contract float %61, 0.000000e+00
  %63 = tail call i32 @llvm.smin.i32(i32 %48, i32 %3)
  %64 = tail call i32 @llvm.smax.i32(i32 %63, i32 0)
  %65 = mul nsw i32 %64, %53
  %66 = add nsw i32 %65, %57
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = fsub contract float %62, %69
  %71 = add nsw i32 %18, %43
  %72 = tail call i32 @llvm.smin.i32(i32 %71, i32 %4)
  %73 = tail call i32 @llvm.smax.i32(i32 %72, i32 0)
  %74 = add nsw i32 %73, %54
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = fsub contract float %70, %77
  %79 = add nsw i32 %65, %73
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !5, !amdgpu.noclobber !9
  %83 = fadd contract float %78, %82
  %84 = icmp ult i32 %48, 2147483647
  %85 = icmp slt i32 %49, %3
  %86 = uitofp i1 %85 to float
  %87 = select i1 %84, float %86, float 0.000000e+00
  %88 = fneg contract float %83
  %89 = fmul contract float %87, %88
  %90 = mul nsw i32 %22, %4
  %91 = add nsw i32 %90, %17
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %32, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  %95 = fmul contract float %94, %89
  store float %95, float addrspace(1)* %93, align 4, !tbaa !5
  br label %96

96:                                               ; preds = %28, %8
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
