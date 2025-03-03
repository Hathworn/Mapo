; ModuleID = '../data/hip_kernels/360/74/main.cu'
source_filename = "../data/hip_kernels/360/74/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26accumulatedPartSizesKerneliPiS_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = add nsw i32 %0, -1
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %16, label %24

16:                                               ; preds = %4
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %22
  store i32 %19, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %24

24:                                               ; preds = %16, %4
  %25 = icmp slt i32 %13, %14
  br i1 %25, label %26, label %40

26:                                               ; preds = %24
  %27 = sext i32 %13 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %30 = add nsw i32 %13, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %34 = icmp eq i32 %29, %33
  br i1 %34, label %40, label %35

35:                                               ; preds = %26
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = sext i32 %29 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %38
  store i32 %37, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %26, %35, %24
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
