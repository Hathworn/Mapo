; ModuleID = '../data/hip_kernels/3603/20/main.cu'
source_filename = "../data/hip_kernels/3603/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18BuildColorFieldDevPfP15HIP_vector_typeIhLj4EES_jj(float addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = bitcast float addrspace(1)* %2 to <2 x float> addrspace(1)*
  %7 = load <2 x float>, <2 x float> addrspace(1)* %6, align 4, !tbaa !4
  %8 = extractelement <2 x float> %7, i64 0
  %9 = extractelement <2 x float> %7, i64 1
  %10 = fsub contract float %9, %8
  %11 = fmul contract float %10, 5.000000e-01
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !8
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !9
  %17 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !18, !invariant.load !19
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = udiv i32 %26, %4
  %28 = udiv i32 %27, %4
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %30 = udiv i32 %29, %3
  %31 = add i32 %30, %28
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !4, !amdgpu.noclobber !19
  %35 = fcmp contract olt float %34, %11
  br i1 %35, label %36, label %43

36:                                               ; preds = %5
  %37 = fsub contract float %34, %8
  %38 = fsub contract float %11, %8
  %39 = fdiv contract float %37, %38
  %40 = fsub contract float 1.000000e+00, %39
  %41 = fmul contract float %40, 2.550000e+02
  %42 = fptoui float %41 to i8
  br label %50

43:                                               ; preds = %5
  %44 = fsub contract float %34, %11
  %45 = fsub contract float %9, %11
  %46 = fdiv contract float %44, %45
  %47 = fmul contract float %46, 2.550000e+02
  %48 = fptoui float %47 to i8
  %49 = fsub contract float 1.000000e+00, %46
  br label %50

50:                                               ; preds = %43, %36
  %51 = phi i8 [ 0, %36 ], [ %48, %43 ]
  %52 = phi i8 [ %42, %36 ], [ 0, %43 ]
  %53 = phi float [ %39, %36 ], [ %49, %43 ]
  %54 = fmul contract float %53, 2.550000e+02
  %55 = fptoui float %54 to i8
  %56 = add i32 %26, %29
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 0
  store i8 %51, i8 addrspace(1)* %58, align 4
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 1
  store i8 %52, i8 addrspace(1)* %59, align 1
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 2
  store i8 %55, i8 addrspace(1)* %60, align 2
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %57, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %61, align 1
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i32 0, i32 1024}
!9 = !{!10, !14, i64 12}
!10 = !{!"hsa_kernel_dispatch_packet_s", !11, i64 0, !11, i64 2, !11, i64 4, !11, i64 6, !11, i64 8, !11, i64 10, !14, i64 12, !14, i64 16, !14, i64 20, !14, i64 24, !14, i64 28, !15, i64 32, !16, i64 40, !15, i64 48, !17, i64 56}
!11 = !{!"short", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!"int", !12, i64 0}
!15 = !{!"long", !12, i64 0}
!16 = !{!"any pointer", !12, i64 0}
!17 = !{!"hsa_signal_s", !15, i64 0}
!18 = !{i16 1, i16 1025}
!19 = !{}
