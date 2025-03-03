; ModuleID = '../data/hip_kernels/12107/0/main.cu'
source_filename = "../data/hip_kernels/12107/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@ps = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18sum_dynamic_kernelPKiPim(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %5
  %7 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 %4
  store i32 %7, i32 addrspace(3)* %8, align 4, !tbaa !5
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !10, !invariant.load !9
  %13 = zext i16 %12 to i32
  %14 = add nuw nsw i32 %4, %13
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, %2
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 %14
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !5
  br label %21

21:                                               ; preds = %17, %3
  %22 = icmp ne i32 %4, 0
  %23 = and i64 %2, 1
  %24 = icmp eq i64 %23, 0
  %25 = select i1 %22, i1 true, i1 %24
  br i1 %25, label %32, label %26

26:                                               ; preds = %21
  %27 = add i64 %2, -1
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !5, !amdgpu.noclobber !9
  %30 = trunc i64 %27 to i32
  %31 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 %30
  store i32 %29, i32 addrspace(3)* %31, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %26, %21
  %33 = zext i16 %12 to i64
  br label %34

34:                                               ; preds = %32, %54
  %35 = phi i64 [ %33, %32 ], [ %55, %54 ]
  %36 = phi i64 [ %2, %32 ], [ %35, %54 ]
  %37 = icmp ult i64 %35, %5
  br i1 %37, label %59, label %38

38:                                               ; preds = %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = trunc i64 %35 to i32
  %40 = add nuw nsw i32 %4, %39
  %41 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 %40
  %42 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %43 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %44 = add nsw i32 %43, %42
  store i32 %44, i32 addrspace(3)* %8, align 4, !tbaa !5
  %45 = and i64 %36, 1
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %54, label %47

47:                                               ; preds = %38
  %48 = trunc i64 %36 to i32
  %49 = add i32 %48, -1
  %50 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %52 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 0), align 4, !tbaa !5
  %53 = add nsw i32 %52, %51
  store i32 %53, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 0), align 4, !tbaa !5
  br label %54

54:                                               ; preds = %47, %38
  %55 = lshr i64 %35, 1
  %56 = icmp ult i64 %35, 2
  br i1 %56, label %57, label %34, !llvm.loop !11

57:                                               ; preds = %54
  %58 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @ps, i32 0, i32 0), align 4, !tbaa !5
  store i32 %58, i32 addrspace(1)* %1, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %34, %57
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
