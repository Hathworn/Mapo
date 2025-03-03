; ModuleID = '../data/hip_kernels/8919/0/main.cu'
source_filename = "../data/hip_kernels/8919/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sData = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12reduceKernelPiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = sub nsw i32 0, %12
  %14 = icmp eq i32 %11, %13
  br i1 %14, label %15, label %58

15:                                               ; preds = %4
  %16 = add i32 %11, %12
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sData, i32 0, i32 %12
  %18 = icmp ult i32 %12, %10
  %19 = icmp ugt i16 %9, 1
  %20 = icmp eq i32 %12, 0
  %21 = icmp eq i32 %16, 0
  %22 = zext i32 %16 to i64
  %23 = zext i32 %5 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  br label %25

25:                                               ; preds = %54, %15
  %26 = phi i32 addrspace(1)* [ %0, %15 ], [ %1, %54 ]
  %27 = phi i32 [ %3, %15 ], [ %57, %54 ]
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %18, label %28, label %31

28:                                               ; preds = %25
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %26, i64 %22
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  store i32 %30, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %31

31:                                               ; preds = %28, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %33, label %32

32:                                               ; preds = %47, %31
  br i1 %20, label %49, label %51

33:                                               ; preds = %31, %47
  %34 = phi i32 [ %35, %47 ], [ 1, %31 ]
  %35 = shl i32 %34, 1
  %36 = add i32 %35, 1023
  %37 = and i32 %36, %12
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %47

39:                                               ; preds = %33
  %40 = add i32 %34, %12
  %41 = icmp ult i32 %40, %10
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sData, i32 0, i32 %40
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %45 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %46 = add nsw i32 %45, %44
  store i32 %46, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %42, %39, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ult i32 %35, %10
  br i1 %48, label %33, label %32, !llvm.loop !11

49:                                               ; preds = %32
  %50 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @sData, i32 0, i32 0), align 4, !tbaa !7
  store i32 %50, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %49, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp sgt i32 %27, 1
  %53 = select i1 %52, i1 %21, i1 false
  br i1 %53, label %54, label %58

54:                                               ; preds = %51
  %55 = add nsw i32 %27, -1
  %56 = udiv i32 %55, %10
  %57 = add nuw nsw i32 %56, 1
  br label %25

58:                                               ; preds = %51, %4
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
