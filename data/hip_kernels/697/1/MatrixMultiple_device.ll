; ModuleID = '../data/hip_kernels/697/1/main.cu'
source_filename = "../data/hip_kernels/697/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14MatrixMultiplePiiiS_iS_(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %11, 5
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add i32 %12, %13
  %15 = add i32 %1, 1
  %16 = sub i32 %15, %4
  %17 = mul nsw i32 %10, %1
  %18 = add nsw i32 %17, %14
  %19 = mul nsw i32 %2, %1
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %160

21:                                               ; preds = %6
  %22 = icmp sgt i32 %4, 0
  br i1 %22, label %23, label %35

23:                                               ; preds = %21
  %24 = and i32 %4, 7
  %25 = icmp ult i32 %4, 8
  %26 = and i32 %4, -8
  %27 = icmp eq i32 %24, 0
  br label %28

28:                                               ; preds = %23, %62
  %29 = phi i32 [ %64, %62 ], [ 0, %23 ]
  %30 = phi i32 [ %63, %62 ], [ 0, %23 ]
  %31 = mul nsw i32 %29, %4
  %32 = add nsw i32 %29, %10
  %33 = mul nsw i32 %32, %1
  %34 = add nsw i32 %33, %14
  br i1 %25, label %41, label %66

35:                                               ; preds = %62, %21
  %36 = phi i32 [ 0, %21 ], [ %63, %62 ]
  %37 = mul nsw i32 %16, %10
  %38 = add nsw i32 %37, %14
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %39
  store i32 %36, i32 addrspace(1)* %40, align 4, !tbaa !5
  br label %160

41:                                               ; preds = %66, %28
  %42 = phi i32 [ undef, %28 ], [ %156, %66 ]
  %43 = phi i32 [ 0, %28 ], [ %157, %66 ]
  %44 = phi i32 [ %30, %28 ], [ %156, %66 ]
  br i1 %27, label %62, label %45

45:                                               ; preds = %41, %45
  %46 = phi i32 [ %59, %45 ], [ %43, %41 ]
  %47 = phi i32 [ %58, %45 ], [ %44, %41 ]
  %48 = phi i32 [ %60, %45 ], [ 0, %41 ]
  %49 = add nsw i32 %46, %31
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !5, !amdgpu.noclobber !9
  %53 = add nsw i32 %34, %46
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = mul nsw i32 %56, %52
  %58 = add nsw i32 %57, %47
  %59 = add nuw nsw i32 %46, 1
  %60 = add i32 %48, 1
  %61 = icmp eq i32 %60, %24
  br i1 %61, label %62, label %45, !llvm.loop !10

62:                                               ; preds = %45, %41
  %63 = phi i32 [ %42, %41 ], [ %58, %45 ]
  %64 = add nuw nsw i32 %29, 1
  %65 = icmp eq i32 %64, %4
  br i1 %65, label %35, label %28, !llvm.loop !12

66:                                               ; preds = %28, %66
  %67 = phi i32 [ %157, %66 ], [ 0, %28 ]
  %68 = phi i32 [ %156, %66 ], [ %30, %28 ]
  %69 = phi i32 [ %158, %66 ], [ 0, %28 ]
  %70 = add nsw i32 %67, %31
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = add nsw i32 %34, %67
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !5, !amdgpu.noclobber !9
  %78 = mul nsw i32 %77, %73
  %79 = add nsw i32 %78, %68
  %80 = or i32 %67, 1
  %81 = add nsw i32 %80, %31
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !5, !amdgpu.noclobber !9
  %85 = add nsw i32 %34, %80
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !5, !amdgpu.noclobber !9
  %89 = mul nsw i32 %88, %84
  %90 = add nsw i32 %89, %79
  %91 = or i32 %67, 2
  %92 = add nsw i32 %91, %31
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %93
  %95 = load i32, i32 addrspace(1)* %94, align 4, !tbaa !5, !amdgpu.noclobber !9
  %96 = add nsw i32 %34, %91
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = mul nsw i32 %99, %95
  %101 = add nsw i32 %100, %90
  %102 = or i32 %67, 3
  %103 = add nsw i32 %102, %31
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !5, !amdgpu.noclobber !9
  %107 = add nsw i32 %34, %102
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %108
  %110 = load i32, i32 addrspace(1)* %109, align 4, !tbaa !5, !amdgpu.noclobber !9
  %111 = mul nsw i32 %110, %106
  %112 = add nsw i32 %111, %101
  %113 = or i32 %67, 4
  %114 = add nsw i32 %113, %31
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  %118 = add nsw i32 %34, %113
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %119
  %121 = load i32, i32 addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = mul nsw i32 %121, %117
  %123 = add nsw i32 %122, %112
  %124 = or i32 %67, 5
  %125 = add nsw i32 %124, %31
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  %129 = add nsw i32 %34, %124
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %130
  %132 = load i32, i32 addrspace(1)* %131, align 4, !tbaa !5, !amdgpu.noclobber !9
  %133 = mul nsw i32 %132, %128
  %134 = add nsw i32 %133, %123
  %135 = or i32 %67, 6
  %136 = add nsw i32 %135, %31
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !5, !amdgpu.noclobber !9
  %140 = add nsw i32 %34, %135
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %141
  %143 = load i32, i32 addrspace(1)* %142, align 4, !tbaa !5, !amdgpu.noclobber !9
  %144 = mul nsw i32 %143, %139
  %145 = add nsw i32 %144, %134
  %146 = or i32 %67, 7
  %147 = add nsw i32 %146, %31
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %148
  %150 = load i32, i32 addrspace(1)* %149, align 4, !tbaa !5, !amdgpu.noclobber !9
  %151 = add nsw i32 %34, %146
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !5, !amdgpu.noclobber !9
  %155 = mul nsw i32 %154, %150
  %156 = add nsw i32 %155, %145
  %157 = add nuw nsw i32 %67, 8
  %158 = add i32 %69, 8
  %159 = icmp eq i32 %158, %26
  br i1 %159, label %41, label %66, !llvm.loop !14

160:                                              ; preds = %35, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
