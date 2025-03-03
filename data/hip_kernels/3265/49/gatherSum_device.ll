; ModuleID = '../data/hip_kernels/3265/49/main.cu'
source_filename = "../data/hip_kernels/3265/49/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9gatherSumiPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  %14 = icmp sgt i32 %0, 0
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %85

16:                                               ; preds = %3
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7
  %20 = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %70, label %22

22:                                               ; preds = %16
  %23 = and i32 %0, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi float [ %19, %22 ], [ %66, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %67, %24 ]
  %27 = phi i32 [ 0, %22 ], [ %68, %24 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %31 = fadd contract float %30, %25
  store float %31, float addrspace(1)* %18, align 4, !tbaa !7
  %32 = or i32 %26, 1
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = fadd contract float %35, %31
  store float %36, float addrspace(1)* %18, align 4, !tbaa !7
  %37 = or i32 %26, 2
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fadd contract float %40, %36
  store float %41, float addrspace(1)* %18, align 4, !tbaa !7
  %42 = or i32 %26, 3
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7
  %46 = fadd contract float %45, %41
  store float %46, float addrspace(1)* %18, align 4, !tbaa !7
  %47 = or i32 %26, 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fadd contract float %50, %46
  store float %51, float addrspace(1)* %18, align 4, !tbaa !7
  %52 = or i32 %26, 5
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fadd contract float %55, %51
  store float %56, float addrspace(1)* %18, align 4, !tbaa !7
  %57 = or i32 %26, 6
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fadd contract float %60, %56
  store float %61, float addrspace(1)* %18, align 4, !tbaa !7
  %62 = or i32 %26, 7
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %1, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7
  %66 = fadd contract float %65, %61
  store float %66, float addrspace(1)* %18, align 4, !tbaa !7
  %67 = add nuw nsw i32 %26, 8
  %68 = add i32 %27, 8
  %69 = icmp eq i32 %68, %23
  br i1 %69, label %70, label %24, !llvm.loop !11

70:                                               ; preds = %24, %16
  %71 = phi float [ %19, %16 ], [ %66, %24 ]
  %72 = phi i32 [ 0, %16 ], [ %67, %24 ]
  %73 = icmp eq i32 %20, 0
  br i1 %73, label %85, label %74

74:                                               ; preds = %70, %74
  %75 = phi float [ %81, %74 ], [ %71, %70 ]
  %76 = phi i32 [ %82, %74 ], [ %72, %70 ]
  %77 = phi i32 [ %83, %74 ], [ 0, %70 ]
  %78 = zext i32 %76 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fadd contract float %80, %75
  store float %81, float addrspace(1)* %18, align 4, !tbaa !7
  %82 = add nuw nsw i32 %76, 1
  %83 = add i32 %77, 1
  %84 = icmp eq i32 %83, %20
  br i1 %84, label %85, label %74, !llvm.loop !13

85:                                               ; preds = %70, %74, %3
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
