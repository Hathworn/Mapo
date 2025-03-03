; ModuleID = '../data/hip_kernels/810/203/main.cu'
source_filename = "../data/hip_kernels/810/203/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19reduceUnrolling8NewPiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 3
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %10, 7
  %17 = add i32 %13, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %45

19:                                               ; preds = %3
  %20 = zext i32 %13 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = zext i16 %9 to i64
  %23 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %22
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7
  %26 = add nsw i32 %25, %23
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %22
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7
  %29 = add nsw i32 %28, %26
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %27, i64 %22
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = add nsw i32 %31, %29
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %30, i64 %22
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = add nsw i32 %34, %32
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %33, i64 %22
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = add nsw i32 %37, %35
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %36, i64 %22
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %40, %38
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %22
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %41
  store i32 %44, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i16 %9, 2
  br i1 %46, label %50, label %47

47:                                               ; preds = %45
  %48 = zext i32 %4 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %48
  br label %52

50:                                               ; preds = %63, %45
  %51 = icmp eq i32 %4, 0
  br i1 %51, label %65, label %69

52:                                               ; preds = %47, %63
  %53 = phi i32 [ %10, %47 ], [ %54, %63 ]
  %54 = lshr i32 %53, 1
  %55 = icmp ult i32 %4, %54
  br i1 %55, label %56, label %63

56:                                               ; preds = %52
  %57 = add nuw nsw i32 %54, %4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %62 = add nsw i32 %61, %60
  store i32 %62, i32 addrspace(1)* %49, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %56, %52
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ult i32 %53, 4
  br i1 %64, label %50, label %52, !llvm.loop !11

65:                                               ; preds = %50
  %66 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %67 = zext i32 %5 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  store i32 %66, i32 addrspace(1)* %68, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %65, %50
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
