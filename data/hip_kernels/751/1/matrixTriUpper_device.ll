; ModuleID = '../data/hip_kernels/751/1/main.cu'
source_filename = "../data/hip_kernels/751/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z14matrixTriUpperPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %15

5:                                                ; preds = %3
  %6 = icmp sgt i32 %2, 0
  %7 = and i32 %2, 7
  %8 = icmp ult i32 %2, 8
  %9 = and i32 %2, -8
  %10 = icmp eq i32 %7, 0
  br label %11

11:                                               ; preds = %5, %30
  %12 = phi i32 [ 0, %5 ], [ %31, %30 ]
  br i1 %6, label %13, label %30

13:                                               ; preds = %11
  %14 = mul nsw i32 %12, %2
  br i1 %8, label %16, label %33

15:                                               ; preds = %30, %3
  ret void

16:                                               ; preds = %90, %13
  %17 = phi i32 [ 0, %13 ], [ %91, %90 ]
  br i1 %10, label %30, label %18

18:                                               ; preds = %16, %26
  %19 = phi i32 [ %27, %26 ], [ %17, %16 ]
  %20 = phi i32 [ %28, %26 ], [ 0, %16 ]
  %21 = icmp ugt i32 %12, %19
  br i1 %21, label %22, label %26

22:                                               ; preds = %18
  %23 = add nsw i32 %19, %14
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  store float 0.000000e+00, float addrspace(1)* %25, align 4, !tbaa !4
  br label %26

26:                                               ; preds = %22, %18
  %27 = add nuw nsw i32 %19, 1
  %28 = add i32 %20, 1
  %29 = icmp eq i32 %28, %7
  br i1 %29, label %30, label %18, !llvm.loop !8

30:                                               ; preds = %16, %26, %11
  %31 = add nuw nsw i32 %12, 1
  %32 = icmp eq i32 %31, %1
  br i1 %32, label %15, label %11, !llvm.loop !10

33:                                               ; preds = %13, %90
  %34 = phi i32 [ %91, %90 ], [ 0, %13 ]
  %35 = phi i32 [ %92, %90 ], [ 0, %13 ]
  %36 = icmp ugt i32 %12, %34
  br i1 %36, label %37, label %41

37:                                               ; preds = %33
  %38 = add nsw i32 %34, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  store float 0.000000e+00, float addrspace(1)* %40, align 4, !tbaa !4
  br label %41

41:                                               ; preds = %37, %33
  %42 = or i32 %34, 1
  %43 = icmp ugt i32 %12, %42
  br i1 %43, label %44, label %48

44:                                               ; preds = %41
  %45 = add nsw i32 %42, %14
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float 0.000000e+00, float addrspace(1)* %47, align 4, !tbaa !4
  br label %48

48:                                               ; preds = %44, %41
  %49 = or i32 %34, 2
  %50 = icmp ugt i32 %12, %49
  br i1 %50, label %51, label %55

51:                                               ; preds = %48
  %52 = add nsw i32 %49, %14
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float 0.000000e+00, float addrspace(1)* %54, align 4, !tbaa !4
  br label %55

55:                                               ; preds = %51, %48
  %56 = or i32 %34, 3
  %57 = icmp ugt i32 %12, %56
  br i1 %57, label %58, label %62

58:                                               ; preds = %55
  %59 = add nsw i32 %56, %14
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  store float 0.000000e+00, float addrspace(1)* %61, align 4, !tbaa !4
  br label %62

62:                                               ; preds = %58, %55
  %63 = or i32 %34, 4
  %64 = icmp ugt i32 %12, %63
  br i1 %64, label %65, label %69

65:                                               ; preds = %62
  %66 = add nsw i32 %63, %14
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  store float 0.000000e+00, float addrspace(1)* %68, align 4, !tbaa !4
  br label %69

69:                                               ; preds = %65, %62
  %70 = or i32 %34, 5
  %71 = icmp ugt i32 %12, %70
  br i1 %71, label %72, label %76

72:                                               ; preds = %69
  %73 = add nsw i32 %70, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  store float 0.000000e+00, float addrspace(1)* %75, align 4, !tbaa !4
  br label %76

76:                                               ; preds = %72, %69
  %77 = or i32 %34, 6
  %78 = icmp ugt i32 %12, %77
  br i1 %78, label %79, label %83

79:                                               ; preds = %76
  %80 = add nsw i32 %77, %14
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float 0.000000e+00, float addrspace(1)* %82, align 4, !tbaa !4
  br label %83

83:                                               ; preds = %79, %76
  %84 = or i32 %34, 7
  %85 = icmp ugt i32 %12, %84
  br i1 %85, label %86, label %90

86:                                               ; preds = %83
  %87 = add nsw i32 %84, %14
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float 0.000000e+00, float addrspace(1)* %89, align 4, !tbaa !4
  br label %90

90:                                               ; preds = %86, %83
  %91 = add nuw nsw i32 %34, 8
  %92 = add i32 %35, 8
  %93 = icmp eq i32 %92, %9
  br i1 %93, label %16, label %33, !llvm.loop !12
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
