; ModuleID = '../data/hip_kernels/13231/1/main.cu'
source_filename = "../data/hip_kernels/13231/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds = internal unnamed_addr addrspace(3) global [4 x [4 x float]] undef, align 16
@_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds = internal unnamed_addr addrspace(3) global [4 x [4 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18kernelMultMatTiledPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = shl nsw i32 %8, 2
  %12 = add nsw i32 %11, %10
  %13 = shl nsw i32 %7, 2
  %14 = add nsw i32 %13, %9
  %15 = sdiv i32 %4, 4
  %16 = icmp sgt i32 %4, 3
  br i1 %16, label %17, label %31

17:                                               ; preds = %6
  %18 = icmp slt i32 %12, %3
  %19 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds, i32 0, i32 %10, i32 %9
  %20 = mul nsw i32 %12, %4
  %21 = icmp slt i32 %14, %5
  %22 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds, i32 0, i32 %10, i32 %9
  %23 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds, i32 0, i32 %10, i32 0
  %24 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds, i32 0, i32 0, i32 %9
  %25 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds, i32 0, i32 %10, i32 1
  %26 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds, i32 0, i32 1, i32 %9
  %27 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds, i32 0, i32 %10, i32 2
  %28 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds, i32 0, i32 2, i32 %9
  %29 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Mds, i32 0, i32 %10, i32 3
  %30 = getelementptr inbounds [4 x [4 x float]], [4 x [4 x float]] addrspace(3)* @_ZZ18kernelMultMatTiledPfS_S_iiiE3Nds, i32 0, i32 3, i32 %9
  br label %36

31:                                               ; preds = %59, %6
  %32 = phi float [ 0.000000e+00, %6 ], [ %76, %59 ]
  %33 = icmp slt i32 %12, %3
  %34 = icmp slt i32 %14, %5
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %79, label %84

36:                                               ; preds = %17, %59
  %37 = phi i32 [ 0, %17 ], [ %77, %59 ]
  %38 = phi float [ 0.000000e+00, %17 ], [ %76, %59 ]
  %39 = shl nsw i32 %37, 2
  %40 = add nuw nsw i32 %39, %9
  %41 = icmp slt i32 %40, %4
  %42 = select i1 %41, i1 %18, i1 false
  br i1 %42, label %43, label %48

43:                                               ; preds = %36
  %44 = add nsw i32 %40, %20
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %48

48:                                               ; preds = %36, %43
  %49 = phi float [ %47, %43 ], [ 0.000000e+00, %36 ]
  store float %49, float addrspace(3)* %19, align 4, !tbaa !5
  %50 = add nuw nsw i32 %39, %10
  %51 = icmp slt i32 %50, %4
  %52 = select i1 %51, i1 %21, i1 false
  br i1 %52, label %53, label %59

53:                                               ; preds = %48
  %54 = mul nsw i32 %50, %5
  %55 = add nsw i32 %54, %14
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %59

59:                                               ; preds = %48, %53
  %60 = phi float [ %58, %53 ], [ 0.000000e+00, %48 ]
  store float %60, float addrspace(3)* %22, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = load float, float addrspace(3)* %23, align 16, !tbaa !5
  %62 = load float, float addrspace(3)* %24, align 4, !tbaa !5
  %63 = fmul contract float %61, %62
  %64 = fadd contract float %38, %63
  %65 = load float, float addrspace(3)* %25, align 4, !tbaa !5
  %66 = load float, float addrspace(3)* %26, align 4, !tbaa !5
  %67 = fmul contract float %65, %66
  %68 = fadd contract float %64, %67
  %69 = load float, float addrspace(3)* %27, align 8, !tbaa !5
  %70 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %71 = fmul contract float %69, %70
  %72 = fadd contract float %68, %71
  %73 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %74 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %75 = fmul contract float %73, %74
  %76 = fadd contract float %72, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = add nuw nsw i32 %37, 1
  %78 = icmp eq i32 %77, %15
  br i1 %78, label %31, label %36, !llvm.loop !10

79:                                               ; preds = %31
  %80 = mul nsw i32 %12, %5
  %81 = add nsw i32 %80, %14
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  store float %32, float addrspace(1)* %83, align 4, !tbaa !5
  br label %84

84:                                               ; preds = %79, %31
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
