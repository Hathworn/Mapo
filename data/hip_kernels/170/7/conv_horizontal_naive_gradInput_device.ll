; ModuleID = '../data/hip_kernels/170/7/main.cu'
source_filename = "../data/hip_kernels/170/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z31conv_horizontal_naive_gradInputiPfPKfS1_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %31

21:                                               ; preds = %7
  %22 = add nsw i32 %5, -1
  %23 = add i32 %22, %6
  %24 = mul nsw i32 %23, %4
  %25 = udiv i32 %16, %13
  %26 = mul i32 %25, %13
  %27 = icmp ugt i32 %16, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %13
  br label %32

31:                                               ; preds = %51, %7
  ret void

32:                                               ; preds = %21, %51
  %33 = phi i32 [ %19, %21 ], [ %52, %51 ]
  %34 = freeze i32 %33
  %35 = freeze i32 %23
  %36 = sdiv i32 %34, %35
  %37 = mul i32 %36, %35
  %38 = sub i32 %34, %37
  %39 = mul nsw i32 %36, %5
  %40 = add nsw i32 %39, %38
  %41 = sdiv i32 %33, %24
  %42 = mul nsw i32 %41, %6
  %43 = sub nsw i32 %38, %5
  %44 = tail call i32 @llvm.smax.i32(i32 %43, i32 -1)
  %45 = add nsw i32 %38, 1
  %46 = tail call i32 @llvm.smin.i32(i32 %6, i32 %45)
  %47 = sext i32 %33 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  store float 0.000000e+00, float addrspace(1)* %48, align 4, !tbaa !16
  %49 = add nsw i32 %44, 1
  %50 = icmp slt i32 %49, %46
  br i1 %50, label %54, label %51

51:                                               ; preds = %54, %32
  %52 = add i32 %30, %33
  %53 = icmp slt i32 %52, %0
  br i1 %53, label %32, label %31, !llvm.loop !20

54:                                               ; preds = %32, %54
  %55 = phi float [ %66, %54 ], [ 0.000000e+00, %32 ]
  %56 = phi i32 [ %67, %54 ], [ %49, %32 ]
  %57 = add nsw i32 %56, %42
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = sub i32 %40, %56
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fmul contract float %60, %64
  %66 = fadd contract float %55, %65
  store float %66, float addrspace(1)* %48, align 4, !tbaa !16
  %67 = add nsw i32 %56, 1
  %68 = icmp slt i32 %67, %46
  br i1 %68, label %54, label %51, !llvm.loop !22
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
