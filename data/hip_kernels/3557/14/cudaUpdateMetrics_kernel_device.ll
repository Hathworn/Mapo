; ModuleID = '../data/hip_kernels/3557/14/main.cu'
source_filename = "../data/hip_kernels/3557/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24cudaUpdateMetrics_kernelPfPiPyS1_PxS2_jjj(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i64 addrspace(1)* nocapture %2, i64 addrspace(1)* nocapture %3, i64 addrspace(1)* nocapture %4, i64 addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %11 = mul i32 %10, %8
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = icmp ult i32 %12, %8
  br i1 %13, label %14, label %33

14:                                               ; preds = %9
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = icmp ult i32 %15, %7
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = icmp ult i32 %17, %6
  %19 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !5
  %27 = load i16, i16 addrspace(4)* %21, align 4, !range !14, !invariant.load !15
  %28 = zext i16 %27 to i32
  %29 = udiv i32 %26, %28
  %30 = mul i32 %29, %28
  %31 = icmp ugt i32 %26, %30
  %32 = zext i1 %31 to i32
  br label %34

33:                                               ; preds = %41, %9
  ret void

34:                                               ; preds = %14, %41
  %35 = phi i32 [ %12, %14 ], [ %43, %41 ]
  br i1 %16, label %36, label %41

36:                                               ; preds = %34
  %37 = add i32 %35, %11
  %38 = mul i32 %37, %7
  %39 = load i16, i16 addrspace(4)* %23, align 2, !range !14, !invariant.load !15
  %40 = zext i16 %39 to i32
  br label %45

41:                                               ; preds = %50, %34
  %42 = add i32 %29, %35
  %43 = add i32 %42, %32
  %44 = icmp ult i32 %43, %8
  br i1 %44, label %34, label %33, !llvm.loop !16

45:                                               ; preds = %36, %50
  %46 = phi i32 [ %15, %36 ], [ %51, %50 ]
  br i1 %18, label %47, label %50

47:                                               ; preds = %45
  %48 = add i32 %38, %46
  %49 = mul i32 %48, %6
  br label %53

50:                                               ; preds = %53, %45
  %51 = add i32 %46, %40
  %52 = icmp ult i32 %51, %7
  br i1 %52, label %45, label %41, !llvm.loop !18

53:                                               ; preds = %47, %53
  %54 = phi i32 [ %17, %47 ], [ %78, %53 ]
  %55 = add i32 %54, %49
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !19, !amdgpu.noclobber !15
  %59 = tail call float @llvm.round.f32(float %58)
  %60 = fptosi float %59 to i32
  %61 = icmp ne i32 %60, 0
  %62 = zext i1 %61 to i32
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !23
  %64 = zext i1 %61 to i64
  %65 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %56
  %66 = load i64, i64 addrspace(1)* %65, align 8, !tbaa !25
  %67 = add i64 %66, %64
  store i64 %67, i64 addrspace(1)* %65, align 8, !tbaa !25
  %68 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %56
  %69 = load i64, i64 addrspace(1)* %68, align 8, !tbaa !25
  %70 = add i64 %69, %64
  store i64 %70, i64 addrspace(1)* %68, align 8, !tbaa !25
  %71 = sext i32 %60 to i64
  %72 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %56
  %73 = load i64, i64 addrspace(1)* %72, align 8, !tbaa !25
  %74 = add nsw i64 %73, %71
  store i64 %74, i64 addrspace(1)* %72, align 8, !tbaa !25
  %75 = getelementptr inbounds i64, i64 addrspace(1)* %5, i64 %56
  %76 = load i64, i64 addrspace(1)* %75, align 8, !tbaa !25
  %77 = add nsw i64 %76, %71
  store i64 %77, i64 addrspace(1)* %75, align 8, !tbaa !25
  %78 = add i32 %54, %28
  %79 = icmp ult i32 %78, %6
  br i1 %79, label %53, label %50, !llvm.loop !27
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.round.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!20 = !{!"float", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !21, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"long long", !21, i64 0}
!27 = distinct !{!27, !17}
