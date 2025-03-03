; ModuleID = '../data/hip_kernels/5065/9/main.cu'
source_filename = "../data/hip_kernels/5065/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8spoc_maxPKdPdi(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %106, label %14

14:                                               ; preds = %3
  %15 = load double, double addrspace(1)* %0, align 8, !tbaa !7, !amdgpu.noclobber !5
  %16 = icmp sgt i32 %2, 1
  br i1 %16, label %17, label %42

17:                                               ; preds = %14
  %18 = add i32 %2, -1
  %19 = add i32 %2, -2
  %20 = and i32 %18, 7
  %21 = icmp ult i32 %19, 7
  br i1 %21, label %24, label %22

22:                                               ; preds = %17
  %23 = and i32 %18, -8
  br label %44

24:                                               ; preds = %44, %17
  %25 = phi double [ undef, %17 ], [ %102, %44 ]
  %26 = phi i32 [ 1, %17 ], [ %103, %44 ]
  %27 = phi double [ %15, %17 ], [ %102, %44 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %42, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %39, %29 ], [ %26, %24 ]
  %31 = phi double [ %38, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %40, %29 ], [ 0, %24 ]
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp contract olt double %31, %36
  %38 = select i1 %37, double %36, double %31
  %39 = add nuw nsw i32 %30, 1
  %40 = add i32 %32, 1
  %41 = icmp eq i32 %40, %20
  br i1 %41, label %42, label %29, !llvm.loop !11

42:                                               ; preds = %24, %29, %14
  %43 = phi double [ %15, %14 ], [ %25, %24 ], [ %38, %29 ]
  store double %43, double addrspace(1)* %1, align 8, !tbaa !7
  br label %106

44:                                               ; preds = %44, %22
  %45 = phi i32 [ 1, %22 ], [ %103, %44 ]
  %46 = phi double [ %15, %22 ], [ %102, %44 ]
  %47 = phi i32 [ 0, %22 ], [ %104, %44 ]
  %48 = zext i32 %45 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !5
  %51 = tail call double @llvm.fabs.f64(double %50)
  %52 = fcmp contract olt double %46, %51
  %53 = select i1 %52, double %51, double %46
  %54 = add nuw nsw i32 %45, 1
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !5
  %58 = tail call double @llvm.fabs.f64(double %57)
  %59 = fcmp contract olt double %53, %58
  %60 = select i1 %59, double %58, double %53
  %61 = add nuw nsw i32 %45, 2
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = tail call double @llvm.fabs.f64(double %64)
  %66 = fcmp contract olt double %60, %65
  %67 = select i1 %66, double %65, double %60
  %68 = add nuw nsw i32 %45, 3
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %0, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !5
  %72 = tail call double @llvm.fabs.f64(double %71)
  %73 = fcmp contract olt double %67, %72
  %74 = select i1 %73, double %72, double %67
  %75 = add nuw nsw i32 %45, 4
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7, !amdgpu.noclobber !5
  %79 = tail call double @llvm.fabs.f64(double %78)
  %80 = fcmp contract olt double %74, %79
  %81 = select i1 %80, double %79, double %74
  %82 = add nuw nsw i32 %45, 5
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7, !amdgpu.noclobber !5
  %86 = tail call double @llvm.fabs.f64(double %85)
  %87 = fcmp contract olt double %81, %86
  %88 = select i1 %87, double %86, double %81
  %89 = add nuw nsw i32 %45, 6
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !5
  %93 = tail call double @llvm.fabs.f64(double %92)
  %94 = fcmp contract olt double %88, %93
  %95 = select i1 %94, double %93, double %88
  %96 = add nuw nsw i32 %45, 7
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7, !amdgpu.noclobber !5
  %100 = tail call double @llvm.fabs.f64(double %99)
  %101 = fcmp contract olt double %95, %100
  %102 = select i1 %101, double %100, double %95
  %103 = add nuw nsw i32 %45, 8
  %104 = add i32 %47, 8
  %105 = icmp eq i32 %104, %23
  br i1 %105, label %24, label %44, !llvm.loop !13

106:                                              ; preds = %3, %42
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
