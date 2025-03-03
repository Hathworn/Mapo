; ModuleID = '../data/hip_kernels/3265/72/main.cu'
source_filename = "../data/hip_kernels/3265/72/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11naiveKerneliPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %91

14:                                               ; preds = %3
  %15 = icmp sgt i32 %0, 0
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7
  br i1 %15, label %19, label %40

19:                                               ; preds = %14
  %20 = and i32 %0, 7
  %21 = icmp ult i32 %0, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %0, -8
  br label %45

24:                                               ; preds = %45, %19
  %25 = phi float [ undef, %19 ], [ %87, %45 ]
  %26 = phi float [ %18, %19 ], [ %87, %45 ]
  %27 = phi i32 [ 0, %19 ], [ %88, %45 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %40, label %29

29:                                               ; preds = %24, %29
  %30 = phi float [ %36, %29 ], [ %26, %24 ]
  %31 = phi i32 [ %37, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %38, %29 ], [ 0, %24 ]
  %33 = zext i32 %31 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = fadd contract float %35, %30
  store float %36, float addrspace(1)* %17, align 4, !tbaa !7
  %37 = add nuw nsw i32 %31, 1
  %38 = add i32 %32, 1
  %39 = icmp eq i32 %38, %20
  br i1 %39, label %40, label %29, !llvm.loop !11

40:                                               ; preds = %24, %29, %14
  %41 = phi float [ %18, %14 ], [ %25, %24 ], [ %36, %29 ]
  %42 = sitofp i32 %0 to float
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %44 = fdiv contract float %41, %42
  store float %44, float addrspace(1)* %43, align 4, !tbaa !7
  br label %91

45:                                               ; preds = %45, %22
  %46 = phi float [ %18, %22 ], [ %87, %45 ]
  %47 = phi i32 [ 0, %22 ], [ %88, %45 ]
  %48 = phi i32 [ 0, %22 ], [ %89, %45 ]
  %49 = zext i32 %47 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = fadd contract float %51, %46
  store float %52, float addrspace(1)* %17, align 4, !tbaa !7
  %53 = or i32 %47, 1
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7
  %57 = fadd contract float %56, %52
  store float %57, float addrspace(1)* %17, align 4, !tbaa !7
  %58 = or i32 %47, 2
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fadd contract float %61, %57
  store float %62, float addrspace(1)* %17, align 4, !tbaa !7
  %63 = or i32 %47, 3
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fadd contract float %66, %62
  store float %67, float addrspace(1)* %17, align 4, !tbaa !7
  %68 = or i32 %47, 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %1, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7
  %72 = fadd contract float %71, %67
  store float %72, float addrspace(1)* %17, align 4, !tbaa !7
  %73 = or i32 %47, 5
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = fadd contract float %76, %72
  store float %77, float addrspace(1)* %17, align 4, !tbaa !7
  %78 = or i32 %47, 6
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fadd contract float %81, %77
  store float %82, float addrspace(1)* %17, align 4, !tbaa !7
  %83 = or i32 %47, 7
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7
  %87 = fadd contract float %86, %82
  store float %87, float addrspace(1)* %17, align 4, !tbaa !7
  %88 = add nuw nsw i32 %47, 8
  %89 = add i32 %48, 8
  %90 = icmp eq i32 %89, %23
  br i1 %90, label %24, label %45, !llvm.loop !13

91:                                               ; preds = %40, %3
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
