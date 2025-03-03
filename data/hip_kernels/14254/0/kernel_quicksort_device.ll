; ModuleID = '../data/hip_kernels/14254/0/main.cu'
source_filename = "../data/hip_kernels/14254/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16kernel_quicksortPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #1 {
  %3 = alloca [1000 x i32], align 16, addrspace(5)
  %4 = alloca [1000 x i32], align 16, addrspace(5)
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = bitcast [1000 x i32] addrspace(5)* %3 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4000, i8 addrspace(5)* %14) #3
  %15 = bitcast [1000 x i32] addrspace(5)* %4 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4000, i8 addrspace(5)* %15) #3
  %16 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %3, i32 0, i32 %13
  store i32 %13, i32 addrspace(5)* %16, align 4, !tbaa !7
  %17 = add nsw i32 %1, -1
  %18 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %13
  store i32 %17, i32 addrspace(5)* %18, align 4, !tbaa !7
  %19 = icmp sgt i32 %13, -1
  br i1 %19, label %20, label %77

20:                                               ; preds = %2, %74
  %21 = phi i32 [ %75, %74 ], [ %13, %2 ]
  %22 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %3, i32 0, i32 %21
  %23 = load i32, i32 addrspace(5)* %22, align 4, !tbaa !7
  %24 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %21
  %25 = load i32, i32 addrspace(5)* %24, align 4, !tbaa !7
  %26 = icmp slt i32 %23, %25
  br i1 %26, label %27, label %72

27:                                               ; preds = %20
  %28 = sext i32 %23 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %27, %61
  %32 = phi i32 [ %23, %27 ], [ %51, %61 ]
  %33 = phi i32 [ %25, %27 ], [ %62, %61 ]
  br label %34

34:                                               ; preds = %34, %31
  %35 = phi i32 [ %42, %34 ], [ %33, %31 ]
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = icmp sge i32 %38, %30
  %40 = icmp slt i32 %32, %35
  %41 = select i1 %39, i1 %40, i1 false
  %42 = add nsw i32 %35, -1
  br i1 %41, label %34, label %43, !llvm.loop !11

43:                                               ; preds = %34
  br i1 %40, label %44, label %48

44:                                               ; preds = %43
  %45 = add nsw i32 %32, 1
  %46 = sext i32 %32 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  store i32 %38, i32 addrspace(1)* %47, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %44, %43
  %49 = phi i32 [ %32, %43 ], [ %45, %44 ]
  br label %50

50:                                               ; preds = %48, %50
  %51 = phi i32 [ %58, %50 ], [ %49, %48 ]
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = icmp slt i32 %54, %30
  %56 = icmp slt i32 %51, %35
  %57 = select i1 %55, i1 %56, i1 false
  %58 = add nsw i32 %51, 1
  br i1 %57, label %50, label %59, !llvm.loop !13

59:                                               ; preds = %50
  br i1 %56, label %60, label %61

60:                                               ; preds = %59
  store i32 %54, i32 addrspace(1)* %37, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %60, %59
  %62 = phi i32 [ %42, %60 ], [ %35, %59 ]
  %63 = icmp slt i32 %51, %62
  br i1 %63, label %31, label %64, !llvm.loop !14

64:                                               ; preds = %61
  store i32 %30, i32 addrspace(1)* %53, align 4, !tbaa !7
  %65 = add nsw i32 %21, 1
  %66 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %3, i32 0, i32 %65
  store i32 %58, i32 addrspace(5)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds [1000 x i32], [1000 x i32] addrspace(5)* %4, i32 0, i32 %65
  store i32 %25, i32 addrspace(5)* %67, align 4, !tbaa !7
  store i32 %51, i32 addrspace(5)* %24, align 4, !tbaa !7
  %68 = sub nsw i32 %25, %58
  %69 = sub nsw i32 %51, %23
  %70 = icmp sgt i32 %68, %69
  br i1 %70, label %71, label %74

71:                                               ; preds = %64
  store i32 %23, i32 addrspace(5)* %66, align 4, !tbaa !7
  store i32 %58, i32 addrspace(5)* %22, align 4, !tbaa !7
  store i32 %51, i32 addrspace(5)* %67, align 4, !tbaa !7
  store i32 %25, i32 addrspace(5)* %24, align 4, !tbaa !7
  br label %74

72:                                               ; preds = %20
  %73 = add nsw i32 %21, -1
  br label %74

74:                                               ; preds = %64, %71, %72
  %75 = phi i32 [ %65, %71 ], [ %65, %64 ], [ %73, %72 ]
  %76 = icmp sgt i32 %75, -1
  br i1 %76, label %20, label %77, !llvm.loop !15

77:                                               ; preds = %74, %2
  call void @llvm.lifetime.end.p5i8(i64 4000, i8 addrspace(5)* %15) #3
  call void @llvm.lifetime.end.p5i8(i64 4000, i8 addrspace(5)* %14) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
