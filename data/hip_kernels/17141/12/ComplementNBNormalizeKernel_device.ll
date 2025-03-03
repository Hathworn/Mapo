; ModuleID = '../data/hip_kernels/17141/12/main.cu'
source_filename = "../data/hip_kernels/17141/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z27ComplementNBNormalizeKernelPfS_jj(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp ult i32 %13, %3
  %15 = icmp ne i32 %2, 0
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %85

17:                                               ; preds = %4
  %18 = and i32 %2, 3
  %19 = icmp ult i32 %2, 4
  br i1 %19, label %67, label %20

20:                                               ; preds = %17
  %21 = and i32 %2, -4
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %64, %22 ]
  %24 = phi i32 [ 0, %20 ], [ %65, %22 ]
  %25 = zext i32 %23 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %1, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %28 = mul i32 %23, %3
  %29 = add i32 %28, %13
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %33 = fdiv contract float %32, %27
  store float %33, float addrspace(1)* %31, align 4, !tbaa !7
  %34 = or i32 %23, 1
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  %38 = mul i32 %34, %3
  %39 = add i32 %38, %13
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %0, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fdiv contract float %42, %37
  store float %43, float addrspace(1)* %41, align 4, !tbaa !7
  %44 = or i32 %23, 2
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = mul i32 %44, %3
  %49 = add i32 %48, %13
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fdiv contract float %52, %47
  store float %53, float addrspace(1)* %51, align 4, !tbaa !7
  %54 = or i32 %23, 3
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %1, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7
  %58 = mul i32 %54, %3
  %59 = add i32 %58, %13
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fdiv contract float %62, %57
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  %64 = add nuw i32 %23, 4
  %65 = add i32 %24, 4
  %66 = icmp eq i32 %65, %21
  br i1 %66, label %67, label %22, !llvm.loop !11

67:                                               ; preds = %22, %17
  %68 = phi i32 [ 0, %17 ], [ %64, %22 ]
  %69 = icmp eq i32 %18, 0
  br i1 %69, label %85, label %70

70:                                               ; preds = %67, %70
  %71 = phi i32 [ %82, %70 ], [ %68, %67 ]
  %72 = phi i32 [ %83, %70 ], [ 0, %67 ]
  %73 = zext i32 %71 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = mul i32 %71, %3
  %77 = add i32 %76, %13
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fdiv contract float %80, %75
  store float %81, float addrspace(1)* %79, align 4, !tbaa !7
  %82 = add nuw i32 %71, 1
  %83 = add i32 %72, 1
  %84 = icmp eq i32 %83, %18
  br i1 %84, label %85, label %70, !llvm.loop !13

85:                                               ; preds = %67, %70, %4
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
