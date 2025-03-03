; ModuleID = '../data/hip_kernels/15641/19/main.cu'
source_filename = "../data/hip_kernels/15641/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reduce_v4PfS_iE1S = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9reduce_v4PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add nsw i32 %12, %4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = add nsw i32 %13, %10
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = fadd contract float %16, %20
  %22 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %4
  store float %21, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %23 = icmp ugt i16 %9, 65
  br i1 %23, label %24, label %27

24:                                               ; preds = %3
  %25 = lshr i16 %9, 1
  %26 = zext i16 %25 to i32
  br label %29

27:                                               ; preds = %38, %3
  %28 = icmp ult i32 %4, 32
  br i1 %28, label %41, label %72

29:                                               ; preds = %24, %38
  %30 = phi i32 [ %39, %38 ], [ %26, %24 ]
  %31 = icmp ult i32 %4, %30
  br i1 %31, label %32, label %38

32:                                               ; preds = %29
  %33 = add nuw nsw i32 %30, %4
  %34 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %36 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %37 = fadd contract float %35, %36
  store float %37, float addrspace(3)* %22, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %32, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = lshr i32 %30, 1
  %40 = icmp ugt i32 %30, 65
  br i1 %40, label %29, label %27, !llvm.loop !11

41:                                               ; preds = %27
  %42 = add nuw nsw i32 %4, 32
  %43 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %42
  %44 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %45 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %46 = fadd contract float %44, %45
  store float %46, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = add nuw nsw i32 %4, 16
  %48 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %50 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %51 = fadd contract float %49, %50
  store float %51, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = add nuw nsw i32 %4, 8
  %53 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %52
  %54 = load float, float addrspace(3)* %53, align 4, !tbaa !7
  %55 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %56 = fadd contract float %54, %55
  store float %56, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = add nuw nsw i32 %4, 4
  %58 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %60 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %61 = fadd contract float %59, %60
  store float %61, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = add nuw nsw i32 %4, 2
  %63 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %65 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %66 = fadd contract float %64, %65
  store float %66, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = add nuw nsw i32 %4, 1
  %68 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 %67
  %69 = load float, float addrspace(3)* %68, align 4, !tbaa !7
  %70 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %71 = fadd contract float %69, %70
  store float %71, float addrspace(3)* %22, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %72

72:                                               ; preds = %41, %27
  %73 = icmp eq i32 %4, 0
  br i1 %73, label %74, label %78

74:                                               ; preds = %72
  %75 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ9reduce_v4PfS_iE1S, i32 0, i32 0), align 16, !tbaa !7
  %76 = sext i32 %5 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %1, i64 %76
  store float %75, float addrspace(1)* %77, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %74, %72
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
