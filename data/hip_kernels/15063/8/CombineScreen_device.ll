; ModuleID = '../data/hip_kernels/15063/8/main.cu'
source_filename = "../data/hip_kernels/15063/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13CombineScreenPfS_S_S_S_S_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %15
  %18 = add i32 %17, %10
  %19 = mul nsw i32 %18, 73
  br label %21

20:                                               ; preds = %21
  ret void

21:                                               ; preds = %65, %9
  %22 = phi i32 [ 0, %9 ], [ %106, %65 ]
  %23 = add nsw i32 %22, %19
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %8, i64 %24
  store float %26, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %30 = add nsw i32 %23, 5329
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %8, i64 %31
  store float %29, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = add nsw i32 %23, 10658
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %8, i64 %36
  store float %34, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %24
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7
  %40 = add nsw i32 %23, 15987
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %8, i64 %41
  store float %39, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %4, i64 %24
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = add nsw i32 %23, 21316
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %8, i64 %46
  store float %44, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = getelementptr inbounds float, float addrspace(1)* %5, i64 %24
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = add nsw i32 %23, 26645
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %8, i64 %51
  store float %49, float addrspace(1)* %52, align 4, !tbaa !7
  %53 = getelementptr inbounds float, float addrspace(1)* %6, i64 %24
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = add nsw i32 %23, 31974
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %8, i64 %56
  store float %54, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %24
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = add nsw i32 %23, 37303
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %8, i64 %61
  store float %59, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %22, 1
  %64 = icmp eq i32 %63, 73
  br i1 %64, label %20, label %65, !llvm.loop !11

65:                                               ; preds = %21
  %66 = add nsw i32 %63, %19
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7
  %70 = getelementptr inbounds float, float addrspace(1)* %8, i64 %67
  store float %69, float addrspace(1)* %70, align 4, !tbaa !7
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = add nsw i32 %66, 5329
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %8, i64 %74
  store float %72, float addrspace(1)* %75, align 4, !tbaa !7
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = add nsw i32 %66, 10658
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %8, i64 %79
  store float %77, float addrspace(1)* %80, align 4, !tbaa !7
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = add nsw i32 %66, 15987
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %8, i64 %84
  store float %82, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %66, 21316
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %8, i64 %89
  store float %87, float addrspace(1)* %90, align 4, !tbaa !7
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %67
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7
  %93 = add nsw i32 %66, 26645
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %8, i64 %94
  store float %92, float addrspace(1)* %95, align 4, !tbaa !7
  %96 = getelementptr inbounds float, float addrspace(1)* %6, i64 %67
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = add nsw i32 %66, 31974
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %8, i64 %99
  store float %97, float addrspace(1)* %100, align 4, !tbaa !7
  %101 = getelementptr inbounds float, float addrspace(1)* %7, i64 %67
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %66, 37303
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %8, i64 %104
  store float %102, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = add nuw nsw i32 %22, 2
  br label %21
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
