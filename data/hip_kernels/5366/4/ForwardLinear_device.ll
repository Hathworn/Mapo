; ModuleID = '../data/hip_kernels/5366/4/main.cu'
source_filename = "../data/hip_kernels/5366/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13ForwardLinearPfS_S_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %16, %3
  %26 = icmp slt i32 %24, %5
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %171

28:                                               ; preds = %7
  %29 = icmp sgt i32 %4, 0
  br i1 %29, label %30, label %59

30:                                               ; preds = %28
  %31 = mul nsw i32 %16, %4
  %32 = and i32 %4, 7
  %33 = icmp ult i32 %4, 8
  br i1 %33, label %36, label %34

34:                                               ; preds = %30
  %35 = and i32 %4, -8
  br label %69

36:                                               ; preds = %69, %30
  %37 = phi float [ undef, %30 ], [ %167, %69 ]
  %38 = phi i32 [ 0, %30 ], [ %168, %69 ]
  %39 = phi float [ 0.000000e+00, %30 ], [ %167, %69 ]
  %40 = icmp eq i32 %32, 0
  br i1 %40, label %59, label %41

41:                                               ; preds = %36, %41
  %42 = phi i32 [ %56, %41 ], [ %38, %36 ]
  %43 = phi float [ %55, %41 ], [ %39, %36 ]
  %44 = phi i32 [ %57, %41 ], [ 0, %36 ]
  %45 = add nsw i32 %42, %31
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = mul nsw i32 %42, %5
  %50 = add nsw i32 %49, %24
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %43, %54
  %56 = add nuw nsw i32 %42, 1
  %57 = add i32 %44, 1
  %58 = icmp eq i32 %57, %32
  br i1 %58, label %59, label %41, !llvm.loop !11

59:                                               ; preds = %36, %41, %28
  %60 = phi float [ 0.000000e+00, %28 ], [ %37, %36 ], [ %55, %41 ]
  %61 = sext i32 %16 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fadd contract float %60, %63
  %65 = mul nsw i32 %16, %5
  %66 = add nsw i32 %65, %24
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %6, i64 %67
  store float %64, float addrspace(1)* %68, align 4, !tbaa !7
  br label %171

69:                                               ; preds = %69, %34
  %70 = phi i32 [ 0, %34 ], [ %168, %69 ]
  %71 = phi float [ 0.000000e+00, %34 ], [ %167, %69 ]
  %72 = phi i32 [ 0, %34 ], [ %169, %69 ]
  %73 = add nsw i32 %70, %31
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %70, %5
  %78 = add nsw i32 %77, %24
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = fmul contract float %76, %81
  %83 = fadd contract float %71, %82
  %84 = or i32 %70, 1
  %85 = add nsw i32 %84, %31
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %1, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %84, %5
  %90 = add nsw i32 %89, %24
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fmul contract float %88, %93
  %95 = fadd contract float %83, %94
  %96 = or i32 %70, 2
  %97 = add nsw i32 %96, %31
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %96, %5
  %102 = add nsw i32 %101, %24
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %100, %105
  %107 = fadd contract float %95, %106
  %108 = or i32 %70, 3
  %109 = add nsw i32 %108, %31
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = mul nsw i32 %108, %5
  %114 = add nsw i32 %113, %24
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract float %112, %117
  %119 = fadd contract float %107, %118
  %120 = or i32 %70, 4
  %121 = add nsw i32 %120, %31
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = mul nsw i32 %120, %5
  %126 = add nsw i32 %125, %24
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract float %124, %129
  %131 = fadd contract float %119, %130
  %132 = or i32 %70, 5
  %133 = add nsw i32 %132, %31
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = mul nsw i32 %132, %5
  %138 = add nsw i32 %137, %24
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !7, !amdgpu.noclobber !5
  %142 = fmul contract float %136, %141
  %143 = fadd contract float %131, %142
  %144 = or i32 %70, 6
  %145 = add nsw i32 %144, %31
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = mul nsw i32 %144, %5
  %150 = add nsw i32 %149, %24
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %0, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = fmul contract float %148, %153
  %155 = fadd contract float %143, %154
  %156 = or i32 %70, 7
  %157 = add nsw i32 %156, %31
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %156, %5
  %162 = add nsw i32 %161, %24
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = fmul contract float %160, %165
  %167 = fadd contract float %155, %166
  %168 = add nuw nsw i32 %70, 8
  %169 = add i32 %72, 8
  %170 = icmp eq i32 %169, %35
  br i1 %170, label %36, label %69, !llvm.loop !13

171:                                              ; preds = %59, %7
  ret void
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
