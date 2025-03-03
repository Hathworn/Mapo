; ModuleID = '../data/hip_kernels/15852/3/main.cu'
source_filename = "../data/hip_kernels/15852/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19_calculate_edge_numPlPKlS1_iiil(i64 addrspace(1)* nocapture %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = freeze i32 %16
  %18 = mul nsw i32 %4, %3
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %59

20:                                               ; preds = %7
  %21 = mul i32 %17, %5
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %22
  %24 = sext i32 %17 to i64
  %25 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %24
  %26 = load i64, i64 addrspace(1)* %25, align 8, !tbaa !7, !amdgpu.noclobber !6
  %27 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %22
  %28 = icmp eq i64 %26, %6
  br i1 %28, label %59, label %29

29:                                               ; preds = %20
  %30 = icmp slt i64 %26, %6
  br i1 %30, label %31, label %37

31:                                               ; preds = %29
  %32 = sub i64 %6, %26
  %33 = load i64, i64 addrspace(1)* %27, align 8, !tbaa !7, !amdgpu.noclobber !6
  %34 = getelementptr inbounds i64, i64 addrspace(1)* %23, i64 %33
  %35 = load i64, i64 addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = add nsw i64 %32, %35
  store i64 %36, i64 addrspace(1)* %34, align 8, !tbaa !7
  br label %59

37:                                               ; preds = %29
  %38 = sub nsw i64 %26, %6
  %39 = icmp sgt i64 %38, 0
  br i1 %39, label %40, label %59

40:                                               ; preds = %37, %55
  %41 = phi i64 [ %57, %55 ], [ %38, %37 ]
  %42 = phi i32 [ %56, %55 ], [ 0, %37 ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i64, i64 addrspace(1)* %27, i64 %43
  %45 = load i64, i64 addrspace(1)* %44, align 8, !tbaa !7
  %46 = getelementptr inbounds i64, i64 addrspace(1)* %23, i64 %45
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !7
  %48 = icmp sgt i64 %47, %41
  br i1 %48, label %49, label %51

49:                                               ; preds = %40
  %50 = sub nsw i64 %47, %41
  store i64 %50, i64 addrspace(1)* %46, align 8, !tbaa !7
  br label %55

51:                                               ; preds = %40
  %52 = add nuw i64 %41, 1
  %53 = sub i64 %52, %47
  store i64 1, i64 addrspace(1)* %46, align 8, !tbaa !7
  %54 = add nsw i32 %42, 1
  br label %55

55:                                               ; preds = %51, %49
  %56 = phi i32 [ %42, %49 ], [ %54, %51 ]
  %57 = phi i64 [ 0, %49 ], [ %53, %51 ]
  %58 = icmp sgt i64 %57, 0
  br i1 %58, label %40, label %59, !llvm.loop !11

59:                                               ; preds = %55, %37, %20, %31, %7
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
