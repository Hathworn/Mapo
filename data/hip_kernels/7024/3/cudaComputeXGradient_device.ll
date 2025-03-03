; ModuleID = '../data/hip_kernels/7024/3/main.cu'
source_filename = "../data/hip_kernels/7024/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cudaComputeXGradientPiPhiii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul nsw i32 %14, %4
  %16 = add nsw i32 %14, 1
  %17 = mul nsw i32 %16, %4
  %18 = add nsw i32 %17, -1
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %25

20:                                               ; preds = %5
  %21 = shl nsw i32 %2, 1
  %22 = mul nsw i32 %3, %2
  %23 = icmp eq i32 %6, 0
  %24 = icmp eq i32 %13, 0
  br label %26

25:                                               ; preds = %70, %5
  ret void

26:                                               ; preds = %20, %70
  %27 = phi i32 [ %15, %20 ], [ %71, %70 ]
  %28 = add nsw i32 %27, %21
  %29 = add nsw i32 %28, 1
  %30 = icmp slt i32 %29, %22
  br i1 %30, label %31, label %70

31:                                               ; preds = %26
  %32 = icmp eq i32 %27, 0
  %33 = select i1 %32, i1 %23, i1 false
  %34 = select i1 %33, i1 %24, i1 false
  br i1 %34, label %70, label %35

35:                                               ; preds = %31
  %36 = add nsw i32 %27, -1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %40 = zext i8 %39 to i32
  %41 = sext i32 %27 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !7
  %44 = zext i8 %43 to i32
  %45 = add nsw i32 %27, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7
  %49 = zext i8 %48 to i32
  %50 = add nsw i32 %28, -1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7
  %54 = zext i8 %53 to i32
  %55 = sext i32 %28 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %55
  %57 = load i8, i8 addrspace(1)* %56, align 1, !tbaa !7
  %58 = zext i8 %57 to i32
  %59 = sext i32 %29 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i32
  %63 = sub nsw i32 %44, %58
  %64 = shl nsw i32 %63, 1
  %65 = add nuw nsw i32 %49, %40
  %66 = add nuw nsw i32 %54, %62
  %67 = sub nsw i32 %65, %66
  %68 = add nsw i32 %67, %64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  store i32 %68, i32 addrspace(1)* %69, align 4, !tbaa !10
  br label %70

70:                                               ; preds = %31, %26, %35
  %71 = add nsw i32 %27, 1
  %72 = icmp eq i32 %71, %18
  br i1 %72, label %25, label %26, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
