; ModuleID = '../data/hip_kernels/5686/4/main.cu'
source_filename = "../data/hip_kernels/5686/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20cosineSimilarityCudaP15HIP_vector_typeIfLj3EEmPf(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %81

18:                                               ; preds = %3
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  br label %23

23:                                               ; preds = %18, %23
  %24 = phi i64 [ %16, %18 ], [ %79, %23 ]
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 1
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !16
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 0
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = fcmp olt float %29, 0x39F0000000000000
  %31 = select i1 %30, float 0x41F0000000000000, float 1.000000e+00
  %32 = fmul float %29, %31
  %33 = tail call float @llvm.sqrt.f32(float %32)
  %34 = bitcast float %33 to i32
  %35 = add nsw i32 %34, -1
  %36 = bitcast i32 %35 to float
  %37 = add nsw i32 %34, 1
  %38 = bitcast i32 %37 to float
  %39 = tail call i1 @llvm.amdgcn.class.f32(float %32, i32 608)
  %40 = select i1 %30, float 0x3EF0000000000000, float 1.000000e+00
  %41 = fneg float %38
  %42 = tail call float @llvm.fma.f32(float %41, float %33, float %32)
  %43 = fcmp ogt float %42, 0.000000e+00
  %44 = fneg float %36
  %45 = tail call float @llvm.fma.f32(float %44, float %33, float %32)
  %46 = fcmp ole float %45, 0.000000e+00
  %47 = select i1 %46, float %36, float %33
  %48 = select i1 %43, float %38, float %47
  %49 = fmul float %40, %48
  %50 = select i1 %39, float %32, float %49
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i32 0, i64 2
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  %53 = fcmp olt float %52, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %52, %54
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = fmul contract float %50, %73
  %75 = fdiv contract float %27, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  store float %75, float addrspace(1)* %76, align 4, !tbaa !19
  %77 = add i32 %19, %25
  %78 = add i32 %77, %22
  %79 = sext i32 %78 to i64
  %80 = icmp ult i64 %79, %1
  br i1 %80, label %23, label %81, !llvm.loop !21

81:                                               ; preds = %23, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{!20, !20, i64 0}
!20 = !{!"float", !17, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
