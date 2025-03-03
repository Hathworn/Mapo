; ModuleID = '../data/hip_kernels/17313/2/main.cu'
source_filename = "../data/hip_kernels/17313/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z4calcPfS_S_i(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  %15 = icmp sgt i32 %3, 0
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %112

17:                                               ; preds = %4
  %18 = mul nsw i32 %13, %3
  %19 = sext i32 %18 to i64
  %20 = sext i32 %13 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = getelementptr float, float addrspace(1)* %2, i64 %19
  %23 = and i32 %3, 7
  %24 = icmp ult i32 %3, 8
  br i1 %24, label %96, label %25

25:                                               ; preds = %17
  %26 = and i32 %3, -8
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi i32 [ 0, %25 ], [ %93, %27 ]
  %29 = phi i32 [ 0, %25 ], [ %94, %27 ]
  %30 = zext i32 %28 to i64
  %31 = getelementptr float, float addrspace(1)* %22, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = fmul contract float %32, %34
  %36 = atomicrmw fadd float addrspace(1)* %21, float %35 syncscope("agent-one-as") monotonic, align 4
  %37 = or i32 %28, 1
  %38 = zext i32 %37 to i64
  %39 = getelementptr float, float addrspace(1)* %22, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fmul contract float %40, %42
  %44 = atomicrmw fadd float addrspace(1)* %21, float %43 syncscope("agent-one-as") monotonic, align 4
  %45 = or i32 %28, 2
  %46 = zext i32 %45 to i64
  %47 = getelementptr float, float addrspace(1)* %22, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fmul contract float %48, %50
  %52 = atomicrmw fadd float addrspace(1)* %21, float %51 syncscope("agent-one-as") monotonic, align 4
  %53 = or i32 %28, 3
  %54 = zext i32 %53 to i64
  %55 = getelementptr float, float addrspace(1)* %22, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7
  %59 = fmul contract float %56, %58
  %60 = atomicrmw fadd float addrspace(1)* %21, float %59 syncscope("agent-one-as") monotonic, align 4
  %61 = or i32 %28, 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr float, float addrspace(1)* %22, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fmul contract float %64, %66
  %68 = atomicrmw fadd float addrspace(1)* %21, float %67 syncscope("agent-one-as") monotonic, align 4
  %69 = or i32 %28, 5
  %70 = zext i32 %69 to i64
  %71 = getelementptr float, float addrspace(1)* %22, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fmul contract float %72, %74
  %76 = atomicrmw fadd float addrspace(1)* %21, float %75 syncscope("agent-one-as") monotonic, align 4
  %77 = or i32 %28, 6
  %78 = zext i32 %77 to i64
  %79 = getelementptr float, float addrspace(1)* %22, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fmul contract float %80, %82
  %84 = atomicrmw fadd float addrspace(1)* %21, float %83 syncscope("agent-one-as") monotonic, align 4
  %85 = or i32 %28, 7
  %86 = zext i32 %85 to i64
  %87 = getelementptr float, float addrspace(1)* %22, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fmul contract float %88, %90
  %92 = atomicrmw fadd float addrspace(1)* %21, float %91 syncscope("agent-one-as") monotonic, align 4
  %93 = add nuw nsw i32 %28, 8
  %94 = add i32 %29, 8
  %95 = icmp eq i32 %94, %26
  br i1 %95, label %96, label %27, !llvm.loop !11

96:                                               ; preds = %27, %17
  %97 = phi i32 [ 0, %17 ], [ %93, %27 ]
  %98 = icmp eq i32 %23, 0
  br i1 %98, label %112, label %99

99:                                               ; preds = %96, %99
  %100 = phi i32 [ %109, %99 ], [ %97, %96 ]
  %101 = phi i32 [ %110, %99 ], [ 0, %96 ]
  %102 = zext i32 %100 to i64
  %103 = getelementptr float, float addrspace(1)* %22, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7
  %105 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %104, %106
  %108 = atomicrmw fadd float addrspace(1)* %21, float %107 syncscope("agent-one-as") monotonic, align 4
  %109 = add nuw nsw i32 %100, 1
  %110 = add i32 %101, 1
  %111 = icmp eq i32 %110, %23
  br i1 %111, label %112, label %99, !llvm.loop !13

112:                                              ; preds = %96, %99, %4
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
