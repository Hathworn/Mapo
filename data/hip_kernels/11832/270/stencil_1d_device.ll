; ModuleID = '../data/hip_kernels/11832/270/main.cu'
source_filename = "../data/hip_kernels/11832/270/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@coef = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@_ZZ10stencil_1dPfS_E4smem = internal unnamed_addr addrspace(3) global [40 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @coef to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_1dPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = add nuw nsw i32 %3, 4
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %12
  store float %15, float addrspace(3)* %16, align 4, !tbaa !7
  %17 = icmp ult i32 %3, 4
  br i1 %17, label %18, label %30

18:                                               ; preds = %2
  %19 = add nsw i32 %11, -4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %3
  store float %22, float addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nsw i32 %11, 32
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nuw nsw i32 %3, 36
  %29 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %28
  store float %27, float addrspace(3)* %29, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %18, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 1), align 4, !tbaa !7
  %32 = add nuw nsw i32 %3, 5
  %33 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !7
  %35 = add nuw nsw i32 %3, 3
  %36 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %35
  %37 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %38 = fsub contract float %34, %37
  %39 = fmul contract float %31, %38
  %40 = fadd contract float %39, 0.000000e+00
  %41 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 2), align 8, !tbaa !7
  %42 = add nuw nsw i32 %3, 6
  %43 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %45 = add nuw nsw i32 %3, 2
  %46 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = fsub contract float %44, %47
  %49 = fmul contract float %41, %48
  %50 = fadd contract float %40, %49
  %51 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 3), align 4, !tbaa !7
  %52 = add nuw nsw i32 %3, 7
  %53 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = add nuw nsw i32 %3, 1
  %56 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %55
  %57 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %58 = fsub contract float %54, %57
  %59 = fmul contract float %51, %58
  %60 = fadd contract float %50, %59
  %61 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 4), align 16, !tbaa !7
  %62 = add nuw nsw i32 %3, 8
  %63 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %65 = getelementptr inbounds [40 x float], [40 x float] addrspace(3)* @_ZZ10stencil_1dPfS_E4smem, i32 0, i32 %3
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fsub contract float %64, %66
  %68 = fmul contract float %61, %67
  %69 = fadd contract float %60, %68
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  store float %69, float addrspace(1)* %70, align 4, !tbaa !7
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
