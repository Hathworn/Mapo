; ModuleID = '../data/hip_kernels/14174/9/main.cu'
source_filename = "../data/hip_kernels/14174/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z17computeCSRColSumsPfPKfPKiS3_mm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = icmp ult i64 %16, %4
  br i1 %17, label %18, label %57

18:                                               ; preds = %6
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %16
  %20 = add nuw nsw i64 %16, 1
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %20
  %22 = bitcast i32 addrspace(1)* %19 to <2 x i32> addrspace(1)*
  %23 = load <2 x i32>, <2 x i32> addrspace(1)* %22, align 4, !tbaa !7
  %24 = extractelement <2 x i32> %23, i64 0
  %25 = extractelement <2 x i32> %23, i64 1
  %26 = icmp ult i32 %24, %25
  br i1 %26, label %27, label %57

27:                                               ; preds = %18
  %28 = sext i32 %24 to i64
  br label %29

29:                                               ; preds = %27, %52
  %30 = phi i64 [ %53, %52 ], [ %28, %27 ]
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !11
  %37 = load float, float addrspace(1)* %34, align 4, !tbaa !11
  %38 = bitcast float %37 to i32
  %39 = bitcast float addrspace(1)* %34 to i32 addrspace(1)*
  %40 = fadd contract float %36, %37
  %41 = bitcast float %40 to i32
  %42 = cmpxchg i32 addrspace(1)* %39, i32 %38, i32 %41 syncscope("agent-one-as") monotonic monotonic, align 4
  %43 = extractvalue { i32, i1 } %42, 1
  br i1 %43, label %52, label %44

44:                                               ; preds = %29, %44
  %45 = phi { i32, i1 } [ %50, %44 ], [ %42, %29 ]
  %46 = extractvalue { i32, i1 } %45, 0
  %47 = bitcast i32 %46 to float
  %48 = fadd contract float %36, %47
  %49 = bitcast float %48 to i32
  %50 = cmpxchg i32 addrspace(1)* %39, i32 %46, i32 %49 syncscope("agent-one-as") monotonic monotonic, align 4
  %51 = extractvalue { i32, i1 } %50, 1
  br i1 %51, label %52, label %44, !llvm.loop !13

52:                                               ; preds = %44, %29
  %53 = add i64 %30, 1
  %54 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7
  %55 = sext i32 %54 to i64
  %56 = icmp ult i64 %53, %55
  br i1 %56, label %29, label %57, !llvm.loop !15

57:                                               ; preds = %52, %18, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
