; ModuleID = '../data/hip_kernels/9237/3/main.cu'
source_filename = "../data/hip_kernels/9237/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7findMaxPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !5
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %15, label %38

15:                                               ; preds = %3
  %16 = and i32 %2, 7
  %17 = icmp ult i32 %2, 8
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = and i32 %2, -8
  br label %42

20:                                               ; preds = %42, %15
  %21 = phi i32 [ undef, %15 ], [ %100, %42 ]
  %22 = phi i32 [ 0, %15 ], [ %101, %42 ]
  %23 = phi i32 [ %13, %15 ], [ %100, %42 ]
  %24 = icmp eq i32 %16, 0
  br i1 %24, label %38, label %25

25:                                               ; preds = %20, %25
  %26 = phi i32 [ %35, %25 ], [ %22, %20 ]
  %27 = phi i32 [ %34, %25 ], [ %23, %20 ]
  %28 = phi i32 [ %36, %25 ], [ 0, %20 ]
  %29 = mul nsw i32 %26, %2
  %30 = add nsw i32 %29, %12
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = tail call i32 @llvm.smax.i32(i32 %33, i32 %27)
  %35 = add nuw nsw i32 %26, 1
  %36 = add i32 %28, 1
  %37 = icmp eq i32 %36, %16
  br i1 %37, label %38, label %25, !llvm.loop !11

38:                                               ; preds = %20, %25, %3
  %39 = phi i32 [ %13, %3 ], [ %21, %20 ], [ %34, %25 ]
  %40 = sext i32 %12 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !7
  ret void

42:                                               ; preds = %42, %18
  %43 = phi i32 [ 0, %18 ], [ %101, %42 ]
  %44 = phi i32 [ %13, %18 ], [ %100, %42 ]
  %45 = phi i32 [ 0, %18 ], [ %102, %42 ]
  %46 = mul nsw i32 %43, %2
  %47 = add nsw i32 %46, %12
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = tail call i32 @llvm.smax.i32(i32 %50, i32 %44)
  %52 = or i32 %43, 1
  %53 = mul nsw i32 %52, %2
  %54 = add nsw i32 %53, %12
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = tail call i32 @llvm.smax.i32(i32 %57, i32 %51)
  %59 = or i32 %43, 2
  %60 = mul nsw i32 %59, %2
  %61 = add nsw i32 %60, %12
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = tail call i32 @llvm.smax.i32(i32 %64, i32 %58)
  %66 = or i32 %43, 3
  %67 = mul nsw i32 %66, %2
  %68 = add nsw i32 %67, %12
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = tail call i32 @llvm.smax.i32(i32 %71, i32 %65)
  %73 = or i32 %43, 4
  %74 = mul nsw i32 %73, %2
  %75 = add nsw i32 %74, %12
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = tail call i32 @llvm.smax.i32(i32 %78, i32 %72)
  %80 = or i32 %43, 5
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %12
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = tail call i32 @llvm.smax.i32(i32 %85, i32 %79)
  %87 = or i32 %43, 6
  %88 = mul nsw i32 %87, %2
  %89 = add nsw i32 %88, %12
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = tail call i32 @llvm.smax.i32(i32 %92, i32 %86)
  %94 = or i32 %43, 7
  %95 = mul nsw i32 %94, %2
  %96 = add nsw i32 %95, %12
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = tail call i32 @llvm.smax.i32(i32 %99, i32 %93)
  %101 = add nuw nsw i32 %43, 8
  %102 = add i32 %45, 8
  %103 = icmp eq i32 %102, %19
  br i1 %103, label %20, label %42, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
