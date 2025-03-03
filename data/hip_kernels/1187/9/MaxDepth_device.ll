; ModuleID = '../data/hip_kernels/1187/9/main.cu'
source_filename = "../data/hip_kernels/1187/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8MaxDepthiPKfiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = freeze i32 %14
  %16 = icmp slt i32 %15, %0
  br i1 %16, label %17, label %171

17:                                               ; preds = %5
  %18 = srem i32 %15, %2
  %19 = sub nsw i32 %15, %18
  %20 = mul nsw i32 %19, %3
  %21 = add nsw i32 %20, %18
  %22 = icmp sgt i32 %3, 1
  br i1 %22, label %23, label %57

23:                                               ; preds = %17
  %24 = add i32 %3, -1
  %25 = add i32 %3, -2
  %26 = and i32 %24, 7
  %27 = icmp ult i32 %25, 7
  br i1 %27, label %30, label %28

28:                                               ; preds = %23
  %29 = and i32 %24, -8
  br label %61

30:                                               ; preds = %61, %23
  %31 = phi i32 [ undef, %23 ], [ %167, %61 ]
  %32 = phi i32 [ 1, %23 ], [ %168, %61 ]
  %33 = phi i32 [ 0, %23 ], [ %167, %61 ]
  %34 = icmp eq i32 %26, 0
  br i1 %34, label %54, label %35

35:                                               ; preds = %30, %35
  %36 = phi i32 [ %51, %35 ], [ %32, %30 ]
  %37 = phi i32 [ %50, %35 ], [ %33, %30 ]
  %38 = phi i32 [ %52, %35 ], [ 0, %30 ]
  %39 = mul nsw i32 %37, %2
  %40 = add nsw i32 %39, %21
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %36, %2
  %45 = add nsw i32 %44, %21
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fcmp contract olt float %43, %48
  %50 = select i1 %49, i32 %36, i32 %37
  %51 = add nuw nsw i32 %36, 1
  %52 = add i32 %38, 1
  %53 = icmp eq i32 %52, %26
  br i1 %53, label %54, label %35, !llvm.loop !11

54:                                               ; preds = %35, %30
  %55 = phi i32 [ %31, %30 ], [ %50, %35 ]
  %56 = sitofp i32 %55 to float
  br label %57

57:                                               ; preds = %54, %17
  %58 = phi float [ 0.000000e+00, %17 ], [ %56, %54 ]
  %59 = sext i32 %15 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  br label %171

61:                                               ; preds = %61, %28
  %62 = phi i32 [ 1, %28 ], [ %168, %61 ]
  %63 = phi i32 [ 0, %28 ], [ %167, %61 ]
  %64 = phi i32 [ 0, %28 ], [ %169, %61 ]
  %65 = mul nsw i32 %63, %2
  %66 = add nsw i32 %65, %21
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = mul nsw i32 %62, %2
  %71 = add nsw i32 %70, %21
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = fcmp contract olt float %69, %74
  %76 = select i1 %75, i32 %62, i32 %63
  %77 = add nuw nsw i32 %62, 1
  %78 = mul nsw i32 %76, %2
  %79 = add nsw i32 %78, %21
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = mul nsw i32 %77, %2
  %84 = add nsw i32 %83, %21
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fcmp contract olt float %82, %87
  %89 = select i1 %88, i32 %77, i32 %76
  %90 = add nuw nsw i32 %62, 2
  %91 = mul nsw i32 %89, %2
  %92 = add nsw i32 %91, %21
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %1, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = mul nsw i32 %90, %2
  %97 = add nsw i32 %96, %21
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %1, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fcmp contract olt float %95, %100
  %102 = select i1 %101, i32 %90, i32 %89
  %103 = add nuw nsw i32 %62, 3
  %104 = mul nsw i32 %102, %2
  %105 = add nsw i32 %104, %21
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7, !amdgpu.noclobber !5
  %109 = mul nsw i32 %103, %2
  %110 = add nsw i32 %109, %21
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fcmp contract olt float %108, %113
  %115 = select i1 %114, i32 %103, i32 %102
  %116 = add nuw nsw i32 %62, 4
  %117 = mul nsw i32 %115, %2
  %118 = add nsw i32 %117, %21
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  %122 = mul nsw i32 %116, %2
  %123 = add nsw i32 %122, %21
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %1, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = fcmp contract olt float %121, %126
  %128 = select i1 %127, i32 %116, i32 %115
  %129 = add nuw nsw i32 %62, 5
  %130 = mul nsw i32 %128, %2
  %131 = add nsw i32 %130, %21
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %1, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = mul nsw i32 %129, %2
  %136 = add nsw i32 %135, %21
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !5
  %140 = fcmp contract olt float %134, %139
  %141 = select i1 %140, i32 %129, i32 %128
  %142 = add nuw nsw i32 %62, 6
  %143 = mul nsw i32 %141, %2
  %144 = add nsw i32 %143, %21
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = mul nsw i32 %142, %2
  %149 = add nsw i32 %148, %21
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %1, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = fcmp contract olt float %147, %152
  %154 = select i1 %153, i32 %142, i32 %141
  %155 = add nuw nsw i32 %62, 7
  %156 = mul nsw i32 %154, %2
  %157 = add nsw i32 %156, %21
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %1, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %155, %2
  %162 = add nsw i32 %161, %21
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %1, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7, !amdgpu.noclobber !5
  %166 = fcmp contract olt float %160, %165
  %167 = select i1 %166, i32 %155, i32 %154
  %168 = add nuw nsw i32 %62, 8
  %169 = add i32 %64, 8
  %170 = icmp eq i32 %169, %29
  br i1 %170, label %30, label %61, !llvm.loop !13

171:                                              ; preds = %5, %57
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
