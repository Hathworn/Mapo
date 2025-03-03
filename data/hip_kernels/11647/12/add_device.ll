; ModuleID = '../data/hip_kernels/11647/12/main.cu'
source_filename = "../data/hip_kernels/11647/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@temp = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3addPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %58

14:                                               ; preds = %3
  %15 = icmp eq i32 %4, 0
  br i1 %15, label %21, label %16

16:                                               ; preds = %14
  %17 = add nsw i32 %4, -1
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %21

21:                                               ; preds = %14, %16
  %22 = phi i32 [ %20, %16 ], [ 0, %14 ]
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %4
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp sgt i32 %2, 1
  br i1 %24, label %33, label %25

25:                                               ; preds = %55, %21
  %26 = phi i32 [ 0, %21 ], [ %35, %55 ]
  %27 = mul nsw i32 %26, %2
  %28 = add i32 %27, %4
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %28
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %31 = zext i32 %4 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  store i32 %30, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %58

33:                                               ; preds = %21, %55
  %34 = phi i32 [ %56, %55 ], [ 1, %21 ]
  %35 = phi i32 [ %36, %55 ], [ 1, %21 ]
  %36 = phi i32 [ %35, %55 ], [ 0, %21 ]
  %37 = icmp ult i32 %4, %34
  %38 = mul nsw i32 %36, %2
  %39 = add i32 %38, %4
  br i1 %37, label %49, label %40

40:                                               ; preds = %33
  %41 = sub i32 %39, %34
  %42 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !7
  %44 = mul nsw i32 %35, %2
  %45 = add i32 %44, %4
  %46 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = add nsw i32 %47, %43
  store i32 %48, i32 addrspace(3)* %46, align 4, !tbaa !7
  br label %55

49:                                               ; preds = %33
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %39
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %52 = mul nsw i32 %35, %2
  %53 = add i32 %52, %4
  %54 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @temp, i32 0, i32 %53
  store i32 %51, i32 addrspace(3)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %49, %40
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = shl i32 %34, 1
  %57 = icmp slt i32 %56, %2
  br i1 %57, label %33, label %25, !llvm.loop !11

58:                                               ; preds = %3, %25
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
