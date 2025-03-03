; ModuleID = '../data/hip_kernels/3114/3/main.cu'
source_filename = "../data/hip_kernels/3114/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11warp_kernelPfPKfPKiS1_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %5
  %25 = icmp slt i32 %15, %4
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %83

27:                                               ; preds = %6
  %28 = shl nsw i32 %15, 2
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = mul nsw i32 %31, %5
  %33 = add nsw i32 %32, %23
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11, !amdgpu.noclobber !5
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %29
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !11, !amdgpu.noclobber !5
  %39 = fmul contract float %36, %38
  %40 = add nuw nsw i32 %28, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %43, %5
  %45 = add nsw i32 %44, %23
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11, !amdgpu.noclobber !5
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !11, !amdgpu.noclobber !5
  %51 = fmul contract float %48, %50
  %52 = fadd contract float %39, %51
  %53 = add nuw nsw i32 %28, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = mul nsw i32 %56, %5
  %58 = add nsw i32 %57, %23
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11, !amdgpu.noclobber !5
  %62 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !11, !amdgpu.noclobber !5
  %64 = fmul contract float %61, %63
  %65 = fadd contract float %52, %64
  %66 = add nuw nsw i32 %28, 3
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = mul nsw i32 %69, %5
  %71 = add nsw i32 %70, %23
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !11, !amdgpu.noclobber !5
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11, !amdgpu.noclobber !5
  %77 = fmul contract float %74, %76
  %78 = fadd contract float %65, %77
  %79 = mul nsw i32 %15, %5
  %80 = add nsw i32 %79, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float %78, float addrspace(1)* %82, align 4, !tbaa !11
  br label %83

83:                                               ; preds = %6, %27
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
