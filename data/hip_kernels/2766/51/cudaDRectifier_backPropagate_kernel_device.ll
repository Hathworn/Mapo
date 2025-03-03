; ModuleID = '../data/hip_kernels/2766/51/main.cu'
source_filename = "../data/hip_kernels/2766/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z35cudaDRectifier_backPropagate_kernelPdS_jdid(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2, double %3, i32 %4, double %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  %25 = icmp ult i32 %18, %2
  br i1 %25, label %26, label %35

26:                                               ; preds = %6
  %27 = icmp sgt i32 %4, 0
  %28 = icmp slt i32 %4, 0
  %29 = sub nsw i32 0, %4
  %30 = shl nuw i32 1, %29
  %31 = sitofp i32 %30 to double
  %32 = shl nuw i32 1, %4
  %33 = sitofp i32 %32 to double
  %34 = fcmp contract ogt double %5, 0.000000e+00
  br label %36

35:                                               ; preds = %61, %6
  ret void

36:                                               ; preds = %26, %61
  %37 = phi i32 [ %18, %26 ], [ %66, %61 ]
  br i1 %27, label %38, label %43

38:                                               ; preds = %36
  %39 = zext i32 %37 to i64
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = fdiv contract double %41, %33
  store double %42, double addrspace(1)* %40, align 8, !tbaa !16
  br label %49

43:                                               ; preds = %36
  br i1 %28, label %44, label %49

44:                                               ; preds = %43
  %45 = zext i32 %37 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !16
  %48 = fmul contract double %47, %31
  store double %48, double addrspace(1)* %46, align 8, !tbaa !16
  br label %49

49:                                               ; preds = %43, %44, %38
  %50 = zext i32 %37 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !16
  br i1 %34, label %53, label %58

53:                                               ; preds = %49
  %54 = fcmp contract ogt double %52, %5
  %55 = fcmp contract ogt double %52, 0.000000e+00
  %56 = select contract i1 %55, double 1.000000e+00, double %3
  %57 = select contract i1 %54, double 0.000000e+00, double %56
  br label %61

58:                                               ; preds = %49
  %59 = fcmp contract ogt double %52, 0.000000e+00
  %60 = select contract i1 %59, double 1.000000e+00, double %3
  br label %61

61:                                               ; preds = %53, %58
  %62 = phi double [ %57, %53 ], [ %60, %58 ]
  %63 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !16
  %65 = fmul contract double %64, %62
  store double %65, double addrspace(1)* %63, align 8, !tbaa !16
  %66 = add i32 %37, %24
  %67 = icmp ult i32 %66, %2
  br i1 %67, label %36, label %35, !llvm.loop !20
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
