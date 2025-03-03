; ModuleID = '../data/hip_kernels/2824/97/main.cu'
source_filename = "../data/hip_kernels/2824/97/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4sum4PfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %33

18:                                               ; preds = %4
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !16
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !16
  %24 = fadd contract float %21, %23
  %25 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  store float %24, float addrspace(1)* %25, align 4, !tbaa !16
  %26 = udiv i32 %13, %10
  %27 = mul i32 %26, %10
  %28 = icmp ugt i32 %13, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %10
  %32 = add i32 %31, %16
  br label %33

33:                                               ; preds = %4, %18
  %34 = phi i32 [ %32, %18 ], [ %16, %4 ]
  %35 = icmp slt i32 %34, %3
  br i1 %35, label %36, label %51

36:                                               ; preds = %33
  %37 = sext i32 %34 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !16
  %42 = fadd contract float %39, %41
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float %42, float addrspace(1)* %43, align 4, !tbaa !16
  %44 = udiv i32 %13, %10
  %45 = mul i32 %44, %10
  %46 = icmp ugt i32 %13, %45
  %47 = zext i1 %46 to i32
  %48 = add i32 %44, %47
  %49 = mul i32 %48, %10
  %50 = add i32 %49, %34
  br label %51

51:                                               ; preds = %36, %33
  %52 = phi i32 [ %50, %36 ], [ %34, %33 ]
  %53 = icmp slt i32 %52, %3
  br i1 %53, label %54, label %69

54:                                               ; preds = %51
  %55 = sext i32 %52 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !16
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = fadd contract float %57, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float %60, float addrspace(1)* %61, align 4, !tbaa !16
  %62 = udiv i32 %13, %10
  %63 = mul i32 %62, %10
  %64 = icmp ugt i32 %13, %63
  %65 = zext i1 %64 to i32
  %66 = add i32 %62, %65
  %67 = mul i32 %66, %10
  %68 = add i32 %67, %52
  br label %69

69:                                               ; preds = %54, %51
  %70 = phi i32 [ %68, %54 ], [ %52, %51 ]
  %71 = icmp slt i32 %70, %3
  br i1 %71, label %72, label %80

72:                                               ; preds = %69
  %73 = sext i32 %70 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fadd contract float %75, %77
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  store float %78, float addrspace(1)* %79, align 4, !tbaa !16
  br label %80

80:                                               ; preds = %72, %69
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
