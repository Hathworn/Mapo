; ModuleID = '../data/hip_kernels/2766/7/main.cu'
source_filename = "../data/hip_kernels/2766/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@partialActiveIdx = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27cudaUpdateMostActive_kernelPjS_jjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = mul i32 %3, %2
  %7 = mul i32 %6, %4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %9 = mul i32 %7, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 %10
  %12 = icmp ult i32 %10, %7
  %13 = select i1 %12, i32 %10, i32 0
  store i32 %13, i32 addrspace(3)* %11, align 4, !tbaa !5
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  br i1 %12, label %15, label %20

15:                                               ; preds = %5
  %16 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !9, !invariant.load !10
  %19 = zext i16 %18 to i32
  br label %27

20:                                               ; preds = %40, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !9, !invariant.load !10
  %24 = icmp ult i16 %23, 2
  br i1 %24, label %44, label %25

25:                                               ; preds = %20
  %26 = zext i16 %23 to i32
  br label %46

27:                                               ; preds = %15, %40
  %28 = phi i32 [ %13, %15 ], [ %41, %40 ]
  %29 = phi i32 [ %10, %15 ], [ %42, %40 ]
  %30 = add i32 %29, %9
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !10
  %34 = add i32 %28, %9
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !10
  %38 = icmp ugt i32 %33, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %27
  store i32 %29, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %40

40:                                               ; preds = %27, %39
  %41 = phi i32 [ %28, %27 ], [ %29, %39 ]
  %42 = add i32 %29, %19
  %43 = icmp ult i32 %42, %7
  br i1 %43, label %27, label %20, !llvm.loop !11

44:                                               ; preds = %65, %20
  %45 = icmp eq i32 %10, 0
  br i1 %45, label %67, label %71

46:                                               ; preds = %25, %65
  %47 = phi i32 [ %48, %65 ], [ %26, %25 ]
  %48 = lshr i32 %47, 1
  %49 = icmp ult i32 %10, %48
  br i1 %49, label %50, label %65

50:                                               ; preds = %46
  %51 = load i32, i32 addrspace(3)* %11, align 4, !tbaa !5
  %52 = add i32 %51, %9
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !10
  %56 = add nuw nsw i32 %48, %10
  %57 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 %56
  %58 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %59 = add i32 %58, %9
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !10
  %63 = icmp ult i32 %55, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %50
  store i32 %58, i32 addrspace(3)* %11, align 4, !tbaa !5
  br label %65

65:                                               ; preds = %50, %64, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = icmp ult i32 %47, 4
  br i1 %66, label %44, label %46, !llvm.loop !13

67:                                               ; preds = %44
  %68 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @partialActiveIdx, i32 0, i32 0), align 4, !tbaa !5
  %69 = zext i32 %8 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %69
  store i32 %68, i32 addrspace(1)* %70, align 4, !tbaa !5
  br label %71

71:                                               ; preds = %67, %44
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
