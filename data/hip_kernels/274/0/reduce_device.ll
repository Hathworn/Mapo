; ModuleID = '../data/hip_kernels/274/0/main.cu'
source_filename = "../data/hip_kernels/274/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@s = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6reducePjPKj(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %3
  %8 = addrspacecast i32 addrspace(3)* %7 to i32*
  store volatile i32 %6, i32* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !10, !invariant.load !9
  %13 = icmp ult i16 %12, 2
  br i1 %13, label %29, label %14

14:                                               ; preds = %2
  %15 = zext i16 %12 to i32
  br label %16

16:                                               ; preds = %14, %27
  %17 = phi i32 [ %18, %27 ], [ %15, %14 ]
  %18 = lshr i32 %17, 1
  %19 = icmp ult i32 %3, %18
  br i1 %19, label %20, label %27

20:                                               ; preds = %16
  %21 = add nuw nsw i32 %18, %3
  %22 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 %21
  %23 = addrspacecast i32 addrspace(3)* %22 to i32*
  %24 = load volatile i32, i32* %23, align 4, !tbaa !5
  %25 = load volatile i32, i32* %8, align 4, !tbaa !5
  %26 = add i32 %25, %24
  store volatile i32 %26, i32* %8, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %20, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ult i32 %17, 4
  br i1 %28, label %29, label %16, !llvm.loop !11

29:                                               ; preds = %27, %2
  %30 = load volatile i32, i32* addrspacecast (i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @s, i32 0, i32 0) to i32*), align 4, !tbaa !5
  %31 = icmp eq i32 %3, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  store i32 %30, i32 addrspace(1)* %0, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %32, %29
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
