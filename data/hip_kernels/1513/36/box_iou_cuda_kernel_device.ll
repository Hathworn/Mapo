; ModuleID = '../data/hip_kernels/1513/36/main.cu'
source_filename = "../data/hip_kernels/1513/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19box_iou_cuda_kernelPfP15HIP_vector_typeIfLj4EES2_lli(float addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 %4, %3
  %18 = icmp sgt i64 %17, %16
  br i1 %18, label %19, label %21

19:                                               ; preds = %6
  %20 = sext i32 %5 to i64
  br label %22

21:                                               ; preds = %22, %6
  ret void

22:                                               ; preds = %19, %22
  %23 = phi i64 [ %16, %19 ], [ %74, %22 ]
  %24 = freeze i64 %23
  %25 = freeze i64 %4
  %26 = sdiv i64 %24, %25
  %27 = mul i64 %26, %25
  %28 = sub i64 %24, %27
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 0
  %30 = load float, float addrspace(1)* %29, align 16, !tbaa !7
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 1
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 2
  %34 = load float, float addrspace(1)* %33, align 8, !tbaa !7
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %26, i32 0, i32 0, i32 0, i64 3
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 0
  %38 = load float, float addrspace(1)* %37, align 16, !tbaa !7
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 1
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 2
  %42 = load float, float addrspace(1)* %41, align 8, !tbaa !7
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %28, i32 0, i32 0, i32 0, i64 3
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = tail call float @llvm.maxnum.f32(float %30, float %38)
  %46 = tail call float @llvm.maxnum.f32(float %32, float %40)
  %47 = tail call float @llvm.minnum.f32(float %34, float %42)
  %48 = tail call float @llvm.minnum.f32(float %36, float %44)
  %49 = fsub contract float %47, %45
  %50 = fadd contract float %49, 1.000000e+00
  %51 = fcmp contract olt float %50, 0.000000e+00
  %52 = select contract i1 %51, float 0.000000e+00, float %50
  %53 = fsub contract float %48, %46
  %54 = fadd contract float %53, 1.000000e+00
  %55 = fcmp contract olt float %54, 0.000000e+00
  %56 = select contract i1 %55, float 0.000000e+00, float %54
  %57 = fmul contract float %52, %56
  %58 = fsub contract float %34, %30
  %59 = fadd contract float %58, 1.000000e+00
  %60 = fsub contract float %36, %32
  %61 = fadd contract float %60, 1.000000e+00
  %62 = fmul contract float %59, %61
  %63 = fsub contract float %42, %38
  %64 = fadd contract float %63, 1.000000e+00
  %65 = fsub contract float %44, %40
  %66 = fadd contract float %65, 1.000000e+00
  %67 = fmul contract float %64, %66
  %68 = fadd contract float %62, %67
  %69 = fsub contract float %68, %57
  %70 = fdiv contract float %57, %69
  %71 = mul i64 %26, %4
  %72 = add i64 %71, %28
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %70, float addrspace(1)* %73, align 4, !tbaa !10
  %74 = add nsw i64 %23, %20
  %75 = icmp slt i64 %74, %17
  br i1 %75, label %22, label %21, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
