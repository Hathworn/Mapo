; ModuleID = '../data/hip_kernels/7806/23/main.cu'
source_filename = "../data/hip_kernels/7806/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i16> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14kernelCountRowPiP15HIP_vector_typeIsLj2EES_iiiS_(i32 addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, 1
  %18 = icmp sgt i32 %16, %5
  %19 = select i1 %17, i1 true, i1 %18
  br i1 %19, label %53, label %20

20:                                               ; preds = %7
  %21 = mul nsw i32 %4, %3
  %22 = add nsw i32 %16, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = zext i32 %16 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %26
  store i32 %25, i32 addrspace(1)* %27, align 4, !tbaa !7
  %28 = mul nsw i32 %16, %3
  %29 = add nsw i32 %28, %4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = add nsw i32 %16, %3
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %34
  store i32 %32, i32 addrspace(1)* %35, align 4, !tbaa !7
  %36 = mul nsw i32 %5, %3
  %37 = add nsw i32 %16, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  %41 = shl nsw i32 %3, 1
  %42 = add nsw i32 %16, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %43
  store i32 %40, i32 addrspace(1)* %44, align 4, !tbaa !7
  %45 = add nsw i32 %28, %5
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7
  %49 = mul nsw i32 %3, 3
  %50 = add nsw i32 %16, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %51
  store i32 %48, i32 addrspace(1)* %52, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %20, %7
  %54 = icmp sge i32 %16, %4
  %55 = icmp slt i32 %16, %5
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %91

57:                                               ; preds = %53
  %58 = mul nsw i32 %16, %3
  %59 = add nsw i32 %58, %4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %60, i32 0, i32 0, i32 0, i64 1
  %62 = load i16, i16 addrspace(1)* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = icmp sgt i16 %62, 0
  %65 = icmp slt i32 %63, %5
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %87

67:                                               ; preds = %57
  %68 = add i32 %58, 1
  br label %69

69:                                               ; preds = %67, %69
  %70 = phi i32 [ %63, %67 ], [ %83, %69 ]
  %71 = phi i64 [ %60, %67 ], [ %80, %69 ]
  %72 = phi i32 [ 0, %67 ], [ %78, %69 ]
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %71, i32 0, i32 0, i32 0, i64 0
  %74 = load i16, i16 addrspace(1)* %73, align 4
  %75 = ashr i16 %74, 2
  %76 = add nsw i16 %75, 1
  %77 = sext i16 %76 to i32
  %78 = add nsw i32 %72, %77
  %79 = add i32 %68, %70
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %80, i32 0, i32 0, i32 0, i64 1
  %82 = load i16, i16 addrspace(1)* %81, align 2
  %83 = sext i16 %82 to i32
  %84 = icmp sgt i16 %82, 0
  %85 = icmp slt i32 %83, %5
  %86 = select i1 %84, i1 %85, i1 false
  br i1 %86, label %69, label %87, !llvm.loop !11

87:                                               ; preds = %69, %57
  %88 = phi i32 [ 0, %57 ], [ %78, %69 ]
  %89 = sext i32 %16 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %89
  store i32 %88, i32 addrspace(1)* %90, align 4, !tbaa !7
  br label %91

91:                                               ; preds = %53, %87
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
