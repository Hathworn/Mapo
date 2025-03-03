; ModuleID = '../data/hip_kernels/9584/7/main.cu'
source_filename = "../data/hip_kernels/9584/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s_diag = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5tracePdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp sgt i32 %1, -1
  %5 = shl nuw i32 1, %1
  %6 = select i1 %4, i32 %5, i32 0
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 %7
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @s_diag, i32 0, i32 %3
  store double %9, double addrspace(3)* %10, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !10, !invariant.load !9
  %15 = zext i16 %14 to i32
  %16 = icmp ugt i16 %14, 1
  br i1 %16, label %20, label %17

17:                                               ; preds = %35, %2
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = icmp eq i32 %3, 0
  br i1 %19, label %44, label %38

20:                                               ; preds = %2, %35
  %21 = phi i32 [ %36, %35 ], [ 1, %2 ]
  %22 = phi double [ %31, %35 ], [ undef, %2 ]
  %23 = icmp eq i32 %21, %6
  %24 = icmp ult i32 %3, %21
  %25 = select i1 %23, i1 true, i1 %24
  br i1 %25, label %30, label %26

26:                                               ; preds = %20
  %27 = sub i32 %3, %21
  %28 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @s_diag, i32 0, i32 %27
  %29 = load double, double addrspace(3)* %28, align 8, !tbaa !5
  br label %30

30:                                               ; preds = %26, %20
  %31 = phi double [ %29, %26 ], [ %22, %20 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %25, label %35, label %32

32:                                               ; preds = %30
  %33 = load double, double addrspace(3)* %10, align 8, !tbaa !5
  %34 = fadd contract double %31, %33
  store double %34, double addrspace(3)* %10, align 8, !tbaa !5
  br label %35

35:                                               ; preds = %32, %30
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = shl i32 %21, 1
  %37 = icmp ult i32 %36, %15
  br i1 %37, label %20, label %17, !llvm.loop !11

38:                                               ; preds = %17
  %39 = icmp eq i32 %3, 1
  %40 = select i1 %39, i1 %4, i1 false
  br i1 %40, label %41, label %52

41:                                               ; preds = %38
  %42 = xor i32 %6, -1
  %43 = add i32 %18, 1
  br label %44

44:                                               ; preds = %17, %41
  %45 = phi i32 [ %43, %41 ], [ %18, %17 ]
  %46 = phi i32 [ %42, %41 ], [ -1, %17 ]
  %47 = add i32 %46, %15
  %48 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @s_diag, i32 0, i32 %47
  %49 = load double, double addrspace(3)* %48, align 8, !tbaa !5
  %50 = zext i32 %45 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  store double %49, double addrspace(1)* %51, align 8, !tbaa !5
  br label %52

52:                                               ; preds = %44, %38
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
