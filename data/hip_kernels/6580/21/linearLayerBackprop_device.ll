; ModuleID = '../data/hip_kernels/6580/21/main.cu'
source_filename = "../data/hip_kernels/6580/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19linearLayerBackpropPfS_S_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %3
  %26 = icmp slt i32 %16, %5
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %175

28:                                               ; preds = %7
  %29 = icmp sgt i32 %4, 0
  br i1 %29, label %30, label %59

30:                                               ; preds = %28
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %4, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %4, -8
  br label %65

35:                                               ; preds = %65, %30
  %36 = phi float [ undef, %30 ], [ %171, %65 ]
  %37 = phi i32 [ 0, %30 ], [ %172, %65 ]
  %38 = phi float [ 0.000000e+00, %30 ], [ %171, %65 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %59, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %56, %40 ], [ %37, %35 ]
  %42 = phi float [ %55, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %57, %40 ], [ 0, %35 ]
  %44 = mul nsw i32 %41, %3
  %45 = add nsw i32 %44, %24
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = mul nsw i32 %41, %5
  %50 = add nsw i32 %49, %16
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %42, %54
  %56 = add nuw nsw i32 %41, 1
  %57 = add i32 %43, 1
  %58 = icmp eq i32 %57, %31
  br i1 %58, label %59, label %40, !llvm.loop !11

59:                                               ; preds = %35, %40, %28
  %60 = phi float [ 0.000000e+00, %28 ], [ %36, %35 ], [ %55, %40 ]
  %61 = mul nsw i32 %24, %5
  %62 = add nsw i32 %61, %16
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  store float %60, float addrspace(1)* %64, align 4, !tbaa !7
  br label %175

65:                                               ; preds = %65, %33
  %66 = phi i32 [ 0, %33 ], [ %172, %65 ]
  %67 = phi float [ 0.000000e+00, %33 ], [ %171, %65 ]
  %68 = phi i32 [ 0, %33 ], [ %173, %65 ]
  %69 = mul nsw i32 %66, %3
  %70 = add nsw i32 %69, %24
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !5
  %74 = mul nsw i32 %66, %5
  %75 = add nsw i32 %74, %16
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fmul contract float %73, %78
  %80 = fadd contract float %67, %79
  %81 = or i32 %66, 1
  %82 = mul nsw i32 %81, %3
  %83 = add nsw i32 %82, %24
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = mul nsw i32 %81, %5
  %88 = add nsw i32 %87, %16
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %80, %92
  %94 = or i32 %66, 2
  %95 = mul nsw i32 %94, %3
  %96 = add nsw i32 %95, %24
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = mul nsw i32 %94, %5
  %101 = add nsw i32 %100, %16
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %99, %104
  %106 = fadd contract float %93, %105
  %107 = or i32 %66, 3
  %108 = mul nsw i32 %107, %3
  %109 = add nsw i32 %108, %24
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = mul nsw i32 %107, %5
  %114 = add nsw i32 %113, %16
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fmul contract float %112, %117
  %119 = fadd contract float %106, %118
  %120 = or i32 %66, 4
  %121 = mul nsw i32 %120, %3
  %122 = add nsw i32 %121, %24
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = mul nsw i32 %120, %5
  %127 = add nsw i32 %126, %16
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract float %125, %130
  %132 = fadd contract float %119, %131
  %133 = or i32 %66, 5
  %134 = mul nsw i32 %133, %3
  %135 = add nsw i32 %134, %24
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %0, i64 %136
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = mul nsw i32 %133, %5
  %140 = add nsw i32 %139, %16
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = fmul contract float %138, %143
  %145 = fadd contract float %132, %144
  %146 = or i32 %66, 6
  %147 = mul nsw i32 %146, %3
  %148 = add nsw i32 %147, %24
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %0, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7, !amdgpu.noclobber !5
  %152 = mul nsw i32 %146, %5
  %153 = add nsw i32 %152, %16
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds float, float addrspace(1)* %1, i64 %154
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !7, !amdgpu.noclobber !5
  %157 = fmul contract float %151, %156
  %158 = fadd contract float %145, %157
  %159 = or i32 %66, 7
  %160 = mul nsw i32 %159, %3
  %161 = add nsw i32 %160, %24
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !7, !amdgpu.noclobber !5
  %165 = mul nsw i32 %159, %5
  %166 = add nsw i32 %165, %16
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %1, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7, !amdgpu.noclobber !5
  %170 = fmul contract float %164, %169
  %171 = fadd contract float %158, %170
  %172 = add nuw nsw i32 %66, 8
  %173 = add i32 %68, 8
  %174 = icmp eq i32 %173, %34
  br i1 %174, label %35, label %65, !llvm.loop !13

175:                                              ; preds = %59, %7
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
