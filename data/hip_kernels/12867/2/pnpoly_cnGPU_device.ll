; ModuleID = '../data/hip_kernels/12867/2/main.cu'
source_filename = "../data/hip_kernels/12867/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvx = internal unnamed_addr addrspace(3) global [607 x float] undef, align 16
@_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvy = internal unnamed_addr addrspace(3) global [607 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12pnpoly_cnGPUPKfS0_S0_S0_Pcii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %68

18:                                               ; preds = %7
  %19 = icmp sgt i32 %6, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %18
  %21 = sext i32 %16 to i64
  br label %62

22:                                               ; preds = %18
  %23 = add nsw i32 %6, -1
  %24 = sext i32 %16 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  br label %28

28:                                               ; preds = %22, %58
  %29 = phi i32 [ 0, %22 ], [ %59, %58 ]
  %30 = phi i32 [ %23, %22 ], [ %31, %58 ]
  %31 = phi i32 [ 0, %22 ], [ %60, %58 ]
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = getelementptr inbounds [607 x float], [607 x float] addrspace(3)* @_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvx, i32 0, i32 %31
  store float %34, float addrspace(3)* %35, align 4, !tbaa !7
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = getelementptr inbounds [607 x float], [607 x float] addrspace(3)* @_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvy, i32 0, i32 %31
  store float %37, float addrspace(3)* %38, align 4, !tbaa !7
  %39 = fcmp contract ule float %37, %26
  %40 = getelementptr inbounds [607 x float], [607 x float] addrspace(3)* @_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvy, i32 0, i32 %30
  %41 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %42 = fcmp contract ogt float %41, %26
  %43 = xor i1 %39, %42
  br i1 %43, label %58, label %44

44:                                               ; preds = %28
  %45 = load float, float addrspace(1)* %27, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = getelementptr inbounds [607 x float], [607 x float] addrspace(3)* @_ZZ12pnpoly_cnGPUPKfS0_S0_S0_PciiE3tvx, i32 0, i32 %30
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %48 = fsub contract float %47, %34
  %49 = fsub contract float %26, %37
  %50 = fmul contract float %49, %48
  %51 = fsub contract float %41, %37
  %52 = fdiv contract float %50, %51
  %53 = fadd contract float %34, %52
  %54 = fcmp contract olt float %45, %53
  %55 = icmp eq i32 %29, 0
  %56 = zext i1 %55 to i32
  %57 = select i1 %54, i32 %56, i32 %29
  br label %58

58:                                               ; preds = %44, %28
  %59 = phi i32 [ %29, %28 ], [ %57, %44 ]
  %60 = add nuw nsw i32 %31, 1
  %61 = icmp eq i32 %60, %6
  br i1 %61, label %62, label %28, !llvm.loop !11

62:                                               ; preds = %58, %20
  %63 = phi i64 [ %21, %20 ], [ %24, %58 ]
  %64 = phi i32 [ 0, %20 ], [ %59, %58 ]
  %65 = trunc i32 %64 to i8
  %66 = and i8 %65, 1
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %63
  store i8 %66, i8 addrspace(1)* %67, align 1, !tbaa !13
  br label %68

68:                                               ; preds = %62, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!9, !9, i64 0}
