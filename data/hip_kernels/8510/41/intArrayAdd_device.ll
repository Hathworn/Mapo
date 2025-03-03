; ModuleID = '../data/hip_kernels/8510/41/main.cu'
source_filename = "../data/hip_kernels/8510/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11intArrayAddiPKiPiS0_i(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i64
  %15 = mul nuw nsw i64 %14, %9
  %16 = add nuw nsw i64 %15, %7
  %17 = sext i32 %0 to i64
  %18 = icmp slt i64 %16, %17
  br i1 %18, label %19, label %106

19:                                               ; preds = %5
  %20 = sext i32 %4 to i64
  %21 = mul nsw i64 %16, %20
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %21
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %21
  %24 = icmp sgt i32 %4, 0
  br i1 %24, label %25, label %106

25:                                               ; preds = %19
  %26 = and i64 %20, 7
  %27 = icmp ult i32 %4, 8
  br i1 %27, label %91, label %28

28:                                               ; preds = %25
  %29 = and i64 %20, -8
  br label %30

30:                                               ; preds = %30, %28
  %31 = phi i64 [ 0, %28 ], [ %88, %30 ]
  %32 = phi i64 [ 0, %28 ], [ %89, %30 ]
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %31
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %31
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %37 = add nsw i32 %36, %34
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %31
  store i32 %37, i32 addrspace(1)* %38, align 4, !tbaa !7
  %39 = or i64 %31, 1
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %39
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %41
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %39
  store i32 %44, i32 addrspace(1)* %45, align 4, !tbaa !7
  %46 = or i64 %31, 2
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %46
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = add nsw i32 %50, %48
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %46
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i64 %31, 3
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %53
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7
  %58 = add nsw i32 %57, %55
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %53
  store i32 %58, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = or i64 %31, 4
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %60
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7
  %65 = add nsw i32 %64, %62
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %60
  store i32 %65, i32 addrspace(1)* %66, align 4, !tbaa !7
  %67 = or i64 %31, 5
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %67
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = add nsw i32 %71, %69
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %67
  store i32 %72, i32 addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i64 %31, 6
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %74
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7
  %79 = add nsw i32 %78, %76
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %74
  store i32 %79, i32 addrspace(1)* %80, align 4, !tbaa !7
  %81 = or i64 %31, 7
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %81
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7
  %86 = add nsw i32 %85, %83
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %81
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !7
  %88 = add nuw nsw i64 %31, 8
  %89 = add i64 %32, 8
  %90 = icmp eq i64 %89, %29
  br i1 %90, label %91, label %30, !llvm.loop !11

91:                                               ; preds = %30, %25
  %92 = phi i64 [ 0, %25 ], [ %88, %30 ]
  %93 = icmp eq i64 %26, 0
  br i1 %93, label %106, label %94

94:                                               ; preds = %91, %94
  %95 = phi i64 [ %103, %94 ], [ %92, %91 ]
  %96 = phi i64 [ %104, %94 ], [ 0, %91 ]
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %22, i64 %95
  %98 = load i32, i32 addrspace(1)* %97, align 4, !tbaa !7
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %95
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = add nsw i32 %100, %98
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %95
  store i32 %101, i32 addrspace(1)* %102, align 4, !tbaa !7
  %103 = add nuw nsw i64 %95, 1
  %104 = add i64 %96, 1
  %105 = icmp eq i64 %104, %26
  br i1 %105, label %106, label %94, !llvm.loop !13

106:                                              ; preds = %91, %94, %19, %5
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
