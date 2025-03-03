; ModuleID = '../data/hip_kernels/253/9/main.cu'
source_filename = "../data/hip_kernels/253/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12maxgradinputPfS_S_S_iiiiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = sub nsw i32 %6, %8
  %13 = sdiv i32 %12, %10
  %14 = add nsw i32 %13, 1
  %15 = sub nsw i32 %5, %7
  %16 = sdiv i32 %15, %9
  %17 = add nsw i32 %16, 1
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %26 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 2, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 16
  %31 = bitcast i8 addrspace(4)* %30 to i32 addrspace(4)*
  %32 = load i32, i32 addrspace(4)* %31, align 8, !tbaa !7
  %33 = mul i32 %25, %29
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %35 = add i32 %33, %34
  %36 = udiv i32 %32, %29
  %37 = mul i32 %36, %29
  %38 = icmp ugt i32 %32, %37
  %39 = zext i1 %38 to i32
  %40 = add i32 %36, %39
  %41 = mul i32 %40, %29
  %42 = mul nsw i32 %14, %18
  %43 = mul nsw i32 %42, %17
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %46 = mul i32 %18, %5
  %47 = mul i32 %46, %6
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %52 = icmp sgt i32 %35, %16
  br i1 %52, label %94, label %53

53:                                               ; preds = %11
  %54 = icmp sgt i32 %19, %13
  %55 = mul i32 %9, %6
  br label %56

56:                                               ; preds = %53, %91
  %57 = phi i32 [ %35, %53 ], [ %92, %91 ]
  br i1 %54, label %91, label %58

58:                                               ; preds = %56
  %59 = mul i32 %55, %57
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %49, i64 %60
  %62 = mul nsw i32 %57, %14
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %45, i64 %63
  %65 = getelementptr inbounds float, float addrspace(1)* %50, i64 %63
  %66 = getelementptr inbounds float, float addrspace(1)* %51, i64 %63
  br label %67

67:                                               ; preds = %58, %67
  %68 = phi i32 [ %19, %58 ], [ %89, %67 ]
  %69 = mul nsw i32 %68, %10
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %61, i64 %70
  %72 = zext i32 %68 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %64, i64 %72
  %74 = getelementptr inbounds float, float addrspace(1)* %65, i64 %72
  %75 = getelementptr inbounds float, float addrspace(1)* %66, i64 %72
  %76 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  %77 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %78 = fadd contract float %77, -1.000000e+00
  %79 = fptosi float %78 to i32
  %80 = load float, float addrspace(1)* %75, align 4, !tbaa !16
  %81 = fadd contract float %80, -1.000000e+00
  %82 = fptosi float %81 to i32
  %83 = mul nsw i32 %82, %6
  %84 = add nsw i32 %83, %79
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %71, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fadd contract float %76, %87
  store float %88, float addrspace(1)* %86, align 4, !tbaa !16
  %89 = add nuw nsw i32 %68, %24
  %90 = icmp sgt i32 %89, %13
  br i1 %90, label %91, label %67, !llvm.loop !20

91:                                               ; preds = %67, %56
  %92 = add nsw i32 %57, %41
  %93 = icmp sgt i32 %92, %16
  br i1 %93, label %94, label %56, !llvm.loop !22

94:                                               ; preds = %91, %11
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
!7 = !{!8, !12, i64 16}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
