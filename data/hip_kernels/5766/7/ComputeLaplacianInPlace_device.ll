; ModuleID = '../data/hip_kernels/5766/7/main.cu'
source_filename = "../data/hip_kernels/5766/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23ComputeLaplacianInPlacePfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp ult i32 %11, %1
  br i1 %12, label %13, label %93

13:                                               ; preds = %2
  %14 = mul i32 %11, %1
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = icmp sgt i32 %1, 0
  br i1 %17, label %18, label %93

18:                                               ; preds = %13
  %19 = zext i32 %11 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %16, i64 %19
  %21 = and i32 %1, 3
  %22 = icmp ult i32 %1, 4
  br i1 %22, label %74, label %23

23:                                               ; preds = %18
  %24 = and i32 %1, -4
  br label %25

25:                                               ; preds = %70, %23
  %26 = phi i32 [ 0, %23 ], [ %71, %70 ]
  %27 = phi i32 [ 0, %23 ], [ %72, %70 ]
  %28 = icmp eq i32 %26, %11
  br i1 %28, label %37, label %29

29:                                               ; preds = %25
  %30 = zext i32 %26 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %16, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %34 = fadd contract float %32, %33
  store float %34, float addrspace(1)* %20, align 4, !tbaa !7
  %35 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %36 = fneg contract float %35
  store float %36, float addrspace(1)* %31, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %25, %29
  %38 = or i32 %26, 1
  %39 = icmp eq i32 %38, %11
  br i1 %39, label %48, label %40

40:                                               ; preds = %37
  %41 = zext i32 %38 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %16, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %44 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %45 = fadd contract float %43, %44
  store float %45, float addrspace(1)* %20, align 4, !tbaa !7
  %46 = load float, float addrspace(1)* %42, align 4, !tbaa !7
  %47 = fneg contract float %46
  store float %47, float addrspace(1)* %42, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %40, %37
  %49 = or i32 %26, 2
  %50 = icmp eq i32 %49, %11
  br i1 %50, label %59, label %51

51:                                               ; preds = %48
  %52 = zext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %16, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %56 = fadd contract float %54, %55
  store float %56, float addrspace(1)* %20, align 4, !tbaa !7
  %57 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %58 = fneg contract float %57
  store float %58, float addrspace(1)* %53, align 4, !tbaa !7
  br label %59

59:                                               ; preds = %51, %48
  %60 = or i32 %26, 3
  %61 = icmp eq i32 %60, %11
  br i1 %61, label %70, label %62

62:                                               ; preds = %59
  %63 = zext i32 %60 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %16, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(1)* %20, align 4, !tbaa !7
  %68 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %69 = fneg contract float %68
  store float %69, float addrspace(1)* %64, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %62, %59
  %71 = add nuw nsw i32 %26, 4
  %72 = add i32 %27, 4
  %73 = icmp eq i32 %72, %24
  br i1 %73, label %74, label %25, !llvm.loop !11

74:                                               ; preds = %70, %18
  %75 = phi i32 [ 0, %18 ], [ %71, %70 ]
  %76 = icmp eq i32 %21, 0
  br i1 %76, label %93, label %77

77:                                               ; preds = %74, %89
  %78 = phi i32 [ %90, %89 ], [ %75, %74 ]
  %79 = phi i32 [ %91, %89 ], [ 0, %74 ]
  %80 = icmp eq i32 %78, %11
  br i1 %80, label %89, label %81

81:                                               ; preds = %77
  %82 = zext i32 %78 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %16, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %85 = load float, float addrspace(1)* %20, align 4, !tbaa !7
  %86 = fadd contract float %84, %85
  store float %86, float addrspace(1)* %20, align 4, !tbaa !7
  %87 = load float, float addrspace(1)* %83, align 4, !tbaa !7
  %88 = fneg contract float %87
  store float %88, float addrspace(1)* %83, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %81, %77
  %90 = add nuw nsw i32 %78, 1
  %91 = add i32 %79, 1
  %92 = icmp eq i32 %91, %21
  br i1 %92, label %93, label %77, !llvm.loop !13

93:                                               ; preds = %74, %89, %13, %2
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
