; ModuleID = '../data/hip_kernels/8036/2/main.cu'
source_filename = "../data/hip_kernels/8036/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28rearrangePopulationWithRangePfS_Pi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = bitcast i32 addrspace(1)* %2 to <2 x i32> addrspace(1)*
  %14 = load <2 x i32>, <2 x i32> addrspace(1)* %13, align 4, !tbaa !7
  %15 = extractelement <2 x i32> %14, i64 0
  %16 = extractelement <2 x i32> %14, i64 1
  %17 = icmp slt i32 %16, %15
  br i1 %17, label %84, label %18

18:                                               ; preds = %3
  %19 = sub i32 1, %15
  %20 = add i32 %19, %16
  %21 = sdiv i32 %20, 2
  %22 = icmp sgt i32 %12, %21
  br i1 %22, label %84, label %23

23:                                               ; preds = %18
  %24 = add nsw i32 %12, %15
  %25 = sub nsw i32 %16, %12
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !11, !amdgpu.noclobber !6
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !11, !amdgpu.noclobber !6
  %32 = fcmp contract olt float %28, %31
  br i1 %32, label %33, label %84

33:                                               ; preds = %23
  %34 = mul nsw i32 %24, 6
  %35 = mul nsw i32 %25, 6
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !11
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  store float %41, float addrspace(1)* %37, align 4, !tbaa !11
  store float %38, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = or i32 %34, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !11
  %46 = or i32 %35, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !11
  store float %49, float addrspace(1)* %44, align 4, !tbaa !11
  store float %45, float addrspace(1)* %48, align 4, !tbaa !11
  %50 = add nsw i32 %34, 2
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !11
  %54 = add nsw i32 %35, 2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !11
  store float %57, float addrspace(1)* %52, align 4, !tbaa !11
  store float %53, float addrspace(1)* %56, align 4, !tbaa !11
  %58 = add nsw i32 %34, 3
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %62 = add nsw i32 %35, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  store float %65, float addrspace(1)* %60, align 4, !tbaa !11
  store float %61, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = add nsw i32 %34, 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11
  %70 = add nsw i32 %35, 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11
  store float %73, float addrspace(1)* %68, align 4, !tbaa !11
  store float %69, float addrspace(1)* %72, align 4, !tbaa !11
  %74 = add nsw i32 %34, 5
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %0, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !11
  %78 = add nsw i32 %35, 5
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  store float %81, float addrspace(1)* %76, align 4, !tbaa !11
  store float %77, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = load float, float addrspace(1)* %27, align 4, !tbaa !11
  %83 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  store float %83, float addrspace(1)* %27, align 4, !tbaa !11
  store float %82, float addrspace(1)* %30, align 4, !tbaa !11
  br label %84

84:                                               ; preds = %18, %33, %23, %3
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
