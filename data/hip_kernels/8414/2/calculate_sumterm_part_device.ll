; ModuleID = '../data/hip_kernels/8414/2/main.cu'
source_filename = "../data/hip_kernels/8414/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22calculate_sumterm_partP15HIP_vector_typeIfLj2EES1_PKS0_PKfPKhjjfjj(%struct.HIP_vector_type addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, float %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %18, %11
  %20 = freeze i32 %19
  %21 = mul i32 %6, %5
  %22 = icmp ult i32 %20, %21
  %23 = icmp ne i32 %8, 0
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %128

25:                                               ; preds = %10, %25
  %26 = phi i32 [ %126, %25 ], [ 0, %10 ]
  %27 = shl nsw i32 %26, 2
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7
  %31 = zext i8 %30 to i32
  %32 = add nsw i32 %31, -1
  %33 = add nuw nsw i32 %27, 1
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %34
  %36 = load i8, i8 addrspace(1)* %35, align 1, !tbaa !7
  %37 = zext i8 %36 to i32
  %38 = add nsw i32 %37, -1
  %39 = add nuw nsw i32 %27, 2
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7
  %43 = zext i8 %42 to i32
  %44 = add nsw i32 %43, -1
  %45 = add nuw nsw i32 %27, 3
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %46
  %48 = load i8, i8 addrspace(1)* %47, align 1, !tbaa !7
  %49 = zext i8 %48 to i32
  %50 = add nsw i32 %49, -1
  %51 = mul i32 %38, %21
  %52 = add i32 %51, %20
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %53, i32 0, i32 0, i32 0, i64 0
  %55 = load float, float addrspace(1)* %54, align 8, !tbaa !7
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %53, i32 0, i32 0, i32 0, i64 1
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = mul i32 %44, %21
  %59 = add i32 %58, %20
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %60, i32 0, i32 0, i32 0, i64 0
  %62 = load float, float addrspace(1)* %61, align 8, !tbaa !7
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %60, i32 0, i32 0, i32 0, i64 1
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  %65 = mul i32 %50, %21
  %66 = add i32 %65, %20
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %67, i32 0, i32 0, i32 0, i64 0
  %69 = load float, float addrspace(1)* %68, align 8, !tbaa !7
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %67, i32 0, i32 0, i32 0, i64 1
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = mul i32 %32, %21
  %73 = add i32 %72, %20
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %74, i32 0, i32 0, i32 0, i64 0
  %76 = load float, float addrspace(1)* %75, align 8, !tbaa !7
  %77 = zext i32 %26 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !10
  %80 = fmul contract float %79, %7
  %81 = fmul contract float %55, %62
  %82 = fmul contract float %81, %69
  %83 = fmul contract float %57, %64
  %84 = fmul contract float %83, %69
  %85 = fsub contract float %82, %84
  %86 = fmul contract float %55, %64
  %87 = fmul contract float %86, %71
  %88 = fadd contract float %85, %87
  %89 = fmul contract float %57, %62
  %90 = fmul contract float %89, %71
  %91 = fadd contract float %90, %88
  %92 = fmul contract float %80, %91
  %93 = fadd contract float %76, %92
  store float %93, float addrspace(1)* %75, align 8, !tbaa !7
  %94 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %74, i32 0, i32 0, i32 0, i64 1
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = load float, float addrspace(1)* %78, align 4, !tbaa !10
  %97 = fmul contract float %96, %7
  %98 = fmul contract float %86, %69
  %99 = fmul contract float %89, %69
  %100 = fadd contract float %98, %99
  %101 = fmul contract float %81, %71
  %102 = fsub contract float %100, %101
  %103 = fmul contract float %83, %71
  %104 = fadd contract float %103, %102
  %105 = fmul contract float %104, %97
  %106 = fadd contract float %95, %105
  store float %106, float addrspace(1)* %94, align 4, !tbaa !7
  %107 = mul i32 %51, %9
  %108 = add i32 %107, %73
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %109, i32 0, i32 0, i32 0, i64 0
  %111 = load float, float addrspace(1)* %110, align 8, !tbaa !7
  %112 = load float, float addrspace(1)* %78, align 4, !tbaa !10
  %113 = fmul contract float %62, %69
  %114 = fmul contract float %64, %71
  %115 = fadd contract float %113, %114
  %116 = fmul contract float %115, %112
  %117 = fadd contract float %111, %116
  store float %117, float addrspace(1)* %110, align 8, !tbaa !7
  %118 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %109, i32 0, i32 0, i32 0, i64 1
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7
  %120 = load float, float addrspace(1)* %78, align 4, !tbaa !10
  %121 = fmul contract float %64, %69
  %122 = fmul contract float %62, %71
  %123 = fsub contract float %121, %122
  %124 = fmul contract float %123, %120
  %125 = fadd contract float %119, %124
  store float %125, float addrspace(1)* %118, align 4, !tbaa !7
  %126 = add nuw nsw i32 %26, 1
  %127 = icmp eq i32 %126, %8
  br i1 %127, label %128, label %25, !llvm.loop !12

128:                                              ; preds = %25, %10
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
