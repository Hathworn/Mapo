; ModuleID = '../data/hip_kernels/2234/0/main.cu'
source_filename = "../data/hip_kernels/2234/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Maze = type { [99 x [99 x i8]], i32, i32, i32, i32, i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8testPathPiP4MazeS_Py(i32 addrspace(1)* nocapture readonly %0, %struct.Maze addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i64 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = zext i32 %16 to i64
  %18 = udiv i32 %14, %11
  %19 = mul i32 %18, %11
  %20 = icmp ugt i32 %14, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %11
  %24 = zext i32 %23 to i64
  %25 = sub nsw i64 0, %24
  %26 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !16, !amdgpu.noclobber !6
  %27 = shl i32 %26, 1
  %28 = sub i32 64, %27
  %29 = zext i32 %28 to i64
  %30 = lshr i64 %25, %29
  %31 = icmp ult i64 %30, %17
  br i1 %31, label %80, label %32

32:                                               ; preds = %4
  %33 = getelementptr inbounds %struct.Maze, %struct.Maze addrspace(1)* %1, i64 0, i32 3
  %34 = getelementptr inbounds %struct.Maze, %struct.Maze addrspace(1)* %1, i64 0, i32 4
  %35 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !16
  br label %36

36:                                               ; preds = %32, %77
  %37 = phi i32 [ %35, %32 ], [ %72, %77 ]
  %38 = phi i64 [ %17, %32 ], [ %78, %77 ]
  %39 = icmp eq i32 %37, 0
  br i1 %39, label %40, label %80

40:                                               ; preds = %36
  %41 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !20
  %42 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !22
  %43 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !16
  br label %44

44:                                               ; preds = %71, %40
  %45 = phi i32 [ 0, %40 ], [ %72, %71 ]
  %46 = phi i32 [ %41, %40 ], [ %63, %71 ]
  %47 = phi i32 [ %42, %40 ], [ %64, %71 ]
  %48 = phi i64 [ %38, %40 ], [ %52, %71 ]
  %49 = phi i32 [ %43, %40 ], [ %74, %71 ]
  %50 = trunc i64 %48 to i32
  %51 = and i32 %50, 3
  %52 = lshr i64 %48, 2
  switch i32 %51, label %61 [
    i32 0, label %53
    i32 1, label %55
    i32 2, label %57
    i32 3, label %59
  ]

53:                                               ; preds = %44
  %54 = add nsw i32 %46, 1
  br label %62

55:                                               ; preds = %44
  %56 = add nsw i32 %47, -1
  br label %62

57:                                               ; preds = %44
  %58 = add nsw i32 %46, -1
  br label %62

59:                                               ; preds = %44
  %60 = add nsw i32 %47, 1
  br label %62

61:                                               ; preds = %44
  unreachable

62:                                               ; preds = %59, %57, %55, %53
  %63 = phi i32 [ %46, %59 ], [ %58, %57 ], [ %46, %55 ], [ %54, %53 ]
  %64 = phi i32 [ %60, %59 ], [ %47, %57 ], [ %56, %55 ], [ %47, %53 ]
  %65 = sext i32 %64 to i64
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds %struct.Maze, %struct.Maze addrspace(1)* %1, i64 0, i32 0, i64 %65, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !23
  switch i8 %68, label %71 [
    i8 36, label %69
    i8 46, label %70
  ]

69:                                               ; preds = %62
  store i32 1, i32 addrspace(1)* %2, align 4, !tbaa !16
  store i64 %38, i64 addrspace(1)* %3, align 8, !tbaa !24
  br label %71

70:                                               ; preds = %62
  br label %71

71:                                               ; preds = %62, %70, %69
  %72 = phi i32 [ %45, %62 ], [ %45, %70 ], [ 1, %69 ]
  %73 = phi i1 [ true, %62 ], [ false, %70 ], [ true, %69 ]
  %74 = add nsw i32 %49, -1
  %75 = icmp eq i32 %49, 0
  %76 = select i1 %73, i1 true, i1 %75
  br i1 %76, label %77, label %44, !llvm.loop !26

77:                                               ; preds = %71
  %78 = add i64 %38, %24
  %79 = icmp ugt i64 %78, %30
  br i1 %79, label %80, label %36, !llvm.loop !28

80:                                               ; preds = %77, %36, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !17, i64 9812}
!21 = !{!"_ZTS4Maze", !18, i64 0, !17, i64 9804, !17, i64 9808, !17, i64 9812, !17, i64 9816, !17, i64 9820, !17, i64 9824}
!22 = !{!21, !17, i64 9816}
!23 = !{!18, !18, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"long long", !18, i64 0}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
!28 = distinct !{!28, !27}
