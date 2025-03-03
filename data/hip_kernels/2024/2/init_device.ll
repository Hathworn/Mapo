; ModuleID = '../data/hip_kernels/2024/2/main.cu'
source_filename = "../data/hip_kernels/2024/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z4initiiPd(i32 %0, i32 %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %22, label %57

22:                                               ; preds = %3
  %23 = icmp slt i32 %12, %0
  %24 = icmp slt i32 %20, %0
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %31, label %26

26:                                               ; preds = %22
  %27 = and i32 %1, 7
  %28 = icmp ult i32 %1, 8
  br i1 %28, label %51, label %29

29:                                               ; preds = %26
  %30 = and i32 %1, -8
  br label %58

31:                                               ; preds = %22
  %32 = and i32 %1, 7
  %33 = icmp ult i32 %1, 8
  br i1 %33, label %36, label %34

34:                                               ; preds = %31
  %35 = and i32 %1, -8
  br label %62

36:                                               ; preds = %62, %31
  %37 = phi i32 [ 0, %31 ], [ %120, %62 ]
  %38 = icmp eq i32 %32, 0
  br i1 %38, label %57, label %39

39:                                               ; preds = %36, %39
  %40 = phi i32 [ %48, %39 ], [ %37, %36 ]
  %41 = phi i32 [ %49, %39 ], [ 0, %36 ]
  %42 = mul nsw i32 %40, %0
  %43 = add i32 %42, %12
  %44 = mul i32 %43, %0
  %45 = add nsw i32 %44, %20
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %2, i64 %46
  store double 0.000000e+00, double addrspace(1)* %47, align 8, !tbaa !7
  %48 = add nuw nsw i32 %40, 1
  %49 = add i32 %41, 1
  %50 = icmp eq i32 %49, %32
  br i1 %50, label %57, label %39, !llvm.loop !11

51:                                               ; preds = %58, %26
  %52 = icmp eq i32 %27, 0
  br i1 %52, label %57, label %53

53:                                               ; preds = %51, %53
  %54 = phi i32 [ %55, %53 ], [ 0, %51 ]
  %55 = add i32 %54, 1
  %56 = icmp eq i32 %55, %27
  br i1 %56, label %57, label %53, !llvm.loop !13

57:                                               ; preds = %39, %36, %53, %51, %3
  ret void

58:                                               ; preds = %58, %29
  %59 = phi i32 [ 0, %29 ], [ %60, %58 ]
  %60 = add i32 %59, 8
  %61 = icmp eq i32 %60, %30
  br i1 %61, label %51, label %58, !llvm.loop !14

62:                                               ; preds = %62, %34
  %63 = phi i32 [ 0, %34 ], [ %120, %62 ]
  %64 = phi i32 [ 0, %34 ], [ %121, %62 ]
  %65 = mul nsw i32 %63, %0
  %66 = add i32 %65, %12
  %67 = mul i32 %66, %0
  %68 = add nsw i32 %67, %20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %2, i64 %69
  store double 0.000000e+00, double addrspace(1)* %70, align 8, !tbaa !7
  %71 = or i32 %63, 1
  %72 = mul nsw i32 %71, %0
  %73 = add i32 %72, %12
  %74 = mul i32 %73, %0
  %75 = add nsw i32 %74, %20
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %2, i64 %76
  store double 0.000000e+00, double addrspace(1)* %77, align 8, !tbaa !7
  %78 = or i32 %63, 2
  %79 = mul nsw i32 %78, %0
  %80 = add i32 %79, %12
  %81 = mul i32 %80, %0
  %82 = add nsw i32 %81, %20
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %2, i64 %83
  store double 0.000000e+00, double addrspace(1)* %84, align 8, !tbaa !7
  %85 = or i32 %63, 3
  %86 = mul nsw i32 %85, %0
  %87 = add i32 %86, %12
  %88 = mul i32 %87, %0
  %89 = add nsw i32 %88, %20
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %2, i64 %90
  store double 0.000000e+00, double addrspace(1)* %91, align 8, !tbaa !7
  %92 = or i32 %63, 4
  %93 = mul nsw i32 %92, %0
  %94 = add i32 %93, %12
  %95 = mul i32 %94, %0
  %96 = add nsw i32 %95, %20
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %2, i64 %97
  store double 0.000000e+00, double addrspace(1)* %98, align 8, !tbaa !7
  %99 = or i32 %63, 5
  %100 = mul nsw i32 %99, %0
  %101 = add i32 %100, %12
  %102 = mul i32 %101, %0
  %103 = add nsw i32 %102, %20
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %2, i64 %104
  store double 0.000000e+00, double addrspace(1)* %105, align 8, !tbaa !7
  %106 = or i32 %63, 6
  %107 = mul nsw i32 %106, %0
  %108 = add i32 %107, %12
  %109 = mul i32 %108, %0
  %110 = add nsw i32 %109, %20
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds double, double addrspace(1)* %2, i64 %111
  store double 0.000000e+00, double addrspace(1)* %112, align 8, !tbaa !7
  %113 = or i32 %63, 7
  %114 = mul nsw i32 %113, %0
  %115 = add i32 %114, %12
  %116 = mul i32 %115, %0
  %117 = add nsw i32 %116, %20
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds double, double addrspace(1)* %2, i64 %118
  store double 0.000000e+00, double addrspace(1)* %119, align 8, !tbaa !7
  %120 = add nuw nsw i32 %63, 8
  %121 = add i32 %64, 8
  %122 = icmp eq i32 %121, %35
  br i1 %122, label %36, label %62, !llvm.loop !14
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
