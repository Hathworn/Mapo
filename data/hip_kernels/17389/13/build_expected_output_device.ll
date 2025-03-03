; ModuleID = '../data/hip_kernels/17389/13/main.cu'
source_filename = "../data/hip_kernels/17389/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21build_expected_outputPiiiPKi(i32 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %75

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = icmp sgt i32 %2, 0
  br i1 %19, label %20, label %75

20:                                               ; preds = %15
  %21 = mul nsw i32 %13, %2
  %22 = and i32 %2, 7
  %23 = icmp ult i32 %2, 8
  br i1 %23, label %63, label %24

24:                                               ; preds = %20
  %25 = and i32 %2, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi i32 [ 0, %24 ], [ %60, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %61, %26 ]
  %29 = add nsw i32 %27, %21
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  store i32 %18, i32 addrspace(1)* %31, align 4, !tbaa !7
  %32 = or i32 %27, 1
  %33 = add nsw i32 %32, %21
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  store i32 %18, i32 addrspace(1)* %35, align 4, !tbaa !7
  %36 = or i32 %27, 2
  %37 = add nsw i32 %36, %21
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  store i32 %18, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = or i32 %27, 3
  %41 = add nsw i32 %40, %21
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  store i32 %18, i32 addrspace(1)* %43, align 4, !tbaa !7
  %44 = or i32 %27, 4
  %45 = add nsw i32 %44, %21
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  store i32 %18, i32 addrspace(1)* %47, align 4, !tbaa !7
  %48 = or i32 %27, 5
  %49 = add nsw i32 %48, %21
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  store i32 %18, i32 addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %27, 6
  %53 = add nsw i32 %52, %21
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  store i32 %18, i32 addrspace(1)* %55, align 4, !tbaa !7
  %56 = or i32 %27, 7
  %57 = add nsw i32 %56, %21
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  store i32 %18, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nuw nsw i32 %27, 8
  %61 = add i32 %28, 8
  %62 = icmp eq i32 %61, %25
  br i1 %62, label %63, label %26, !llvm.loop !11

63:                                               ; preds = %26, %20
  %64 = phi i32 [ 0, %20 ], [ %60, %26 ]
  %65 = icmp eq i32 %22, 0
  br i1 %65, label %75, label %66

66:                                               ; preds = %63, %66
  %67 = phi i32 [ %72, %66 ], [ %64, %63 ]
  %68 = phi i32 [ %73, %66 ], [ 0, %63 ]
  %69 = add nsw i32 %67, %21
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  store i32 %18, i32 addrspace(1)* %71, align 4, !tbaa !7
  %72 = add nuw nsw i32 %67, 1
  %73 = add i32 %68, 1
  %74 = icmp eq i32 %73, %22
  br i1 %74, label %75, label %66, !llvm.loop !13

75:                                               ; preds = %63, %66, %15, %4
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
