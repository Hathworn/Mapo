; ModuleID = '../data/hip_kernels/5366/5/main.cu'
source_filename = "../data/hip_kernels/5366/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14BackwardLinearPfS_iiiS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %2
  %25 = icmp slt i32 %23, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %174

27:                                               ; preds = %6
  %28 = icmp sgt i32 %3, 0
  br i1 %28, label %29, label %58

29:                                               ; preds = %27
  %30 = and i32 %3, 7
  %31 = icmp ult i32 %3, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = and i32 %3, -8
  br label %64

34:                                               ; preds = %64, %29
  %35 = phi float [ undef, %29 ], [ %170, %64 ]
  %36 = phi i32 [ 0, %29 ], [ %171, %64 ]
  %37 = phi float [ 0.000000e+00, %29 ], [ %170, %64 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %58, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %55, %39 ], [ %36, %34 ]
  %41 = phi float [ %54, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %56, %39 ], [ 0, %34 ]
  %43 = mul nsw i32 %40, %2
  %44 = add nsw i32 %43, %15
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %40, %4
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract float %47, %52
  %54 = fadd contract float %41, %53
  %55 = add nuw nsw i32 %40, 1
  %56 = add i32 %42, 1
  %57 = icmp eq i32 %56, %30
  br i1 %57, label %58, label %39, !llvm.loop !11

58:                                               ; preds = %34, %39, %27
  %59 = phi float [ 0.000000e+00, %27 ], [ %35, %34 ], [ %54, %39 ]
  %60 = mul nsw i32 %15, %4
  %61 = add nsw i32 %60, %23
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %62
  store float %59, float addrspace(1)* %63, align 4, !tbaa !7
  br label %174

64:                                               ; preds = %64, %32
  %65 = phi i32 [ 0, %32 ], [ %171, %64 ]
  %66 = phi float [ 0.000000e+00, %32 ], [ %170, %64 ]
  %67 = phi i32 [ 0, %32 ], [ %172, %64 ]
  %68 = mul nsw i32 %65, %2
  %69 = add nsw i32 %68, %15
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = mul nsw i32 %65, %4
  %74 = add nsw i32 %73, %23
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %72, %77
  %79 = fadd contract float %66, %78
  %80 = or i32 %65, 1
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %15
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = mul nsw i32 %80, %4
  %87 = add nsw i32 %86, %23
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = fmul contract float %85, %90
  %92 = fadd contract float %79, %91
  %93 = or i32 %65, 2
  %94 = mul nsw i32 %93, %2
  %95 = add nsw i32 %94, %15
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %1, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7, !amdgpu.noclobber !5
  %99 = mul nsw i32 %93, %4
  %100 = add nsw i32 %99, %23
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !5
  %104 = fmul contract float %98, %103
  %105 = fadd contract float %92, %104
  %106 = or i32 %65, 3
  %107 = mul nsw i32 %106, %2
  %108 = add nsw i32 %107, %15
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = mul nsw i32 %106, %4
  %113 = add nsw i32 %112, %23
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = fmul contract float %111, %116
  %118 = fadd contract float %105, %117
  %119 = or i32 %65, 4
  %120 = mul nsw i32 %119, %2
  %121 = add nsw i32 %120, %15
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = mul nsw i32 %119, %4
  %126 = add nsw i32 %125, %23
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %0, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !5
  %130 = fmul contract float %124, %129
  %131 = fadd contract float %118, %130
  %132 = or i32 %65, 5
  %133 = mul nsw i32 %132, %2
  %134 = add nsw i32 %133, %15
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = mul nsw i32 %132, %4
  %139 = add nsw i32 %138, %23
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %0, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = fmul contract float %137, %142
  %144 = fadd contract float %131, %143
  %145 = or i32 %65, 6
  %146 = mul nsw i32 %145, %2
  %147 = add nsw i32 %146, %15
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %1, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = mul nsw i32 %145, %4
  %152 = add nsw i32 %151, %23
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %0, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = fmul contract float %150, %155
  %157 = fadd contract float %144, %156
  %158 = or i32 %65, 7
  %159 = mul nsw i32 %158, %2
  %160 = add nsw i32 %159, %15
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !5
  %164 = mul nsw i32 %158, %4
  %165 = add nsw i32 %164, %23
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %0, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7, !amdgpu.noclobber !5
  %169 = fmul contract float %163, %168
  %170 = fadd contract float %157, %169
  %171 = add nuw nsw i32 %65, 8
  %172 = add i32 %67, 8
  %173 = icmp eq i32 %172, %33
  br i1 %173, label %34, label %64, !llvm.loop !13

174:                                              ; preds = %58, %6
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
