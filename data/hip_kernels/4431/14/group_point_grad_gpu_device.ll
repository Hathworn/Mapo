; ModuleID = '../data/hip_kernels/4431/14/main.cu'
source_filename = "../data/hip_kernels/4431/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z20group_point_grad_gpuiiiiiPKfPKiPf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul nsw i32 %4, %3
  %11 = mul nsw i32 %10, %9
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %12
  %14 = mul i32 %9, %2
  %15 = mul i32 %14, %10
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %5, i64 %16
  %18 = mul i32 %14, %1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %7, i64 %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = icmp slt i32 %21, %3
  br i1 %27, label %28, label %39

28:                                               ; preds = %8
  %29 = icmp sgt i32 %4, 0
  %30 = icmp sgt i32 %2, 0
  %31 = and i32 %2, 7
  %32 = icmp ult i32 %2, 8
  %33 = and i32 %2, -8
  %34 = icmp eq i32 %31, 0
  br label %35

35:                                               ; preds = %28, %40
  %36 = phi i32 [ %21, %28 ], [ %41, %40 ]
  br i1 %29, label %37, label %40

37:                                               ; preds = %35
  %38 = mul nsw i32 %36, %4
  br label %43

39:                                               ; preds = %40, %8
  ret void

40:                                               ; preds = %68, %35
  %41 = add nuw nsw i32 %36, %26
  %42 = icmp slt i32 %41, %3
  br i1 %42, label %35, label %39, !llvm.loop !7

43:                                               ; preds = %37, %68
  %44 = phi i32 [ 0, %37 ], [ %69, %68 ]
  %45 = add nsw i32 %44, %38
  br i1 %30, label %46, label %68

46:                                               ; preds = %43
  %47 = sext i32 %45 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !9
  %50 = mul nsw i32 %49, %2
  %51 = mul i32 %45, %2
  br i1 %32, label %52, label %71

52:                                               ; preds = %71, %46
  %53 = phi i32 [ 0, %46 ], [ %145, %71 ]
  br i1 %34, label %68, label %54

54:                                               ; preds = %52, %54
  %55 = phi i32 [ %65, %54 ], [ %53, %52 ]
  %56 = phi i32 [ %66, %54 ], [ 0, %52 ]
  %57 = add nsw i32 %55, %50
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %20, i64 %58
  %60 = add nsw i32 %55, %51
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %17, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !13
  %64 = atomicrmw fadd float addrspace(1)* %59, float %63 syncscope("agent-one-as") monotonic, align 4
  %65 = add nuw nsw i32 %55, 1
  %66 = add i32 %56, 1
  %67 = icmp eq i32 %66, %31
  br i1 %67, label %68, label %54, !llvm.loop !15

68:                                               ; preds = %52, %54, %43
  %69 = add nuw nsw i32 %44, 1
  %70 = icmp eq i32 %69, %4
  br i1 %70, label %40, label %43, !llvm.loop !17

71:                                               ; preds = %46, %71
  %72 = phi i32 [ %145, %71 ], [ 0, %46 ]
  %73 = phi i32 [ %146, %71 ], [ 0, %46 ]
  %74 = add nsw i32 %72, %50
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %20, i64 %75
  %77 = add nsw i32 %72, %51
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %17, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !13
  %81 = atomicrmw fadd float addrspace(1)* %76, float %80 syncscope("agent-one-as") monotonic, align 4
  %82 = or i32 %72, 1
  %83 = add nsw i32 %82, %50
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %20, i64 %84
  %86 = add nsw i32 %82, %51
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %17, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !13
  %90 = atomicrmw fadd float addrspace(1)* %85, float %89 syncscope("agent-one-as") monotonic, align 4
  %91 = or i32 %72, 2
  %92 = add nsw i32 %91, %50
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %20, i64 %93
  %95 = add nsw i32 %91, %51
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %17, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !13
  %99 = atomicrmw fadd float addrspace(1)* %94, float %98 syncscope("agent-one-as") monotonic, align 4
  %100 = or i32 %72, 3
  %101 = add nsw i32 %100, %50
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %20, i64 %102
  %104 = add nsw i32 %100, %51
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %17, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !13
  %108 = atomicrmw fadd float addrspace(1)* %103, float %107 syncscope("agent-one-as") monotonic, align 4
  %109 = or i32 %72, 4
  %110 = add nsw i32 %109, %50
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %20, i64 %111
  %113 = add nsw i32 %109, %51
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %17, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !13
  %117 = atomicrmw fadd float addrspace(1)* %112, float %116 syncscope("agent-one-as") monotonic, align 4
  %118 = or i32 %72, 5
  %119 = add nsw i32 %118, %50
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %20, i64 %120
  %122 = add nsw i32 %118, %51
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %17, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !13
  %126 = atomicrmw fadd float addrspace(1)* %121, float %125 syncscope("agent-one-as") monotonic, align 4
  %127 = or i32 %72, 6
  %128 = add nsw i32 %127, %50
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %20, i64 %129
  %131 = add nsw i32 %127, %51
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %17, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !13
  %135 = atomicrmw fadd float addrspace(1)* %130, float %134 syncscope("agent-one-as") monotonic, align 4
  %136 = or i32 %72, 7
  %137 = add nsw i32 %136, %50
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %20, i64 %138
  %140 = add nsw i32 %136, %51
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %17, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !13
  %144 = atomicrmw fadd float addrspace(1)* %139, float %143 syncscope("agent-one-as") monotonic, align 4
  %145 = add nuw nsw i32 %72, 8
  %146 = add i32 %73, 8
  %147 = icmp eq i32 %146, %33
  br i1 %147, label %52, label %71, !llvm.loop !18
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !11, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !8}
!18 = distinct !{!18, !8}
