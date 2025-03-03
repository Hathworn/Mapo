; ModuleID = '../data/hip_kernels/8036/10/main.cu'
source_filename = "../data/hip_kernels/8036/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11shuffleGenePfS_S_Pi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 1
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = sdiv i32 %15, 2
  %17 = icmp sgt i32 %13, %16
  br i1 %17, label %89, label %18

18:                                               ; preds = %4
  %19 = sitofp i32 %16 to double
  %20 = fdiv contract double %19, 5.300000e+00
  %21 = fptosi double %20 to i32
  %22 = add nsw i32 %13, %21
  %23 = srem i32 %22, %16
  %24 = add nsw i32 %23, %16
  %25 = mul nsw i32 %13, 6
  %26 = mul nsw i32 %24, 6
  %27 = sext i32 %13 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = sext i32 %24 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = sext i32 %25 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !11
  %34 = sext i32 %26 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11
  store float %36, float addrspace(1)* %32, align 4, !tbaa !11
  store float %33, float addrspace(1)* %35, align 4, !tbaa !11
  %37 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %38 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %38, float addrspace(1)* %28, align 4, !tbaa !11
  store float %37, float addrspace(1)* %30, align 4, !tbaa !11
  %39 = or i32 %25, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !11
  %43 = or i32 %26, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !11
  store float %46, float addrspace(1)* %41, align 4, !tbaa !11
  store float %42, float addrspace(1)* %45, align 4, !tbaa !11
  %47 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %48 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %48, float addrspace(1)* %28, align 4, !tbaa !11
  store float %47, float addrspace(1)* %30, align 4, !tbaa !11
  %49 = add nsw i32 %25, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11
  %53 = add nsw i32 %26, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !11
  store float %56, float addrspace(1)* %51, align 4, !tbaa !11
  store float %52, float addrspace(1)* %55, align 4, !tbaa !11
  %57 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %58 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %58, float addrspace(1)* %28, align 4, !tbaa !11
  store float %57, float addrspace(1)* %30, align 4, !tbaa !11
  %59 = add nsw i32 %25, 3
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !11
  %63 = add nsw i32 %26, 3
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !11
  store float %66, float addrspace(1)* %61, align 4, !tbaa !11
  store float %62, float addrspace(1)* %65, align 4, !tbaa !11
  %67 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %68 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %68, float addrspace(1)* %28, align 4, !tbaa !11
  store float %67, float addrspace(1)* %30, align 4, !tbaa !11
  %69 = add nsw i32 %25, 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = add nsw i32 %26, 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !11
  store float %76, float addrspace(1)* %71, align 4, !tbaa !11
  store float %72, float addrspace(1)* %75, align 4, !tbaa !11
  %77 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %78 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %78, float addrspace(1)* %28, align 4, !tbaa !11
  store float %77, float addrspace(1)* %30, align 4, !tbaa !11
  %79 = add nsw i32 %25, 5
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !11
  %83 = add nsw i32 %26, 5
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11
  store float %86, float addrspace(1)* %81, align 4, !tbaa !11
  store float %82, float addrspace(1)* %85, align 4, !tbaa !11
  %87 = load float, float addrspace(1)* %28, align 4, !tbaa !11
  %88 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %88, float addrspace(1)* %28, align 4, !tbaa !11
  store float %87, float addrspace(1)* %30, align 4, !tbaa !11
  br label %89

89:                                               ; preds = %18, %4
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
