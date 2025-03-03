; ModuleID = '../data/hip_kernels/14395/23/main.cu'
source_filename = "../data/hip_kernels/14395/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12cu_minMaxLocPKfPfS1_PiS2_S1_S1_S2_S2_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture %7, i32 addrspace(1)* nocapture %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = add i32 %18, %11
  %20 = icmp slt i32 %19, %9
  %21 = select i1 %20, i32 %19, i32 0
  %22 = sext i32 %21 to i64
  %23 = getelementptr float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7
  %25 = zext i32 %11 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %6, i64 %25
  store float %24, float addrspace(1)* %26, align 4, !tbaa !7
  %27 = getelementptr inbounds float, float addrspace(1)* %5, i64 %25
  store float %24, float addrspace(1)* %27, align 4, !tbaa !7
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %25
  store i32 %21, i32 addrspace(1)* %28, align 4, !tbaa !11
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %25
  store i32 %21, i32 addrspace(1)* %29, align 4, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp ult i16 %16, 2
  br i1 %30, label %31, label %33

31:                                               ; preds = %55, %10
  %32 = icmp eq i32 %11, 0
  br i1 %32, label %57, label %67

33:                                               ; preds = %10, %55
  %34 = phi i32 [ %35, %55 ], [ %17, %10 ]
  %35 = lshr i32 %34, 1
  %36 = icmp ult i32 %11, %35
  br i1 %36, label %37, label %55

37:                                               ; preds = %33
  %38 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %39 = add nuw nsw i32 %35, %11
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %6, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7
  %43 = fcmp contract ult float %38, %42
  br i1 %43, label %44, label %47

44:                                               ; preds = %37
  store float %42, float addrspace(1)* %26, align 4, !tbaa !7
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %40
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !11
  store i32 %46, i32 addrspace(1)* %28, align 4, !tbaa !11
  br label %47

47:                                               ; preds = %37, %44
  %48 = load float, float addrspace(1)* %27, align 4, !tbaa !7
  %49 = getelementptr inbounds float, float addrspace(1)* %5, i64 %40
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fcmp contract ugt float %48, %50
  br i1 %51, label %52, label %55

52:                                               ; preds = %47
  store float %50, float addrspace(1)* %27, align 4, !tbaa !7
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %40
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !11
  store i32 %54, i32 addrspace(1)* %29, align 4, !tbaa !11
  br label %55

55:                                               ; preds = %52, %47, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ult i32 %34, 4
  br i1 %56, label %31, label %33, !llvm.loop !13

57:                                               ; preds = %31
  %58 = load float, float addrspace(1)* %5, align 4, !tbaa !7
  %59 = zext i32 %12 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %58, float addrspace(1)* %60, align 4, !tbaa !7
  %61 = load float, float addrspace(1)* %6, align 4, !tbaa !7
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  store float %61, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !11
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %59
  store i32 %63, i32 addrspace(1)* %64, align 4, !tbaa !11
  %65 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !11
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %59
  store i32 %65, i32 addrspace(1)* %66, align 4, !tbaa !11
  br label %67

67:                                               ; preds = %57, %31
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
