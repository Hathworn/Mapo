; ModuleID = '../data/hip_kernels/2829/2/main.cu'
source_filename = "../data/hip_kernels/2829/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z6mandelPfffffj(float addrspace(1)* nocapture writeonly %0, float %1, float %2, float %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = udiv i32 %14, %11
  %17 = mul i32 %16, %11
  %18 = icmp ugt i32 %14, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = fsub contract float %2, %1
  %22 = uitofp i16 %10 to float
  %23 = fdiv contract float %21, %22
  %24 = fsub contract float %4, %3
  %25 = sitofp i32 %20 to float
  %26 = fdiv contract float %24, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = uitofp i32 %27 to float
  %29 = fadd contract float %28, 5.000000e-01
  %30 = fmul contract float %29, %23
  %31 = fadd contract float %30, %1
  %32 = uitofp i32 %15 to float
  %33 = fadd contract float %32, 5.000000e-01
  %34 = fmul contract float %33, %26
  %35 = fadd contract float %34, %3
  %36 = icmp eq i32 %5, 0
  br i1 %36, label %55, label %37

37:                                               ; preds = %6, %52
  %38 = phi i32 [ %53, %52 ], [ 0, %6 ]
  %39 = phi float [ %49, %52 ], [ 0.000000e+00, %6 ]
  %40 = phi float [ %48, %52 ], [ 0.000000e+00, %6 ]
  %41 = phi float [ %45, %52 ], [ 0.000000e+00, %6 ]
  %42 = phi float [ %47, %52 ], [ 0.000000e+00, %6 ]
  %43 = fmul contract float %41, %42
  %44 = fadd contract float %35, %43
  %45 = fadd contract float %43, %44
  %46 = fsub contract float %40, %39
  %47 = fadd contract float %31, %46
  %48 = fmul contract float %47, %47
  %49 = fmul contract float %45, %45
  %50 = fadd contract float %48, %49
  %51 = fcmp contract ogt float %50, 4.000000e+00
  br i1 %51, label %55, label %52

52:                                               ; preds = %37
  %53 = add nuw i32 %38, 1
  %54 = icmp eq i32 %53, %5
  br i1 %54, label %55, label %37, !llvm.loop !16

55:                                               ; preds = %37, %52, %6
  %56 = phi i32 [ 0, %6 ], [ %5, %52 ], [ %38, %37 ]
  %57 = mul i32 %15, %11
  %58 = icmp eq i32 %56, %5
  %59 = select i1 %58, %struct.HIP_vector_base zeroinitializer, %struct.HIP_vector_base { %union.anon { %"struct.HIP_vector_base<float, 3>::Native_vec_" { [3 x float] [float 1.000000e+00, float 1.000000e+00, float 1.000000e+00] } } }
  %60 = extractvalue %struct.HIP_vector_base %59, 0, 0, 0, 0
  %61 = extractvalue %struct.HIP_vector_base %59, 0, 0, 0, 1
  %62 = extractvalue %struct.HIP_vector_base %59, 0, 0, 0, 2
  %63 = add i32 %57, %27
  %64 = mul nsw i32 %63, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %60, float addrspace(1)* %66, align 4, !tbaa !18
  %67 = add nsw i32 %64, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %68
  store float %61, float addrspace(1)* %69, align 4, !tbaa !18
  %70 = add nsw i32 %64, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float %62, float addrspace(1)* %72, align 4, !tbaa !18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
