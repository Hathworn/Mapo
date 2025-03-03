; ModuleID = '../data/hip_kernels/15873/0/main.cu'
source_filename = "../data/hip_kernels/15873/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3oddPjj(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %10, %1
  %12 = add i32 %11, %9
  %13 = shl i32 %12, 1
  %14 = add i32 %13, 7
  %15 = add i32 %13, 10
  %16 = shl i32 %14, 1
  %17 = add i32 %16, -4
  %18 = icmp ule i32 %15, %17
  %19 = mul i32 %15, %14
  %20 = icmp ult i32 %19, 100000000
  %21 = select i1 %18, i1 %20, i1 false
  br i1 %21, label %22, label %48

22:                                               ; preds = %2
  %23 = udiv i32 99999999, %14
  %24 = add i32 %13, 8
  %25 = add i32 %13, 6
  br label %26

26:                                               ; preds = %22, %33
  %27 = phi i32 [ %17, %22 ], [ %35, %33 ]
  %28 = phi i32 [ %15, %22 ], [ %34, %33 ]
  %29 = tail call i32 @llvm.umin.i32(i32 %27, i32 %23)
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = lshr exact i32 %28, 1
  %31 = lshr i32 %29, 1
  %32 = icmp ugt i32 %30, %31
  br i1 %32, label %33, label %40

33:                                               ; preds = %40, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %34 = add i32 %24, %28
  %35 = add i32 %25, %27
  %36 = icmp ule i32 %34, %35
  %37 = mul i32 %34, %14
  %38 = icmp ult i32 %37, 100000000
  %39 = select i1 %36, i1 %38, i1 false
  br i1 %39, label %26, label %48, !llvm.loop !7

40:                                               ; preds = %26, %40
  %41 = phi i32 [ %46, %40 ], [ %30, %26 ]
  %42 = mul i32 %41, %14
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* %44, i32 -1, i32 2, i32 4, i1 false)
  %46 = add nuw nsw i32 %41, 1
  %47 = icmp ult i32 %41, %31
  br i1 %47, label %40, label %33, !llvm.loop !9

48:                                               ; preds = %33, %2
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #3

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nounwind willreturn }

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
