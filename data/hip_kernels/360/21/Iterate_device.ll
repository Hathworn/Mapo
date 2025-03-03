; ModuleID = '../data/hip_kernels/360/21/main.cu'
source_filename = "../data/hip_kernels/360/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7IterateiPiS_S_S_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %61

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp slt i32 %21, 1000001
  br i1 %24, label %25, label %56

25:                                               ; preds = %18
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %19
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = add nsw i32 %16, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = icmp slt i32 %27, %31
  br i1 %32, label %33, label %56

33:                                               ; preds = %25, %33
  %34 = phi i32 [ %53, %33 ], [ %21, %25 ]
  %35 = phi i32 [ %52, %33 ], [ %23, %25 ]
  %36 = phi i32 [ %54, %33 ], [ %27, %25 ]
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = icmp sgt i32 %42, 0
  %46 = icmp eq i32 %42, %34
  %47 = select i1 %45, i1 %46, i1 false
  %48 = icmp sgt i32 %44, %35
  %49 = select i1 %47, i1 %48, i1 false
  %50 = icmp sgt i32 %42, %34
  %51 = select i1 %50, i1 true, i1 %49
  %52 = select i1 %51, i32 %44, i32 %35
  %53 = tail call i32 @llvm.smax.i32(i32 %42, i32 %34)
  %54 = add nsw i32 %36, 1
  %55 = icmp slt i32 %54, %31
  br i1 %55, label %33, label %56, !llvm.loop !11

56:                                               ; preds = %33, %25, %18
  %57 = phi i32 [ %23, %18 ], [ %23, %25 ], [ %52, %33 ]
  %58 = phi i32 [ %21, %18 ], [ %21, %25 ], [ %53, %33 ]
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %19
  store i32 %58, i32 addrspace(1)* %59, align 4, !tbaa !7
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %19
  store i32 %57, i32 addrspace(1)* %60, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %56, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
