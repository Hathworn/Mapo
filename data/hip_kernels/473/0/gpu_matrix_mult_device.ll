; ModuleID = '../data/hip_kernels/473/0/main.cu'
source_filename = "../data/hip_kernels/473/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gpu_matrix_multPiS_S_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
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
  %24 = icmp slt i32 %23, %5
  %25 = icmp slt i32 %15, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %166

27:                                               ; preds = %6
  %28 = icmp sgt i32 %4, 0
  br i1 %28, label %29, label %58

29:                                               ; preds = %27
  %30 = mul nsw i32 %15, %4
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %4, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = and i32 %4, -8
  br label %64

35:                                               ; preds = %64, %29
  %36 = phi i32 [ undef, %29 ], [ %162, %64 ]
  %37 = phi i32 [ 0, %29 ], [ %163, %64 ]
  %38 = phi i32 [ 0, %29 ], [ %162, %64 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %58, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %55, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %54, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %56, %40 ], [ 0, %35 ]
  %44 = add nsw i32 %41, %30
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = mul nsw i32 %41, %5
  %49 = add nsw i32 %48, %23
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = mul nsw i32 %52, %47
  %54 = add nsw i32 %53, %42
  %55 = add nuw nsw i32 %41, 1
  %56 = add i32 %43, 1
  %57 = icmp eq i32 %56, %31
  br i1 %57, label %58, label %40, !llvm.loop !11

58:                                               ; preds = %35, %40, %27
  %59 = phi i32 [ 0, %27 ], [ %36, %35 ], [ %54, %40 ]
  %60 = mul nsw i32 %15, %5
  %61 = add nsw i32 %60, %23
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %62
  store i32 %59, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %166

64:                                               ; preds = %64, %33
  %65 = phi i32 [ 0, %33 ], [ %163, %64 ]
  %66 = phi i32 [ 0, %33 ], [ %162, %64 ]
  %67 = phi i32 [ 0, %33 ], [ %164, %64 ]
  %68 = add nsw i32 %65, %30
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = mul nsw i32 %65, %5
  %73 = add nsw i32 %72, %23
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = mul nsw i32 %76, %71
  %78 = add nsw i32 %77, %66
  %79 = or i32 %65, 1
  %80 = add nsw i32 %79, %30
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = mul nsw i32 %79, %5
  %85 = add nsw i32 %84, %23
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %88, %83
  %90 = add nsw i32 %89, %78
  %91 = or i32 %65, 2
  %92 = add nsw i32 %91, %30
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !7, !amdgpu.noclobber !5
  %96 = mul nsw i32 %91, %5
  %97 = add nsw i32 %96, %23
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %100, %95
  %102 = add nsw i32 %101, %90
  %103 = or i32 %65, 3
  %104 = add nsw i32 %103, %30
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = mul nsw i32 %103, %5
  %109 = add nsw i32 %108, %23
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = mul nsw i32 %112, %107
  %114 = add nsw i32 %113, %102
  %115 = or i32 %65, 4
  %116 = add nsw i32 %115, %30
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %117
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = mul nsw i32 %115, %5
  %121 = add nsw i32 %120, %23
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = mul nsw i32 %124, %119
  %126 = add nsw i32 %125, %114
  %127 = or i32 %65, 5
  %128 = add nsw i32 %127, %30
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !5
  %132 = mul nsw i32 %127, %5
  %133 = add nsw i32 %132, %23
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = mul nsw i32 %136, %131
  %138 = add nsw i32 %137, %126
  %139 = or i32 %65, 6
  %140 = add nsw i32 %139, %30
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !5
  %144 = mul nsw i32 %139, %5
  %145 = add nsw i32 %144, %23
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = mul nsw i32 %148, %143
  %150 = add nsw i32 %149, %138
  %151 = or i32 %65, 7
  %152 = add nsw i32 %151, %30
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !7, !amdgpu.noclobber !5
  %156 = mul nsw i32 %151, %5
  %157 = add nsw i32 %156, %23
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %158
  %160 = load i32, i32 addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !5
  %161 = mul nsw i32 %160, %155
  %162 = add nsw i32 %161, %150
  %163 = add nuw nsw i32 %65, 8
  %164 = add i32 %67, 8
  %165 = icmp eq i32 %164, %34
  br i1 %165, label %35, label %64, !llvm.loop !13

166:                                              ; preds = %58, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
