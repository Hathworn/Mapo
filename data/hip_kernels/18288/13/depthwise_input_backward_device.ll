; ModuleID = '../data/hip_kernels/18288/13/main.cu'
source_filename = "../data/hip_kernels/18288/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z24depthwise_input_backwardiiiiiiiPKiS0_S0_PKfS2_S2_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readnone %10, float addrspace(1)* nocapture readonly %11, float addrspace(1)* nocapture readonly %12, float addrspace(1)* nocapture %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %43

17:                                               ; preds = %14
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !6
  %27 = mul i32 %18, %23
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %29 = add i32 %27, %28
  %30 = mul i32 %5, %4
  %31 = mul nsw i32 %30, %2
  %32 = icmp slt i32 %29, %31
  %33 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 16
  %34 = bitcast i8 addrspace(4)* %33 to i32 addrspace(4)*
  %35 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %36 = bitcast i8 addrspace(4)* %35 to i16 addrspace(4)*
  %37 = load i16, i16 addrspace(4)* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = udiv i32 %26, %23
  %40 = mul i32 %39, %23
  %41 = icmp ugt i32 %26, %40
  %42 = zext i1 %41 to i32
  br label %44

43:                                               ; preds = %57, %14
  ret void

44:                                               ; preds = %17, %57
  %45 = phi i32 [ %15, %17 ], [ %59, %57 ]
  br i1 %32, label %46, label %57

46:                                               ; preds = %44
  %47 = mul nsw i32 %45, %2
  %48 = mul i32 %30, %47
  %49 = mul nsw i32 %45, %1
  %50 = load i32, i32 addrspace(4)* %34, align 8, !tbaa !16
  %51 = udiv i32 %50, %38
  %52 = mul i32 %51, %38
  %53 = icmp ugt i32 %50, %52
  %54 = zext i1 %53 to i32
  %55 = add i32 %51, %54
  %56 = mul i32 %55, %23
  br label %61

57:                                               ; preds = %108, %44
  %58 = add i32 %39, %45
  %59 = add i32 %58, %42
  %60 = icmp slt i32 %59, %0
  br i1 %60, label %44, label %43, !llvm.loop !17

61:                                               ; preds = %46, %108
  %62 = phi i32 [ %29, %46 ], [ %109, %108 ]
  %63 = freeze i32 %62
  %64 = freeze i32 %30
  %65 = sdiv i32 %63, %64
  %66 = mul i32 %65, %64
  %67 = sub i32 %63, %66
  %68 = sdiv i32 %67, %5
  %69 = add nsw i32 %65, %47
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !19
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %108

74:                                               ; preds = %61
  %75 = mul i32 %69, %6
  %76 = add nsw i32 %62, %48
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %12, i64 %77
  %79 = sitofp i32 %72 to float
  %80 = and i32 %72, 1
  %81 = icmp eq i32 %72, 1
  br i1 %81, label %84, label %82

82:                                               ; preds = %74
  %83 = and i32 %72, -2
  br label %111

84:                                               ; preds = %111, %74
  %85 = phi i32 [ 0, %74 ], [ %155, %111 ]
  %86 = icmp eq i32 %80, 0
  br i1 %86, label %108, label %87

87:                                               ; preds = %84
  %88 = add nsw i32 %85, %75
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !19
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %89
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !19
  %94 = load float, float addrspace(1)* %78, align 4, !tbaa !23
  %95 = mul i32 %30, %93
  %96 = add nsw i32 %95, %67
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %11, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !23
  %100 = fmul contract float %94, %99
  %101 = fdiv contract float %100, %79
  %102 = add i32 %91, %49
  %103 = mul i32 %102, %4
  %104 = add nsw i32 %103, %68
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %13, i64 %105
  %107 = atomicrmw fadd float addrspace(1)* %106, float %101 syncscope("agent-one-as") monotonic, align 4
  br label %108

108:                                              ; preds = %87, %84, %61
  %109 = add i32 %56, %62
  %110 = icmp slt i32 %109, %31
  br i1 %110, label %61, label %57, !llvm.loop !25

111:                                              ; preds = %111, %82
  %112 = phi i32 [ 0, %82 ], [ %155, %111 ]
  %113 = phi i32 [ 0, %82 ], [ %156, %111 ]
  %114 = add nsw i32 %112, %75
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !19
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %115
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !19
  %120 = load float, float addrspace(1)* %78, align 4, !tbaa !23
  %121 = mul i32 %30, %119
  %122 = add nsw i32 %121, %67
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %11, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !23
  %126 = fmul contract float %120, %125
  %127 = fdiv contract float %126, %79
  %128 = add i32 %117, %49
  %129 = mul i32 %128, %4
  %130 = add nsw i32 %129, %68
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %13, i64 %131
  %133 = atomicrmw fadd float addrspace(1)* %132, float %127 syncscope("agent-one-as") monotonic, align 4
  %134 = or i32 %112, 1
  %135 = add nsw i32 %134, %75
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !19
  %139 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %136
  %140 = load i32, i32 addrspace(1)* %139, align 4, !tbaa !19
  %141 = load float, float addrspace(1)* %78, align 4, !tbaa !23
  %142 = mul i32 %30, %140
  %143 = add nsw i32 %142, %67
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %11, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !23
  %147 = fmul contract float %141, %146
  %148 = fdiv contract float %147, %79
  %149 = add i32 %138, %49
  %150 = mul i32 %149, %4
  %151 = add nsw i32 %150, %68
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %13, i64 %152
  %154 = atomicrmw fadd float addrspace(1)* %153, float %148 syncscope("agent-one-as") monotonic, align 4
  %155 = add nuw nsw i32 %112, 2
  %156 = add i32 %113, 2
  %157 = icmp eq i32 %156, %83
  br i1 %157, label %84, label %111, !llvm.loop !26
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = !{!7, !11, i64 16}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !21, i64 0}
!21 = !{!"omnipotent char", !22, i64 0}
!22 = !{!"Simple C++ TBAA"}
!23 = !{!24, !24, i64 0}
!24 = !{!"float", !21, i64 0}
!25 = distinct !{!25, !18}
!26 = distinct !{!26, !18}
