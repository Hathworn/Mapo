; ModuleID = '../data/hip_kernels/16910/5/main.cu'
source_filename = "../data/hip_kernels/16910/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13extract_snipsPKdPKiS2_S2_PKfPf(double addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %8 = fptosi double %7 to i32
  %9 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %10 = load double, double addrspace(1)* %9, align 8, !tbaa !4, !amdgpu.noclobber !8
  %11 = fptosi double %10 to i32
  %12 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !4, !amdgpu.noclobber !8
  %14 = fptosi double %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 1
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !10, !amdgpu.noclobber !8
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %58

20:                                               ; preds = %6
  %21 = tail call i32 @llvm.smin.i32(i32 %18, i32 5000)
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y()
  %23 = icmp sge i32 %22, %14
  %24 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 6
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  br label %27

27:                                               ; preds = %20, %55
  %28 = phi i32 [ 0, %20 ], [ %56, %55 ]
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !10, !amdgpu.noclobber !8
  %32 = icmp ne i32 %31, %16
  %33 = select i1 %32, i1 true, i1 %23
  br i1 %33, label %55, label %34

34:                                               ; preds = %27
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !10, !amdgpu.noclobber !8
  %37 = mul i32 %28, %14
  %38 = load i16, i16 addrspace(4)* %26, align 2, !range !12, !invariant.load !8
  %39 = zext i16 %38 to i32
  br label %40

40:                                               ; preds = %34, %40
  %41 = phi i32 [ %22, %34 ], [ %53, %40 ]
  %42 = mul nsw i32 %41, %8
  %43 = add i32 %42, %15
  %44 = add i32 %43, %36
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !13
  %48 = add i32 %41, %37
  %49 = mul i32 %48, %11
  %50 = add i32 %49, %15
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %5, i64 %51
  store float %47, float addrspace(1)* %52, align 4, !tbaa !13
  %53 = add i32 %41, %39
  %54 = icmp slt i32 %53, %14
  br i1 %54, label %40, label %55, !llvm.loop !15

55:                                               ; preds = %40, %27
  %56 = add nuw nsw i32 %28, 1
  %57 = icmp eq i32 %56, %21
  br i1 %57, label %58, label %27, !llvm.loop !17

58:                                               ; preds = %55, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{i16 1, i16 1025}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !6, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
