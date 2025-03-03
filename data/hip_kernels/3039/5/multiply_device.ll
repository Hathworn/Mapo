; ModuleID = '../data/hip_kernels/3039/5/main.cu'
source_filename = "../data/hip_kernels/3039/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8multiplyPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
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
  %23 = icmp slt i32 %14, %3
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  %26 = icmp sgt i32 %4, 0
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %159

28:                                               ; preds = %5
  %29 = mul nsw i32 %14, %4
  %30 = and i32 %4, 7
  %31 = icmp ult i32 %4, 8
  br i1 %31, label %136, label %32

32:                                               ; preds = %28
  %33 = and i32 %4, -8
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi i32 [ 0, %32 ], [ %133, %34 ]
  %36 = phi i32 [ 0, %32 ], [ %132, %34 ]
  %37 = phi i32 [ 0, %32 ], [ %134, %34 ]
  %38 = add nsw i32 %35, %29
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nsw i32 %35, %3
  %43 = add nsw i32 %42, %22
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nsw i32 %46, %41
  %48 = add nsw i32 %47, %36
  %49 = or i32 %35, 1
  %50 = add nsw i32 %49, %29
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = mul nsw i32 %49, %3
  %55 = add nsw i32 %54, %22
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = mul nsw i32 %58, %53
  %60 = add nsw i32 %59, %48
  %61 = or i32 %35, 2
  %62 = add nsw i32 %61, %29
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = mul nsw i32 %61, %3
  %67 = add nsw i32 %66, %22
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = mul nsw i32 %70, %65
  %72 = add nsw i32 %71, %60
  %73 = or i32 %35, 3
  %74 = add nsw i32 %73, %29
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = mul nsw i32 %73, %3
  %79 = add nsw i32 %78, %22
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = mul nsw i32 %82, %77
  %84 = add nsw i32 %83, %72
  %85 = or i32 %35, 4
  %86 = add nsw i32 %85, %29
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !7, !amdgpu.noclobber !5
  %90 = mul nsw i32 %85, %3
  %91 = add nsw i32 %90, %22
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = mul nsw i32 %94, %89
  %96 = add nsw i32 %95, %84
  %97 = or i32 %35, 5
  %98 = add nsw i32 %97, %29
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = mul nsw i32 %97, %3
  %103 = add nsw i32 %102, %22
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = mul nsw i32 %106, %101
  %108 = add nsw i32 %107, %96
  %109 = or i32 %35, 6
  %110 = add nsw i32 %109, %29
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = mul nsw i32 %109, %3
  %115 = add nsw i32 %114, %22
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = mul nsw i32 %118, %113
  %120 = add nsw i32 %119, %108
  %121 = or i32 %35, 7
  %122 = add nsw i32 %121, %29
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %123
  %125 = load i32, i32 addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = mul nsw i32 %121, %3
  %127 = add nsw i32 %126, %22
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = mul nsw i32 %130, %125
  %132 = add nsw i32 %131, %120
  %133 = add nuw nsw i32 %35, 8
  %134 = add i32 %37, 8
  %135 = icmp eq i32 %134, %33
  br i1 %135, label %136, label %34, !llvm.loop !11

136:                                              ; preds = %34, %28
  %137 = phi i32 [ undef, %28 ], [ %132, %34 ]
  %138 = phi i32 [ 0, %28 ], [ %133, %34 ]
  %139 = phi i32 [ 0, %28 ], [ %132, %34 ]
  %140 = icmp eq i32 %30, 0
  br i1 %140, label %159, label %141

141:                                              ; preds = %136, %141
  %142 = phi i32 [ %156, %141 ], [ %138, %136 ]
  %143 = phi i32 [ %155, %141 ], [ %139, %136 ]
  %144 = phi i32 [ %157, %141 ], [ 0, %136 ]
  %145 = add nsw i32 %142, %29
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = mul nsw i32 %142, %3
  %150 = add nsw i32 %149, %22
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %151
  %153 = load i32, i32 addrspace(1)* %152, align 4, !tbaa !7, !amdgpu.noclobber !5
  %154 = mul nsw i32 %153, %148
  %155 = add nsw i32 %154, %143
  %156 = add nuw nsw i32 %142, 1
  %157 = add i32 %144, 1
  %158 = icmp eq i32 %157, %30
  br i1 %158, label %159, label %141, !llvm.loop !13

159:                                              ; preds = %136, %141, %5
  %160 = phi i32 [ 0, %5 ], [ %137, %136 ], [ %155, %141 ]
  %161 = mul nsw i32 %14, %3
  %162 = add nsw i32 %161, %22
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %163
  store i32 %160, i32 addrspace(1)* %164, align 4, !tbaa !7
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
