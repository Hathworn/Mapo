; ModuleID = '../data/hip_kernels/5919/32/main.cu'
source_filename = "../data/hip_kernels/5919/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13kDotProduct_rPfS_S_jjE5shmem = internal addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13kDotProduct_rPfS_S_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 9
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = add i32 %7, %8
  %10 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jjE5shmem, i32 0, i32 %8
  store float 0.000000e+00, float addrspace(3)* %10, align 4, !tbaa !5
  %11 = icmp ult i32 %9, %3
  %12 = icmp ult i32 %9, %4
  %13 = select i1 %11, i1 %12, i1 false
  br i1 %13, label %14, label %27

14:                                               ; preds = %5, %14
  %15 = phi float [ %23, %14 ], [ 0.000000e+00, %5 ]
  %16 = phi i32 [ %24, %14 ], [ %9, %5 ]
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = fmul contract float %19, %21
  %23 = fadd contract float %15, %22
  %24 = add i32 %16, %3
  %25 = icmp ult i32 %24, %4
  br i1 %25, label %14, label %26, !llvm.loop !10

26:                                               ; preds = %14
  store float %23, float addrspace(3)* %10, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %26, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ult i32 %8, 256
  br i1 %28, label %29, label %35

29:                                               ; preds = %27
  %30 = add nuw nsw i32 %8, 256
  %31 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jjE5shmem, i32 0, i32 %30
  %32 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %33 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %34 = fadd contract float %32, %33
  store float %34, float addrspace(3)* %10, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %29, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = icmp ult i32 %8, 128
  br i1 %36, label %37, label %43

37:                                               ; preds = %35
  %38 = add nuw nsw i32 %8, 128
  %39 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jjE5shmem, i32 0, i32 %38
  %40 = load float, float addrspace(3)* %39, align 4, !tbaa !5
  %41 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %42 = fadd contract float %40, %41
  store float %42, float addrspace(3)* %10, align 4, !tbaa !5
  br label %43

43:                                               ; preds = %37, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ult i32 %8, 64
  br i1 %44, label %45, label %51

45:                                               ; preds = %43
  %46 = add nuw nsw i32 %8, 64
  %47 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ13kDotProduct_rPfS_S_jjE5shmem, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %49 = load float, float addrspace(3)* %10, align 4, !tbaa !5
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(3)* %10, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %45, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %8, 32
  br i1 %52, label %53, label %90

53:                                               ; preds = %51
  %54 = addrspacecast float addrspace(3)* %10 to float*
  %55 = getelementptr inbounds float, float addrspace(3)* %10, i32 32
  %56 = addrspacecast float addrspace(3)* %55 to float*
  %57 = load volatile float, float* %56, align 4, !tbaa !5
  %58 = load volatile float, float* %54, align 4, !tbaa !5
  %59 = fadd contract float %57, %58
  store volatile float %59, float* %54, align 4, !tbaa !5
  %60 = getelementptr inbounds float, float addrspace(3)* %10, i32 16
  %61 = addrspacecast float addrspace(3)* %60 to float*
  %62 = load volatile float, float* %61, align 4, !tbaa !5
  %63 = load volatile float, float* %54, align 4, !tbaa !5
  %64 = fadd contract float %62, %63
  store volatile float %64, float* %54, align 4, !tbaa !5
  %65 = getelementptr inbounds float, float addrspace(3)* %10, i32 8
  %66 = addrspacecast float addrspace(3)* %65 to float*
  %67 = load volatile float, float* %66, align 4, !tbaa !5
  %68 = load volatile float, float* %54, align 4, !tbaa !5
  %69 = fadd contract float %67, %68
  store volatile float %69, float* %54, align 4, !tbaa !5
  %70 = getelementptr inbounds float, float addrspace(3)* %10, i32 4
  %71 = addrspacecast float addrspace(3)* %70 to float*
  %72 = load volatile float, float* %71, align 4, !tbaa !5
  %73 = load volatile float, float* %54, align 4, !tbaa !5
  %74 = fadd contract float %72, %73
  store volatile float %74, float* %54, align 4, !tbaa !5
  %75 = getelementptr inbounds float, float addrspace(3)* %10, i32 2
  %76 = addrspacecast float addrspace(3)* %75 to float*
  %77 = load volatile float, float* %76, align 4, !tbaa !5
  %78 = load volatile float, float* %54, align 4, !tbaa !5
  %79 = fadd contract float %77, %78
  store volatile float %79, float* %54, align 4, !tbaa !5
  %80 = getelementptr inbounds float, float addrspace(3)* %10, i32 1
  %81 = addrspacecast float addrspace(3)* %80 to float*
  %82 = load volatile float, float* %81, align 4, !tbaa !5
  %83 = load volatile float, float* %54, align 4, !tbaa !5
  %84 = fadd contract float %82, %83
  store volatile float %84, float* %54, align 4, !tbaa !5
  %85 = icmp eq i32 %8, 0
  br i1 %85, label %86, label %90

86:                                               ; preds = %53
  %87 = load volatile float, float* %54, align 4, !tbaa !5
  %88 = zext i32 %6 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  store float %87, float addrspace(1)* %89, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %53, %86, %51
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
