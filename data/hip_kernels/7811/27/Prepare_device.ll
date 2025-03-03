; ModuleID = '../data/hip_kernels/7811/27/main.cu'
source_filename = "../data/hip_kernels/7811/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7PreparePfS_iii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %14, %2
  %24 = icmp slt i32 %22, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %68

26:                                               ; preds = %5
  %27 = mul nsw i32 %22, %2
  %28 = add nsw i32 %27, %14
  %29 = shl nsw i32 %28, 2
  %30 = sitofp i32 %14 to float
  %31 = add nsw i32 %2, -1
  %32 = sitofp i32 %31 to float
  %33 = fdiv contract float %30, %32
  %34 = icmp eq i32 %4, 1
  %35 = sext i32 %29 to i64
  br i1 %34, label %39, label %36

36:                                               ; preds = %26
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %39

39:                                               ; preds = %26, %36
  %40 = phi contract float [ %38, %36 ], [ %33, %26 ]
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  store float %40, float addrspace(1)* %41, align 4, !tbaa !7
  %42 = add nuw nsw i32 %29, 1
  %43 = sext i32 %42 to i64
  br i1 %34, label %52, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %46, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = add nuw nsw i32 %29, 2
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  br label %56

52:                                               ; preds = %39
  %53 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %33, float addrspace(1)* %53, align 4, !tbaa !7
  %54 = add nuw nsw i32 %29, 2
  %55 = sext i32 %54 to i64
  br label %56

56:                                               ; preds = %52, %44
  %57 = phi i64 [ %55, %52 ], [ %49, %44 ]
  %58 = phi contract float [ %33, %52 ], [ %51, %44 ]
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  store float %58, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = add nuw nsw i32 %29, 3
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  store float 1.000000e+00, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = icmp eq i32 %4, 2
  br i1 %63, label %64, label %68

64:                                               ; preds = %56
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float %33, float addrspace(1)* %65, align 4, !tbaa !7
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  store float %33, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %33, float addrspace(1)* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %56, %64, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
