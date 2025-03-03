; ModuleID = '../data/hip_kernels/6655/4/main.cu'
source_filename = "../data/hip_kernels/6655/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7kernel0ifPfS_(i32 %0, float %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %15, label %32

15:                                               ; preds = %4
  %16 = and i32 %0, 7
  %17 = icmp ult i32 %0, 8
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = and i32 %0, -8
  br label %34

20:                                               ; preds = %34, %15
  %21 = phi i32 [ 0, %15 ], [ %68, %34 ]
  %22 = icmp eq i32 %16, 0
  br i1 %22, label %32, label %23

23:                                               ; preds = %20, %23
  %24 = phi i32 [ %29, %23 ], [ %21, %20 ]
  %25 = phi i32 [ %30, %23 ], [ 0, %20 ]
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  store float 1.000000e+00, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds float, float addrspace(1)* %3, i64 %26
  store float 2.000000e+00, float addrspace(1)* %28, align 4, !tbaa !7
  %29 = add nuw nsw i32 %24, 1
  %30 = add i32 %25, 1
  %31 = icmp eq i32 %30, %16
  br i1 %31, label %32, label %23, !llvm.loop !11

32:                                               ; preds = %20, %23, %4
  %33 = icmp slt i32 %13, %0
  br i1 %33, label %71, label %79

34:                                               ; preds = %34, %18
  %35 = phi i32 [ 0, %18 ], [ %68, %34 ]
  %36 = phi i32 [ 0, %18 ], [ %69, %34 ]
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  store float 1.000000e+00, float addrspace(1)* %38, align 4, !tbaa !7
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  store float 2.000000e+00, float addrspace(1)* %39, align 4, !tbaa !7
  %40 = or i32 %35, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  store float 1.000000e+00, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  store float 2.000000e+00, float addrspace(1)* %43, align 4, !tbaa !7
  %44 = or i32 %35, 2
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  store float 1.000000e+00, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = getelementptr inbounds float, float addrspace(1)* %3, i64 %45
  store float 2.000000e+00, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = or i32 %35, 3
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  store float 1.000000e+00, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %3, i64 %49
  store float 2.000000e+00, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = or i32 %35, 4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  store float 1.000000e+00, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %53
  store float 2.000000e+00, float addrspace(1)* %55, align 4, !tbaa !7
  %56 = or i32 %35, 5
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  store float 1.000000e+00, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %57
  store float 2.000000e+00, float addrspace(1)* %59, align 4, !tbaa !7
  %60 = or i32 %35, 6
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  store float 1.000000e+00, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %61
  store float 2.000000e+00, float addrspace(1)* %63, align 4, !tbaa !7
  %64 = or i32 %35, 7
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  store float 1.000000e+00, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  store float 2.000000e+00, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = add nuw nsw i32 %35, 8
  %69 = add i32 %36, 8
  %70 = icmp eq i32 %69, %19
  br i1 %70, label %20, label %34, !llvm.loop !13

71:                                               ; preds = %32
  %72 = sext i32 %13 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fmul contract float %74, %1
  %76 = getelementptr inbounds float, float addrspace(1)* %3, i64 %72
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7
  %78 = fadd contract float %75, %77
  store float %78, float addrspace(1)* %76, align 4, !tbaa !7
  br label %79

79:                                               ; preds = %71, %32
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
