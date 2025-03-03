; ModuleID = '../data/hip_kernels/16057/27/main.cu'
source_filename = "../data/hip_kernels/16057/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z3MulPfS_iS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, float addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %15, label %52

15:                                               ; preds = %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %2
  %25 = add nsw i32 %24, %13
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = and i32 %2, 7
  %29 = icmp ult i32 %2, 8
  br i1 %29, label %32, label %30

30:                                               ; preds = %15
  %31 = and i32 %2, -8
  br label %53

32:                                               ; preds = %53, %15
  %33 = phi i32 [ 0, %15 ], [ %151, %53 ]
  %34 = icmp eq i32 %28, 0
  br i1 %34, label %52, label %35

35:                                               ; preds = %32, %35
  %36 = phi i32 [ %49, %35 ], [ %33, %32 ]
  %37 = phi i32 [ %50, %35 ], [ 0, %32 ]
  %38 = add nsw i32 %36, %24
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = mul nsw i32 %36, %2
  %43 = add nsw i32 %42, %13
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fmul contract float %41, %46
  %48 = atomicrmw fadd float addrspace(1)* %27, float %47 syncscope("agent-one-as") monotonic, align 4
  %49 = add nuw nsw i32 %36, 1
  %50 = add i32 %37, 1
  %51 = icmp eq i32 %50, %28
  br i1 %51, label %52, label %35, !llvm.loop !11

52:                                               ; preds = %32, %35, %4
  ret void

53:                                               ; preds = %53, %30
  %54 = phi i32 [ 0, %30 ], [ %151, %53 ]
  %55 = phi i32 [ 0, %30 ], [ %152, %53 ]
  %56 = add nsw i32 %54, %24
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = mul nsw i32 %54, %2
  %61 = add nsw i32 %60, %13
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = fmul contract float %59, %64
  %66 = atomicrmw fadd float addrspace(1)* %27, float %65 syncscope("agent-one-as") monotonic, align 4
  %67 = or i32 %54, 1
  %68 = add nsw i32 %67, %24
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = mul nsw i32 %67, %2
  %73 = add nsw i32 %72, %13
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fmul contract float %71, %76
  %78 = atomicrmw fadd float addrspace(1)* %27, float %77 syncscope("agent-one-as") monotonic, align 4
  %79 = or i32 %54, 2
  %80 = add nsw i32 %79, %24
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7
  %84 = mul nsw i32 %79, %2
  %85 = add nsw i32 %84, %13
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fmul contract float %83, %88
  %90 = atomicrmw fadd float addrspace(1)* %27, float %89 syncscope("agent-one-as") monotonic, align 4
  %91 = or i32 %54, 3
  %92 = add nsw i32 %91, %24
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = mul nsw i32 %91, %2
  %97 = add nsw i32 %96, %13
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = fmul contract float %95, %100
  %102 = atomicrmw fadd float addrspace(1)* %27, float %101 syncscope("agent-one-as") monotonic, align 4
  %103 = or i32 %54, 4
  %104 = add nsw i32 %103, %24
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = mul nsw i32 %103, %2
  %109 = add nsw i32 %108, %13
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %107, %112
  %114 = atomicrmw fadd float addrspace(1)* %27, float %113 syncscope("agent-one-as") monotonic, align 4
  %115 = or i32 %54, 5
  %116 = add nsw i32 %115, %24
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = mul nsw i32 %115, %2
  %121 = add nsw i32 %120, %13
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %0, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7
  %125 = fmul contract float %119, %124
  %126 = atomicrmw fadd float addrspace(1)* %27, float %125 syncscope("agent-one-as") monotonic, align 4
  %127 = or i32 %54, 6
  %128 = add nsw i32 %127, %24
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = mul nsw i32 %127, %2
  %133 = add nsw i32 %132, %13
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %131, %136
  %138 = atomicrmw fadd float addrspace(1)* %27, float %137 syncscope("agent-one-as") monotonic, align 4
  %139 = or i32 %54, 7
  %140 = add nsw i32 %139, %24
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7
  %144 = mul nsw i32 %139, %2
  %145 = add nsw i32 %144, %13
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %0, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7
  %149 = fmul contract float %143, %148
  %150 = atomicrmw fadd float addrspace(1)* %27, float %149 syncscope("agent-one-as") monotonic, align 4
  %151 = add nuw nsw i32 %54, 8
  %152 = add i32 %55, 8
  %153 = icmp eq i32 %152, %31
  br i1 %153, label %32, label %53, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
