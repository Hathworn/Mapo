; ModuleID = '../data/hip_kernels/14340/0/main.cu'
source_filename = "../data/hip_kernels/14340/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@shared = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3sumPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add nsw i32 %10, %3
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %3
  store i32 %14, i32 addrspace(3)* %15, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %16 = lshr i16 %8, 1
  %17 = zext i16 %16 to i32
  %18 = icmp ult i32 %3, %17
  br i1 %18, label %19, label %25

19:                                               ; preds = %2
  %20 = add nuw nsw i32 %3, %17
  %21 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %20
  %22 = load i32, i32 addrspace(3)* %21, align 4, !tbaa !7
  %23 = load i32, i32 addrspace(3)* %15, align 4, !tbaa !7
  %24 = add nsw i32 %23, %22
  store i32 %24, i32 addrspace(3)* %15, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %19, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp eq i32 %3, 0
  br i1 %26, label %27, label %99

27:                                               ; preds = %25
  %28 = and i32 %9, 1
  %29 = add nuw nsw i32 %28, %17
  %30 = icmp eq i32 %29, 1
  %31 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 0), align 4, !tbaa !7
  br i1 %30, label %95, label %32

32:                                               ; preds = %27
  %33 = add nuw nsw i32 %28, %17
  %34 = add nsw i32 %33, -1
  %35 = add nsw i32 %33, -2
  %36 = and i32 %34, 7
  %37 = icmp ult i32 %35, 7
  br i1 %37, label %78, label %38

38:                                               ; preds = %32
  %39 = and i32 %34, -8
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi i32 [ %31, %38 ], [ %74, %40 ]
  %42 = phi i32 [ 1, %38 ], [ %75, %40 ]
  %43 = phi i32 [ 0, %38 ], [ %76, %40 ]
  %44 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %42
  %45 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !7
  %46 = add nsw i32 %41, %45
  %47 = add nuw nsw i32 %42, 1
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %46, %49
  %51 = add nuw nsw i32 %42, 2
  %52 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %51
  %53 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !7
  %54 = add nsw i32 %50, %53
  %55 = add nuw nsw i32 %42, 3
  %56 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !7
  %58 = add nsw i32 %54, %57
  %59 = add nuw nsw i32 %42, 4
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %59
  %61 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !7
  %62 = add nsw i32 %58, %61
  %63 = add nuw nsw i32 %42, 5
  %64 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %63
  %65 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !7
  %66 = add nsw i32 %62, %65
  %67 = add nuw nsw i32 %42, 6
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %67
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !7
  %70 = add nsw i32 %66, %69
  %71 = add nuw nsw i32 %42, 7
  %72 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %71
  %73 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !7
  %74 = add nsw i32 %70, %73
  %75 = add nuw nsw i32 %42, 8
  %76 = add i32 %43, 8
  %77 = icmp eq i32 %76, %39
  br i1 %77, label %78, label %40, !llvm.loop !11

78:                                               ; preds = %40, %32
  %79 = phi i32 [ undef, %32 ], [ %74, %40 ]
  %80 = phi i32 [ %31, %32 ], [ %74, %40 ]
  %81 = phi i32 [ 1, %32 ], [ %75, %40 ]
  %82 = icmp eq i32 %36, 0
  br i1 %82, label %93, label %83

83:                                               ; preds = %78, %83
  %84 = phi i32 [ %89, %83 ], [ %80, %78 ]
  %85 = phi i32 [ %90, %83 ], [ %81, %78 ]
  %86 = phi i32 [ %91, %83 ], [ 0, %78 ]
  %87 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 %85
  %88 = load i32, i32 addrspace(3)* %87, align 4, !tbaa !7
  %89 = add nsw i32 %84, %88
  %90 = add nuw nsw i32 %85, 1
  %91 = add i32 %86, 1
  %92 = icmp eq i32 %91, %36
  br i1 %92, label %93, label %83, !llvm.loop !13

93:                                               ; preds = %83, %78
  %94 = phi i32 [ %79, %78 ], [ %89, %83 ]
  store i32 %94, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @shared, i32 0, i32 0), align 4, !tbaa !7
  br label %95

95:                                               ; preds = %27, %93
  %96 = phi i32 [ %94, %93 ], [ %31, %27 ]
  %97 = sext i32 %4 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  store i32 %96, i32 addrspace(1)* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %95, %25
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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
