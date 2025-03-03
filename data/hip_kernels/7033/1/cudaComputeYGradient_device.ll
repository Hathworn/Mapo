; ModuleID = '../data/hip_kernels/7033/1/main.cu'
source_filename = "../data/hip_kernels/7033/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20cudaComputeYGradientPiPhii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %57, label %15

15:                                               ; preds = %4
  %16 = add nsw i32 %13, -1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !5
  %20 = zext i8 %19 to i32
  %21 = sext i32 %13 to i64
  %22 = add nsw i32 %13, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !5
  %26 = zext i8 %25 to i32
  %27 = add nsw i32 %13, %2
  %28 = add nsw i32 %27, -1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %29
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !7, !amdgpu.noclobber !5
  %32 = zext i8 %31 to i32
  %33 = add nsw i32 %27, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i8 %36 to i32
  %38 = shl nsw i32 %2, 1
  %39 = add nsw i32 %13, %38
  %40 = add nsw i32 %39, -1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7, !amdgpu.noclobber !5
  %44 = zext i8 %43 to i32
  %45 = add nsw i32 %39, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7, !amdgpu.noclobber !5
  %49 = zext i8 %48 to i32
  %50 = sub nsw i32 %32, %37
  %51 = shl nsw i32 %50, 1
  %52 = add nuw nsw i32 %20, %44
  %53 = add nuw nsw i32 %26, %49
  %54 = sub nsw i32 %52, %53
  %55 = add nsw i32 %54, %51
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  store i32 %55, i32 addrspace(1)* %56, align 4, !tbaa !10
  br label %57

57:                                               ; preds = %4, %15
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
