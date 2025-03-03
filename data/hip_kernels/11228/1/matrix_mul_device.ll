; ModuleID = '../data/hip_kernels/11228/1/main.cu'
source_filename = "../data/hip_kernels/11228/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10matrix_mulPfS_S_iiiiiiE4ds_M = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16
@_ZZ10matrix_mulPfS_S_iiiiiiE4ds_N = internal unnamed_addr addrspace(3) global [2 x [2 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10matrix_mulPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = shl nsw i32 %11, 1
  %15 = add nsw i32 %14, %13
  %16 = shl nsw i32 %10, 1
  %17 = add nsw i32 %16, %12
  %18 = icmp slt i32 %4, 0
  br i1 %18, label %31, label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %4, -1
  %21 = sdiv i32 %20, 2
  %22 = icmp slt i32 %15, %3
  %23 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 %12
  %24 = mul nsw i32 %15, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_N, i32 0, i32 %13, i32 %12
  %27 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 0
  %28 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_N, i32 0, i32 0, i32 %12
  %29 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_M, i32 0, i32 %13, i32 1
  %30 = getelementptr inbounds [2 x [2 x float]], [2 x [2 x float]] addrspace(3)* @_ZZ10matrix_mulPfS_S_iiiiiiE4ds_N, i32 0, i32 1, i32 %12
  br label %36

31:                                               ; preds = %60, %9
  %32 = phi float [ 0.000000e+00, %9 ], [ %69, %60 ]
  %33 = icmp slt i32 %15, %7
  %34 = icmp slt i32 %17, %8
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %72, label %77

36:                                               ; preds = %19, %60
  %37 = phi i32 [ 0, %19 ], [ %70, %60 ]
  %38 = phi float [ 0.000000e+00, %19 ], [ %69, %60 ]
  br i1 %22, label %39, label %48

39:                                               ; preds = %36
  %40 = shl nuw nsw i32 %37, 1
  %41 = add nuw i32 %40, %12
  %42 = icmp slt i32 %41, %4
  br i1 %42, label %43, label %48

43:                                               ; preds = %39
  %44 = add i32 %41, %24
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %48

48:                                               ; preds = %36, %39, %43
  %49 = phi float [ %47, %43 ], [ 0.000000e+00, %39 ], [ 0.000000e+00, %36 ]
  store float %49, float addrspace(3)* %23, align 4, !tbaa !5
  br i1 %25, label %50, label %60

50:                                               ; preds = %48
  %51 = shl nuw nsw i32 %37, 1
  %52 = add nuw nsw i32 %51, %13
  %53 = icmp slt i32 %52, %5
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = mul nsw i32 %52, %6
  %56 = add nsw i32 %55, %17
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %60

60:                                               ; preds = %48, %50, %54
  %61 = phi float [ %59, %54 ], [ 0.000000e+00, %50 ], [ 0.000000e+00, %48 ]
  store float %61, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = load float, float addrspace(3)* %27, align 8, !tbaa !5
  %63 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %64 = fmul contract float %62, %63
  %65 = fadd contract float %38, %64
  %66 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %67 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %68 = fmul contract float %66, %67
  %69 = fadd contract float %65, %68
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = add nuw nsw i32 %37, 1
  %71 = icmp eq i32 %37, %21
  br i1 %71, label %31, label %36, !llvm.loop !10

72:                                               ; preds = %31
  %73 = mul nsw i32 %15, %8
  %74 = add nsw i32 %73, %17
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  store float %32, float addrspace(1)* %76, align 4, !tbaa !5
  br label %77

77:                                               ; preds = %72, %31
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
