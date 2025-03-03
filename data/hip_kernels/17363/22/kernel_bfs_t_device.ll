; ModuleID = '../data/hip_kernels/17363/22/main.cu'
source_filename = "../data/hip_kernels/17363/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12kernel_bfs_tPiS_S_Pbiiiiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i8 addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = and i32 %11, 16777215
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %4
  br i1 %21, label %22, label %53

22:                                               ; preds = %10
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %53, label %27

27:                                               ; preds = %22
  %28 = freeze i32 %20
  %29 = freeze i32 %8
  %30 = sdiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  %33 = icmp sgt i32 %32, 0
  %34 = icmp sgt i32 %30, 0
  %35 = and i1 %33, %34
  %36 = add nsw i32 %5, -1
  %37 = icmp slt i32 %32, %36
  %38 = select i1 %35, i1 %37, i1 false
  %39 = add nsw i32 %6, -1
  %40 = icmp slt i32 %30, %39
  %41 = select i1 %38, i1 %40, i1 false
  br i1 %41, label %42, label %46

42:                                               ; preds = %27
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !12, !amdgpu.noclobber !5
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %50, label %46

46:                                               ; preds = %42, %27
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !12, !amdgpu.noclobber !5
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %46, %42
  %51 = phi i32 [ 1, %42 ], [ -1, %46 ]
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %23
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !12
  store i8 0, i8 addrspace(1)* %24, align 1, !tbaa !7
  br label %53

53:                                               ; preds = %50, %46, %22, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !9, i64 0}
