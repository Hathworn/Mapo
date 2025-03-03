; ModuleID = '../data/hip_kernels/18288/7/main.cu'
source_filename = "../data/hip_kernels/18288/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z19avg_pool3d_backwardiiiiiPKiS0_PKfPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = mul nsw i32 %3, %2
  %15 = icmp slt i32 %13, %14
  %16 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !5
  %22 = load i16, i16 addrspace(4)* %18, align 4, !range !14, !invariant.load !15
  %23 = zext i16 %22 to i32
  %24 = udiv i32 %21, %23
  %25 = mul i32 %24, %23
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  br label %29

28:                                               ; preds = %35, %9
  ret void

29:                                               ; preds = %12, %35
  %30 = phi i32 [ %10, %12 ], [ %37, %35 ]
  br i1 %15, label %31, label %35

31:                                               ; preds = %29
  %32 = mul nsw i32 %30, %2
  %33 = mul nsw i32 %30, %1
  %34 = mul nsw i32 %32, %3
  br label %39

35:                                               ; preds = %77, %29
  %36 = add i32 %24, %30
  %37 = add i32 %36, %27
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %29, label %28, !llvm.loop !16

39:                                               ; preds = %31, %77
  %40 = phi i32 [ %13, %31 ], [ %78, %77 ]
  %41 = freeze i32 %40
  %42 = freeze i32 %3
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = add nsw i32 %43, %32
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !18
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %77

51:                                               ; preds = %39
  %52 = mul i32 %46, %4
  %53 = add nsw i32 %40, %34
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %7, i64 %54
  %56 = sitofp i32 %49 to float
  %57 = and i32 %49, 1
  %58 = icmp eq i32 %49, 1
  br i1 %58, label %61, label %59

59:                                               ; preds = %51
  %60 = and i32 %49, -2
  br label %80

61:                                               ; preds = %80, %51
  %62 = phi i32 [ 0, %51 ], [ %108, %80 ]
  %63 = icmp eq i32 %57, 0
  br i1 %63, label %77, label %64

64:                                               ; preds = %61
  %65 = add nsw i32 %62, %52
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !18
  %69 = add i32 %68, %33
  %70 = mul i32 %69, %3
  %71 = add nsw i32 %70, %45
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %8, i64 %72
  %74 = load float, float addrspace(1)* %55, align 4, !tbaa !22
  %75 = fdiv contract float %74, %56
  %76 = atomicrmw fadd float addrspace(1)* %73, float %75 syncscope("agent-one-as") monotonic, align 4
  br label %77

77:                                               ; preds = %64, %61, %39
  %78 = add i32 %40, %23
  %79 = icmp slt i32 %78, %14
  br i1 %79, label %39, label %35, !llvm.loop !24

80:                                               ; preds = %80, %59
  %81 = phi i32 [ 0, %59 ], [ %108, %80 ]
  %82 = phi i32 [ 0, %59 ], [ %109, %80 ]
  %83 = add nsw i32 %81, %52
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !18
  %87 = add i32 %86, %33
  %88 = mul i32 %87, %3
  %89 = add nsw i32 %88, %45
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %8, i64 %90
  %92 = load float, float addrspace(1)* %55, align 4, !tbaa !22
  %93 = fdiv contract float %92, %56
  %94 = atomicrmw fadd float addrspace(1)* %91, float %93 syncscope("agent-one-as") monotonic, align 4
  %95 = or i32 %81, 1
  %96 = add nsw i32 %95, %52
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !18
  %100 = add i32 %99, %33
  %101 = mul i32 %100, %3
  %102 = add nsw i32 %101, %45
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %8, i64 %103
  %105 = load float, float addrspace(1)* %55, align 4, !tbaa !22
  %106 = fdiv contract float %105, %56
  %107 = atomicrmw fadd float addrspace(1)* %104, float %106 syncscope("agent-one-as") monotonic, align 4
  %108 = add nuw nsw i32 %81, 2
  %109 = add i32 %82, 2
  %110 = icmp eq i32 %109, %60
  br i1 %110, label %61, label %80, !llvm.loop !25
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!23, !23, i64 0}
!23 = !{!"float", !20, i64 0}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
