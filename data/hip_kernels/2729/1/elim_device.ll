; ModuleID = '../data/hip_kernels/2729/1/main.cu'
source_filename = "../data/hip_kernels/2729/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@pivot = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4elimPdiii(double addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp eq i32 %5, 0
  %8 = icmp slt i32 %2, %1
  %9 = select i1 %7, i1 %8, i1 false
  %10 = mul nsw i32 %2, %1
  br i1 %9, label %11, label %20

11:                                               ; preds = %4, %11
  %12 = phi i32 [ %18, %11 ], [ %2, %4 ]
  %13 = add nsw i32 %12, %10
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 %14
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @pivot, i32 0, i32 %12
  store double %16, double addrspace(3)* %17, align 8, !tbaa !5
  %18 = add nsw i32 %12, 1
  %19 = icmp slt i32 %18, %1
  br i1 %19, label %11, label %20, !llvm.loop !10

20:                                               ; preds = %11, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = mul nsw i32 %6, %3
  %22 = add nsw i32 %21, %5
  %23 = mul nsw i32 %22, %1
  %24 = add nsw i32 %23, %2
  %25 = add nsw i32 %23, %1
  %26 = icmp sgt i32 %23, %10
  br i1 %26, label %27, label %46

27:                                               ; preds = %20
  %28 = add nsw i32 %24, 1
  %29 = icmp slt i32 %28, %25
  br i1 %29, label %30, label %46

30:                                               ; preds = %27
  %31 = sext i32 %24 to i64
  %32 = getelementptr inbounds double, double addrspace(1)* %0, i64 %31
  br label %33

33:                                               ; preds = %30, %33
  %34 = phi i32 [ %28, %30 ], [ %44, %33 ]
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !5
  %38 = load double, double addrspace(1)* %32, align 8, !tbaa !5
  %39 = sub nsw i32 %34, %23
  %40 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @pivot, i32 0, i32 %39
  %41 = load double, double addrspace(3)* %40, align 8, !tbaa !5
  %42 = fmul contract double %38, %41
  %43 = fsub contract double %37, %42
  store double %43, double addrspace(1)* %36, align 8, !tbaa !5
  %44 = add nsw i32 %34, 1
  %45 = icmp slt i32 %44, %25
  br i1 %45, label %33, label %46, !llvm.loop !12

46:                                               ; preds = %33, %27, %20
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
