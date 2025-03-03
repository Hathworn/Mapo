; ModuleID = '../data/hip_kernels/17144/0/main.cu'
source_filename = "../data/hip_kernels/17144/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10merge_sortPii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %9 = mul nuw nsw i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add nuw nsw i32 %9, %10
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %18

13:                                               ; preds = %2
  %14 = zext i32 %11 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !5
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %11
  store i32 %16, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %18

18:                                               ; preds = %13, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = shl nsw i32 %1, 1
  %20 = icmp sgt i32 %1, 1
  br i1 %20, label %32, label %24

21:                                               ; preds = %88
  %22 = and i32 %90, 1
  %23 = xor i32 %22, 1
  br label %24

24:                                               ; preds = %21, %18
  %25 = phi i32 [ 0, %18 ], [ %23, %21 ]
  %26 = mul nuw nsw i32 %25, %1
  %27 = add nsw i32 %26, %11
  %28 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %27
  %29 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !7
  %30 = zext i32 %11 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  store i32 %29, i32 addrspace(1)* %31, align 4, !tbaa !7
  ret void

32:                                               ; preds = %18, %88
  %33 = phi i32 [ %90, %88 ], [ 1, %18 ]
  %34 = phi i32 [ %89, %88 ], [ 2, %18 ]
  %35 = add i32 %34, -1
  %36 = and i32 %35, %11
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %88

38:                                               ; preds = %32
  %39 = and i32 %33, 1
  %40 = xor i32 %39, 1
  %41 = mul nuw nsw i32 %40, %1
  %42 = add i32 %41, %11
  %43 = ashr exact i32 %34, 1
  %44 = add i32 %42, %43
  %45 = add i32 %42, %34
  %46 = sub nuw nsw i32 2, %39
  %47 = mul nsw i32 %46, %1
  %48 = icmp eq i32 %39, 0
  %49 = select i1 %48, i32 0, i32 %1
  %50 = add nsw i32 %49, %11
  br label %51

51:                                               ; preds = %84, %38
  %52 = phi i32 [ %42, %38 ], [ %85, %84 ]
  %53 = phi i32 [ %44, %38 ], [ %86, %84 ]
  %54 = phi i32 [ %50, %38 ], [ %87, %84 ]
  %55 = icmp slt i32 %52, %44
  %56 = icmp slt i32 %52, %47
  %57 = select i1 %55, i1 %56, i1 false
  %58 = icmp slt i32 %53, %45
  %59 = icmp slt i32 %53, %47
  %60 = select i1 %58, i1 %59, i1 false
  br i1 %57, label %67, label %61

61:                                               ; preds = %51
  br i1 %60, label %62, label %88

62:                                               ; preds = %61
  %63 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %53
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !7
  %65 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %54
  store i32 %64, i32 addrspace(3)* %65, align 4, !tbaa !7
  %66 = add nsw i32 %53, 1
  br label %84

67:                                               ; preds = %51
  br i1 %60, label %73, label %68

68:                                               ; preds = %67
  %69 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %52
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %54
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !7
  %72 = add nsw i32 %52, 1
  br label %84

73:                                               ; preds = %67
  %74 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %53
  %75 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !7
  %76 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %52
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %78 = icmp sgt i32 %75, %77
  %79 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %54
  br i1 %78, label %80, label %82

80:                                               ; preds = %73
  store i32 %77, i32 addrspace(3)* %79, align 4, !tbaa !7
  %81 = add nsw i32 %52, 1
  br label %84

82:                                               ; preds = %73
  store i32 %75, i32 addrspace(3)* %79, align 4, !tbaa !7
  %83 = add nsw i32 %53, 1
  br label %84

84:                                               ; preds = %68, %82, %80, %62
  %85 = phi i32 [ %81, %80 ], [ %52, %82 ], [ %72, %68 ], [ %52, %62 ]
  %86 = phi i32 [ %53, %80 ], [ %83, %82 ], [ %53, %68 ], [ %66, %62 ]
  %87 = add nsw i32 %54, 1
  br label %51, !llvm.loop !11

88:                                               ; preds = %61, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = shl i32 %34, 1
  %90 = add nuw nsw i32 %33, 1
  %91 = icmp slt i32 %89, %19
  br i1 %91, label %32, label %21, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
