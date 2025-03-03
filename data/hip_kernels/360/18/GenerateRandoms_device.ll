; ModuleID = '../data/hip_kernels/360/18/main.cu'
source_filename = "../data/hip_kernels/360/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15GenerateRandomsiiPjS_(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %15, label %46

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = and i32 %1, 3
  %20 = icmp ult i32 %1, 4
  br i1 %20, label %23, label %21

21:                                               ; preds = %15
  %22 = and i32 %1, -4
  br label %47

23:                                               ; preds = %100, %15
  %24 = phi i32 [ %18, %15 ], [ %102, %100 ]
  %25 = phi i32 [ %13, %15 ], [ %101, %100 ]
  %26 = icmp eq i32 %19, 0
  br i1 %26, label %46, label %27

27:                                               ; preds = %23, %41
  %28 = phi i32 [ %43, %41 ], [ %24, %23 ]
  %29 = phi i32 [ %42, %41 ], [ %25, %23 ]
  %30 = phi i32 [ %44, %41 ], [ 0, %23 ]
  %31 = icmp slt i32 %29, %0
  br i1 %31, label %32, label %41

32:                                               ; preds = %27
  %33 = shl i32 %28, 13
  %34 = xor i32 %33, %28
  %35 = lshr i32 %34, 19
  %36 = shl i32 %28, 12
  %37 = xor i32 %35, %36
  %38 = sext i32 %29 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  store i32 %37, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = add nsw i32 %29, 32768
  br label %41

41:                                               ; preds = %32, %27
  %42 = phi i32 [ %40, %32 ], [ %29, %27 ]
  %43 = phi i32 [ %37, %32 ], [ %28, %27 ]
  %44 = add i32 %30, 1
  %45 = icmp eq i32 %44, %19
  br i1 %45, label %46, label %27, !llvm.loop !11

46:                                               ; preds = %23, %41, %4
  ret void

47:                                               ; preds = %100, %21
  %48 = phi i32 [ %18, %21 ], [ %102, %100 ]
  %49 = phi i32 [ %13, %21 ], [ %101, %100 ]
  %50 = phi i32 [ 0, %21 ], [ %103, %100 ]
  %51 = icmp slt i32 %49, %0
  br i1 %51, label %52, label %61

52:                                               ; preds = %47
  %53 = shl i32 %48, 13
  %54 = xor i32 %53, %48
  %55 = lshr i32 %54, 19
  %56 = shl i32 %48, 12
  %57 = xor i32 %55, %56
  %58 = sext i32 %49 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  store i32 %57, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nsw i32 %49, 32768
  br label %61

61:                                               ; preds = %47, %52
  %62 = phi i32 [ %60, %52 ], [ %49, %47 ]
  %63 = phi i32 [ %57, %52 ], [ %48, %47 ]
  %64 = icmp slt i32 %62, %0
  br i1 %64, label %65, label %74

65:                                               ; preds = %61
  %66 = shl i32 %63, 13
  %67 = xor i32 %66, %63
  %68 = lshr i32 %67, 19
  %69 = shl i32 %63, 12
  %70 = xor i32 %68, %69
  %71 = sext i32 %62 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  store i32 %70, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = add nsw i32 %62, 32768
  br label %74

74:                                               ; preds = %65, %61
  %75 = phi i32 [ %73, %65 ], [ %62, %61 ]
  %76 = phi i32 [ %70, %65 ], [ %63, %61 ]
  %77 = icmp slt i32 %75, %0
  br i1 %77, label %78, label %87

78:                                               ; preds = %74
  %79 = shl i32 %76, 13
  %80 = xor i32 %79, %76
  %81 = lshr i32 %80, 19
  %82 = shl i32 %76, 12
  %83 = xor i32 %81, %82
  %84 = sext i32 %75 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %84
  store i32 %83, i32 addrspace(1)* %85, align 4, !tbaa !7
  %86 = add nsw i32 %75, 32768
  br label %87

87:                                               ; preds = %78, %74
  %88 = phi i32 [ %86, %78 ], [ %75, %74 ]
  %89 = phi i32 [ %83, %78 ], [ %76, %74 ]
  %90 = icmp slt i32 %88, %0
  br i1 %90, label %91, label %100

91:                                               ; preds = %87
  %92 = shl i32 %89, 13
  %93 = xor i32 %92, %89
  %94 = lshr i32 %93, 19
  %95 = shl i32 %89, 12
  %96 = xor i32 %94, %95
  %97 = sext i32 %88 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %97
  store i32 %96, i32 addrspace(1)* %98, align 4, !tbaa !7
  %99 = add nsw i32 %88, 32768
  br label %100

100:                                              ; preds = %91, %87
  %101 = phi i32 [ %99, %91 ], [ %88, %87 ]
  %102 = phi i32 [ %96, %91 ], [ %89, %87 ]
  %103 = add i32 %50, 4
  %104 = icmp eq i32 %103, %22
  br i1 %104, label %23, label %47, !llvm.loop !13
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
