; ModuleID = '../data/hip_kernels/1204/5/main.cu'
source_filename = "../data/hip_kernels/1204/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z7kernelDiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
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
  br i1 %22, label %23, label %36

23:                                               ; preds = %3
  %24 = sdiv i32 %0, 128
  %25 = icmp sgt i32 %0, 127
  %26 = add nsw i32 %24, -1
  %27 = and i32 %24, 7
  %28 = icmp ult i32 %26, 7
  %29 = and i32 %24, -8
  %30 = icmp eq i32 %27, 0
  br label %31

31:                                               ; preds = %23, %50
  %32 = phi i32 [ %15, %23 ], [ %51, %50 ]
  br i1 %25, label %33, label %50

33:                                               ; preds = %31
  %34 = sext i32 %32 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  br i1 %28, label %37, label %53

36:                                               ; preds = %50, %3
  ret void

37:                                               ; preds = %53, %33
  %38 = phi i32 [ 0, %33 ], [ %103, %53 ]
  br i1 %30, label %50, label %39

39:                                               ; preds = %37, %39
  %40 = phi i32 [ %47, %39 ], [ %38, %37 ]
  %41 = phi i32 [ %48, %39 ], [ 0, %37 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %42
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %46 = atomicrmw fadd float addrspace(1)* %43, float %45 syncscope("agent-one-as") monotonic, align 4
  store float %46, float addrspace(1)* %35, align 4, !tbaa !16
  %47 = add nuw nsw i32 %40, 1
  %48 = add i32 %41, 1
  %49 = icmp eq i32 %48, %27
  br i1 %49, label %50, label %39, !llvm.loop !20

50:                                               ; preds = %37, %39, %31
  %51 = add nsw i32 %32, %21
  %52 = icmp slt i32 %51, %0
  br i1 %52, label %31, label %36, !llvm.loop !22

53:                                               ; preds = %33, %53
  %54 = phi i32 [ %103, %53 ], [ 0, %33 ]
  %55 = phi i32 [ %104, %53 ], [ 0, %33 ]
  %56 = zext i32 %54 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16
  %60 = atomicrmw fadd float addrspace(1)* %57, float %59 syncscope("agent-one-as") monotonic, align 4
  store float %60, float addrspace(1)* %35, align 4, !tbaa !16
  %61 = or i32 %54, 1
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %62
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !16
  %66 = atomicrmw fadd float addrspace(1)* %63, float %65 syncscope("agent-one-as") monotonic, align 4
  store float %66, float addrspace(1)* %35, align 4, !tbaa !16
  %67 = or i32 %54, 2
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !16
  %72 = atomicrmw fadd float addrspace(1)* %69, float %71 syncscope("agent-one-as") monotonic, align 4
  store float %72, float addrspace(1)* %35, align 4, !tbaa !16
  %73 = or i32 %54, 3
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !16
  %78 = atomicrmw fadd float addrspace(1)* %75, float %77 syncscope("agent-one-as") monotonic, align 4
  store float %78, float addrspace(1)* %35, align 4, !tbaa !16
  %79 = or i32 %54, 4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %2, i64 %80
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = atomicrmw fadd float addrspace(1)* %81, float %83 syncscope("agent-one-as") monotonic, align 4
  store float %84, float addrspace(1)* %35, align 4, !tbaa !16
  %85 = or i32 %54, 5
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = atomicrmw fadd float addrspace(1)* %87, float %89 syncscope("agent-one-as") monotonic, align 4
  store float %90, float addrspace(1)* %35, align 4, !tbaa !16
  %91 = or i32 %54, 6
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %92
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = atomicrmw fadd float addrspace(1)* %93, float %95 syncscope("agent-one-as") monotonic, align 4
  store float %96, float addrspace(1)* %35, align 4, !tbaa !16
  %97 = or i32 %54, 7
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16
  %102 = atomicrmw fadd float addrspace(1)* %99, float %101 syncscope("agent-one-as") monotonic, align 4
  store float %102, float addrspace(1)* %35, align 4, !tbaa !16
  %103 = add nuw nsw i32 %54, 8
  %104 = add i32 %55, 8
  %105 = icmp eq i32 %104, %29
  br i1 %105, label %37, label %53, !llvm.loop !24
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
