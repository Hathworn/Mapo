; ModuleID = '../data/hip_kernels/11130/7/main.cu'
source_filename = "../data/hip_kernels/11130/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14multiplicacionPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = mul nsw i32 %15, %5
  %25 = add nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %26
  store i32 0, i32 addrspace(1)* %27, align 4, !tbaa !7
  %28 = icmp sgt i32 %4, 0
  br i1 %28, label %29, label %57

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %4
  %31 = and i32 %4, 3
  %32 = icmp ult i32 %4, 4
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %4, -4
  br label %58

35:                                               ; preds = %58, %29
  %36 = phi i32 [ 0, %29 ], [ %108, %58 ]
  %37 = phi i32 [ 0, %29 ], [ %109, %58 ]
  %38 = icmp eq i32 %31, 0
  br i1 %38, label %57, label %39

39:                                               ; preds = %35, %39
  %40 = phi i32 [ %53, %39 ], [ %36, %35 ]
  %41 = phi i32 [ %54, %39 ], [ %37, %35 ]
  %42 = phi i32 [ %55, %39 ], [ 0, %35 ]
  %43 = add nsw i32 %41, %30
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = mul nsw i32 %41, %5
  %48 = add nsw i32 %47, %23
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7
  %52 = mul nsw i32 %51, %46
  %53 = add nsw i32 %40, %52
  store i32 %53, i32 addrspace(1)* %27, align 4, !tbaa !7
  %54 = add nuw nsw i32 %41, 1
  %55 = add i32 %42, 1
  %56 = icmp eq i32 %55, %31
  br i1 %56, label %57, label %39, !llvm.loop !11

57:                                               ; preds = %35, %39, %6
  ret void

58:                                               ; preds = %58, %33
  %59 = phi i32 [ 0, %33 ], [ %108, %58 ]
  %60 = phi i32 [ 0, %33 ], [ %109, %58 ]
  %61 = phi i32 [ 0, %33 ], [ %110, %58 ]
  %62 = add nsw i32 %60, %30
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7
  %66 = mul nsw i32 %60, %5
  %67 = add nsw i32 %66, %23
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7
  %71 = mul nsw i32 %70, %65
  %72 = add nsw i32 %59, %71
  store i32 %72, i32 addrspace(1)* %27, align 4, !tbaa !7
  %73 = or i32 %60, 1
  %74 = add nsw i32 %73, %30
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7
  %78 = mul nsw i32 %73, %5
  %79 = add nsw i32 %78, %23
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7
  %83 = mul nsw i32 %82, %77
  %84 = add nsw i32 %72, %83
  store i32 %84, i32 addrspace(1)* %27, align 4, !tbaa !7
  %85 = or i32 %60, 2
  %86 = add nsw i32 %85, %30
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7
  %90 = mul nsw i32 %85, %5
  %91 = add nsw i32 %90, %23
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7
  %95 = mul nsw i32 %94, %89
  %96 = add nsw i32 %84, %95
  store i32 %96, i32 addrspace(1)* %27, align 4, !tbaa !7
  %97 = or i32 %60, 3
  %98 = add nsw i32 %97, %30
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7
  %102 = mul nsw i32 %97, %5
  %103 = add nsw i32 %102, %23
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7
  %107 = mul nsw i32 %106, %101
  %108 = add nsw i32 %96, %107
  store i32 %108, i32 addrspace(1)* %27, align 4, !tbaa !7
  %109 = add nuw nsw i32 %60, 4
  %110 = add i32 %61, 4
  %111 = icmp eq i32 %110, %34
  br i1 %111, label %35, label %58, !llvm.loop !13
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
