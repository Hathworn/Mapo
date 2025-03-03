; ModuleID = '../data/hip_kernels/15394/91/main.cu'
source_filename = "../data/hip_kernels/15394/91/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18writeOffsetUnroll4PfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = add i32 %14, %4
  %16 = mul nuw nsw i32 %11, 3
  %17 = add i32 %15, %16
  %18 = icmp ult i32 %17, %3
  br i1 %18, label %19, label %58

19:                                               ; preds = %5
  %20 = zext i32 %14 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = fadd contract float %22, %24
  %26 = zext i32 %15 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  store float %25, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = add i32 %14, %11
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fadd contract float %31, %33
  %35 = add i32 %15, %11
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  store float %34, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = shl nuw nsw i32 %11, 1
  %39 = add i32 %14, %38
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %1, i64 %40
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = fadd contract float %42, %44
  %46 = add i32 %15, %38
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  store float %45, float addrspace(1)* %48, align 4, !tbaa !7
  %49 = add i32 %14, %16
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fadd contract float %52, %54
  %56 = zext i32 %17 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  store float %55, float addrspace(1)* %57, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %19, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
