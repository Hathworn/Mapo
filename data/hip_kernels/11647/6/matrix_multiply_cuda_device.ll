; ModuleID = '../data/hip_kernels/11647/6/main.cu'
source_filename = "../data/hip_kernels/11647/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20matrix_multiply_cudaPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp sgt i32 %4, 0
  br i1 %23, label %24, label %53

24:                                               ; preds = %5
  %25 = mul nsw i32 %14, %4
  %26 = and i32 %4, 7
  %27 = icmp ult i32 %4, 8
  br i1 %27, label %30, label %28

28:                                               ; preds = %24
  %29 = and i32 %4, -8
  br label %59

30:                                               ; preds = %59, %24
  %31 = phi i32 [ undef, %24 ], [ %157, %59 ]
  %32 = phi i32 [ 0, %24 ], [ %158, %59 ]
  %33 = phi i32 [ 0, %24 ], [ %157, %59 ]
  %34 = icmp eq i32 %26, 0
  br i1 %34, label %53, label %35

35:                                               ; preds = %30, %35
  %36 = phi i32 [ %50, %35 ], [ %32, %30 ]
  %37 = phi i32 [ %49, %35 ], [ %33, %30 ]
  %38 = phi i32 [ %51, %35 ], [ 0, %30 ]
  %39 = add nsw i32 %36, %25
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = mul nsw i32 %36, %3
  %44 = add nsw i32 %43, %22
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %47, %42
  %49 = add nsw i32 %48, %37
  %50 = add nuw nsw i32 %36, 1
  %51 = add i32 %38, 1
  %52 = icmp eq i32 %51, %26
  br i1 %52, label %53, label %35, !llvm.loop !11

53:                                               ; preds = %30, %35, %5
  %54 = phi i32 [ 0, %5 ], [ %31, %30 ], [ %49, %35 ]
  %55 = mul nsw i32 %14, %3
  %56 = add nsw i32 %55, %22
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %57
  store i32 %54, i32 addrspace(1)* %58, align 4, !tbaa !7
  ret void

59:                                               ; preds = %59, %28
  %60 = phi i32 [ 0, %28 ], [ %158, %59 ]
  %61 = phi i32 [ 0, %28 ], [ %157, %59 ]
  %62 = phi i32 [ 0, %28 ], [ %159, %59 ]
  %63 = add nsw i32 %60, %25
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  %67 = mul nsw i32 %60, %3
  %68 = add nsw i32 %67, %22
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = mul nsw i32 %71, %66
  %73 = add nsw i32 %72, %61
  %74 = or i32 %60, 1
  %75 = add nsw i32 %74, %25
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = mul nsw i32 %74, %3
  %80 = add nsw i32 %79, %22
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = mul nsw i32 %83, %78
  %85 = add nsw i32 %84, %73
  %86 = or i32 %60, 2
  %87 = add nsw i32 %86, %25
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %88
  %90 = load i32, i32 addrspace(1)* %89, align 4, !tbaa !7, !amdgpu.noclobber !5
  %91 = mul nsw i32 %86, %3
  %92 = add nsw i32 %91, %22
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = mul nsw i32 %95, %90
  %97 = add nsw i32 %96, %85
  %98 = or i32 %60, 3
  %99 = add nsw i32 %98, %25
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = mul nsw i32 %98, %3
  %104 = add nsw i32 %103, %22
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %107, %102
  %109 = add nsw i32 %108, %97
  %110 = or i32 %60, 4
  %111 = add nsw i32 %110, %25
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %112
  %114 = load i32, i32 addrspace(1)* %113, align 4, !tbaa !7, !amdgpu.noclobber !5
  %115 = mul nsw i32 %110, %3
  %116 = add nsw i32 %115, %22
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = mul nsw i32 %119, %114
  %121 = add nsw i32 %120, %109
  %122 = or i32 %60, 5
  %123 = add nsw i32 %122, %25
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  %127 = mul nsw i32 %122, %3
  %128 = add nsw i32 %127, %22
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = mul nsw i32 %131, %126
  %133 = add nsw i32 %132, %121
  %134 = or i32 %60, 6
  %135 = add nsw i32 %134, %25
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  %139 = mul nsw i32 %134, %3
  %140 = add nsw i32 %139, %22
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = mul nsw i32 %143, %138
  %145 = add nsw i32 %144, %133
  %146 = or i32 %60, 7
  %147 = add nsw i32 %146, %25
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !7, !amdgpu.noclobber !5
  %151 = mul nsw i32 %146, %3
  %152 = add nsw i32 %151, %22
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = mul nsw i32 %155, %150
  %157 = add nsw i32 %156, %145
  %158 = add nuw nsw i32 %60, 8
  %159 = add i32 %62, 8
  %160 = icmp eq i32 %159, %29
  br i1 %160, label %30, label %59, !llvm.loop !13
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
