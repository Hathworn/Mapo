; ModuleID = '../data/hip_kernels/32/5/main.cu'
source_filename = "../data/hip_kernels/32/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@hcri = protected addrspace(4) externally_initialized global double 0.000000e+00, align 8
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @hcri to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16LeftRightBound2DPdS_S_S_iii(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  %20 = icmp slt i32 %19, %5
  br i1 %20, label %21, label %80

21:                                               ; preds = %7
  %22 = icmp eq i32 %4, 0
  %23 = load double, double addrspace(4)* @hcri, align 8
  %24 = udiv i32 %17, %14
  %25 = mul i32 %24, %14
  %26 = icmp ugt i32 %17, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %14
  br label %30

30:                                               ; preds = %21, %67
  %31 = phi i32 [ %19, %21 ], [ %78, %67 ]
  %32 = mul nsw i32 %31, %6
  br i1 %22, label %33, label %49

33:                                               ; preds = %30
  %34 = add nsw i32 %32, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !16
  %38 = sext i32 %32 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  store double %37, double addrspace(1)* %39, align 8, !tbaa !16
  %40 = add nsw i32 %31, 1
  %41 = mul nsw i32 %40, %6
  %42 = add nsw i32 %41, -2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !16
  %46 = add nsw i32 %41, -1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  store double %45, double addrspace(1)* %48, align 8, !tbaa !16
  br label %67

49:                                               ; preds = %30
  %50 = sext i32 %32 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !16
  %53 = fadd contract double %23, %52
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  store double %53, double addrspace(1)* %54, align 8, !tbaa !16
  %55 = add nsw i32 %31, 1
  %56 = mul nsw i32 %55, %6
  %57 = add nsw i32 %56, -1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !16
  %61 = fadd contract double %23, %60
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %58
  store double %61, double addrspace(1)* %62, align 8, !tbaa !16
  %63 = add nsw i32 %32, 1
  %64 = sext i32 %63 to i64
  %65 = add nsw i32 %56, -2
  %66 = sext i32 %65 to i64
  br label %67

67:                                               ; preds = %49, %33
  %68 = phi i64 [ %58, %49 ], [ %47, %33 ]
  %69 = phi i64 [ %66, %49 ], [ %43, %33 ]
  %70 = phi i64 [ %50, %49 ], [ %38, %33 ]
  %71 = phi i64 [ %64, %49 ], [ %35, %33 ]
  %72 = getelementptr inbounds double, double addrspace(1)* %3, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16
  %74 = getelementptr inbounds double, double addrspace(1)* %3, i64 %70
  store double %73, double addrspace(1)* %74, align 8, !tbaa !16
  %75 = getelementptr inbounds double, double addrspace(1)* %2, i64 %69
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !16
  %77 = getelementptr inbounds double, double addrspace(1)* %2, i64 %68
  store double %76, double addrspace(1)* %77, align 8, !tbaa !16
  %78 = add i32 %29, %31
  %79 = icmp slt i32 %78, %5
  br i1 %79, label %30, label %80, !llvm.loop !20

80:                                               ; preds = %67, %7
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
