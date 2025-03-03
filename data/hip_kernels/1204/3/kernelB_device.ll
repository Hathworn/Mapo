; ModuleID = '../data/hip_kernels/1204/3/main.cu'
source_filename = "../data/hip_kernels/1204/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z7kernelBiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp slt i32 %15, %0
  br i1 %22, label %23, label %31

23:                                               ; preds = %3
  %24 = sdiv i32 %0, 128
  %25 = icmp sgt i32 %0, 127
  %26 = add nsw i32 %24, -1
  %27 = and i32 %24, 7
  %28 = icmp ult i32 %26, 7
  %29 = and i32 %24, -8
  %30 = icmp eq i32 %27, 0
  br label %32

31:                                               ; preds = %119, %3
  ret void

32:                                               ; preds = %23, %119
  %33 = phi i32 [ %15, %23 ], [ %120, %119 ]
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16
  %39 = fcmp contract ogt float %36, %38
  br i1 %39, label %40, label %103

40:                                               ; preds = %32
  br i1 %25, label %41, label %119

41:                                               ; preds = %40
  br i1 %28, label %105, label %42

42:                                               ; preds = %41, %42
  %43 = phi i32 [ %100, %42 ], [ 0, %41 ]
  %44 = phi i32 [ %101, %42 ], [ 0, %41 ]
  %45 = zext i32 %43 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  %50 = fadd contract float %47, %49
  store float %50, float addrspace(1)* %37, align 4, !tbaa !16
  %51 = or i32 %43, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  %57 = fadd contract float %54, %56
  store float %57, float addrspace(1)* %37, align 4, !tbaa !16
  %58 = or i32 %43, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16
  %64 = fadd contract float %61, %63
  store float %64, float addrspace(1)* %37, align 4, !tbaa !16
  %65 = or i32 %43, 3
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !16
  %71 = fadd contract float %68, %70
  store float %71, float addrspace(1)* %37, align 4, !tbaa !16
  %72 = or i32 %43, 4
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = fadd contract float %75, %77
  store float %78, float addrspace(1)* %37, align 4, !tbaa !16
  %79 = or i32 %43, 5
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16
  %85 = fadd contract float %82, %84
  store float %85, float addrspace(1)* %37, align 4, !tbaa !16
  %86 = or i32 %43, 6
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %87
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fadd contract float %89, %91
  store float %92, float addrspace(1)* %37, align 4, !tbaa !16
  %93 = or i32 %43, 7
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !16
  %99 = fadd contract float %96, %98
  store float %99, float addrspace(1)* %37, align 4, !tbaa !16
  %100 = add nuw nsw i32 %43, 8
  %101 = add i32 %44, 8
  %102 = icmp eq i32 %101, %29
  br i1 %102, label %105, label %42, !llvm.loop !20

103:                                              ; preds = %32
  %104 = atomicrmw fadd float addrspace(1)* %37, float %36 syncscope("agent-one-as") monotonic, align 4
  store float %104, float addrspace(1)* %37, align 4, !tbaa !16
  br label %119

105:                                              ; preds = %42, %41
  %106 = phi i32 [ 0, %41 ], [ %100, %42 ]
  br i1 %30, label %119, label %107

107:                                              ; preds = %105, %107
  %108 = phi i32 [ %116, %107 ], [ %106, %105 ]
  %109 = phi i32 [ %117, %107 ], [ 0, %105 ]
  %110 = zext i32 %108 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !16
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %110
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fadd contract float %112, %114
  store float %115, float addrspace(1)* %37, align 4, !tbaa !16
  %116 = add nuw nsw i32 %108, 1
  %117 = add i32 %109, 1
  %118 = icmp eq i32 %117, %27
  br i1 %118, label %119, label %107, !llvm.loop !22

119:                                              ; preds = %105, %107, %40, %103
  %120 = add nsw i32 %33, %21
  %121 = icmp slt i32 %120, %0
  br i1 %121, label %32, label %31, !llvm.loop !24
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
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
