; ModuleID = '../data/hip_kernels/18288/11/main.cu'
source_filename = "../data/hip_kernels/18288/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z29weighted_interpolate_backwardiiiiiPKiS0_PKfS2_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = icmp slt i32 %11, %0
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = mul nsw i32 %3, %1
  %16 = icmp slt i32 %14, %15
  %17 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %17, i64 12
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !5
  %23 = load i16, i16 addrspace(4)* %19, align 4, !range !14, !invariant.load !15
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %22, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %22, %26
  %28 = zext i1 %27 to i32
  br label %30

29:                                               ; preds = %36, %10
  ret void

30:                                               ; preds = %13, %36
  %31 = phi i32 [ %11, %13 ], [ %38, %36 ]
  br i1 %16, label %32, label %36

32:                                               ; preds = %30
  %33 = mul nsw i32 %31, %1
  %34 = mul nsw i32 %31, %2
  %35 = mul nsw i32 %33, %3
  br label %40

36:                                               ; preds = %84, %30
  %37 = add i32 %25, %31
  %38 = add i32 %37, %28
  %39 = icmp slt i32 %38, %0
  br i1 %39, label %30, label %29, !llvm.loop !16

40:                                               ; preds = %32, %84
  %41 = phi i32 [ %14, %32 ], [ %85, %84 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %3
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = add nsw i32 %44, %33
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !18
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %84

52:                                               ; preds = %40
  %53 = mul i32 %47, %4
  %54 = add nsw i32 %41, %35
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %7, i64 %55
  %57 = and i32 %50, 3
  %58 = icmp ult i32 %50, 4
  br i1 %58, label %61, label %59

59:                                               ; preds = %52
  %60 = and i32 %50, -4
  br label %87

61:                                               ; preds = %87, %52
  %62 = phi i32 [ 0, %52 ], [ %149, %87 ]
  %63 = icmp eq i32 %57, 0
  br i1 %63, label %84, label %64

64:                                               ; preds = %61, %64
  %65 = phi i32 [ %81, %64 ], [ %62, %61 ]
  %66 = phi i32 [ %82, %64 ], [ 0, %61 ]
  %67 = add nsw i32 %65, %53
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !18
  %71 = getelementptr inbounds float, float addrspace(1)* %8, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !22
  %73 = add i32 %70, %34
  %74 = mul i32 %73, %3
  %75 = add nsw i32 %74, %46
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %9, i64 %76
  %78 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %79 = fmul contract float %72, %78
  %80 = atomicrmw fadd float addrspace(1)* %77, float %79 syncscope("agent-one-as") monotonic, align 4
  %81 = add nuw nsw i32 %65, 1
  %82 = add i32 %66, 1
  %83 = icmp eq i32 %82, %57
  br i1 %83, label %84, label %64, !llvm.loop !24

84:                                               ; preds = %61, %64, %40
  %85 = add i32 %41, %24
  %86 = icmp slt i32 %85, %15
  br i1 %86, label %40, label %36, !llvm.loop !26

87:                                               ; preds = %87, %59
  %88 = phi i32 [ 0, %59 ], [ %149, %87 ]
  %89 = phi i32 [ 0, %59 ], [ %150, %87 ]
  %90 = add nsw i32 %88, %53
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !18
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %91
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !22
  %96 = add i32 %93, %34
  %97 = mul i32 %96, %3
  %98 = add nsw i32 %97, %46
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %9, i64 %99
  %101 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %102 = fmul contract float %95, %101
  %103 = atomicrmw fadd float addrspace(1)* %100, float %102 syncscope("agent-one-as") monotonic, align 4
  %104 = or i32 %88, 1
  %105 = add nsw i32 %104, %53
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %106
  %108 = load i32, i32 addrspace(1)* %107, align 4, !tbaa !18
  %109 = getelementptr inbounds float, float addrspace(1)* %8, i64 %106
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !22
  %111 = add i32 %108, %34
  %112 = mul i32 %111, %3
  %113 = add nsw i32 %112, %46
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %9, i64 %114
  %116 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %117 = fmul contract float %110, %116
  %118 = atomicrmw fadd float addrspace(1)* %115, float %117 syncscope("agent-one-as") monotonic, align 4
  %119 = or i32 %88, 2
  %120 = add nsw i32 %119, %53
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %121
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa !18
  %124 = getelementptr inbounds float, float addrspace(1)* %8, i64 %121
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !22
  %126 = add i32 %123, %34
  %127 = mul i32 %126, %3
  %128 = add nsw i32 %127, %46
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %9, i64 %129
  %131 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %132 = fmul contract float %125, %131
  %133 = atomicrmw fadd float addrspace(1)* %130, float %132 syncscope("agent-one-as") monotonic, align 4
  %134 = or i32 %88, 3
  %135 = add nsw i32 %134, %53
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !18
  %139 = getelementptr inbounds float, float addrspace(1)* %8, i64 %136
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !22
  %141 = add i32 %138, %34
  %142 = mul i32 %141, %3
  %143 = add nsw i32 %142, %46
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %9, i64 %144
  %146 = load float, float addrspace(1)* %56, align 4, !tbaa !22
  %147 = fmul contract float %140, %146
  %148 = atomicrmw fadd float addrspace(1)* %145, float %147 syncscope("agent-one-as") monotonic, align 4
  %149 = add nuw nsw i32 %88, 4
  %150 = add i32 %89, 4
  %151 = icmp eq i32 %150, %60
  br i1 %151, label %61, label %87, !llvm.loop !27
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
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.unroll.disable"}
!26 = distinct !{!26, !17}
!27 = distinct !{!27, !17}
