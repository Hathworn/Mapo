; ModuleID = '../data/hip_kernels/6804/2/main.cu'
source_filename = "../data/hip_kernels/6804/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@subTotals = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6reducePdS_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp sgt i32 %12, 50000
  br i1 %13, label %57, label %14

14:                                               ; preds = %3
  %15 = shl nsw i32 %12, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %0, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !5
  %19 = add nuw nsw i32 %15, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !5
  %23 = fadd contract double %18, %22
  %24 = fmul contract double %23, 5.000000e-01
  %25 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @subTotals, i32 0, i32 %11
  store double %24, double addrspace(3)* %25, align 8, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = lshr i32 %8, 1
  %27 = icmp ult i32 %26, %2
  br i1 %27, label %47, label %28

28:                                               ; preds = %14, %41
  %29 = phi i32 [ %42, %41 ], [ 2, %14 ]
  %30 = add i32 %29, 1023
  %31 = and i32 %30, %11
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %41

33:                                               ; preds = %28
  %34 = load double, double addrspace(3)* %25, align 8, !tbaa !7
  %35 = ashr exact i32 %29, 1
  %36 = add nsw i32 %35, %11
  %37 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @subTotals, i32 0, i32 %36
  %38 = load double, double addrspace(3)* %37, align 8, !tbaa !7
  %39 = fadd contract double %34, %38
  %40 = fmul contract double %39, 5.000000e-01
  store double %40, double addrspace(3)* %25, align 8, !tbaa !7
  br label %41

41:                                               ; preds = %33, %28
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = shl nsw i32 %29, 1
  %43 = udiv i32 %8, %42
  %44 = icmp ult i32 %43, %2
  br i1 %44, label %45, label %28, !llvm.loop !11

45:                                               ; preds = %41
  %46 = and i32 %29, 2147483646
  br label %47

47:                                               ; preds = %45, %14
  %48 = phi i32 [ 1, %14 ], [ %46, %45 ]
  %49 = add nuw i32 %48, 1023
  %50 = and i32 %49, %11
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %57

52:                                               ; preds = %47
  %53 = load double, double addrspace(3)* %25, align 8, !tbaa !7
  %54 = sdiv i32 %12, %48
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %55
  store double %53, double addrspace(1)* %56, align 8, !tbaa !7
  br label %57

57:                                               ; preds = %47, %52, %3
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
