; ModuleID = '../data/hip_kernels/8510/40/main.cu'
source_filename = "../data/hip_kernels/8510/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20IntDataPointIdentityiPKiS0_PiS1_i(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = zext i32 %9 to i64
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i64
  %16 = mul nuw nsw i64 %15, %10
  %17 = add nuw nsw i64 %16, %8
  %18 = sext i32 %0 to i64
  %19 = icmp slt i64 %17, %18
  br i1 %19, label %20, label %84

20:                                               ; preds = %6
  %21 = sext i32 %5 to i64
  %22 = mul nsw i64 %17, %21
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %22
  %25 = icmp sgt i32 %5, 0
  br i1 %25, label %26, label %43

26:                                               ; preds = %20
  %27 = and i64 %21, 7
  %28 = icmp ult i32 %5, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %26
  %30 = and i64 %21, -8
  br label %47

31:                                               ; preds = %47, %26
  %32 = phi i64 [ 0, %26 ], [ %81, %47 ]
  %33 = icmp eq i64 %27, 0
  br i1 %33, label %43, label %34

34:                                               ; preds = %31, %34
  %35 = phi i64 [ %40, %34 ], [ %32, %31 ]
  %36 = phi i64 [ %41, %34 ], [ 0, %31 ]
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %35
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %35
  store i32 %38, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = add nuw nsw i64 %35, 1
  %41 = add i64 %36, 1
  %42 = icmp eq i64 %41, %27
  br i1 %42, label %43, label %34, !llvm.loop !11

43:                                               ; preds = %31, %34, %20
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %17
  store i32 %45, i32 addrspace(1)* %46, align 4, !tbaa !7
  br label %84

47:                                               ; preds = %47, %29
  %48 = phi i64 [ 0, %29 ], [ %81, %47 ]
  %49 = phi i64 [ 0, %29 ], [ %82, %47 ]
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %48
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %48
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i64 %48, 1
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %53
  store i32 %55, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = or i64 %48, 2
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %57
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = or i64 %48, 3
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %61
  store i32 %63, i32 addrspace(1)* %64, align 4, !tbaa !7
  %65 = or i64 %48, 4
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %65
  store i32 %67, i32 addrspace(1)* %68, align 4, !tbaa !7
  %69 = or i64 %48, 5
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %69
  store i32 %71, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = or i64 %48, 6
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !7
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %73
  store i32 %75, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = or i64 %48, 7
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %24, i64 %77
  store i32 %79, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = add nuw nsw i64 %48, 8
  %82 = add i64 %49, 8
  %83 = icmp eq i64 %82, %30
  br i1 %83, label %31, label %47, !llvm.loop !13

84:                                               ; preds = %43, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
