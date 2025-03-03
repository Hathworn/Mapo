; ModuleID = '../data/hip_kernels/7064/9/main.cu'
source_filename = "../data/hip_kernels/7064/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6gJoin2PfmmPKfmS1_m(float addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2, float addrspace(1)* nocapture readonly %3, i64 %4, float addrspace(1)* nocapture readonly %5, i64 %6) local_unnamed_addr #0 {
  %8 = add i64 %6, %4
  %9 = trunc i64 %8 to i32
  %10 = mul i64 %8, %1
  %11 = trunc i64 %10 to i32
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %30

13:                                               ; preds = %7
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = trunc i64 %4 to i32
  %16 = icmp eq i64 %2, 0
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = load i16, i16 addrspace(4)* %20, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %23, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %23, %27
  %29 = zext i1 %28 to i32
  br label %31

30:                                               ; preds = %74, %7
  ret void

31:                                               ; preds = %13, %74
  %32 = phi i32 [ 0, %13 ], [ %76, %74 ]
  %33 = add i32 %32, %14
  %34 = icmp slt i32 %33, %11
  br i1 %34, label %35, label %74

35:                                               ; preds = %31
  %36 = sext i32 %33 to i64
  %37 = mul i64 %36, %2
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %39 = freeze i32 %33
  %40 = freeze i32 %9
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %40
  %43 = sub i32 %39, %42
  %44 = zext i32 %41 to i64
  %45 = sext i32 %43 to i64
  %46 = mul i32 %41, %15
  %47 = add i32 %46, %43
  %48 = mul i64 %44, %6
  %49 = sub i64 %45, %4
  %50 = add i64 %49, %48
  %51 = sext i32 %47 to i64
  %52 = mul i64 %51, %2
  %53 = getelementptr inbounds float, float addrspace(1)* %3, i64 %52
  %54 = shl i64 %50, 32
  %55 = ashr exact i64 %54, 32
  %56 = mul i64 %55, %2
  %57 = getelementptr inbounds float, float addrspace(1)* %5, i64 %56
  br i1 %16, label %74, label %58

58:                                               ; preds = %35
  %59 = icmp ult i64 %45, %4
  %60 = select i1 %59, float addrspace(1)* %53, float addrspace(1)* %57
  br label %61

61:                                               ; preds = %58, %70
  %62 = phi i32 [ 0, %58 ], [ %71, %70 ]
  %63 = add i32 %62, %17
  %64 = sext i32 %63 to i64
  %65 = icmp ult i64 %64, %2
  br i1 %65, label %66, label %70

66:                                               ; preds = %61
  %67 = getelementptr inbounds float, float addrspace(1)* %38, i64 %64
  %68 = getelementptr inbounds float, float addrspace(1)* %60, i64 %64
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !15
  store float %69, float addrspace(1)* %67, align 4, !tbaa !15
  br label %70

70:                                               ; preds = %66, %61
  %71 = add i32 %62, %25
  %72 = sext i32 %71 to i64
  %73 = icmp ult i64 %72, %2
  br i1 %73, label %61, label %74, !llvm.loop !19

74:                                               ; preds = %70, %35, %31
  %75 = add i32 %26, %32
  %76 = add i32 %75, %29
  %77 = icmp slt i32 %76, %11
  br i1 %77, label %31, label %30, !llvm.loop !21
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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
