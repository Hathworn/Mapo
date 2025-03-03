; ModuleID = '../data/hip_kernels/8377/0/main.cu'
source_filename = "../data/hip_kernels/8377/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7oddevenPiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  switch i32 %1, label %34 [
    i32 0, label %5
    i32 1, label %20
  ]

5:                                                ; preds = %3
  %6 = shl nsw i32 %4, 1
  %7 = add nuw nsw i32 %6, 1
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %9, label %34

9:                                                ; preds = %5
  %10 = sext i32 %6 to i64
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %10
  %12 = bitcast i32 addrspace(1)* %11 to <2 x i32> addrspace(1)*
  %13 = load <2 x i32>, <2 x i32> addrspace(1)* %12, align 4, !tbaa !4
  %14 = extractelement <2 x i32> %13, i64 0
  %15 = extractelement <2 x i32> %13, i64 1
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %34

17:                                               ; preds = %9
  %18 = sext i32 %7 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  store i32 %15, i32 addrspace(1)* %11, align 4, !tbaa !4
  store i32 %14, i32 addrspace(1)* %19, align 4, !tbaa !4
  br label %34

20:                                               ; preds = %3
  %21 = shl nsw i32 %4, 1
  %22 = add nsw i32 %21, 2
  %23 = icmp slt i32 %22, %2
  br i1 %23, label %24, label %34

24:                                               ; preds = %20
  %25 = add nuw nsw i32 %21, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !4
  %29 = sext i32 %22 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !4
  %32 = icmp sgt i32 %28, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %24
  store i32 %31, i32 addrspace(1)* %27, align 4, !tbaa !4
  store i32 %28, i32 addrspace(1)* %30, align 4, !tbaa !4
  br label %34

34:                                               ; preds = %5, %17, %9, %3, %24, %33, %20
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
