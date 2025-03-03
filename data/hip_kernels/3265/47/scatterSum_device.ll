; ModuleID = '../data/hip_kernels/3265/47/main.cu'
source_filename = "../data/hip_kernels/3265/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z10scatterSumiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  %14 = icmp sgt i32 %0, 0
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %81

16:                                               ; preds = %3
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = and i32 %0, 7
  %20 = icmp ult i32 %0, 8
  br i1 %20, label %68, label %21

21:                                               ; preds = %16
  %22 = and i32 %0, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi i32 [ 0, %21 ], [ %65, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %66, %23 ]
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %28 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %29 = atomicrmw fadd float addrspace(1)* %27, float %28 syncscope("agent-one-as") monotonic, align 4
  %30 = or i32 %24, 1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %33 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %34 = atomicrmw fadd float addrspace(1)* %32, float %33 syncscope("agent-one-as") monotonic, align 4
  %35 = or i32 %24, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %39 = atomicrmw fadd float addrspace(1)* %37, float %38 syncscope("agent-one-as") monotonic, align 4
  %40 = or i32 %24, 3
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %44 = atomicrmw fadd float addrspace(1)* %42, float %43 syncscope("agent-one-as") monotonic, align 4
  %45 = or i32 %24, 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %49 = atomicrmw fadd float addrspace(1)* %47, float %48 syncscope("agent-one-as") monotonic, align 4
  %50 = or i32 %24, 5
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  %53 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %54 = atomicrmw fadd float addrspace(1)* %52, float %53 syncscope("agent-one-as") monotonic, align 4
  %55 = or i32 %24, 6
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %2, i64 %56
  %58 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %59 = atomicrmw fadd float addrspace(1)* %57, float %58 syncscope("agent-one-as") monotonic, align 4
  %60 = or i32 %24, 7
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %64 = atomicrmw fadd float addrspace(1)* %62, float %63 syncscope("agent-one-as") monotonic, align 4
  %65 = add nuw nsw i32 %24, 8
  %66 = add i32 %25, 8
  %67 = icmp eq i32 %66, %22
  br i1 %67, label %68, label %23, !llvm.loop !11

68:                                               ; preds = %23, %16
  %69 = phi i32 [ 0, %16 ], [ %65, %23 ]
  %70 = icmp eq i32 %19, 0
  br i1 %70, label %81, label %71

71:                                               ; preds = %68, %71
  %72 = phi i32 [ %78, %71 ], [ %69, %68 ]
  %73 = phi i32 [ %79, %71 ], [ 0, %68 ]
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %77 = atomicrmw fadd float addrspace(1)* %75, float %76 syncscope("agent-one-as") monotonic, align 4
  %78 = add nuw nsw i32 %72, 1
  %79 = add i32 %73, 1
  %80 = icmp eq i32 %79, %19
  br i1 %80, label %81, label %71, !llvm.loop !13

81:                                               ; preds = %68, %71, %3
  ret void
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
