; ModuleID = '../data/hip_kernels/1114/58/main.cu'
source_filename = "../data/hip_kernels/1114/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21set_segmented_nnz_numPiS_S_S_S_mmiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i64 %5, i64 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %7
  br i1 %20, label %21, label %136

21:                                               ; preds = %10
  %22 = add nsw i32 %19, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = sext i32 %19 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %29 = sub nsw i32 %25, %28
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %136

31:                                               ; preds = %21
  %32 = xor i32 %28, -1
  %33 = add i32 %25, %32
  %34 = and i32 %29, 3
  %35 = icmp ult i32 %33, 3
  br i1 %35, label %111, label %36

36:                                               ; preds = %31
  %37 = and i32 %29, -4
  br label %38

38:                                               ; preds = %38, %36
  %39 = phi i32 [ 0, %36 ], [ %108, %38 ]
  %40 = phi i32 [ 0, %36 ], [ %109, %38 ]
  %41 = add nsw i32 %39, %28
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = sext i32 %44 to i64
  %46 = udiv i64 %45, %5
  %47 = trunc i64 %46 to i32
  %48 = mul nsw i32 %47, %8
  %49 = add nsw i32 %48, %19
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  store i32 %52, i32 addrspace(1)* %53, align 4, !tbaa !7
  %54 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %55 = add nsw i32 %54, 1
  store i32 %55, i32 addrspace(1)* %51, align 4, !tbaa !7
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %42
  store i32 %47, i32 addrspace(1)* %56, align 4, !tbaa !7
  %57 = or i32 %39, 1
  %58 = add nsw i32 %57, %28
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = sext i32 %61 to i64
  %63 = udiv i64 %62, %5
  %64 = trunc i64 %63 to i32
  %65 = mul nsw i32 %64, %8
  %66 = add nsw i32 %65, %19
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %59
  store i32 %69, i32 addrspace(1)* %70, align 4, !tbaa !7
  %71 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %72 = add nsw i32 %71, 1
  store i32 %72, i32 addrspace(1)* %68, align 4, !tbaa !7
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  store i32 %64, i32 addrspace(1)* %73, align 4, !tbaa !7
  %74 = or i32 %39, 2
  %75 = add nsw i32 %74, %28
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7
  %79 = sext i32 %78 to i64
  %80 = udiv i64 %79, %5
  %81 = trunc i64 %80 to i32
  %82 = mul nsw i32 %81, %8
  %83 = add nsw i32 %82, %19
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %84
  %86 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %76
  store i32 %86, i32 addrspace(1)* %87, align 4, !tbaa !7
  %88 = load i32, i32 addrspace(1)* %85, align 4, !tbaa !7
  %89 = add nsw i32 %88, 1
  store i32 %89, i32 addrspace(1)* %85, align 4, !tbaa !7
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %76
  store i32 %81, i32 addrspace(1)* %90, align 4, !tbaa !7
  %91 = or i32 %39, 3
  %92 = add nsw i32 %91, %28
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7
  %96 = sext i32 %95 to i64
  %97 = udiv i64 %96, %5
  %98 = trunc i64 %97 to i32
  %99 = mul nsw i32 %98, %8
  %100 = add nsw i32 %99, %19
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %93
  store i32 %103, i32 addrspace(1)* %104, align 4, !tbaa !7
  %105 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !7
  %106 = add nsw i32 %105, 1
  store i32 %106, i32 addrspace(1)* %102, align 4, !tbaa !7
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %93
  store i32 %98, i32 addrspace(1)* %107, align 4, !tbaa !7
  %108 = add nuw nsw i32 %39, 4
  %109 = add i32 %40, 4
  %110 = icmp eq i32 %109, %37
  br i1 %110, label %111, label %38, !llvm.loop !11

111:                                              ; preds = %38, %31
  %112 = phi i32 [ 0, %31 ], [ %108, %38 ]
  %113 = icmp eq i32 %34, 0
  br i1 %113, label %136, label %114

114:                                              ; preds = %111, %114
  %115 = phi i32 [ %133, %114 ], [ %112, %111 ]
  %116 = phi i32 [ %134, %114 ], [ 0, %111 ]
  %117 = add nsw i32 %115, %28
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !7
  %121 = sext i32 %120 to i64
  %122 = udiv i64 %121, %5
  %123 = trunc i64 %122 to i32
  %124 = mul nsw i32 %123, %8
  %125 = add nsw i32 %124, %19
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !7
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %118
  store i32 %128, i32 addrspace(1)* %129, align 4, !tbaa !7
  %130 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !7
  %131 = add nsw i32 %130, 1
  store i32 %131, i32 addrspace(1)* %127, align 4, !tbaa !7
  %132 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %118
  store i32 %123, i32 addrspace(1)* %132, align 4, !tbaa !7
  %133 = add nuw nsw i32 %115, 1
  %134 = add i32 %116, 1
  %135 = icmp eq i32 %134, %34
  br i1 %135, label %136, label %114, !llvm.loop !13

136:                                              ; preds = %111, %114, %21, %10
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
