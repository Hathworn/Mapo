; ModuleID = '../data/hip_kernels/4610/1/main.cu'
source_filename = "../data/hip_kernels/4610/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8calcdataPdS_ii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add nuw nsw i32 %12, 1
  %14 = add i32 %13, %11
  %15 = add nsw i32 %3, 1
  %16 = icmp sgt i32 %14, %15
  %17 = icmp slt i32 %2, 1
  %18 = select i1 %16, i1 true, i1 %17
  br i1 %18, label %121, label %19

19:                                               ; preds = %4
  %20 = add nuw nsw i32 %2, 1
  %21 = mul nsw i32 %14, %20
  %22 = add i32 %2, -1
  %23 = and i32 %2, 7
  %24 = icmp ult i32 %22, 7
  br i1 %24, label %104, label %25

25:                                               ; preds = %19
  %26 = and i32 %2, -8
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi i32 [ 1, %25 ], [ %101, %27 ]
  %29 = phi i32 [ 0, %25 ], [ %102, %27 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %1, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %33 = add nsw i32 %28, %21
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7
  %37 = fsub contract double %36, %32
  store double %37, double addrspace(1)* %35, align 8, !tbaa !7
  %38 = add nuw nsw i32 %28, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = add nsw i32 %38, %21
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fsub contract double %45, %41
  store double %46, double addrspace(1)* %44, align 8, !tbaa !7
  %47 = add nuw nsw i32 %28, 2
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7
  %51 = add nsw i32 %47, %21
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7
  %55 = fsub contract double %54, %50
  store double %55, double addrspace(1)* %53, align 8, !tbaa !7
  %56 = add nuw nsw i32 %28, 3
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = add nsw i32 %56, %21
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fsub contract double %63, %59
  store double %64, double addrspace(1)* %62, align 8, !tbaa !7
  %65 = add nuw nsw i32 %28, 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = add nsw i32 %65, %21
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = fsub contract double %72, %68
  store double %73, double addrspace(1)* %71, align 8, !tbaa !7
  %74 = add nuw nsw i32 %28, 5
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %1, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = add nsw i32 %74, %21
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %0, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fsub contract double %81, %77
  store double %82, double addrspace(1)* %80, align 8, !tbaa !7
  %83 = add nuw nsw i32 %28, 6
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %1, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = add nsw i32 %83, %21
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %0, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7
  %91 = fsub contract double %90, %86
  store double %91, double addrspace(1)* %89, align 8, !tbaa !7
  %92 = add nuw i32 %28, 7
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7
  %96 = add nsw i32 %92, %21
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = fsub contract double %99, %95
  store double %100, double addrspace(1)* %98, align 8, !tbaa !7
  %101 = add nuw i32 %28, 8
  %102 = add i32 %29, 8
  %103 = icmp eq i32 %102, %26
  br i1 %103, label %104, label %27, !llvm.loop !11

104:                                              ; preds = %27, %19
  %105 = phi i32 [ 1, %19 ], [ %101, %27 ]
  %106 = icmp eq i32 %23, 0
  br i1 %106, label %121, label %107

107:                                              ; preds = %104, %107
  %108 = phi i32 [ %118, %107 ], [ %105, %104 ]
  %109 = phi i32 [ %119, %107 ], [ 0, %104 ]
  %110 = zext i32 %108 to i64
  %111 = getelementptr inbounds double, double addrspace(1)* %1, i64 %110
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7
  %113 = add nsw i32 %108, %21
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %0, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !7
  %117 = fsub contract double %116, %112
  store double %117, double addrspace(1)* %115, align 8, !tbaa !7
  %118 = add nuw i32 %108, 1
  %119 = add i32 %109, 1
  %120 = icmp eq i32 %119, %23
  br i1 %120, label %121, label %107, !llvm.loop !13

121:                                              ; preds = %104, %107, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
