; ModuleID = '../data/hip_kernels/424/95/main.cu'
source_filename = "../data/hip_kernels/424/95/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17copyChunks_kernelPviP15HIP_vector_typeIiLj2EEiPiS_(i8 addrspace(1)* nocapture readonly %0, i32 %1, %struct.HIP_vector_type addrspace(1)* nocapture %2, i32 %3, i32 addrspace(1)* nocapture readonly %4, i8 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = udiv i32 %18, %15
  %20 = mul i32 %19, %15
  %21 = icmp ugt i32 %18, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %7
  %25 = add i32 %10, %8
  %26 = add i32 %25, %24
  %27 = mul i32 %26, %15
  %28 = add i32 %9, %1
  %29 = add i32 %28, %27
  %30 = icmp slt i32 %29, %3
  br i1 %30, label %31, label %131

31:                                               ; preds = %6
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %32, i32 0, i32 0, i32 0, i64 0
  %34 = load i32, i32 addrspace(1)* %33, align 8, !amdgpu.noclobber !6
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %32, i32 0, i32 0, i32 0, i64 1
  %36 = load i32, i32 addrspace(1)* %35, align 4, !amdgpu.noclobber !6
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %32
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !6
  %39 = icmp sgt i32 %36, 0
  br i1 %39, label %40, label %130

40:                                               ; preds = %31
  %41 = and i32 %36, 7
  %42 = icmp ult i32 %36, 8
  br i1 %42, label %114, label %43

43:                                               ; preds = %40
  %44 = and i32 %36, -8
  br label %45

45:                                               ; preds = %45, %43
  %46 = phi i32 [ 0, %43 ], [ %111, %45 ]
  %47 = phi i32 [ 0, %43 ], [ %112, %45 ]
  %48 = add nsw i32 %46, %34
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %49
  %51 = load i8, i8 addrspace(1)* %50, align 1, !tbaa !20
  %52 = add nsw i32 %46, %38
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %53
  store i8 %51, i8 addrspace(1)* %54, align 1, !tbaa !20
  %55 = or i32 %46, 1
  %56 = add nsw i32 %55, %34
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !20
  %60 = add nsw i32 %55, %38
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %61
  store i8 %59, i8 addrspace(1)* %62, align 1, !tbaa !20
  %63 = or i32 %46, 2
  %64 = add nsw i32 %63, %34
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %65
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !20
  %68 = add nsw i32 %63, %38
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %69
  store i8 %67, i8 addrspace(1)* %70, align 1, !tbaa !20
  %71 = or i32 %46, 3
  %72 = add nsw i32 %71, %34
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !20
  %76 = add nsw i32 %71, %38
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %77
  store i8 %75, i8 addrspace(1)* %78, align 1, !tbaa !20
  %79 = or i32 %46, 4
  %80 = add nsw i32 %79, %34
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %81
  %83 = load i8, i8 addrspace(1)* %82, align 1, !tbaa !20
  %84 = add nsw i32 %79, %38
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %85
  store i8 %83, i8 addrspace(1)* %86, align 1, !tbaa !20
  %87 = or i32 %46, 5
  %88 = add nsw i32 %87, %34
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %89
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !20
  %92 = add nsw i32 %87, %38
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %93
  store i8 %91, i8 addrspace(1)* %94, align 1, !tbaa !20
  %95 = or i32 %46, 6
  %96 = add nsw i32 %95, %34
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !20
  %100 = add nsw i32 %95, %38
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %101
  store i8 %99, i8 addrspace(1)* %102, align 1, !tbaa !20
  %103 = or i32 %46, 7
  %104 = add nsw i32 %103, %34
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %105
  %107 = load i8, i8 addrspace(1)* %106, align 1, !tbaa !20
  %108 = add nsw i32 %103, %38
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %109
  store i8 %107, i8 addrspace(1)* %110, align 1, !tbaa !20
  %111 = add nuw nsw i32 %46, 8
  %112 = add i32 %47, 8
  %113 = icmp eq i32 %112, %44
  br i1 %113, label %114, label %45, !llvm.loop !21

114:                                              ; preds = %45, %40
  %115 = phi i32 [ 0, %40 ], [ %111, %45 ]
  %116 = icmp eq i32 %41, 0
  br i1 %116, label %130, label %117

117:                                              ; preds = %114, %117
  %118 = phi i32 [ %127, %117 ], [ %115, %114 ]
  %119 = phi i32 [ %128, %117 ], [ 0, %114 ]
  %120 = add nsw i32 %118, %34
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %121
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !20
  %124 = add nsw i32 %118, %38
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %125
  store i8 %123, i8 addrspace(1)* %126, align 1, !tbaa !20
  %127 = add nuw nsw i32 %118, 1
  %128 = add i32 %119, 1
  %129 = icmp eq i32 %128, %41
  br i1 %129, label %130, label %117, !llvm.loop !23

130:                                              ; preds = %114, %117, %31
  store i32 %38, i32 addrspace(1)* %33, align 8
  store i32 %36, i32 addrspace(1)* %35, align 4
  br label %131

131:                                              ; preds = %130, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
