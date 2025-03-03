; ModuleID = '../data/hip_kernels/16911/3/main.cu'
source_filename = "../data/hip_kernels/16911/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13get_iou_cuda_iiPiS_PlS_Pf(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i64 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp slt i32 %8, %1
  br i1 %9, label %10, label %25

10:                                               ; preds = %7
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = icmp slt i32 %11, %0
  %13 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !5
  %19 = load i16, i16 addrspace(4)* %15, align 4, !range !14, !invariant.load !15
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %18, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  br label %26

25:                                               ; preds = %38, %7
  ret void

26:                                               ; preds = %10, %38
  %27 = phi i32 [ %8, %10 ], [ %40, %38 ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !15
  %31 = add nsw i32 %27, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !15
  br i1 %12, label %35, label %38

35:                                               ; preds = %26
  %36 = icmp slt i32 %30, %34
  %37 = mul nsw i32 %27, %0
  br label %42

38:                                               ; preds = %47, %26
  %39 = add i32 %21, %27
  %40 = add i32 %39, %24
  %41 = icmp slt i32 %40, %1
  br i1 %41, label %26, label %25, !llvm.loop !20

42:                                               ; preds = %35, %47
  %43 = phi i32 [ %11, %35 ], [ %62, %47 ]
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !15
  br i1 %36, label %64, label %47

47:                                               ; preds = %64, %42
  %48 = phi i32 [ 0, %42 ], [ %76, %64 ]
  %49 = sitofp i32 %48 to float
  %50 = fpext float %49 to double
  %51 = add i32 %34, %46
  %52 = add i32 %30, %48
  %53 = sub i32 %51, %52
  %54 = sitofp i32 %53 to float
  %55 = fpext float %54 to double
  %56 = fadd contract double %55, 1.000000e-05
  %57 = fdiv contract double %50, %56
  %58 = fptrunc double %57 to float
  %59 = add nsw i32 %43, %37
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %6, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !22
  %62 = add i32 %43, %20
  %63 = icmp slt i32 %62, %0
  br i1 %63, label %42, label %38, !llvm.loop !24

64:                                               ; preds = %42, %64
  %65 = phi i32 [ %77, %64 ], [ %30, %42 ]
  %66 = phi i32 [ %76, %64 ], [ 0, %42 ]
  %67 = sext i32 %65 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !16, !amdgpu.noclobber !15
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %70
  %72 = load i64, i64 addrspace(1)* %71, align 8, !tbaa !25, !amdgpu.noclobber !15
  %73 = trunc i64 %72 to i32
  %74 = icmp eq i32 %43, %73
  %75 = zext i1 %74 to i32
  %76 = add nuw nsw i32 %66, %75
  %77 = add nsw i32 %65, 1
  %78 = icmp slt i32 %77, %34
  br i1 %78, label %64, label %47, !llvm.loop !27
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
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !18, i64 0}
!24 = distinct !{!24, !21}
!25 = !{!26, !26, i64 0}
!26 = !{!"long", !18, i64 0}
!27 = distinct !{!27, !21}
