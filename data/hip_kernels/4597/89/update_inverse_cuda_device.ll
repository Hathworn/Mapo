; ModuleID = '../data/hip_kernels/4597/89/main.cu'
source_filename = "../data/hip_kernels/4597/89/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19update_inverse_cudaPfS_iii = comdat any

@_ZZL19update_inverse_cudaPfS_iiiE3A_k = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZL19update_inverse_cudaPfS_iiiE8u_shared = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16
@_ZZL19update_inverse_cudaPfS_iiiE11Ainv_shared = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL19update_inverse_cudaPfS_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 comdat {
  %6 = mul nsw i32 %4, %3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !5, !amdgpu.noclobber !9
  %12 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE3A_k, i32 0, i32 %7
  store float %11, float addrspace(3)* %12, align 4, !tbaa !5
  %13 = zext i32 %7 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE8u_shared, i32 0, i32 %7
  store float %15, float addrspace(3)* %16, align 4, !tbaa !5
  %17 = fmul contract float %11, %15
  %18 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u, i32 0, i32 %7
  store float %17, float addrspace(3)* %18, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %19 = ashr i32 %2, 1
  %20 = icmp sgt i32 %2, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %5
  %22 = shl nuw nsw i32 %7, 1
  %23 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u, i32 0, i32 %22
  %24 = bitcast float addrspace(3)* %23 to <2 x float> addrspace(3)*
  br label %36

25:                                               ; preds = %45, %5
  %26 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u, i32 0, i32 0), align 16, !tbaa !5
  %27 = fadd contract float %26, 1.000000e+00
  %28 = fdiv contract float 1.000000e+00, %27
  %29 = icmp sgt i32 %2, 0
  br i1 %29, label %30, label %49

30:                                               ; preds = %25
  %31 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE11Ainv_shared, i32 0, i32 %7
  %32 = icmp eq i32 %2, 1
  %33 = shl nuw nsw i32 %7, 1
  %34 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u, i32 0, i32 %33
  %35 = bitcast float addrspace(3)* %34 to <2 x float> addrspace(3)*
  br label %50

36:                                               ; preds = %21, %45
  %37 = phi i32 [ %19, %21 ], [ %47, %45 ]
  %38 = phi float [ undef, %21 ], [ %46, %45 ]
  %39 = icmp ult i32 %7, %37
  br i1 %39, label %40, label %45

40:                                               ; preds = %36
  %41 = load <2 x float>, <2 x float> addrspace(3)* %24, align 8, !tbaa !5
  %42 = extractelement <2 x float> %41, i64 0
  %43 = extractelement <2 x float> %41, i64 1
  %44 = fadd contract float %42, %43
  br label %45

45:                                               ; preds = %40, %36
  %46 = phi float [ %44, %40 ], [ %38, %36 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float %46, float addrspace(3)* %18, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = lshr i32 %37, 1
  %48 = icmp ult i32 %37, 2
  br i1 %48, label %25, label %36, !llvm.loop !10

49:                                               ; preds = %61, %25
  ret void

50:                                               ; preds = %30, %61
  %51 = phi float [ undef, %30 ], [ %62, %61 ]
  %52 = phi i32 [ 0, %30 ], [ %69, %61 ]
  %53 = mul nsw i32 %52, %3
  %54 = add i32 %53, %7
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  store float %57, float addrspace(3)* %31, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = load float, float addrspace(3)* %16, align 4, !tbaa !5
  %59 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %60 = fmul contract float %58, %59
  store float %60, float addrspace(3)* %18, align 4, !tbaa !5
  br i1 %32, label %61, label %71

61:                                               ; preds = %80, %50
  %62 = phi float [ %51, %50 ], [ %81, %80 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = load float, float addrspace(3)* %31, align 4, !tbaa !5
  %64 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZL19update_inverse_cudaPfS_iiiE6Ainv_u, i32 0, i32 0), align 16, !tbaa !5
  %65 = fmul contract float %28, %64
  %66 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %67 = fmul contract float %65, %66
  %68 = fsub contract float %63, %67
  store float %68, float addrspace(1)* %56, align 4, !tbaa !5
  %69 = add nuw nsw i32 %52, 1
  %70 = icmp eq i32 %69, %2
  br i1 %70, label %49, label %50, !llvm.loop !12

71:                                               ; preds = %50, %80
  %72 = phi float [ %81, %80 ], [ %51, %50 ]
  %73 = phi i32 [ %82, %80 ], [ %19, %50 ]
  %74 = icmp ult i32 %7, %73
  br i1 %74, label %75, label %80

75:                                               ; preds = %71
  %76 = load <2 x float>, <2 x float> addrspace(3)* %35, align 8, !tbaa !5
  %77 = extractelement <2 x float> %76, i64 0
  %78 = extractelement <2 x float> %76, i64 1
  %79 = fadd contract float %77, %78
  br label %80

80:                                               ; preds = %75, %71
  %81 = phi float [ %79, %75 ], [ %72, %71 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store float %81, float addrspace(3)* %18, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = lshr i32 %73, 1
  %83 = icmp ult i32 %73, 2
  br i1 %83, label %61, label %71, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
