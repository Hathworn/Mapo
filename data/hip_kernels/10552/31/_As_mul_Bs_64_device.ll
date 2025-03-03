; ModuleID = '../data/hip_kernels/10552/31/main.cu'
source_filename = "../data/hip_kernels/10552/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13_As_mul_Bs_64iiPdPiS0_S_S0_S0_S_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !7
  %20 = mul i32 %11, %16
  %21 = add i32 %20, %10
  %22 = icmp slt i32 %21, %1
  br i1 %22, label %23, label %93

23:                                               ; preds = %9
  %24 = udiv i32 %19, %16
  %25 = mul i32 %24, %16
  %26 = icmp ugt i32 %19, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %16
  %30 = icmp sgt i32 %0, 0
  br label %31

31:                                               ; preds = %23, %90
  %32 = phi i32 [ %21, %23 ], [ %91, %90 ]
  %33 = mul nsw i32 %32, %0
  %34 = add nsw i32 %33, %0
  br i1 %30, label %35, label %41

35:                                               ; preds = %31, %35
  %36 = phi i32 [ %39, %35 ], [ %33, %31 ]
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %8, i64 %37
  store double 0.000000e+00, double addrspace(1)* %38, align 8, !tbaa !16
  %39 = add nsw i32 %36, 1
  %40 = icmp slt i32 %39, %34
  br i1 %40, label %35, label %41, !llvm.loop !20

41:                                               ; preds = %35, %31
  %42 = sext i32 %32 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !22, !amdgpu.noclobber !6
  %45 = add nsw i32 %32, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !22, !amdgpu.noclobber !6
  %49 = add nsw i32 %48, -1
  %50 = icmp slt i32 %44, %48
  br i1 %50, label %51, label %90

51:                                               ; preds = %41
  %52 = add nsw i32 %44, -1
  %53 = add nsw i32 %33, -1
  br label %54

54:                                               ; preds = %51, %87
  %55 = phi i32 [ %52, %51 ], [ %88, %87 ]
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !22, !amdgpu.noclobber !6
  %59 = add nsw i32 %58, -1
  %60 = getelementptr inbounds double, double addrspace(1)* %5, i64 %56
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !16
  %62 = sext i32 %59 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %62
  %64 = bitcast i32 addrspace(1)* %63 to <2 x i32> addrspace(1)*
  %65 = load <2 x i32>, <2 x i32> addrspace(1)* %64, align 4, !tbaa !22
  %66 = extractelement <2 x i32> %65, i64 1
  %67 = add nsw i32 %66, -1
  %68 = extractelement <2 x i32> %65, i64 0
  %69 = icmp slt i32 %68, %66
  br i1 %69, label %70, label %87

70:                                               ; preds = %54
  %71 = add nsw i32 %68, -1
  br label %72

72:                                               ; preds = %70, %72
  %73 = phi i32 [ %85, %72 ], [ %71, %70 ]
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !22, !amdgpu.noclobber !6
  %77 = getelementptr inbounds double, double addrspace(1)* %2, i64 %74
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !16
  %79 = fmul contract double %61, %78
  %80 = add i32 %53, %76
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %8, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !16
  %84 = fadd contract double %83, %79
  store double %84, double addrspace(1)* %82, align 8, !tbaa !16
  %85 = add nsw i32 %73, 1
  %86 = icmp slt i32 %85, %67
  br i1 %86, label %72, label %87, !llvm.loop !24

87:                                               ; preds = %72, %54
  %88 = add nsw i32 %55, 1
  %89 = icmp slt i32 %88, %49
  br i1 %89, label %54, label %90, !llvm.loop !25

90:                                               ; preds = %87, %41
  %91 = add i32 %29, %32
  %92 = icmp slt i32 %91, %1
  br i1 %92, label %31, label %93, !llvm.loop !26

93:                                               ; preds = %90, %9
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
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !18, i64 0}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !21}
!26 = distinct !{!26, !21}
