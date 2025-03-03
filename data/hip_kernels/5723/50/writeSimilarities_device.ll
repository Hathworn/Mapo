; ModuleID = '../data/hip_kernels/5723/50/main.cu'
source_filename = "../data/hip_kernels/5723/50/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17writeSimilaritiesPKfPiiiPfii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %89

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !11, !amdgpu.noclobber !5
  %24 = icmp sgt i32 %3, 0
  br i1 %24, label %25, label %89

25:                                               ; preds = %18
  %26 = mul nsw i32 %6, %2
  %27 = and i32 %3, 7
  %28 = icmp ult i32 %3, 8
  br i1 %28, label %76, label %29

29:                                               ; preds = %25
  %30 = and i32 %3, -8
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi i32 [ 0, %29 ], [ %73, %31 ]
  %33 = phi i32 [ 0, %29 ], [ %74, %31 ]
  %34 = mul nsw i32 %26, %32
  %35 = add nsw i32 %34, %23
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  store float %21, float addrspace(1)* %37, align 4, !tbaa !7
  %38 = or i32 %32, 1
  %39 = mul nsw i32 %26, %38
  %40 = add nsw i32 %39, %23
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %4, i64 %41
  store float %21, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = or i32 %32, 2
  %44 = mul nsw i32 %26, %43
  %45 = add nsw i32 %44, %23
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  store float %21, float addrspace(1)* %47, align 4, !tbaa !7
  %48 = or i32 %32, 3
  %49 = mul nsw i32 %26, %48
  %50 = add nsw i32 %49, %23
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  store float %21, float addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i32 %32, 4
  %54 = mul nsw i32 %26, %53
  %55 = add nsw i32 %54, %23
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  store float %21, float addrspace(1)* %57, align 4, !tbaa !7
  %58 = or i32 %32, 5
  %59 = mul nsw i32 %26, %58
  %60 = add nsw i32 %59, %23
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  store float %21, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = or i32 %32, 6
  %64 = mul nsw i32 %26, %63
  %65 = add nsw i32 %64, %23
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %66
  store float %21, float addrspace(1)* %67, align 4, !tbaa !7
  %68 = or i32 %32, 7
  %69 = mul nsw i32 %26, %68
  %70 = add nsw i32 %69, %23
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  store float %21, float addrspace(1)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i32 %32, 8
  %74 = add i32 %33, 8
  %75 = icmp eq i32 %74, %30
  br i1 %75, label %76, label %31, !llvm.loop !13

76:                                               ; preds = %31, %25
  %77 = phi i32 [ 0, %25 ], [ %73, %31 ]
  %78 = icmp eq i32 %27, 0
  br i1 %78, label %89, label %79

79:                                               ; preds = %76, %79
  %80 = phi i32 [ %86, %79 ], [ %77, %76 ]
  %81 = phi i32 [ %87, %79 ], [ 0, %76 ]
  %82 = mul nsw i32 %26, %80
  %83 = add nsw i32 %82, %23
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %4, i64 %84
  store float %21, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = add nuw nsw i32 %80, 1
  %87 = add i32 %81, 1
  %88 = icmp eq i32 %87, %27
  br i1 %88, label %89, label %79, !llvm.loop !15

89:                                               ; preds = %76, %79, %18, %7
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
