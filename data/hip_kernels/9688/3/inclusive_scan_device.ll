; ModuleID = '../data/hip_kernels/9688/3/main.cu'
source_filename = "../data/hip_kernels/9688/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@XY = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14inclusive_scanPKjPji(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %11
  store i32 %17, i32 addrspace(3)* %18, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %14, %3
  %20 = icmp eq i32 %11, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 0), align 4, !tbaa !7
  br label %25

23:                                               ; preds = %19
  %24 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %11
  br label %30

25:                                               ; preds = %30, %21
  %26 = phi i32 [ %22, %21 ], [ %36, %30 ]
  %27 = zext i32 %12 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  store i32 %26, i32 addrspace(1)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %29 = icmp ult i32 %11, %4
  br i1 %29, label %39, label %46

30:                                               ; preds = %23, %30
  %31 = phi i32 [ 1, %23 ], [ %37, %30 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = sub i32 %11, %31
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %35 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !7
  %36 = add nsw i32 %35, %34
  store i32 %36, i32 addrspace(3)* %24, align 4, !tbaa !7
  %37 = shl nuw nsw i32 %31, 1
  %38 = icmp ult i32 %11, %37
  br i1 %38, label %25, label %30, !llvm.loop !11

39:                                               ; preds = %25
  %40 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %11
  %41 = mul nuw nsw i32 %11, %9
  %42 = add nuw nsw i32 %41, 3
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7
  store i32 %45, i32 addrspace(3)* %40, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %39, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp eq i32 %4, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %49, %46
  ret void

49:                                               ; preds = %46, %49
  %50 = phi i32 [ %55, %49 ], [ 0, %46 ]
  %51 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @XY, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !7
  %53 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %54 = add i32 %53, %52
  store i32 %54, i32 addrspace(1)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = add nuw nsw i32 %50, 1
  %56 = icmp eq i32 %55, %4
  br i1 %56, label %48, label %49, !llvm.loop !13
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
!13 = distinct !{!13, !12}
