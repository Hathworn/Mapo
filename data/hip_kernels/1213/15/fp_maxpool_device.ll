; ModuleID = '../data/hip_kernels/1213/15/main.cu'
source_filename = "../data/hip_kernels/1213/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10fp_maxpoolPfS_iiiib(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i1 %6) local_unnamed_addr #0 {
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
  %26 = mul i32 %4, %2
  %27 = mul i32 %26, %26
  %28 = mul i32 %27, %5
  %29 = add nsw i32 %2, -1
  %30 = sdiv i32 %29, -2
  %31 = mul nsw i32 %19, %28
  %32 = sdiv i32 %31, %25
  %33 = add nsw i32 %19, 1
  %34 = mul nsw i32 %33, %28
  %35 = sdiv i32 %34, %25
  %36 = icmp slt i32 %32, %35
  br i1 %36, label %37, label %39

37:                                               ; preds = %7
  %38 = select i1 %6, i32 %30, i32 0
  br label %40

39:                                               ; preds = %89, %7
  ret void

40:                                               ; preds = %37, %89
  %41 = phi i32 [ %90, %89 ], [ %32, %37 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %2
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = freeze i32 %2
  %48 = sdiv i32 %44, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %44, %49
  %51 = freeze i32 %5
  %52 = sdiv i32 %48, %51
  %53 = mul i32 %52, %51
  %54 = sub i32 %48, %53
  %55 = freeze i32 %4
  %56 = sdiv i32 %52, %55
  %57 = mul i32 %56, %55
  %58 = sub i32 %52, %57
  %59 = srem i32 %56, %4
  %60 = add nsw i32 %58, %46
  %61 = add nsw i32 %59, %50
  %62 = add i32 %61, %30
  %63 = add nsw i32 %59, %50
  %64 = select i1 %6, i32 %62, i32 %63
  %65 = add i32 %60, %38
  %66 = icmp sgt i32 %65, -1
  br i1 %66, label %67, label %89

67:                                               ; preds = %40
  %68 = icmp slt i32 %65, %3
  %69 = icmp sgt i32 %64, -1
  %70 = select i1 %68, i1 %69, i1 false
  %71 = icmp slt i32 %64, %3
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %73, label %89

73:                                               ; preds = %67
  %74 = mul nsw i32 %54, %3
  %75 = add nsw i32 %64, %74
  %76 = mul nsw i32 %75, %3
  %77 = add nsw i32 %76, %65
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fcmp contract ogt float %80, -1.000000e+02
  br i1 %81, label %82, label %89

82:                                               ; preds = %73
  %83 = mul nsw i32 %54, %4
  %84 = add nsw i32 %59, %83
  %85 = mul nsw i32 %84, %4
  %86 = add nsw i32 %85, %58
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %80, float addrspace(1)* %88, align 4, !tbaa !16
  br label %89

89:                                               ; preds = %73, %82, %67, %40
  %90 = add nsw i32 %41, 1
  %91 = icmp slt i32 %90, %35
  br i1 %91, label %40, label %39, !llvm.loop !20
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
