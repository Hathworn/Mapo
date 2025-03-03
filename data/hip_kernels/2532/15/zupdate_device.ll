; ModuleID = '../data/hip_kernels/2532/15/main.cu'
source_filename = "../data/hip_kernels/2532/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7zupdatePfS_fii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %4
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %74

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %3
  %28 = add nsw i32 %27, %14
  %29 = shl nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = add nuw nsw i32 %29, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul contract float %32, %32
  %38 = fmul contract float %36, %36
  %39 = fadd contract float %37, %38
  %40 = fcmp olt float %39, 0x39F0000000000000
  %41 = select i1 %40, float 0x41F0000000000000, float 1.000000e+00
  %42 = fmul float %39, %41
  %43 = tail call float @llvm.sqrt.f32(float %42)
  %44 = bitcast float %43 to i32
  %45 = add nsw i32 %44, -1
  %46 = bitcast i32 %45 to float
  %47 = add nsw i32 %44, 1
  %48 = bitcast i32 %47 to float
  %49 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 608)
  %50 = select i1 %40, float 0x3EF0000000000000, float 1.000000e+00
  %51 = fneg float %48
  %52 = tail call float @llvm.fma.f32(float %51, float %43, float %42)
  %53 = fcmp ogt float %52, 0.000000e+00
  %54 = fneg float %46
  %55 = tail call float @llvm.fma.f32(float %54, float %43, float %42)
  %56 = fcmp ole float %55, 0.000000e+00
  %57 = select i1 %56, float %46, float %43
  %58 = select i1 %53, float %48, float %57
  %59 = fmul float %50, %58
  %60 = select i1 %49, float %42, float %59
  %61 = fmul contract float %60, %2
  %62 = fadd contract float %61, 1.000000e+00
  %63 = fdiv contract float 1.000000e+00, %62
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fmul contract float %32, %2
  %67 = fadd contract float %66, %65
  %68 = fmul contract float %67, %63
  store float %68, float addrspace(1)* %31, align 4, !tbaa !7
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = fmul contract float %36, %2
  %72 = fadd contract float %71, %70
  %73 = fmul contract float %72, %63
  store float %73, float addrspace(1)* %35, align 4, !tbaa !7
  br label %74

74:                                               ; preds = %26, %5
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
