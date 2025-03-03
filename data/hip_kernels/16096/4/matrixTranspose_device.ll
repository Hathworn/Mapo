; ModuleID = '../data/hip_kernels/16096/4/main.cu'
source_filename = "../data/hip_kernels/16096/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15matrixTransposePdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
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
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  %25 = icmp sgt i32 %3, 0
  %26 = and i1 %24, %25
  br i1 %26, label %27, label %121

27:                                               ; preds = %4
  %28 = mul nsw i32 %13, %3
  %29 = add nsw i32 %28, %21
  %30 = mul nsw i32 %21, %3
  %31 = add nsw i32 %30, %13
  %32 = and i32 %3, 7
  %33 = icmp ult i32 %3, 8
  br i1 %33, label %105, label %34

34:                                               ; preds = %27
  %35 = and i32 %3, -8
  br label %36

36:                                               ; preds = %36, %34
  %37 = phi i32 [ 0, %34 ], [ %102, %36 ]
  %38 = phi i32 [ 0, %34 ], [ %103, %36 ]
  %39 = add nsw i32 %29, %37
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = add nsw i32 %31, %37
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %1, i64 %44
  store double %42, double addrspace(1)* %45, align 8, !tbaa !7
  %46 = or i32 %37, 1
  %47 = add nsw i32 %29, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7
  %51 = add nsw i32 %31, %46
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  store double %50, double addrspace(1)* %53, align 8, !tbaa !7
  %54 = or i32 %37, 2
  %55 = add nsw i32 %29, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %59 = add nsw i32 %31, %54
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %1, i64 %60
  store double %58, double addrspace(1)* %61, align 8, !tbaa !7
  %62 = or i32 %37, 3
  %63 = add nsw i32 %29, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7
  %67 = add nsw i32 %31, %62
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  store double %66, double addrspace(1)* %69, align 8, !tbaa !7
  %70 = or i32 %37, 4
  %71 = add nsw i32 %29, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %0, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7
  %75 = add nsw i32 %31, %70
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  store double %74, double addrspace(1)* %77, align 8, !tbaa !7
  %78 = or i32 %37, 5
  %79 = add nsw i32 %29, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %0, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7
  %83 = add nsw i32 %31, %78
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %1, i64 %84
  store double %82, double addrspace(1)* %85, align 8, !tbaa !7
  %86 = or i32 %37, 6
  %87 = add nsw i32 %29, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %0, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7
  %91 = add nsw i32 %31, %86
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %1, i64 %92
  store double %90, double addrspace(1)* %93, align 8, !tbaa !7
  %94 = or i32 %37, 7
  %95 = add nsw i32 %29, %94
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !7
  %99 = add nsw i32 %31, %94
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %1, i64 %100
  store double %98, double addrspace(1)* %101, align 8, !tbaa !7
  %102 = add nuw nsw i32 %37, 8
  %103 = add i32 %38, 8
  %104 = icmp eq i32 %103, %35
  br i1 %104, label %105, label %36, !llvm.loop !11

105:                                              ; preds = %36, %27
  %106 = phi i32 [ 0, %27 ], [ %102, %36 ]
  %107 = icmp eq i32 %32, 0
  br i1 %107, label %121, label %108

108:                                              ; preds = %105, %108
  %109 = phi i32 [ %118, %108 ], [ %106, %105 ]
  %110 = phi i32 [ %119, %108 ], [ 0, %105 ]
  %111 = add nsw i32 %29, %109
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = add nsw i32 %31, %109
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %1, i64 %116
  store double %114, double addrspace(1)* %117, align 8, !tbaa !7
  %118 = add nuw nsw i32 %109, 1
  %119 = add i32 %110, 1
  %120 = icmp eq i32 %119, %32
  br i1 %120, label %121, label %108, !llvm.loop !13

121:                                              ; preds = %105, %108, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
