; ModuleID = '../data/hip_kernels/1426/5/main.cu'
source_filename = "../data/hip_kernels/1426/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z29backward_avgpool_layer_kerneliiiiPfS_(i32 %0, i32 %1, i32 %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = freeze i32 %26
  %28 = icmp slt i32 %27, %0
  br i1 %28, label %29, label %94

29:                                               ; preds = %6
  %30 = mul nsw i32 %2, %1
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %94

32:                                               ; preds = %29
  %33 = mul nsw i32 %27, %30
  %34 = sext i32 %27 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %36 = sitofp i32 %30 to float
  %37 = and i32 %30, 3
  %38 = icmp ult i32 %30, 4
  br i1 %38, label %78, label %39

39:                                               ; preds = %32
  %40 = and i32 %30, -4
  br label %41

41:                                               ; preds = %41, %39
  %42 = phi i32 [ 0, %39 ], [ %75, %41 ]
  %43 = phi i32 [ 0, %39 ], [ %76, %41 ]
  %44 = add nsw i32 %42, %33
  %45 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %46 = fdiv contract float %45, %36
  %47 = sext i32 %44 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %4, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = fadd contract float %49, %46
  store float %50, float addrspace(1)* %48, align 4, !tbaa !16
  %51 = or i32 %42, 1
  %52 = add nsw i32 %51, %33
  %53 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %54 = fdiv contract float %53, %36
  %55 = sext i32 %52 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = fadd contract float %57, %54
  store float %58, float addrspace(1)* %56, align 4, !tbaa !16
  %59 = or i32 %42, 2
  %60 = add nsw i32 %59, %33
  %61 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %62 = fdiv contract float %61, %36
  %63 = sext i32 %60 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = fadd contract float %65, %62
  store float %66, float addrspace(1)* %64, align 4, !tbaa !16
  %67 = or i32 %42, 3
  %68 = add nsw i32 %67, %33
  %69 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %70 = fdiv contract float %69, %36
  %71 = sext i32 %68 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fadd contract float %73, %70
  store float %74, float addrspace(1)* %72, align 4, !tbaa !16
  %75 = add nuw nsw i32 %42, 4
  %76 = add i32 %43, 4
  %77 = icmp eq i32 %76, %40
  br i1 %77, label %78, label %41, !llvm.loop !20

78:                                               ; preds = %41, %32
  %79 = phi i32 [ 0, %32 ], [ %75, %41 ]
  %80 = icmp eq i32 %37, 0
  br i1 %80, label %94, label %81

81:                                               ; preds = %78, %81
  %82 = phi i32 [ %91, %81 ], [ %79, %78 ]
  %83 = phi i32 [ %92, %81 ], [ 0, %78 ]
  %84 = add nsw i32 %82, %33
  %85 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %86 = fdiv contract float %85, %36
  %87 = sext i32 %84 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %4, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fadd contract float %89, %86
  store float %90, float addrspace(1)* %88, align 4, !tbaa !16
  %91 = add nuw nsw i32 %82, 1
  %92 = add i32 %83, 1
  %93 = icmp eq i32 %92, %37
  br i1 %93, label %94, label %81, !llvm.loop !22

94:                                               ; preds = %78, %81, %29, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
