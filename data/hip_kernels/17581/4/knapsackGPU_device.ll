; ModuleID = '../data/hip_kernels/17581/4/main.cu'
source_filename = "../data/hip_kernels/17581/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11knapsackGPUPiiS_S_i(i32 addrspace(1)* nocapture %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp eq i32 %1, 0
  br i1 %15, label %48, label %16

16:                                               ; preds = %5
  %17 = add nsw i32 %4, 1
  %18 = mul nsw i32 %17, %1
  %19 = add nsw i32 %14, %18
  %20 = icmp sle i32 %14, %17
  %21 = icmp sgt i32 %14, 0
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %46

23:                                               ; preds = %16
  %24 = add nsw i32 %1, -1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = icmp slt i32 %14, %27
  %29 = sub nsw i32 %19, %17
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  br i1 %28, label %42, label %33

33:                                               ; preds = %23
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %25
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = sub nsw i32 %29, %27
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !6
  %40 = add nsw i32 %39, %35
  %41 = tail call i32 @llvm.smax.i32(i32 %32, i32 %40)
  br label %42

42:                                               ; preds = %23, %33
  %43 = phi i32 [ %41, %33 ], [ %32, %23 ]
  %44 = sext i32 %19 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  store i32 %43, i32 addrspace(1)* %45, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %42, %16
  %47 = icmp eq i32 %14, 0
  br i1 %47, label %48, label %52

48:                                               ; preds = %5, %46
  %49 = phi i32 [ %19, %46 ], [ %14, %5 ]
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  store i32 0, i32 addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %48, %46
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
