; ModuleID = '../data/hip_kernels/14764/4/main.cu'
source_filename = "../data/hip_kernels/14764/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z14kennel_matrixQPdS_S_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = freeze i32 %14
  %16 = freeze i32 %4
  %17 = sdiv i32 %15, %16
  %18 = add nsw i32 %14, %4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %3, i64 %19
  store double 0.000000e+00, double addrspace(1)* %20, align 8, !tbaa !7
  %21 = icmp sgt i32 %4, 0
  br i1 %21, label %22, label %30

22:                                               ; preds = %5
  %23 = mul i32 %17, %16
  %24 = sub i32 %15, %23
  %25 = sext i32 %17 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %27 = mul nsw i32 %17, %4
  %28 = mul nsw i32 %24, %4
  %29 = bitcast double addrspace(1)* %20 to i64 addrspace(1)*
  br label %31

30:                                               ; preds = %61, %5
  ret void

31:                                               ; preds = %22, %61
  %32 = phi i32 [ 0, %22 ], [ %62, %61 ]
  %33 = load double, double addrspace(1)* %26, align 8, !tbaa !7
  %34 = fcmp contract une double %33, 0.000000e+00
  br i1 %34, label %35, label %61

35:                                               ; preds = %31
  %36 = zext i32 %32 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7
  %39 = fcmp contract une double %38, 0.000000e+00
  br i1 %39, label %40, label %61

40:                                               ; preds = %35
  %41 = add nsw i32 %32, %27
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %0, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7
  %45 = add nsw i32 %32, %28
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fmul contract double %44, %48
  %50 = fdiv contract double %49, %33
  %51 = fdiv contract double %50, %38
  %52 = load i64, i64 addrspace(1)* %29, align 8, !tbaa !11
  br label %53

53:                                               ; preds = %53, %40
  %54 = phi i64 [ %52, %40 ], [ %59, %53 ]
  %55 = bitcast i64 %54 to double
  %56 = fadd contract double %51, %55
  %57 = bitcast double %56 to i64
  %58 = cmpxchg i64 addrspace(1)* %29, i64 %54, i64 %57 syncscope("agent-one-as") monotonic monotonic, align 8
  %59 = extractvalue { i64, i1 } %58, 0
  %60 = icmp eq i64 %54, %59
  br i1 %60, label %61, label %53, !llvm.loop !13

61:                                               ; preds = %53, %31, %35
  %62 = add nuw nsw i32 %32, 1
  %63 = icmp eq i32 %62, %4
  br i1 %63, label %30, label %31, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
