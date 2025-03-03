; ModuleID = '../data/hip_kernels/7024/4/main.cu'
source_filename = "../data/hip_kernels/7024/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cudaComputeYGradientPiPhiii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  br i1 %19, label %20, label %24

20:                                               ; preds = %5
  %21 = shl nsw i32 %2, 1
  %22 = mul nsw i32 %3, %2
  %23 = icmp eq i32 %6, 0
  br label %25

24:                                               ; preds = %74, %5
  ret void

25:                                               ; preds = %20, %74
  %26 = phi i32 [ %15, %20 ], [ %75, %74 ]
  %27 = add nsw i32 %26, %21
  %28 = add nsw i32 %27, 1
  %29 = icmp sge i32 %28, %22
  %30 = icmp eq i32 %26, 0
  %31 = select i1 %30, i1 %23, i1 false
  %32 = select i1 %29, i1 true, i1 %31
  br i1 %32, label %33, label %35

33:                                               ; preds = %25
  %34 = add nsw i32 %26, 1
  br label %74

35:                                               ; preds = %25
  %36 = add nsw i32 %26, -1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %40 = zext i8 %39 to i32
  %41 = sext i32 %26 to i64
  %42 = add nsw i32 %26, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %43
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !7
  %46 = zext i8 %45 to i32
  %47 = add nsw i32 %26, %2
  %48 = add nsw i32 %47, -1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !7
  %52 = zext i8 %51 to i32
  %53 = add nsw i32 %47, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7
  %57 = zext i8 %56 to i32
  %58 = add nsw i32 %27, -1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i32
  %63 = sext i32 %28 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i32
  %67 = sub nsw i32 %52, %57
  %68 = shl nsw i32 %67, 1
  %69 = add nuw nsw i32 %40, %62
  %70 = add nuw nsw i32 %46, %66
  %71 = sub nsw i32 %69, %70
  %72 = add nsw i32 %71, %68
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  store i32 %72, i32 addrspace(1)* %73, align 4, !tbaa !10
  br label %74

74:                                               ; preds = %33, %35
  %75 = phi i32 [ %34, %33 ], [ %42, %35 ]
  %76 = icmp eq i32 %75, %18
  br i1 %76, label %24, label %25, !llvm.loop !12
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
