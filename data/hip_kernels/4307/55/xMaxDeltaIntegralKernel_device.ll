; ModuleID = '../data/hip_kernels/4307/55/main.cu'
source_filename = "../data/hip_kernels/4307/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23xMaxDeltaIntegralKernelPKfPfiiiS0_S0_S0_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
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
  br i1 %27, label %28, label %92

28:                                               ; preds = %8
  %29 = add nsw i32 %22, 1
  %30 = mul i32 %4, %3
  %31 = mul i32 %30, %20
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %34 = sext i32 %20 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %6, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = fadd contract float %36, -1.000000e+00
  %38 = tail call float @llvm.ceil.f32(float %37)
  %39 = fptosi float %38 to i32
  %40 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5, !amdgpu.noclobber !9
  %42 = tail call float @llvm.floor.f32(float %41)
  %43 = fptosi float %42 to i32
  %44 = getelementptr inbounds float, float addrspace(1)* %7, i64 %34
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = tail call float @llvm.floor.f32(float %45)
  %47 = fptosi float %46 to i32
  %48 = add nsw i32 %29, %43
  %49 = add nsw i32 %48, 1
  %50 = tail call i32 @llvm.smin.i32(i32 %49, i32 %3)
  %51 = tail call i32 @llvm.smax.i32(i32 %50, i32 1)
  %52 = add nuw nsw i32 %4, 1
  %53 = mul nsw i32 %51, %52
  %54 = add nsw i32 %18, %47
  %55 = tail call i32 @llvm.smin.i32(i32 %54, i32 %4)
  %56 = tail call i32 @llvm.smax.i32(i32 %55, i32 0)
  %57 = add nsw i32 %53, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = fadd contract float %60, 0.000000e+00
  %62 = tail call i32 @llvm.smin.i32(i32 %48, i32 %3)
  %63 = tail call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = mul nsw i32 %63, %52
  %65 = add nsw i32 %64, %56
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !5, !amdgpu.noclobber !9
  %69 = fsub contract float %61, %68
  %70 = add nsw i32 %18, %39
  %71 = tail call i32 @llvm.smin.i32(i32 %70, i32 %4)
  %72 = tail call i32 @llvm.smax.i32(i32 %71, i32 0)
  %73 = add nsw i32 %53, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !5, !amdgpu.noclobber !9
  %77 = fsub contract float %69, %76
  %78 = add nsw i32 %64, %72
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = fadd contract float %77, %81
  %83 = icmp sgt i32 %48, 0
  %84 = icmp slt i32 %48, %3
  %85 = uitofp i1 %84 to float
  %86 = select i1 %83, float %85, float 0.000000e+00
  %87 = fmul contract float %82, %86
  %88 = mul nsw i32 %22, %4
  %89 = add nsw i32 %88, %17
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %33, i64 %90
  store float %87, float addrspace(1)* %91, align 4, !tbaa !5
  br label %92

92:                                               ; preds = %28, %8
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
