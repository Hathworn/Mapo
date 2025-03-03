; ModuleID = '../data/hip_kernels/8036/1/main.cu'
source_filename = "../data/hip_kernels/8036/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19rearrangePopulationPfS_Pi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !7, !amdgpu.noclobber !6
  %15 = sdiv i32 %14, 2
  %16 = icmp sgt i32 %12, %15
  br i1 %16, label %88, label %17

17:                                               ; preds = %3
  %18 = xor i32 %12, -1
  %19 = add i32 %14, %18
  %20 = sext i32 %12 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !11, !amdgpu.noclobber !6
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !11, !amdgpu.noclobber !6
  %26 = fcmp contract olt float %22, %25
  br i1 %26, label %27, label %88

27:                                               ; preds = %17
  %28 = mul nsw i32 %12, 6
  %29 = mul nsw i32 %19, 6
  %30 = sext i32 %28 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !11
  %33 = sext i32 %29 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !11
  store float %35, float addrspace(1)* %31, align 4, !tbaa !11
  store float %32, float addrspace(1)* %34, align 4, !tbaa !11
  %36 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %37 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %37, float addrspace(1)* %21, align 4, !tbaa !11
  store float %36, float addrspace(1)* %24, align 4, !tbaa !11
  %38 = or i32 %28, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = or i32 %29, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !11
  store float %45, float addrspace(1)* %40, align 4, !tbaa !11
  store float %41, float addrspace(1)* %44, align 4, !tbaa !11
  %46 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %47 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %47, float addrspace(1)* %21, align 4, !tbaa !11
  store float %46, float addrspace(1)* %24, align 4, !tbaa !11
  %48 = add nsw i32 %28, 2
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !11
  %52 = add nsw i32 %29, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !11
  store float %55, float addrspace(1)* %50, align 4, !tbaa !11
  store float %51, float addrspace(1)* %54, align 4, !tbaa !11
  %56 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %57 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %57, float addrspace(1)* %21, align 4, !tbaa !11
  store float %56, float addrspace(1)* %24, align 4, !tbaa !11
  %58 = add nsw i32 %28, 3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %62 = add nsw i32 %29, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  store float %65, float addrspace(1)* %60, align 4, !tbaa !11
  store float %61, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %67 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %67, float addrspace(1)* %21, align 4, !tbaa !11
  store float %66, float addrspace(1)* %24, align 4, !tbaa !11
  %68 = add nsw i32 %28, 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !11
  %72 = add nsw i32 %29, 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !11
  store float %75, float addrspace(1)* %70, align 4, !tbaa !11
  store float %71, float addrspace(1)* %74, align 4, !tbaa !11
  %76 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %77 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %77, float addrspace(1)* %21, align 4, !tbaa !11
  store float %76, float addrspace(1)* %24, align 4, !tbaa !11
  %78 = add nsw i32 %28, 5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = add nsw i32 %29, 5
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !11
  store float %85, float addrspace(1)* %80, align 4, !tbaa !11
  store float %81, float addrspace(1)* %84, align 4, !tbaa !11
  %86 = load float, float addrspace(1)* %21, align 4, !tbaa !11
  %87 = load float, float addrspace(1)* %24, align 4, !tbaa !11
  store float %87, float addrspace(1)* %21, align 4, !tbaa !11
  store float %86, float addrspace(1)* %24, align 4, !tbaa !11
  br label %88

88:                                               ; preds = %27, %17, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
