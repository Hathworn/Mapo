; ModuleID = '../data/hip_kernels/175/27/main.cu'
source_filename = "../data/hip_kernels/175/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14integrateBinsTiiiiPi(i32 %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add nsw i32 %12, %13
  %16 = icmp slt i32 %15, %1
  %17 = icmp slt i32 %14, %3
  %18 = select i1 %16, i1 %17, i1 false
  %19 = icmp sgt i32 %0, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %76

21:                                               ; preds = %5
  %22 = mul i32 %3, %0
  %23 = mul i32 %22, %15
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %24
  %26 = zext i32 %14 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %26
  %28 = zext i32 %3 to i64
  %29 = and i32 %0, 7
  %30 = icmp ult i32 %0, 8
  br i1 %30, label %63, label %31

31:                                               ; preds = %21
  %32 = and i32 %0, -8
  br label %33

33:                                               ; preds = %33, %31
  %34 = phi i32 [ 0, %31 ], [ %59, %33 ]
  %35 = phi i32 addrspace(1)* [ %27, %31 ], [ %60, %33 ]
  %36 = phi i32 [ 0, %31 ], [ %61, %33 ]
  %37 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %38 = add nsw i32 %37, %34
  store i32 %38, i32 addrspace(1)* %35, align 4, !tbaa !7
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %35, i64 %28
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = add nsw i32 %40, %38
  store i32 %41, i32 addrspace(1)* %39, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %28
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %41
  store i32 %44, i32 addrspace(1)* %42, align 4, !tbaa !7
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %42, i64 %28
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %46, %44
  store i32 %47, i32 addrspace(1)* %45, align 4, !tbaa !7
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %45, i64 %28
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %49, %47
  store i32 %50, i32 addrspace(1)* %48, align 4, !tbaa !7
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %48, i64 %28
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %53 = add nsw i32 %52, %50
  store i32 %53, i32 addrspace(1)* %51, align 4, !tbaa !7
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %51, i64 %28
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = add nsw i32 %55, %53
  store i32 %56, i32 addrspace(1)* %54, align 4, !tbaa !7
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %54, i64 %28
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = add nsw i32 %58, %56
  store i32 %59, i32 addrspace(1)* %57, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %57, i64 %28
  %61 = add i32 %36, 8
  %62 = icmp eq i32 %61, %32
  br i1 %62, label %63, label %33, !llvm.loop !11

63:                                               ; preds = %33, %21
  %64 = phi i32 [ 0, %21 ], [ %59, %33 ]
  %65 = phi i32 addrspace(1)* [ %27, %21 ], [ %60, %33 ]
  %66 = icmp eq i32 %29, 0
  br i1 %66, label %76, label %67

67:                                               ; preds = %63, %67
  %68 = phi i32 [ %72, %67 ], [ %64, %63 ]
  %69 = phi i32 addrspace(1)* [ %73, %67 ], [ %65, %63 ]
  %70 = phi i32 [ %74, %67 ], [ 0, %63 ]
  %71 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %72 = add nsw i32 %71, %68
  store i32 %72, i32 addrspace(1)* %69, align 4, !tbaa !7
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %69, i64 %28
  %74 = add i32 %70, 1
  %75 = icmp eq i32 %74, %29
  br i1 %75, label %76, label %67, !llvm.loop !13

76:                                               ; preds = %63, %67, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
