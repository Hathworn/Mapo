; ModuleID = '../data/hip_kernels/10806/3/main.cu'
source_filename = "../data/hip_kernels/10806/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7computePiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  switch i32 %5, label %42 [
    i32 2, label %6
    i32 1, label %24
  ]

6:                                                ; preds = %4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %8
  %10 = load i32, i32 addrspace(1)* %9, align 4, !tbaa !5, !amdgpu.noclobber !9
  %11 = add i32 %7, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = mul nsw i32 %14, %10
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %8
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = mul nsw i32 %19, %17
  %21 = sub nsw i32 %15, %20
  %22 = shl i32 %3, 1
  %23 = add i32 %22, %7
  br label %65

24:                                               ; preds = %4
  %25 = shl i32 %3, 1
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = add i32 %25, %26
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = zext i32 %26 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = mul nsw i32 %33, %30
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !5, !amdgpu.noclobber !9
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %28
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = mul nsw i32 %38, %36
  %40 = sub nsw i32 %34, %39
  %41 = add i32 %26, %3
  br label %65

42:                                               ; preds = %4
  %43 = add i32 %5, 1
  %44 = mul i32 %43, %3
  %45 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %46 = add i32 %44, %45
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = add i32 %5, 2
  %51 = mul i32 %50, %3
  %52 = add i32 %51, %45
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = mul nsw i32 %55, %49
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = mul nsw i32 %60, %58
  %62 = sub nsw i32 %56, %61
  %63 = mul i32 %5, %3
  %64 = add i32 %63, %45
  br label %65

65:                                               ; preds = %24, %42, %6
  %66 = phi i32 [ %41, %24 ], [ %64, %42 ], [ %23, %6 ]
  %67 = phi i32 [ %40, %24 ], [ %62, %42 ], [ %21, %6 ]
  %68 = zext i32 %66 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %68
  store i32 %67, i32 addrspace(1)* %69, align 4, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
