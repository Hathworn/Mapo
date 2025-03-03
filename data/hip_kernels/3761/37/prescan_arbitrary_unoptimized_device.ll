; ModuleID = '../data/hip_kernels/3761/37/main.cu'
source_filename = "../data/hip_kernels/3761/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29prescan_arbitrary_unoptimizedPiS_ii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp slt i32 %5, %2
  %7 = shl nuw nsw i32 %5, 1
  br i1 %6, label %8, label %17

8:                                                ; preds = %4
  %9 = zext i32 %7 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %9
  %11 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %7
  store i32 %11, i32 addrspace(3)* %12, align 4, !tbaa !5
  %13 = add nuw nsw i32 %7, 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %20

17:                                               ; preds = %4
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %7
  store i32 0, i32 addrspace(3)* %18, align 4, !tbaa !5
  %19 = add nuw nsw i32 %7, 1
  br label %20

20:                                               ; preds = %17, %8
  %21 = phi i32 [ %19, %17 ], [ %13, %8 ]
  %22 = phi i32 [ 0, %17 ], [ %16, %8 ]
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %21
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !5
  %24 = icmp sgt i32 %3, 1
  br i1 %24, label %25, label %29

25:                                               ; preds = %20
  %26 = shl nuw nsw i32 %5, 1
  %27 = add nuw nsw i32 %26, 1
  %28 = add nuw nsw i32 %26, 2
  br label %32

29:                                               ; preds = %47, %20
  %30 = phi i32 [ 1, %20 ], [ %48, %47 ]
  %31 = icmp eq i32 %5, 0
  br i1 %31, label %50, label %53

32:                                               ; preds = %25, %47
  %33 = phi i32 [ %3, %25 ], [ %35, %47 ]
  %34 = phi i32 [ 1, %25 ], [ %48, %47 ]
  %35 = ashr i32 %33, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp slt i32 %5, %35
  br i1 %36, label %37, label %47

37:                                               ; preds = %32
  %38 = mul nsw i32 %34, %27
  %39 = add nsw i32 %38, -1
  %40 = mul nsw i32 %34, %28
  %41 = add nsw i32 %40, -1
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %39
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %41
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %46 = add nsw i32 %45, %43
  store i32 %46, i32 addrspace(3)* %44, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %37, %32
  %48 = shl nsw i32 %34, 1
  %49 = icmp sgt i32 %33, 3
  br i1 %49, label %32, label %29, !llvm.loop !10

50:                                               ; preds = %29
  %51 = add nsw i32 %3, -1
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %51
  store i32 0, i32 addrspace(3)* %52, align 4, !tbaa !5
  br label %53

53:                                               ; preds = %50, %29
  br i1 %24, label %54, label %58

54:                                               ; preds = %53
  %55 = shl nuw nsw i32 %5, 1
  %56 = add nuw nsw i32 %55, 1
  %57 = add nuw nsw i32 %55, 2
  br label %59

58:                                               ; preds = %75, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %6, label %78, label %89

59:                                               ; preds = %54, %75
  %60 = phi i32 [ %30, %54 ], [ %62, %75 ]
  %61 = phi i32 [ 1, %54 ], [ %76, %75 ]
  %62 = lshr i32 %60, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp slt i32 %5, %61
  br i1 %63, label %64, label %75

64:                                               ; preds = %59
  %65 = mul nsw i32 %62, %56
  %66 = add nsw i32 %65, -1
  %67 = mul nsw i32 %62, %57
  %68 = add nsw i32 %67, -1
  %69 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %66
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !5
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %68
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !5
  store i32 %72, i32 addrspace(3)* %69, align 4, !tbaa !5
  %73 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !5
  %74 = add nsw i32 %73, %70
  store i32 %74, i32 addrspace(3)* %71, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %59, %64
  %76 = shl nsw i32 %61, 1
  %77 = icmp slt i32 %76, %3
  br i1 %77, label %59, label %58, !llvm.loop !12

78:                                               ; preds = %58
  %79 = shl nuw nsw i32 %5, 1
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %79
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !5
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  store i32 %82, i32 addrspace(1)* %83, align 4, !tbaa !5
  %84 = add nuw nsw i32 %79, 1
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %84
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !5
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  store i32 %87, i32 addrspace(1)* %88, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %78, %58
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
