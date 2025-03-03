; ModuleID = '../data/hip_kernels/14592/33/main.cu'
source_filename = "../data/hip_kernels/14592/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z51cunn_TemporalMaxPooling_updateGradInputKernelAtomicPfS_S_iiiii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %4
  %11 = mul i32 %10, %3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %0, i64 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %15, 10
  %17 = or i32 %16, %14
  %18 = mul i32 %17, %4
  %19 = mul i32 %18, %7
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %13, i64 %20
  %22 = mul i32 %10, %5
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = zext i32 %18 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %24, i64 %25
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %23
  %28 = getelementptr inbounds float, float addrspace(1)* %27, i64 %25
  %29 = icmp ult i32 %17, %5
  %30 = icmp sgt i32 %4, 0
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %158

32:                                               ; preds = %8
  %33 = and i32 %4, 7
  %34 = icmp ult i32 %4, 8
  br i1 %34, label %138, label %35

35:                                               ; preds = %32
  %36 = and i32 %4, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i32 [ 0, %35 ], [ %135, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %136, %37 ]
  %40 = zext i32 %38 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %28, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5
  %43 = fptosi float %42 to i32
  %44 = mul nsw i32 %43, %4
  %45 = add nsw i32 %44, %38
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %21, i64 %46
  %48 = getelementptr inbounds float, float addrspace(1)* %26, i64 %40
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5
  %50 = atomicrmw fadd float addrspace(1)* %47, float %49 syncscope("agent-one-as") monotonic, align 4
  %51 = or i32 %38, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %28, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5
  %55 = fptosi float %54 to i32
  %56 = mul nsw i32 %55, %4
  %57 = add nsw i32 %56, %51
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %21, i64 %58
  %60 = getelementptr inbounds float, float addrspace(1)* %26, i64 %52
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !5
  %62 = atomicrmw fadd float addrspace(1)* %59, float %61 syncscope("agent-one-as") monotonic, align 4
  %63 = or i32 %38, 2
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %28, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !5
  %67 = fptosi float %66 to i32
  %68 = mul nsw i32 %67, %4
  %69 = add nsw i32 %68, %63
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %21, i64 %70
  %72 = getelementptr inbounds float, float addrspace(1)* %26, i64 %64
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !5
  %74 = atomicrmw fadd float addrspace(1)* %71, float %73 syncscope("agent-one-as") monotonic, align 4
  %75 = or i32 %38, 3
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %28, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = fptosi float %78 to i32
  %80 = mul nsw i32 %79, %4
  %81 = add nsw i32 %80, %75
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %21, i64 %82
  %84 = getelementptr inbounds float, float addrspace(1)* %26, i64 %76
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !5
  %86 = atomicrmw fadd float addrspace(1)* %83, float %85 syncscope("agent-one-as") monotonic, align 4
  %87 = or i32 %38, 4
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %28, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !5
  %91 = fptosi float %90 to i32
  %92 = mul nsw i32 %91, %4
  %93 = add nsw i32 %92, %87
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %21, i64 %94
  %96 = getelementptr inbounds float, float addrspace(1)* %26, i64 %88
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !5
  %98 = atomicrmw fadd float addrspace(1)* %95, float %97 syncscope("agent-one-as") monotonic, align 4
  %99 = or i32 %38, 5
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %28, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !5
  %103 = fptosi float %102 to i32
  %104 = mul nsw i32 %103, %4
  %105 = add nsw i32 %104, %99
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %21, i64 %106
  %108 = getelementptr inbounds float, float addrspace(1)* %26, i64 %100
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !5
  %110 = atomicrmw fadd float addrspace(1)* %107, float %109 syncscope("agent-one-as") monotonic, align 4
  %111 = or i32 %38, 6
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %28, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = fptosi float %114 to i32
  %116 = mul nsw i32 %115, %4
  %117 = add nsw i32 %116, %111
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %21, i64 %118
  %120 = getelementptr inbounds float, float addrspace(1)* %26, i64 %112
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5
  %122 = atomicrmw fadd float addrspace(1)* %119, float %121 syncscope("agent-one-as") monotonic, align 4
  %123 = or i32 %38, 7
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %28, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !5
  %127 = fptosi float %126 to i32
  %128 = mul nsw i32 %127, %4
  %129 = add nsw i32 %128, %123
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %21, i64 %130
  %132 = getelementptr inbounds float, float addrspace(1)* %26, i64 %124
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5
  %134 = atomicrmw fadd float addrspace(1)* %131, float %133 syncscope("agent-one-as") monotonic, align 4
  %135 = add nuw nsw i32 %38, 8
  %136 = add i32 %39, 8
  %137 = icmp eq i32 %136, %36
  br i1 %137, label %138, label %37, !llvm.loop !9

138:                                              ; preds = %37, %32
  %139 = phi i32 [ 0, %32 ], [ %135, %37 ]
  %140 = icmp eq i32 %33, 0
  br i1 %140, label %158, label %141

141:                                              ; preds = %138, %141
  %142 = phi i32 [ %155, %141 ], [ %139, %138 ]
  %143 = phi i32 [ %156, %141 ], [ 0, %138 ]
  %144 = zext i32 %142 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %28, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %147 = fptosi float %146 to i32
  %148 = mul nsw i32 %147, %4
  %149 = add nsw i32 %148, %142
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %21, i64 %150
  %152 = getelementptr inbounds float, float addrspace(1)* %26, i64 %144
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !5
  %154 = atomicrmw fadd float addrspace(1)* %151, float %153 syncscope("agent-one-as") monotonic, align 4
  %155 = add nuw nsw i32 %142, 1
  %156 = add i32 %143, 1
  %157 = icmp eq i32 %156, %33
  br i1 %157, label %158, label %141, !llvm.loop !11

158:                                              ; preds = %138, %141, %8
  ret void
}

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
