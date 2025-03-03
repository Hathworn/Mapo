; ModuleID = '../data/hip_kernels/2766/2/main.cu'
source_filename = "../data/hip_kernels/2766/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25cudaUpdateActivity_kernelPiPcPjS1_S_PyS2_jjjy(i32 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i64 addrspace(1)* nocapture readnone %5, i64 addrspace(1)* nocapture readnone %6, i32 %7, i32 %8, i32 %9, i64 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %13 = mul i32 %12, %9
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = icmp ult i32 %14, %9
  br i1 %15, label %16, label %35

16:                                               ; preds = %11
  %17 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %18 = icmp ult i32 %17, %8
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %20 = icmp ult i32 %19, %7
  %21 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = getelementptr i8, i8 addrspace(4)* %21, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !5
  %29 = load i16, i16 addrspace(4)* %23, align 4, !range !14, !invariant.load !15
  %30 = zext i16 %29 to i32
  %31 = udiv i32 %28, %30
  %32 = mul i32 %31, %30
  %33 = icmp ugt i32 %28, %32
  %34 = zext i1 %33 to i32
  br label %36

35:                                               ; preds = %43, %11
  ret void

36:                                               ; preds = %16, %43
  %37 = phi i32 [ %14, %16 ], [ %45, %43 ]
  br i1 %18, label %38, label %43

38:                                               ; preds = %36
  %39 = add i32 %37, %13
  %40 = mul i32 %39, %8
  %41 = load i16, i16 addrspace(4)* %25, align 2, !range !14, !invariant.load !15
  %42 = zext i16 %41 to i32
  br label %47

43:                                               ; preds = %52, %36
  %44 = add i32 %31, %37
  %45 = add i32 %44, %34
  %46 = icmp ult i32 %45, %9
  br i1 %46, label %36, label %35, !llvm.loop !16

47:                                               ; preds = %38, %52
  %48 = phi i32 [ %17, %38 ], [ %53, %52 ]
  br i1 %20, label %49, label %52

49:                                               ; preds = %47
  %50 = add i32 %40, %48
  %51 = mul i32 %50, %7
  br label %55

52:                                               ; preds = %65, %47
  %53 = add i32 %48, %42
  %54 = icmp ult i32 %53, %8
  br i1 %54, label %47, label %43, !llvm.loop !18

55:                                               ; preds = %49, %65
  %56 = phi i32 [ %19, %49 ], [ %78, %65 ]
  %57 = add i32 %56, %51
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !19
  %61 = tail call i32 @llvm.abs.i32(i32 %60, i1 true)
  %62 = icmp eq i32 %60, 0
  br i1 %62, label %65, label %63

63:                                               ; preds = %55
  %64 = sdiv i32 %60, %61
  br label %65

65:                                               ; preds = %55, %63
  %66 = phi i32 [ %64, %63 ], [ 0, %55 ]
  %67 = trunc i32 %66 to i8
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %58
  store i8 %67, i8 addrspace(1)* %68, align 1, !tbaa !23
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %58
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !19
  %71 = add i32 %70, %61
  store i32 %71, i32 addrspace(1)* %69, align 4, !tbaa !19
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %58
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !19
  %74 = add i32 %73, %61
  store i32 %74, i32 addrspace(1)* %72, align 4, !tbaa !19
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %58
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !19
  %77 = add nsw i32 %76, %60
  store i32 %77, i32 addrspace(1)* %75, align 4, !tbaa !19
  %78 = add i32 %56, %30
  %79 = icmp ult i32 %78, %7
  br i1 %79, label %55, label %52, !llvm.loop !24
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
declare i32 @llvm.amdgcn.workgroup.id.z() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!21, !21, i64 0}
!24 = distinct !{!24, !17}
