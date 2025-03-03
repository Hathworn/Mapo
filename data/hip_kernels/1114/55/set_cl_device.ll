; ModuleID = '../data/hip_kernels/1114/55/main.cu'
source_filename = "../data/hip_kernels/1114/55/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6set_clPiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = sdiv i32 %3, %2
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %5
  br i1 %15, label %16, label %99

16:                                               ; preds = %4
  %17 = mul nsw i32 %14, %2
  %18 = icmp sgt i32 %2, 0
  br i1 %18, label %19, label %95

19:                                               ; preds = %16
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  br i1 %21, label %78, label %22

22:                                               ; preds = %19
  %23 = and i32 %2, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %75, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %74, %24 ]
  %27 = phi i32 [ 0, %22 ], [ %76, %24 ]
  %28 = add nsw i32 %25, %17
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 %26)
  %33 = or i32 %25, 1
  %34 = add nsw i32 %33, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = tail call i32 @llvm.smax.i32(i32 %37, i32 %32)
  %39 = or i32 %25, 2
  %40 = add nsw i32 %39, %17
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call i32 @llvm.smax.i32(i32 %43, i32 %38)
  %45 = or i32 %25, 3
  %46 = add nsw i32 %45, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = tail call i32 @llvm.smax.i32(i32 %49, i32 %44)
  %51 = or i32 %25, 4
  %52 = add nsw i32 %51, %17
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = tail call i32 @llvm.smax.i32(i32 %55, i32 %50)
  %57 = or i32 %25, 5
  %58 = add nsw i32 %57, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = tail call i32 @llvm.smax.i32(i32 %61, i32 %56)
  %63 = or i32 %25, 6
  %64 = add nsw i32 %63, %17
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = tail call i32 @llvm.smax.i32(i32 %67, i32 %62)
  %69 = or i32 %25, 7
  %70 = add nsw i32 %69, %17
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = tail call i32 @llvm.smax.i32(i32 %73, i32 %68)
  %75 = add nuw nsw i32 %25, 8
  %76 = add i32 %27, 8
  %77 = icmp eq i32 %76, %23
  br i1 %77, label %78, label %24, !llvm.loop !11

78:                                               ; preds = %24, %19
  %79 = phi i32 [ undef, %19 ], [ %74, %24 ]
  %80 = phi i32 [ 0, %19 ], [ %75, %24 ]
  %81 = phi i32 [ 0, %19 ], [ %74, %24 ]
  %82 = icmp eq i32 %20, 0
  br i1 %82, label %95, label %83

83:                                               ; preds = %78, %83
  %84 = phi i32 [ %92, %83 ], [ %80, %78 ]
  %85 = phi i32 [ %91, %83 ], [ %81, %78 ]
  %86 = phi i32 [ %93, %83 ], [ 0, %78 ]
  %87 = add nsw i32 %84, %17
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = tail call i32 @llvm.smax.i32(i32 %90, i32 %85)
  %92 = add nuw nsw i32 %84, 1
  %93 = add i32 %86, 1
  %94 = icmp eq i32 %93, %20
  br i1 %94, label %95, label %83, !llvm.loop !13

95:                                               ; preds = %78, %83, %16
  %96 = phi i32 [ 0, %16 ], [ %79, %78 ], [ %91, %83 ]
  %97 = sext i32 %14 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  store i32 %96, i32 addrspace(1)* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %4, %95
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
