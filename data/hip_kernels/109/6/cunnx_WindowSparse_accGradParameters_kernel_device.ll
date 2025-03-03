; ModuleID = '../data/hip_kernels/109/6/main.cu'
source_filename = "../data/hip_kernels/109/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z43cunnx_WindowSparse_accGradParameters_kernelPfS_S_S_S_S_iiiif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %4, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  %22 = fptosi float %21 to i32
  %23 = add nsw i32 %22, -1
  %24 = getelementptr inbounds float, float addrspace(1)* %5, i64 %19
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = fptosi float %25 to i32
  %27 = add nsw i32 %26, -1
  %28 = mul nsw i32 %18, %6
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %31 = mul nsw i32 %18, %7
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = mul nsw i32 %27, %8
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = sext i32 %23 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %36, i64 %37
  %39 = sext i32 %27 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = icmp slt i32 %12, %6
  br i1 %41, label %42, label %48

42:                                               ; preds = %11
  %43 = icmp sgt i32 %7, 0
  %44 = and i32 %7, 7
  %45 = icmp ult i32 %7, 8
  %46 = and i32 %7, -8
  %47 = icmp eq i32 %44, 0
  br label %50

48:                                               ; preds = %74, %11
  %49 = icmp slt i32 %12, %7
  br i1 %49, label %163, label %162

50:                                               ; preds = %42, %74
  %51 = phi i32 [ %12, %42 ], [ %75, %74 ]
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %30, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fmul contract float %54, %10
  br i1 %43, label %56, label %74

56:                                               ; preds = %50
  br i1 %45, label %57, label %77

57:                                               ; preds = %77, %56
  %58 = phi i32 [ 0, %56 ], [ %159, %77 ]
  br i1 %47, label %74, label %59

59:                                               ; preds = %57, %59
  %60 = phi i32 [ %71, %59 ], [ %58, %57 ]
  %61 = phi i32 [ %72, %59 ], [ 0, %57 ]
  %62 = mul nsw i32 %60, %8
  %63 = add nsw i32 %62, %51
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %38, i64 %64
  %66 = zext i32 %60 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %33, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %55, %68
  %70 = atomicrmw fadd float addrspace(1)* %65, float %69 syncscope("agent-one-as") monotonic, align 4
  %71 = add nuw nsw i32 %60, 1
  %72 = add i32 %61, 1
  %73 = icmp eq i32 %72, %44
  br i1 %73, label %74, label %59, !llvm.loop !11

74:                                               ; preds = %57, %59, %50
  %75 = add nuw nsw i32 %51, %17
  %76 = icmp slt i32 %75, %6
  br i1 %76, label %50, label %48, !llvm.loop !13

77:                                               ; preds = %56, %77
  %78 = phi i32 [ %159, %77 ], [ 0, %56 ]
  %79 = phi i32 [ %160, %77 ], [ 0, %56 ]
  %80 = mul nsw i32 %78, %8
  %81 = add nsw i32 %80, %51
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %38, i64 %82
  %84 = zext i32 %78 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %33, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fmul contract float %55, %86
  %88 = atomicrmw fadd float addrspace(1)* %83, float %87 syncscope("agent-one-as") monotonic, align 4
  %89 = or i32 %78, 1
  %90 = mul nsw i32 %89, %8
  %91 = add nsw i32 %90, %51
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %38, i64 %92
  %94 = zext i32 %89 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %33, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = fmul contract float %55, %96
  %98 = atomicrmw fadd float addrspace(1)* %93, float %97 syncscope("agent-one-as") monotonic, align 4
  %99 = or i32 %78, 2
  %100 = mul nsw i32 %99, %8
  %101 = add nsw i32 %100, %51
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %38, i64 %102
  %104 = zext i32 %99 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %33, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7
  %107 = fmul contract float %55, %106
  %108 = atomicrmw fadd float addrspace(1)* %103, float %107 syncscope("agent-one-as") monotonic, align 4
  %109 = or i32 %78, 3
  %110 = mul nsw i32 %109, %8
  %111 = add nsw i32 %110, %51
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %38, i64 %112
  %114 = zext i32 %109 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %33, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fmul contract float %55, %116
  %118 = atomicrmw fadd float addrspace(1)* %113, float %117 syncscope("agent-one-as") monotonic, align 4
  %119 = or i32 %78, 4
  %120 = mul nsw i32 %119, %8
  %121 = add nsw i32 %120, %51
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %38, i64 %122
  %124 = zext i32 %119 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %33, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = fmul contract float %55, %126
  %128 = atomicrmw fadd float addrspace(1)* %123, float %127 syncscope("agent-one-as") monotonic, align 4
  %129 = or i32 %78, 5
  %130 = mul nsw i32 %129, %8
  %131 = add nsw i32 %130, %51
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %38, i64 %132
  %134 = zext i32 %129 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %33, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fmul contract float %55, %136
  %138 = atomicrmw fadd float addrspace(1)* %133, float %137 syncscope("agent-one-as") monotonic, align 4
  %139 = or i32 %78, 6
  %140 = mul nsw i32 %139, %8
  %141 = add nsw i32 %140, %51
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %38, i64 %142
  %144 = zext i32 %139 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %33, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !7
  %147 = fmul contract float %55, %146
  %148 = atomicrmw fadd float addrspace(1)* %143, float %147 syncscope("agent-one-as") monotonic, align 4
  %149 = or i32 %78, 7
  %150 = mul nsw i32 %149, %8
  %151 = add nsw i32 %150, %51
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %38, i64 %152
  %154 = zext i32 %149 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %33, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7
  %157 = fmul contract float %55, %156
  %158 = atomicrmw fadd float addrspace(1)* %153, float %157 syncscope("agent-one-as") monotonic, align 4
  %159 = add nuw nsw i32 %78, 8
  %160 = add i32 %79, 8
  %161 = icmp eq i32 %160, %46
  br i1 %161, label %57, label %77, !llvm.loop !15

162:                                              ; preds = %163, %48
  ret void

163:                                              ; preds = %48, %163
  %164 = phi i32 [ %171, %163 ], [ %12, %48 ]
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %40, i64 %165
  %167 = getelementptr inbounds float, float addrspace(1)* %33, i64 %165
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = fmul contract float %168, %10
  %170 = atomicrmw fadd float addrspace(1)* %166, float %169 syncscope("agent-one-as") monotonic, align 4
  %171 = add nuw nsw i32 %164, %17
  %172 = icmp slt i32 %171, %7
  br i1 %172, label %163, label %162, !llvm.loop !16
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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
