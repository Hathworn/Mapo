; ModuleID = '../data/hip_kernels/11180/11/main.cu'
source_filename = "../data/hip_kernels/11180/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10cinzaGPU1dPhS_i(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %40

14:                                               ; preds = %3
  %15 = mul nsw i32 %12, 3
  %16 = add nsw i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !6
  %20 = zext i8 %19 to i16
  %21 = add nsw i32 %15, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %22
  %24 = load i8, i8 addrspace(1)* %23, align 1, !tbaa !7, !amdgpu.noclobber !6
  %25 = zext i8 %24 to i16
  %26 = sext i32 %15 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !6
  %29 = zext i8 %28 to i16
  %30 = mul nuw nsw i16 %20, 30
  %31 = mul nuw nsw i16 %25, 59
  %32 = add nuw nsw i16 %31, %30
  %33 = mul nuw nsw i16 %29, 11
  %34 = add nuw nsw i16 %32, %33
  %35 = udiv i16 %34, 100
  %36 = trunc i16 %35 to i8
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  store i8 %36, i8 addrspace(1)* %37, align 1, !tbaa !7
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %22
  store i8 %36, i8 addrspace(1)* %38, align 1, !tbaa !7
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %26
  store i8 %36, i8 addrspace(1)* %39, align 1, !tbaa !7
  br label %40

40:                                               ; preds = %14, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
