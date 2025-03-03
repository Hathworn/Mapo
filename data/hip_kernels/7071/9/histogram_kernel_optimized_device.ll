; ModuleID = '../data/hip_kernels/7071/9/main.cu'
source_filename = "../data/hip_kernels/7071/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@bins_s = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z26histogram_kernel_optimizedPjS_jj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp ult i32 %5, %3
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %6, label %8, label %18

8:                                                ; preds = %4
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  br label %13

13:                                               ; preds = %8, %13
  %14 = phi i32 [ %5, %8 ], [ %16, %13 ]
  %15 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @bins_s, i32 0, i32 %14
  store i32 0, i32 addrspace(3)* %15, align 4, !tbaa !7
  %16 = add i32 %14, %12
  %17 = icmp ult i32 %16, %3
  br i1 %17, label %13, label %18, !llvm.loop !11

18:                                               ; preds = %13, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !5, !invariant.load !6
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !13
  %27 = mul i32 %19, %23
  %28 = add i32 %27, %5
  %29 = icmp ult i32 %28, %2
  br i1 %29, label %30, label %55

30:                                               ; preds = %18
  %31 = udiv i32 %26, %23
  %32 = mul i32 %31, %23
  %33 = icmp ugt i32 %26, %32
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = mul i32 %35, %23
  br label %37

37:                                               ; preds = %30, %50
  %38 = phi i32 [ 0, %30 ], [ %52, %50 ]
  %39 = phi i32 [ 0, %30 ], [ %51, %50 ]
  %40 = phi i32 [ %28, %30 ], [ %53, %50 ]
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  %44 = icmp eq i32 %43, %38
  br i1 %44, label %48, label %45

45:                                               ; preds = %37
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @bins_s, i32 0, i32 %38
  %47 = atomicrmw add i32 addrspace(3)* %46, i32 %39 syncscope("agent-one-as") monotonic, align 4
  br label %50

48:                                               ; preds = %37
  %49 = add i32 %39, 1
  br label %50

50:                                               ; preds = %48, %45
  %51 = phi i32 [ 1, %45 ], [ %49, %48 ]
  %52 = phi i32 [ %43, %45 ], [ %38, %48 ]
  %53 = add i32 %36, %40
  %54 = icmp ult i32 %53, %2
  br i1 %54, label %37, label %55, !llvm.loop !22

55:                                               ; preds = %50, %18
  %56 = phi i32 [ 0, %18 ], [ %51, %50 ]
  %57 = phi i32 [ 0, %18 ], [ %52, %50 ]
  %58 = icmp eq i32 %56, 0
  br i1 %58, label %62, label %59

59:                                               ; preds = %55
  %60 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @bins_s, i32 0, i32 %57
  %61 = atomicrmw add i32 addrspace(3)* %60, i32 %56 syncscope("agent-one-as") monotonic, align 4
  br label %62

62:                                               ; preds = %59, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %6, label %63, label %72

63:                                               ; preds = %62, %63
  %64 = phi i32 [ %70, %63 ], [ %5, %62 ]
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @bins_s, i32 0, i32 %64
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !7
  %69 = atomicrmw add i32 addrspace(1)* %66, i32 %68 syncscope("agent-one-as") monotonic, align 4
  %70 = add i32 %64, %23
  %71 = icmp ult i32 %70, %3
  br i1 %71, label %63, label %72, !llvm.loop !23

72:                                               ; preds = %63, %62
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !18, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !18, i64 12, !18, i64 16, !18, i64 20, !18, i64 24, !18, i64 28, !19, i64 32, !20, i64 40, !19, i64 48, !21, i64 56}
!15 = !{!"short", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !{!"int", !16, i64 0}
!19 = !{!"long", !16, i64 0}
!20 = !{!"any pointer", !16, i64 0}
!21 = !{!"hsa_signal_s", !19, i64 0}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !12}
