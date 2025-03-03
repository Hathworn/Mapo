; ModuleID = '../data/hip_kernels/3265/45/main.cu'
source_filename = "../data/hip_kernels/3265/45/main.cu"
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
  br i1 %13, label %14, label %91

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = icmp sgt i32 %0, 0
  br i1 %18, label %19, label %91

19:                                               ; preds = %14
  %20 = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %77, label %22

22:                                               ; preds = %19
  %23 = and i32 %0, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %74, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %75, %24 ]
  %27 = add nsw i32 %25, %12
  %28 = srem i32 %27, %0
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  %31 = atomicrmw fadd float addrspace(1)* %30, float %17 syncscope("agent-one-as") monotonic, align 4
  %32 = or i32 %25, 1
  %33 = add nsw i32 %32, %12
  %34 = srem i32 %33, %0
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %37 = atomicrmw fadd float addrspace(1)* %36, float %17 syncscope("agent-one-as") monotonic, align 4
  %38 = or i32 %25, 2
  %39 = add nsw i32 %38, %12
  %40 = srem i32 %39, %0
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %43 = atomicrmw fadd float addrspace(1)* %42, float %17 syncscope("agent-one-as") monotonic, align 4
  %44 = or i32 %25, 3
  %45 = add nsw i32 %44, %12
  %46 = srem i32 %45, %0
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = atomicrmw fadd float addrspace(1)* %48, float %17 syncscope("agent-one-as") monotonic, align 4
  %50 = or i32 %25, 4
  %51 = add nsw i32 %50, %12
  %52 = srem i32 %51, %0
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = atomicrmw fadd float addrspace(1)* %54, float %17 syncscope("agent-one-as") monotonic, align 4
  %56 = or i32 %25, 5
  %57 = add nsw i32 %56, %12
  %58 = srem i32 %57, %0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = atomicrmw fadd float addrspace(1)* %60, float %17 syncscope("agent-one-as") monotonic, align 4
  %62 = or i32 %25, 6
  %63 = add nsw i32 %62, %12
  %64 = srem i32 %63, %0
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = atomicrmw fadd float addrspace(1)* %66, float %17 syncscope("agent-one-as") monotonic, align 4
  %68 = or i32 %25, 7
  %69 = add nsw i32 %68, %12
  %70 = srem i32 %69, %0
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %2, i64 %71
  %73 = atomicrmw fadd float addrspace(1)* %72, float %17 syncscope("agent-one-as") monotonic, align 4
  %74 = add nuw nsw i32 %25, 8
  %75 = add i32 %26, 8
  %76 = icmp eq i32 %75, %23
  br i1 %76, label %77, label %24, !llvm.loop !11

77:                                               ; preds = %24, %19
  %78 = phi i32 [ 0, %19 ], [ %74, %24 ]
  %79 = icmp eq i32 %20, 0
  br i1 %79, label %91, label %80

80:                                               ; preds = %77, %80
  %81 = phi i32 [ %88, %80 ], [ %78, %77 ]
  %82 = phi i32 [ %89, %80 ], [ 0, %77 ]
  %83 = add nsw i32 %81, %12
  %84 = srem i32 %83, %0
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %87 = atomicrmw fadd float addrspace(1)* %86, float %17 syncscope("agent-one-as") monotonic, align 4
  %88 = add nuw nsw i32 %81, 1
  %89 = add i32 %82, 1
  %90 = icmp eq i32 %89, %20
  br i1 %90, label %91, label %80, !llvm.loop !13

91:                                               ; preds = %77, %80, %14, %3
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
