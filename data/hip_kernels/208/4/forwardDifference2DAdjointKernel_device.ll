; ModuleID = '../data/hip_kernels/208/4/main.cu'
source_filename = "../data/hip_kernels/208/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32forwardDifference2DAdjointKerneliiPKfS0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 8, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %17 = add nuw nsw i32 %16, 1
  %18 = add i32 %17, %15
  %19 = add nsw i32 %0, -1
  %20 = icmp ult i32 %18, %19
  br i1 %20, label %21, label %42

21:                                               ; preds = %5
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 4, !tbaa !16
  %30 = mul i32 %22, %26
  %31 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %32 = add nuw nsw i32 %31, 1
  %33 = add i32 %32, %30
  %34 = add nsw i32 %1, -1
  %35 = icmp ult i32 %33, %34
  %36 = udiv i32 %14, %11
  %37 = mul i32 %36, %11
  %38 = icmp ugt i32 %14, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %11
  br label %43

42:                                               ; preds = %53, %5
  ret void

43:                                               ; preds = %21, %53
  %44 = phi i32 [ %18, %21 ], [ %54, %53 ]
  br i1 %35, label %45, label %53

45:                                               ; preds = %43
  %46 = mul i32 %44, %1
  %47 = udiv i32 %29, %26
  %48 = mul i32 %47, %26
  %49 = icmp ugt i32 %29, %48
  %50 = zext i1 %49 to i32
  %51 = add i32 %47, %50
  %52 = mul i32 %51, %26
  br label %56

53:                                               ; preds = %56, %43
  %54 = add i32 %41, %44
  %55 = icmp ult i32 %54, %19
  br i1 %55, label %43, label %42, !llvm.loop !17

56:                                               ; preds = %45, %56
  %57 = phi i32 [ %33, %45 ], [ %76, %56 ]
  %58 = add i32 %57, %46
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !19
  %62 = add i32 %58, -1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !19
  %66 = fsub contract float %65, %61
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !19
  %69 = fsub contract float %66, %68
  %70 = sub i32 %58, %1
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %3, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !19
  %74 = fadd contract float %69, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  store float %74, float addrspace(1)* %75, align 4, !tbaa !19
  %76 = add i32 %52, %57
  %77 = icmp ult i32 %76, %34
  br i1 %77, label %56, label %53, !llvm.loop !23
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
!6 = !{!7, !11, i64 16}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = distinct !{!23, !18}
