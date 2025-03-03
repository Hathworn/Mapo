; ModuleID = '../data/hip_kernels/12526/1/main.cu'
source_filename = "../data/hip_kernels/12526/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11mult_globalPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  %25 = icmp sgt i32 %3, 0
  %26 = and i1 %24, %25
  br i1 %26, label %27, label %112

27:                                               ; preds = %4
  %28 = mul nsw i32 %21, %3
  %29 = add nsw i32 %28, %13
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %32 = and i32 %3, 3
  %33 = icmp ult i32 %3, 4
  br i1 %33, label %90, label %34

34:                                               ; preds = %27
  %35 = and i32 %3, -4
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %87, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %86, %36 ]
  %39 = phi i32 [ 0, %34 ], [ %88, %36 ]
  %40 = add nsw i32 %37, %28
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = mul nsw i32 %37, %3
  %45 = add nsw i32 %44, %13
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = mul nsw i32 %48, %43
  %50 = add nsw i32 %49, %38
  store i32 %50, i32 addrspace(1)* %31, align 4, !tbaa !7
  %51 = or i32 %37, 1
  %52 = add nsw i32 %51, %28
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = mul nsw i32 %51, %3
  %57 = add nsw i32 %56, %13
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = mul nsw i32 %60, %55
  %62 = add nsw i32 %61, %50
  store i32 %62, i32 addrspace(1)* %31, align 4, !tbaa !7
  %63 = or i32 %37, 2
  %64 = add nsw i32 %63, %28
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !7
  %68 = mul nsw i32 %63, %3
  %69 = add nsw i32 %68, %13
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = mul nsw i32 %72, %67
  %74 = add nsw i32 %73, %62
  store i32 %74, i32 addrspace(1)* %31, align 4, !tbaa !7
  %75 = or i32 %37, 3
  %76 = add nsw i32 %75, %28
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = mul nsw i32 %75, %3
  %81 = add nsw i32 %80, %13
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7
  %85 = mul nsw i32 %84, %79
  %86 = add nsw i32 %85, %74
  store i32 %86, i32 addrspace(1)* %31, align 4, !tbaa !7
  %87 = add nuw nsw i32 %37, 4
  %88 = add i32 %39, 4
  %89 = icmp eq i32 %88, %35
  br i1 %89, label %90, label %36, !llvm.loop !11

90:                                               ; preds = %36, %27
  %91 = phi i32 [ 0, %27 ], [ %87, %36 ]
  %92 = phi i32 [ 0, %27 ], [ %86, %36 ]
  %93 = icmp eq i32 %32, 0
  br i1 %93, label %112, label %94

94:                                               ; preds = %90, %94
  %95 = phi i32 [ %109, %94 ], [ %91, %90 ]
  %96 = phi i32 [ %108, %94 ], [ %92, %90 ]
  %97 = phi i32 [ %110, %94 ], [ 0, %90 ]
  %98 = add nsw i32 %95, %28
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7
  %102 = mul nsw i32 %95, %3
  %103 = add nsw i32 %102, %13
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7
  %107 = mul nsw i32 %106, %101
  %108 = add nsw i32 %107, %96
  store i32 %108, i32 addrspace(1)* %31, align 4, !tbaa !7
  %109 = add nuw nsw i32 %95, 1
  %110 = add i32 %97, 1
  %111 = icmp eq i32 %110, %32
  br i1 %111, label %112, label %94, !llvm.loop !13

112:                                              ; preds = %90, %94, %4
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
