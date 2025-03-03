; ModuleID = '../data/hip_kernels/15/8/main.cu'
source_filename = "../data/hip_kernels/15/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@hcri = protected addrspace(4) externally_initialized global double 0.000000e+00, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @hcri to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16TopBottomBound2DPdS_S_S_iii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !7
  %18 = mul i32 %9, %14
  %19 = add i32 %18, %8
  %20 = icmp slt i32 %19, %6
  br i1 %20, label %21, label %79

21:                                               ; preds = %7
  %22 = icmp eq i32 %4, 0
  %23 = load double, double addrspace(4)* @hcri, align 8
  %24 = add nsw i32 %5, -1
  %25 = mul nsw i32 %24, %6
  %26 = add nsw i32 %5, -2
  %27 = mul nsw i32 %26, %6
  %28 = udiv i32 %17, %14
  %29 = mul i32 %28, %14
  %30 = icmp ugt i32 %17, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %14
  br label %34

34:                                               ; preds = %21, %66
  %35 = phi i32 [ %19, %21 ], [ %77, %66 ]
  br i1 %22, label %36, label %50

36:                                               ; preds = %34
  %37 = add nsw i32 %35, %6
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !16
  %41 = sext i32 %35 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  store double %40, double addrspace(1)* %42, align 8, !tbaa !16
  %43 = add nsw i32 %35, %27
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16
  %47 = add nsw i32 %35, %25
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  store double %46, double addrspace(1)* %49, align 8, !tbaa !16
  br label %66

50:                                               ; preds = %34
  %51 = sext i32 %35 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = fadd contract double %23, %53
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  store double %54, double addrspace(1)* %55, align 8, !tbaa !16
  %56 = add nsw i32 %35, %25
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16
  %60 = fadd contract double %23, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  store double %60, double addrspace(1)* %61, align 8, !tbaa !16
  %62 = add nsw i32 %35, %6
  %63 = sext i32 %62 to i64
  %64 = add nsw i32 %35, %27
  %65 = sext i32 %64 to i64
  br label %66

66:                                               ; preds = %50, %36
  %67 = phi i64 [ %57, %50 ], [ %48, %36 ]
  %68 = phi i64 [ %65, %50 ], [ %44, %36 ]
  %69 = phi i64 [ %51, %50 ], [ %41, %36 ]
  %70 = phi i64 [ %63, %50 ], [ %38, %36 ]
  %71 = getelementptr inbounds double, double addrspace(1)* %3, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !16
  %73 = getelementptr inbounds double, double addrspace(1)* %3, i64 %69
  store double %72, double addrspace(1)* %73, align 8, !tbaa !16
  %74 = getelementptr inbounds double, double addrspace(1)* %2, i64 %68
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !16
  %76 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  store double %75, double addrspace(1)* %76, align 8, !tbaa !16
  %77 = add i32 %33, %35
  %78 = icmp slt i32 %77, %6
  br i1 %78, label %34, label %79, !llvm.loop !20

79:                                               ; preds = %66, %7
  ret void
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
