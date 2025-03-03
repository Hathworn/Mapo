; ModuleID = '../data/hip_kernels/5434/6/main.cu'
source_filename = "../data/hip_kernels/5434/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10finiteDiffiddiiPdS_(i32 %0, double %1, double %2, i32 %3, i32 %4, double addrspace(1)* nocapture %5, double addrspace(1)* nocapture %6) local_unnamed_addr #0 {
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
  %20 = udiv i32 %16, %13
  %21 = mul i32 %20, %13
  %22 = icmp ugt i32 %16, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %13
  %26 = icmp sgt i32 %3, 0
  br i1 %26, label %27, label %36

27:                                               ; preds = %7
  %28 = icmp slt i32 %19, %4
  %29 = add nsw i32 %19, 1
  %30 = icmp slt i32 %29, %4
  %31 = sitofp i32 %0 to double
  %32 = fmul contract double %31, %1
  %33 = fdiv contract double %32, %2
  br label %34

34:                                               ; preds = %27, %46
  %35 = phi i32 [ 0, %27 ], [ %47, %46 ]
  br i1 %28, label %38, label %37

36:                                               ; preds = %46, %7
  ret void

37:                                               ; preds = %38, %34
  br i1 %30, label %49, label %46

38:                                               ; preds = %34, %38
  %39 = phi i32 [ %44, %38 ], [ %19, %34 ]
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %5, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !16
  %43 = getelementptr inbounds double, double addrspace(1)* %6, i64 %40
  store double %42, double addrspace(1)* %43, align 8, !tbaa !16
  %44 = add nsw i32 %39, %25
  %45 = icmp slt i32 %44, %4
  br i1 %45, label %38, label %37, !llvm.loop !20

46:                                               ; preds = %49, %37
  %47 = add nuw nsw i32 %35, 1
  %48 = icmp eq i32 %47, %3
  br i1 %48, label %36, label %34, !llvm.loop !22

49:                                               ; preds = %37, %49
  %50 = phi i32 [ %62, %49 ], [ %29, %37 ]
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %6, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = add nsw i32 %50, -1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %6, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16
  %58 = fsub contract double %53, %57
  %59 = fmul contract double %33, %58
  %60 = fsub contract double %53, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %5, i64 %51
  store double %60, double addrspace(1)* %61, align 8, !tbaa !16
  %62 = add nsw i32 %50, %25
  %63 = icmp slt i32 %62, %4
  br i1 %63, label %49, label %46, !llvm.loop !23
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
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
