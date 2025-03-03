; ModuleID = '../data/hip_kernels/14707/2/main.cu'
source_filename = "../data/hip_kernels/14707/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12kernel_lucasPlS_Pil(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = shl nsw i32 %5, 7
  %8 = add nsw i32 %7, %6
  %9 = sext i32 %8 to i64
  %10 = icmp slt i64 %9, %3
  br i1 %10, label %11, label %70

11:                                               ; preds = %4
  %12 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %9
  %13 = load i64, i64 addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %9
  %15 = load i64, i64 addrspace(1)* %14, align 8, !tbaa !5, !amdgpu.noclobber !9
  %16 = add nsw i64 %15, 1
  %17 = sdiv i64 %16, 2
  %18 = trunc i64 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %70, label %20

20:                                               ; preds = %11
  %21 = tail call i32 @llvm.ctlz.i32(i32 %18, i1 true), !range !10
  %22 = sub nuw nsw i32 32, %21
  %23 = sub nsw i64 1, %13
  %24 = sdiv i64 %23, 4
  %25 = tail call i32 @llvm.smax.i32(i32 %22, i32 1)
  br label %26

26:                                               ; preds = %20, %62
  %27 = phi i32 [ %68, %62 ], [ 0, %20 ]
  %28 = phi i64 [ %67, %62 ], [ %17, %20 ]
  %29 = phi i64 [ %39, %62 ], [ 1, %20 ]
  %30 = phi i64 [ %64, %62 ], [ 2, %20 ]
  %31 = phi i64 [ %66, %62 ], [ %24, %20 ]
  %32 = phi i64 [ %36, %62 ], [ 1, %20 ]
  %33 = phi i64 [ %63, %62 ], [ 0, %20 ]
  %34 = shl nsw i64 %31, 1
  %35 = mul nsw i64 %29, %32
  %36 = srem i64 %35, %15
  %37 = mul nsw i64 %29, %29
  %38 = sub nsw i64 %37, %34
  %39 = srem i64 %38, %15
  %40 = and i64 %28, 1
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %62, label %42

42:                                               ; preds = %26
  %43 = mul nsw i64 %36, %30
  %44 = mul nsw i64 %39, %33
  %45 = add nsw i64 %44, %43
  %46 = and i64 %45, -9223372036854775807
  %47 = icmp eq i64 %46, 1
  %48 = select i1 %47, i64 %15, i64 0
  %49 = add nsw i64 %48, %45
  %50 = sdiv i64 %49, 2
  %51 = srem i64 %50, %15
  %52 = mul nsw i64 %39, %30
  %53 = mul i64 %33, %13
  %54 = mul i64 %53, %36
  %55 = add nsw i64 %52, %54
  %56 = and i64 %55, -9223372036854775807
  %57 = icmp eq i64 %56, 1
  %58 = select i1 %57, i64 %15, i64 0
  %59 = add nsw i64 %58, %55
  %60 = sdiv i64 %59, 2
  %61 = srem i64 %60, %15
  br label %62

62:                                               ; preds = %42, %26
  %63 = phi i64 [ %51, %42 ], [ %33, %26 ]
  %64 = phi i64 [ %61, %42 ], [ %30, %26 ]
  %65 = mul nsw i64 %31, %31
  %66 = srem i64 %65, %15
  %67 = ashr i64 %28, 1
  %68 = add nuw nsw i32 %27, 1
  %69 = icmp eq i32 %68, %25
  br i1 %69, label %70, label %26, !llvm.loop !11

70:                                               ; preds = %62, %11, %4
  %71 = phi i64 [ undef, %4 ], [ 0, %11 ], [ %63, %62 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %10, label %72, label %76

72:                                               ; preds = %70
  %73 = icmp eq i64 %71, 0
  %74 = zext i1 %73 to i32
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %9
  store i32 %74, i32 addrspace(1)* %75, align 4, !tbaa !13
  br label %76

76:                                               ; preds = %72, %70
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i32 0, i32 33}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !7, i64 0}
