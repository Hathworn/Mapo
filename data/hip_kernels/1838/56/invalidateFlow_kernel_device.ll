; ModuleID = '../data/hip_kernels/1838/56/main.cu'
source_filename = "../data/hip_kernels/1838/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21invalidateFlow_kernelPfS_PKfS1_iif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = shl i32 %8, 8
  %15 = ashr exact i32 %14, 8
  %16 = mul nsw i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = shl i32 %19, 8
  %25 = ashr exact i32 %24, 8
  %26 = mul nsw i32 %25, %23
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %18, %4
  %30 = icmp slt i32 %28, %5
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %77

32:                                               ; preds = %7
  %33 = shl i32 %28, 8
  %34 = ashr exact i32 %33, 8
  %35 = shl i32 %4, 8
  %36 = ashr exact i32 %35, 8
  %37 = mul nsw i32 %34, %36
  %38 = add nsw i32 %37, %18
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = getelementptr inbounds float, float addrspace(1)* %3, i64 %39
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fsub contract float %41, %45
  %49 = fmul contract float %48, %48
  %50 = fsub contract float %43, %47
  %51 = fmul contract float %50, %50
  %52 = fadd contract float %49, %51
  %53 = fcmp olt float %52, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = fcmp contract ogt float %73, %6
  %75 = select i1 %74, float 0x7FF8000000000000, float %43
  %76 = select i1 %74, float 0x7FF8000000000000, float %41
  store float %76, float addrspace(1)* %40, align 4, !tbaa !7
  store float %75, float addrspace(1)* %42, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %32, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
