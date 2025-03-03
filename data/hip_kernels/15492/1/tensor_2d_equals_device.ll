; ModuleID = '../data/hip_kernels/15492/1/main.cu'
source_filename = "../data/hip_kernels/15492/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16tensor_2d_equalsiiPKfiiiS0_iiiPi(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 addrspace(1)* nocapture %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %51

32:                                               ; preds = %11
  %33 = mul nsw i32 %20, %4
  %34 = add nsw i32 %33, %3
  %35 = mul nsw i32 %28, %5
  %36 = add nsw i32 %34, %35
  %37 = mul nsw i32 %20, %8
  %38 = add nsw i32 %37, %7
  %39 = mul nsw i32 %28, %9
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %36 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = sext i32 %40 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %6, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fcmp contract une float %43, %46
  br i1 %47, label %48, label %51

48:                                               ; preds = %32
  %49 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !11, !amdgpu.noclobber !5
  %50 = add nsw i32 %49, 1
  store i32 %50, i32 addrspace(1)* %10, align 4, !tbaa !11
  br label %51

51:                                               ; preds = %32, %48, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
