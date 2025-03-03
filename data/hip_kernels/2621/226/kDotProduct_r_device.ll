; ModuleID = '../data/hip_kernels/2621/226/main.cu'
source_filename = "../data/hip_kernels/2621/226/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13kDotProduct_rPfS_S_jE5shmem = internal addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13kDotProduct_rPfS_S_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 9
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jE5shmem, i32 0, i32 %7
  store float 0.000000e+00, float addrspace(3)* %9, align 4, !tbaa !5
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !9
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !18, !invariant.load !19
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = shl i32 %22, 9
  %24 = icmp ult i32 %8, %23
  %25 = icmp ult i32 %8, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %40

27:                                               ; preds = %4, %27
  %28 = phi float [ %36, %27 ], [ 0.000000e+00, %4 ]
  %29 = phi i32 [ %37, %27 ], [ %8, %4 ]
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !5, !amdgpu.noclobber !19
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !19
  %35 = fmul contract float %32, %34
  %36 = fadd contract float %28, %35
  %37 = add i32 %29, %23
  %38 = icmp ult i32 %37, %3
  br i1 %38, label %27, label %39, !llvm.loop !20

39:                                               ; preds = %27
  store float %36, float addrspace(3)* %9, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %39, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %7, 256
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = add nuw nsw i32 %7, 256
  %44 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jE5shmem, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %46 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %9, align 4, !tbaa !5
  br label %48

48:                                               ; preds = %42, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ult i32 %7, 128
  br i1 %49, label %50, label %56

50:                                               ; preds = %48
  %51 = add nuw nsw i32 %7, 128
  %52 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jE5shmem, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %55 = fadd contract float %53, %54
  store float %55, float addrspace(3)* %9, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %50, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ult i32 %7, 64
  br i1 %57, label %58, label %64

58:                                               ; preds = %56
  %59 = add nuw nsw i32 %7, 64
  %60 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jE5shmem, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !5
  %62 = load float, float addrspace(3)* %9, align 4, !tbaa !5
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(3)* %9, align 4, !tbaa !5
  br label %64

64:                                               ; preds = %58, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = icmp ult i32 %7, 32
  br i1 %65, label %66, label %103

66:                                               ; preds = %64
  %67 = addrspacecast float addrspace(3)* %9 to float*
  %68 = getelementptr inbounds float, float addrspace(3)* %9, i32 32
  %69 = addrspacecast float addrspace(3)* %68 to float*
  %70 = load volatile float, float* %69, align 4, !tbaa !5
  %71 = load volatile float, float* %67, align 4, !tbaa !5
  %72 = fadd contract float %70, %71
  store volatile float %72, float* %67, align 4, !tbaa !5
  %73 = getelementptr inbounds float, float addrspace(3)* %9, i32 16
  %74 = addrspacecast float addrspace(3)* %73 to float*
  %75 = load volatile float, float* %74, align 4, !tbaa !5
  %76 = load volatile float, float* %67, align 4, !tbaa !5
  %77 = fadd contract float %75, %76
  store volatile float %77, float* %67, align 4, !tbaa !5
  %78 = getelementptr inbounds float, float addrspace(3)* %9, i32 8
  %79 = addrspacecast float addrspace(3)* %78 to float*
  %80 = load volatile float, float* %79, align 4, !tbaa !5
  %81 = load volatile float, float* %67, align 4, !tbaa !5
  %82 = fadd contract float %80, %81
  store volatile float %82, float* %67, align 4, !tbaa !5
  %83 = getelementptr inbounds float, float addrspace(3)* %9, i32 4
  %84 = addrspacecast float addrspace(3)* %83 to float*
  %85 = load volatile float, float* %84, align 4, !tbaa !5
  %86 = load volatile float, float* %67, align 4, !tbaa !5
  %87 = fadd contract float %85, %86
  store volatile float %87, float* %67, align 4, !tbaa !5
  %88 = getelementptr inbounds float, float addrspace(3)* %9, i32 2
  %89 = addrspacecast float addrspace(3)* %88 to float*
  %90 = load volatile float, float* %89, align 4, !tbaa !5
  %91 = load volatile float, float* %67, align 4, !tbaa !5
  %92 = fadd contract float %90, %91
  store volatile float %92, float* %67, align 4, !tbaa !5
  %93 = getelementptr inbounds float, float addrspace(3)* %9, i32 1
  %94 = addrspacecast float addrspace(3)* %93 to float*
  %95 = load volatile float, float* %94, align 4, !tbaa !5
  %96 = load volatile float, float* %67, align 4, !tbaa !5
  %97 = fadd contract float %95, %96
  store volatile float %97, float* %67, align 4, !tbaa !5
  %98 = icmp eq i32 %7, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %66
  %100 = load volatile float, float* %67, align 4, !tbaa !5
  %101 = zext i32 %5 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  store float %100, float addrspace(1)* %102, align 4, !tbaa !5
  br label %103

103:                                              ; preds = %66, %99, %64
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
