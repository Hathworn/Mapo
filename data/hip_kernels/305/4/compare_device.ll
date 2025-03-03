; ModuleID = '../data/hip_kernels/305/4/main.cu'
source_filename = "../data/hip_kernels/305/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@position = protected addrspace(1) externally_initialized global i32 0, align 4
@largest = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @position to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7comparePcPiS0_iii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = load i32, i32 addrspace(1)* @position, align 4, !tbaa !7
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %18, label %21

18:                                               ; preds = %6
  %19 = sext i32 %15 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  store i32 2, i32 addrspace(1)* %20, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %18, %6
  %22 = icmp slt i32 %15, %3
  br i1 %22, label %23, label %64

23:                                               ; preds = %21
  %24 = sext i32 %15 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7
  %27 = icmp ne i32 %26, 0
  %28 = load i32, i32 addrspace(1)* @position, align 4
  %29 = icmp eq i32 %15, %28
  %30 = select i1 %27, i1 true, i1 %29
  br i1 %30, label %64, label %31

31:                                               ; preds = %23
  %32 = mul nsw i32 %28, %4
  %33 = icmp sgt i32 %4, 0
  br i1 %33, label %34, label %54

34:                                               ; preds = %31
  %35 = mul nsw i32 %15, %4
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %49, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %51, %36 ]
  %39 = add nsw i32 %38, %32
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !11
  %43 = add nsw i32 %38, %35
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !11
  %47 = icmp ne i8 %42, %46
  %48 = zext i1 %47 to i32
  %49 = add nuw nsw i32 %37, %48
  %50 = icmp sle i32 %49, %5
  %51 = add nuw nsw i32 %38, 1
  %52 = icmp slt i32 %51, %4
  %53 = select i1 %50, i1 %52, i1 false
  br i1 %53, label %36, label %54, !llvm.loop !12

54:                                               ; preds = %36, %31
  %55 = phi i32 [ 0, %31 ], [ %49, %36 ]
  %56 = icmp sgt i32 %55, %5
  br i1 %56, label %64, label %57

57:                                               ; preds = %54
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = sext i32 %28 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = add nsw i32 %62, %59
  store i32 %63, i32 addrspace(1)* %61, align 4, !tbaa !7
  store i32 1, i32 addrspace(1)* %25, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %54, %57, %23, %21
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
