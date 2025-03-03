; ModuleID = '../data/hip_kernels/2824/205/main.cu'
source_filename = "../data/hip_kernels/2824/205/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@coef = protected addrspace(4) externally_initialized global [5 x float] zeroinitializer, align 16
@_ZZ10stencil_1dPfS_iE4smem = internal unnamed_addr addrspace(3) global [38 x float] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([5 x float] addrspace(4)* @coef to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_1dPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  %16 = icmp slt i32 %15, %2
  br i1 %16, label %17, label %76

17:                                               ; preds = %3
  %18 = add nuw nsw i32 %14, 3
  %19 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %18
  %20 = icmp ult i32 %14, 3
  %21 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %14
  %22 = add nuw nsw i32 %14, 35
  %23 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %22
  %24 = udiv i32 %12, %9
  %25 = mul i32 %24, %9
  %26 = icmp ugt i32 %12, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %9
  %30 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 1), align 4, !tbaa !16
  %31 = add nuw nsw i32 %14, 4
  %32 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %31
  %33 = add nuw nsw i32 %14, 2
  %34 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %33
  %35 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 2), align 8, !tbaa !16
  %36 = add nuw nsw i32 %14, 5
  %37 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %36
  %38 = add nuw nsw i32 %14, 1
  %39 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %38
  %40 = load float, float addrspace(4)* getelementptr inbounds ([5 x float], [5 x float] addrspace(4)* @coef, i64 0, i64 3), align 4, !tbaa !16
  %41 = add nuw nsw i32 %14, 6
  %42 = getelementptr inbounds [38 x float], [38 x float] addrspace(3)* @_ZZ10stencil_1dPfS_iE4smem, i32 0, i32 %41
  br label %43

43:                                               ; preds = %17, %57
  %44 = phi i32 [ %15, %17 ], [ %74, %57 ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  store float %47, float addrspace(3)* %19, align 4, !tbaa !16
  br i1 %20, label %48, label %57

48:                                               ; preds = %43
  %49 = add nsw i32 %44, -3
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !16
  store float %52, float addrspace(3)* %21, align 4, !tbaa !16
  %53 = add nsw i32 %44, 32
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16
  store float %56, float addrspace(3)* %23, align 4, !tbaa !16
  br label %57

57:                                               ; preds = %48, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = load float, float addrspace(3)* %32, align 4, !tbaa !16
  %59 = load float, float addrspace(3)* %34, align 4, !tbaa !16
  %60 = fsub contract float %58, %59
  %61 = fmul contract float %30, %60
  %62 = fadd contract float %61, 0.000000e+00
  %63 = load float, float addrspace(3)* %37, align 4, !tbaa !16
  %64 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %65 = fsub contract float %63, %64
  %66 = fmul contract float %35, %65
  %67 = fadd contract float %62, %66
  %68 = load float, float addrspace(3)* %42, align 4, !tbaa !16
  %69 = load float, float addrspace(3)* %21, align 4, !tbaa !16
  %70 = fsub contract float %68, %69
  %71 = fmul contract float %40, %70
  %72 = fadd contract float %67, %71
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %72, float addrspace(1)* %73, align 4, !tbaa !16
  %74 = add i32 %29, %44
  %75 = icmp slt i32 %74, %2
  br i1 %75, label %43, label %76, !llvm.loop !20

76:                                               ; preds = %57, %3
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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
