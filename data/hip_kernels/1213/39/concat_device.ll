; ModuleID = '../data/hip_kernels/1213/39/main.cu'
source_filename = "../data/hip_kernels/1213/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6concatPfS_S_S_mmmmmS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8, float addrspace(1)* nocapture writeonly %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %16
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = zext i32 %23 to i64
  %25 = icmp ult i64 %24, %8
  br i1 %25, label %26, label %78

26:                                               ; preds = %11
  %27 = sext i32 %10 to i64
  %28 = add i64 %5, %4
  %29 = add i64 %28, %6
  %30 = udiv i32 %19, %16
  %31 = mul i32 %30, %16
  %32 = icmp ugt i32 %19, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %16
  %36 = zext i32 %35 to i64
  br label %37

37:                                               ; preds = %26, %75
  %38 = phi i64 [ %24, %26 ], [ %76, %75 ]
  %39 = udiv i64 %38, %27
  %40 = mul i64 %39, %27
  %41 = sub nuw i64 %38, %40
  %42 = shl i64 %41, 32
  %43 = ashr exact i64 %42, 32
  %44 = icmp ult i64 %43, %4
  br i1 %44, label %45, label %51

45:                                               ; preds = %37
  %46 = mul i64 %39, %4
  %47 = add i64 %43, %46
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = getelementptr inbounds float, float addrspace(1)* %9, i64 %38
  store float %49, float addrspace(1)* %50, align 4, !tbaa !16
  br label %75

51:                                               ; preds = %37
  %52 = icmp ult i64 %43, %28
  br i1 %52, label %53, label %60

53:                                               ; preds = %51
  %54 = mul i64 %39, %5
  %55 = sub i64 %54, %4
  %56 = add i64 %55, %43
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16
  %59 = getelementptr inbounds float, float addrspace(1)* %9, i64 %38
  store float %58, float addrspace(1)* %59, align 4, !tbaa !16
  br label %75

60:                                               ; preds = %51
  %61 = icmp ult i64 %43, %29
  %62 = getelementptr inbounds float, float addrspace(1)* %9, i64 %38
  br i1 %61, label %63, label %69

63:                                               ; preds = %60
  %64 = mul i64 %39, %6
  %65 = sub i64 %64, %28
  %66 = add i64 %65, %43
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  store float %68, float addrspace(1)* %62, align 4, !tbaa !16
  br label %75

69:                                               ; preds = %60
  %70 = mul i64 %39, %7
  %71 = sub i64 %70, %29
  %72 = add i64 %71, %43
  %73 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !16
  store float %74, float addrspace(1)* %62, align 4, !tbaa !16
  br label %75

75:                                               ; preds = %53, %69, %63, %45
  %76 = add i64 %38, %36
  %77 = icmp ult i64 %76, %8
  br i1 %77, label %37, label %78, !llvm.loop !20

78:                                               ; preds = %75, %11
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
