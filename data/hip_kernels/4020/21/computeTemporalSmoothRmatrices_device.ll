; ModuleID = '../data/hip_kernels/4020/21/main.cu'
source_filename = "../data/hip_kernels/4020/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30computeTemporalSmoothRmatricesPKfjjjPKjjPf(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %16, %13
  %19 = mul i32 %18, %13
  %20 = icmp ugt i32 %16, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = add i32 %23, %9
  %25 = icmp ult i32 %24, %1
  br i1 %25, label %26, label %77

26:                                               ; preds = %7
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %29 = mul nuw nsw i32 %28, %13
  %30 = add nuw nsw i32 %29, %27
  %31 = sext i32 %24 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !16, !amdgpu.noclobber !5
  %34 = mul nsw i32 %33, %33
  %35 = mul i32 %2, %2
  %36 = sub nsw i32 %24, %5
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = add nsw i32 %1, -1
  %39 = add nsw i32 %24, %5
  %40 = tail call i32 @llvm.smin.i32(i32 %38, i32 %39)
  %41 = icmp ult i32 %30, %34
  br i1 %41, label %42, label %77

42:                                               ; preds = %26
  %43 = icmp sgt i32 %37, %40
  %44 = mul nsw i32 %24, %35
  %45 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %46 = bitcast i8 addrspace(4)* %45 to i16 addrspace(4)*
  %47 = load i16, i16 addrspace(4)* %46, align 2, !range !4, !invariant.load !5
  %48 = zext i16 %47 to i32
  %49 = mul nuw nsw i32 %48, %13
  br label %50

50:                                               ; preds = %42, %59
  %51 = phi i32 [ %30, %42 ], [ %64, %59 ]
  %52 = freeze i32 %51
  %53 = freeze i32 %33
  %54 = sdiv i32 %52, %53
  %55 = mul i32 %54, %53
  %56 = sub i32 %52, %55
  %57 = mul i32 %54, %2
  %58 = add i32 %57, %56
  br i1 %43, label %59, label %66

59:                                               ; preds = %66, %50
  %60 = phi float [ 0.000000e+00, %50 ], [ %74, %66 ]
  %61 = add nsw i32 %58, %44
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %62
  store float %60, float addrspace(1)* %63, align 4, !tbaa !20
  %64 = add i32 %49, %51
  %65 = icmp slt i32 %64, %34
  br i1 %65, label %50, label %77, !llvm.loop !22

66:                                               ; preds = %50, %66
  %67 = phi i32 [ %75, %66 ], [ %37, %50 ]
  %68 = phi float [ %74, %66 ], [ 0.000000e+00, %50 ]
  %69 = mul nsw i32 %67, %35
  %70 = add nsw i32 %69, %58
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !20
  %74 = fadd contract float %68, %73
  %75 = add nuw nsw i32 %67, 1
  %76 = icmp slt i32 %67, %40
  br i1 %76, label %66, label %59, !llvm.loop !24

77:                                               ; preds = %59, %26, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
