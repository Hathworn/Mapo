; ModuleID = '../data/hip_kernels/7806/24/main.cu'
source_filename = "../data/hip_kernels/7806/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i16> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23kernelGenerateTrianglesPiP15HIP_vector_typeIsLj2EEPS0_IiLj3EES_iii(i32 addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp sge i32 %16, %5
  %18 = icmp slt i32 %16, %6
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %85

20:                                               ; preds = %7
  %21 = mul nsw i32 %16, %4
  %22 = add nsw i32 %21, %5
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i64 1
  %25 = load i16, i16 addrspace(1)* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = icmp sgt i16 %25, 0
  %28 = icmp slt i32 %26, %6
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %85

30:                                               ; preds = %20
  %31 = add nsw i32 %16, -1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %35
  br label %37

37:                                               ; preds = %30, %76
  %38 = phi i32 [ %81, %76 ], [ %26, %30 ]
  %39 = phi i64 [ %48, %76 ], [ %23, %30 ]
  %40 = phi %struct.HIP_vector_type.0 addrspace(1)* [ %78, %76 ], [ %36, %30 ]
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %39, i32 0, i32 0, i32 0, i64 0
  %42 = load i16, i16 addrspace(1)* %41, align 4
  %43 = add nsw i32 %38, %21
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = add nsw i32 %43, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = add i32 %43, %4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = sext i32 %51 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  switch i16 %42, label %76 [
    i16 0, label %67
    i16 1, label %59
    i16 2, label %60
    i16 3, label %61
    i16 4, label %62
  ]

59:                                               ; preds = %37
  br label %67

60:                                               ; preds = %37
  br label %67

61:                                               ; preds = %37
  br label %67

62:                                               ; preds = %37
  %63 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store i32 %55, i32 addrspace(1)* %63, align 4
  %64 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1
  store i32 %46, i32 addrspace(1)* %64, align 4
  %65 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2
  store i32 %50, i32 addrspace(1)* %65, align 4
  %66 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 1
  br label %67

67:                                               ; preds = %37, %62, %59, %60, %61
  %68 = phi %struct.HIP_vector_type.0 addrspace(1)* [ %40, %61 ], [ %40, %60 ], [ %40, %59 ], [ %66, %62 ], [ %40, %37 ]
  %69 = phi i32 [ %55, %61 ], [ %50, %60 ], [ %46, %59 ], [ %58, %62 ], [ %58, %37 ]
  %70 = phi i64 [ 0, %61 ], [ 0, %60 ], [ 0, %59 ], [ 1, %62 ], [ 0, %37 ]
  %71 = phi i32 [ %46, %61 ], [ %58, %60 ], [ %55, %59 ], [ %46, %62 ], [ %50, %37 ]
  %72 = phi i32 [ %50, %61 ], [ %46, %60 ], [ %58, %59 ], [ %55, %62 ], [ %55, %37 ]
  %73 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %68, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store i32 %69, i32 addrspace(1)* %73, align 4
  %74 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 1
  store i32 %71, i32 addrspace(1)* %74, align 4
  %75 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %40, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 2
  store i32 %72, i32 addrspace(1)* %75, align 4
  br label %76

76:                                               ; preds = %67, %37
  %77 = phi %struct.HIP_vector_type.0 addrspace(1)* [ %40, %37 ], [ %68, %67 ]
  %78 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %77, i64 1
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %48, i32 0, i32 0, i32 0, i64 1
  %80 = load i16, i16 addrspace(1)* %79, align 2
  %81 = sext i16 %80 to i32
  %82 = icmp sgt i16 %80, 0
  %83 = icmp slt i32 %81, %6
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %37, label %85, !llvm.loop !11

85:                                               ; preds = %76, %20, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
