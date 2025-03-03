; ModuleID = '../data/hip_kernels/1036/3/main.cu'
source_filename = "../data/hip_kernels/1036/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7max_graPdS_(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = icmp ugt i16 %7, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %2
  %11 = zext i32 %3 to i64
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 %11
  br label %15

13:                                               ; preds = %30, %2
  %14 = icmp eq i32 %3, 0
  br i1 %14, label %32, label %34

15:                                               ; preds = %10, %30
  %16 = phi i32 [ 1, %10 ], [ %17, %30 ]
  %17 = shl i32 %16, 1
  %18 = srem i32 %3, %17
  %19 = icmp eq i32 %18, %16
  br i1 %19, label %20, label %30

20:                                               ; preds = %15
  %21 = sub nsw i32 %3, %16
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %0, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %25 = load double, double addrspace(1)* %12, align 8, !tbaa !7
  %26 = tail call double @llvm.fabs.f64(double %24)
  %27 = tail call double @llvm.fabs.f64(double %25)
  %28 = fcmp contract ogt double %26, %27
  %29 = select contract i1 %28, double %26, double %27
  store double %29, double addrspace(1)* %23, align 8, !tbaa !7
  br label %30

30:                                               ; preds = %20, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i32 %17, %8
  br i1 %31, label %15, label %13, !llvm.loop !11

32:                                               ; preds = %13
  %33 = load double, double addrspace(1)* %0, align 8, !tbaa !7
  store double %33, double addrspace(1)* %1, align 8, !tbaa !7
  br label %34

34:                                               ; preds = %32, %13
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
