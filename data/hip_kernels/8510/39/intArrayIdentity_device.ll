; ModuleID = '../data/hip_kernels/8510/39/main.cu'
source_filename = "../data/hip_kernels/8510/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16intArrayIdentityiPiS_i(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %76

15:                                               ; preds = %4
  %16 = mul nsw i32 %13, %3
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  %20 = sext i32 %3 to i64
  %21 = icmp sgt i32 %3, 0
  br i1 %21, label %22, label %76

22:                                               ; preds = %15
  %23 = and i64 %20, 7
  %24 = icmp ult i32 %3, 8
  br i1 %24, label %64, label %25

25:                                               ; preds = %22
  %26 = and i64 %20, -8
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi i64 [ 0, %25 ], [ %61, %27 ]
  %29 = phi i64 [ 0, %25 ], [ %62, %27 ]
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %28
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %28
  store i32 %31, i32 addrspace(1)* %32, align 4, !tbaa !7
  %33 = or i64 %28, 1
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %33
  store i32 %35, i32 addrspace(1)* %36, align 4, !tbaa !7
  %37 = or i64 %28, 2
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %37
  store i32 %39, i32 addrspace(1)* %40, align 4, !tbaa !7
  %41 = or i64 %28, 3
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %41
  store i32 %43, i32 addrspace(1)* %44, align 4, !tbaa !7
  %45 = or i64 %28, 4
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %45
  store i32 %47, i32 addrspace(1)* %48, align 4, !tbaa !7
  %49 = or i64 %28, 5
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %49
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i64 %28, 6
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %53
  store i32 %55, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = or i64 %28, 7
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %57
  store i32 %59, i32 addrspace(1)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i64 %28, 8
  %62 = add i64 %29, 8
  %63 = icmp eq i64 %62, %26
  br i1 %63, label %64, label %27, !llvm.loop !11

64:                                               ; preds = %27, %22
  %65 = phi i64 [ 0, %22 ], [ %61, %27 ]
  %66 = icmp eq i64 %23, 0
  br i1 %66, label %76, label %67

67:                                               ; preds = %64, %67
  %68 = phi i64 [ %73, %67 ], [ %65, %64 ]
  %69 = phi i64 [ %74, %67 ], [ 0, %64 ]
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %68
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %19, i64 %68
  store i32 %71, i32 addrspace(1)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i64 %68, 1
  %74 = add i64 %69, 1
  %75 = icmp eq i64 %74, %23
  br i1 %75, label %76, label %67, !llvm.loop !13

76:                                               ; preds = %64, %67, %15, %4
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
