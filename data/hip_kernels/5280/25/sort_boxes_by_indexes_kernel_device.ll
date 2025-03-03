; ModuleID = '../data/hip_kernels/5280/25/main.cu'
source_filename = "../data/hip_kernels/5280/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28sort_boxes_by_indexes_kernelPfPiS0_S_S0_iS_S0_S0_S_ii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = add i32 %20, %13
  %22 = icmp slt i32 %21, %5
  br i1 %22, label %23, label %111

23:                                               ; preds = %12
  %24 = sext i32 %21 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = mul nsw i32 %26, %11
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !11, !amdgpu.noclobber !6
  %31 = mul nsw i32 %21, %11
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %6, i64 %32
  store float %30, float addrspace(1)* %33, align 4, !tbaa !11
  %34 = add nsw i32 %27, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11
  %38 = add nsw i32 %31, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %6, i64 %39
  store float %37, float addrspace(1)* %40, align 4, !tbaa !11
  %41 = add nsw i32 %27, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %0, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !11
  %45 = add nsw i32 %31, 2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %6, i64 %46
  store float %44, float addrspace(1)* %47, align 4, !tbaa !11
  %48 = add nsw i32 %27, 3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !11
  %52 = add nsw i32 %31, 3
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %6, i64 %53
  store float %51, float addrspace(1)* %54, align 4, !tbaa !11
  %55 = add nsw i32 %27, 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !11
  %59 = add nsw i32 %31, 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %6, i64 %60
  store float %58, float addrspace(1)* %61, align 4, !tbaa !11
  %62 = add nsw i32 %27, 5
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !11
  %66 = add nsw i32 %31, 5
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %6, i64 %67
  store float %65, float addrspace(1)* %68, align 4, !tbaa !11
  %69 = add nsw i32 %27, 6
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = add nsw i32 %31, 6
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  store float %72, float addrspace(1)* %75, align 4, !tbaa !11
  %76 = sext i32 %26 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !6
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %24
  store i32 %78, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %24
  store i32 %81, i32 addrspace(1)* %82, align 4, !tbaa !7
  %83 = mul nsw i32 %26, %10
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !11
  %87 = mul nsw i32 %21, %10
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %9, i64 %88
  store float %86, float addrspace(1)* %89, align 4, !tbaa !11
  %90 = add nsw i32 %83, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %3, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !11
  %94 = add nsw i32 %87, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %9, i64 %95
  store float %93, float addrspace(1)* %96, align 4, !tbaa !11
  %97 = add nsw i32 %83, 2
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !11
  %101 = add nsw i32 %87, 2
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %9, i64 %102
  store float %100, float addrspace(1)* %103, align 4, !tbaa !11
  %104 = add nsw i32 %83, 3
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !11
  %108 = add nsw i32 %87, 3
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %9, i64 %109
  store float %107, float addrspace(1)* %110, align 4, !tbaa !11
  br label %111

111:                                              ; preds = %23, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
