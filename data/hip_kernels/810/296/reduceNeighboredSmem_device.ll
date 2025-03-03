; ModuleID = '../data/hip_kernels/810/296/main.cu'
source_filename = "../data/hip_kernels/810/296/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20reduceNeighboredSmemPiS_jE4smem = internal unnamed_addr addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20reduceNeighboredSmemPiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %42

14:                                               ; preds = %3
  %15 = zext i32 %11 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = zext i32 %4 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ20reduceNeighboredSmemPiS_jE4smem, i32 0, i32 %4
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ugt i16 %9, 1
  br i1 %21, label %24, label %22

22:                                               ; preds = %36, %14
  %23 = icmp eq i32 %4, 0
  br i1 %23, label %38, label %42

24:                                               ; preds = %14, %36
  %25 = phi i32 [ %26, %36 ], [ 1, %14 ]
  %26 = shl nsw i32 %25, 1
  %27 = add i32 %26, 1023
  %28 = and i32 %27, %4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %36

30:                                               ; preds = %24
  %31 = add i32 %25, %4
  %32 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ20reduceNeighboredSmemPiS_jE4smem, i32 0, i32 %31
  %33 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !7
  %34 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %35 = add nsw i32 %34, %33
  store i32 %35, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %36

36:                                               ; preds = %30, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i32 %26, %10
  br i1 %37, label %24, label %22, !llvm.loop !11

38:                                               ; preds = %22
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ20reduceNeighboredSmemPiS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %40 = zext i32 %5 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %22, %38, %3
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
