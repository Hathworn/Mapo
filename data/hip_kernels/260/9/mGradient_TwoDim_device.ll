; ModuleID = '../data/hip_kernels/260/9/main.cu'
source_filename = "../data/hip_kernels/260/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16mGradient_TwoDimPfS_S_ff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = icmp eq i32 %12, 0
  %14 = add nsw i32 %11, -1
  %15 = icmp eq i32 %14, %12
  %16 = icmp eq i32 %6, 0
  %17 = icmp eq i32 %6, 479
  %18 = select i1 %13, i1 true, i1 %15
  %19 = select i1 %18, i1 true, i1 %16
  %20 = select i1 %19, i1 true, i1 %17
  br i1 %20, label %51, label %21

21:                                               ; preds = %5
  %22 = mul i32 %6, %11
  %23 = add i32 %22, %12
  %24 = add nsw i32 %23, -1
  %25 = add nsw i32 %23, 1
  %26 = add i32 %23, %11
  %27 = sub i32 %23, %11
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = sext i32 %24 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fsub contract float %30, %33
  %35 = fmul contract float %34, %3
  %36 = sext i32 %23 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fsub contract float %38, %35
  store float %39, float addrspace(1)* %37, align 4, !tbaa !7
  %40 = sext i32 %26 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = sext i32 %27 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fsub contract float %42, %45
  %47 = fmul contract float %46, %4
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = fsub contract float %49, %47
  store float %50, float addrspace(1)* %48, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %5, %21
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
