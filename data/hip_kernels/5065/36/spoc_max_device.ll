; ModuleID = '../data/hip_kernels/5065/36/main.cu'
source_filename = "../data/hip_kernels/5065/36/main.cu"
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
  br i1 %13, label %107, label %14

14:                                               ; preds = %3
  %15 = load double, double addrspace(1)* %0, align 8, !tbaa !7, !amdgpu.noclobber !5
  %16 = tail call double @llvm.fabs.f64(double %15)
  %17 = icmp sgt i32 %2, 1
  br i1 %17, label %18, label %43

18:                                               ; preds = %14
  %19 = add i32 %2, -1
  %20 = add i32 %2, -2
  %21 = and i32 %19, 7
  %22 = icmp ult i32 %20, 7
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = and i32 %19, -8
  br label %45

25:                                               ; preds = %45, %18
  %26 = phi double [ undef, %18 ], [ %103, %45 ]
  %27 = phi i32 [ 1, %18 ], [ %104, %45 ]
  %28 = phi double [ %16, %18 ], [ %103, %45 ]
  %29 = icmp eq i32 %21, 0
  br i1 %29, label %43, label %30

30:                                               ; preds = %25, %30
  %31 = phi i32 [ %40, %30 ], [ %27, %25 ]
  %32 = phi double [ %39, %30 ], [ %28, %25 ]
  %33 = phi i32 [ %41, %30 ], [ 0, %25 ]
  %34 = zext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = tail call double @llvm.fabs.f64(double %36)
  %38 = fcmp contract olt double %32, %37
  %39 = select i1 %38, double %37, double %32
  %40 = add nuw nsw i32 %31, 1
  %41 = add i32 %33, 1
  %42 = icmp eq i32 %41, %21
  br i1 %42, label %43, label %30, !llvm.loop !11

43:                                               ; preds = %25, %30, %14
  %44 = phi double [ %16, %14 ], [ %26, %25 ], [ %39, %30 ]
  store double %44, double addrspace(1)* %1, align 8, !tbaa !7
  br label %107

45:                                               ; preds = %45, %23
  %46 = phi i32 [ 1, %23 ], [ %104, %45 ]
  %47 = phi double [ %16, %23 ], [ %103, %45 ]
  %48 = phi i32 [ 0, %23 ], [ %105, %45 ]
  %49 = zext i32 %46 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7, !amdgpu.noclobber !5
  %52 = tail call double @llvm.fabs.f64(double %51)
  %53 = fcmp contract olt double %47, %52
  %54 = select i1 %53, double %52, double %47
  %55 = add nuw nsw i32 %46, 1
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = tail call double @llvm.fabs.f64(double %58)
  %60 = fcmp contract olt double %54, %59
  %61 = select i1 %60, double %59, double %54
  %62 = add nuw nsw i32 %46, 2
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !5
  %66 = tail call double @llvm.fabs.f64(double %65)
  %67 = fcmp contract olt double %61, %66
  %68 = select i1 %67, double %66, double %61
  %69 = add nuw nsw i32 %46, 3
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !5
  %73 = tail call double @llvm.fabs.f64(double %72)
  %74 = fcmp contract olt double %68, %73
  %75 = select i1 %74, double %73, double %68
  %76 = add nuw nsw i32 %46, 4
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7, !amdgpu.noclobber !5
  %80 = tail call double @llvm.fabs.f64(double %79)
  %81 = fcmp contract olt double %75, %80
  %82 = select i1 %81, double %80, double %75
  %83 = add nuw nsw i32 %46, 5
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7, !amdgpu.noclobber !5
  %87 = tail call double @llvm.fabs.f64(double %86)
  %88 = fcmp contract olt double %82, %87
  %89 = select i1 %88, double %87, double %82
  %90 = add nuw nsw i32 %46, 6
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds double, double addrspace(1)* %0, i64 %91
  %93 = load double, double addrspace(1)* %92, align 8, !tbaa !7, !amdgpu.noclobber !5
  %94 = tail call double @llvm.fabs.f64(double %93)
  %95 = fcmp contract olt double %89, %94
  %96 = select i1 %95, double %94, double %89
  %97 = add nuw nsw i32 %46, 7
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7, !amdgpu.noclobber !5
  %101 = tail call double @llvm.fabs.f64(double %100)
  %102 = fcmp contract olt double %96, %101
  %103 = select i1 %102, double %101, double %96
  %104 = add nuw nsw i32 %46, 8
  %105 = add i32 %48, 8
  %106 = icmp eq i32 %105, %24
  br i1 %106, label %25, label %45, !llvm.loop !13

107:                                              ; preds = %3, %43
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
