; ModuleID = '../data/hip_kernels/11832/272/main.cu'
source_filename = "../data/hip_kernels/11832/272/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17stencil_1d_globalPfS_S_E4smem = internal unnamed_addr addrspace(3) global [40 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17stencil_1d_globalPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = add nuw nsw i32 %4, 4
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %13
  store float %16, float addrspace(3)* %17, align 4, !tbaa !7
  %18 = icmp ult i32 %4, 4
  br i1 %18, label %19, label %31

19:                                               ; preds = %3
  %20 = add nsw i32 %12, -4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %4
  store float %23, float addrspace(3)* %24, align 4, !tbaa !7
  %25 = add nsw i32 %12, 32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !6
  %29 = add nuw nsw i32 %4, 36
  %30 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %29
  store float %28, float addrspace(3)* %30, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  %34 = add nuw nsw i32 %4, 5
  %35 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %34
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %37 = add nuw nsw i32 %4, 3
  %38 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %37
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %40 = fsub contract float %36, %39
  %41 = fmul contract float %33, %40
  %42 = fadd contract float %41, 0.000000e+00
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = add nuw nsw i32 %4, 6
  %46 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nuw nsw i32 %4, 2
  %49 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %48
  %50 = load float, float addrspace(3)* %49, align 4, !tbaa !7
  %51 = fsub contract float %47, %50
  %52 = fmul contract float %44, %51
  %53 = fadd contract float %42, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 3
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = add nuw nsw i32 %4, 7
  %57 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = add nuw nsw i32 %4, 1
  %60 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %62 = fsub contract float %58, %61
  %63 = fmul contract float %55, %62
  %64 = fadd contract float %53, %63
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 4
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = add nuw nsw i32 %4, 8
  %68 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ17stencil_1d_globalPfS_S_E4smem, i32 0, i32 %4
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fsub contract float %69, %71
  %73 = fmul contract float %66, %72
  %74 = fadd contract float %64, %73
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  store float %74, float addrspace(1)* %75, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
