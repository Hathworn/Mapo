; ModuleID = '../data/hip_kernels/5755/2/main.cu'
source_filename = "../data/hip_kernels/5755/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22cosineSimilarityKernelPdiiS_S_S_(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = freeze i32 %1
  %21 = freeze i32 %19
  %22 = sdiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  %27 = add nsw i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = freeze i32 %2
  %30 = freeze i32 %14
  %31 = sdiv i32 %29, %30
  %32 = mul i32 %31, %30
  %33 = sub i32 %29, %32
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = add nsw i32 %31, %35
  %37 = mul i32 %27, %28
  %38 = add nsw i32 %37, %27
  %39 = tail call i32 @llvm.smin.i32(i32 %38, i32 %1)
  %40 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %41 = mul i32 %36, %40
  %42 = add nsw i32 %41, %36
  %43 = tail call i32 @llvm.smin.i32(i32 %42, i32 %2)
  %44 = icmp slt i32 %37, %39
  br i1 %44, label %45, label %53

45:                                               ; preds = %6
  %46 = icmp slt i32 %41, %43
  br label %47

47:                                               ; preds = %45, %54
  %48 = phi i32 [ %37, %45 ], [ %55, %54 ]
  br i1 %46, label %49, label %54

49:                                               ; preds = %47
  %50 = mul nsw i32 %48, %2
  %51 = sext i32 %48 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %3, i64 %51
  br label %57

53:                                               ; preds = %54, %6
  ret void

54:                                               ; preds = %57, %47
  %55 = add nsw i32 %48, 1
  %56 = icmp slt i32 %55, %39
  br i1 %56, label %47, label %53, !llvm.loop !16

57:                                               ; preds = %49, %57
  %58 = phi i32 [ %41, %49 ], [ %70, %57 ]
  %59 = add nsw i32 %58, %50
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !18
  %63 = load double, double addrspace(1)* %52, align 8, !tbaa !18
  %64 = sext i32 %58 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %4, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !18
  %67 = fmul contract double %63, %66
  %68 = fdiv contract double %62, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %5, i64 %60
  store double %68, double addrspace(1)* %69, align 8, !tbaa !18
  %70 = add nsw i32 %58, 1
  %71 = icmp slt i32 %70, %43
  br i1 %71, label %57, label %54, !llvm.loop !22
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"double", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
