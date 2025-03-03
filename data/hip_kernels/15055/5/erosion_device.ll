; ModuleID = '../data/hip_kernels/15055/5/main.cu'
source_filename = "../data/hip_kernels/15055/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7erosionPhS_iiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = sub nsw i32 %15, %2
  %25 = add nsw i32 %15, %2
  %26 = sub nsw i32 %23, %3
  %27 = add nsw i32 %23, %3
  %28 = icmp slt i32 %24, 0
  %29 = icmp slt i32 %25, %4
  %30 = add nsw i32 %4, -1
  %31 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %32 = select i1 %28, i1 true, i1 %29
  %33 = select i1 %32, i32 %25, i32 %30
  %34 = icmp slt i32 %26, 0
  %35 = icmp slt i32 %27, %5
  %36 = add nsw i32 %5, -1
  %37 = tail call i32 @llvm.smax.i32(i32 %26, i32 0)
  %38 = select i1 %34, i1 true, i1 %35
  %39 = select i1 %38, i32 %27, i32 %36
  %40 = icmp sgt i32 %37, %39
  br i1 %40, label %48, label %41

41:                                               ; preds = %6
  %42 = icmp sgt i32 %31, %33
  br label %43

43:                                               ; preds = %41, %54
  %44 = phi i32 [ %37, %41 ], [ %56, %54 ]
  %45 = phi i8 [ -1, %41 ], [ %55, %54 ]
  br i1 %42, label %54, label %46

46:                                               ; preds = %43
  %47 = mul nsw i32 %44, %4
  br label %58

48:                                               ; preds = %54, %6
  %49 = phi i8 [ -1, %6 ], [ %55, %54 ]
  %50 = mul nsw i32 %23, %4
  %51 = add nsw i32 %50, %15
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %52
  store i8 %49, i8 addrspace(1)* %53, align 1, !tbaa !7
  ret void

54:                                               ; preds = %58, %43
  %55 = phi i8 [ %45, %43 ], [ %65, %58 ]
  %56 = add nuw nsw i32 %44, 1
  %57 = icmp slt i32 %44, %39
  br i1 %57, label %43, label %48, !llvm.loop !10

58:                                               ; preds = %46, %58
  %59 = phi i32 [ %31, %46 ], [ %66, %58 ]
  %60 = phi i8 [ %45, %46 ], [ %65, %58 ]
  %61 = add nsw i32 %59, %47
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !7, !amdgpu.noclobber !5
  %65 = tail call i8 @llvm.umin.i8(i8 %60, i8 %64)
  %66 = add nuw nsw i32 %59, 1
  %67 = icmp slt i32 %59, %33
  br i1 %67, label %58, label %54, !llvm.loop !12
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i8 @llvm.umin.i8(i8, i8) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
