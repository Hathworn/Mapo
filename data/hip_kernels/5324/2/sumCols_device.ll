; ModuleID = '../data/hip_kernels/5324/2/main.cu'
source_filename = "../data/hip_kernels/5324/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7sumColsPiS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %15, label %38

15:                                               ; preds = %4
  %16 = and i32 %2, 7
  %17 = icmp ult i32 %2, 8
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = and i32 %2, -8
  br label %42

20:                                               ; preds = %42, %15
  %21 = phi i32 [ undef, %15 ], [ %100, %42 ]
  %22 = phi i32 [ 0, %15 ], [ %101, %42 ]
  %23 = phi i32 [ 0, %15 ], [ %100, %42 ]
  %24 = icmp eq i32 %16, 0
  br i1 %24, label %38, label %25

25:                                               ; preds = %20, %25
  %26 = phi i32 [ %35, %25 ], [ %22, %20 ]
  %27 = phi i32 [ %34, %25 ], [ %23, %20 ]
  %28 = phi i32 [ %36, %25 ], [ 0, %20 ]
  %29 = mul nsw i32 %26, %3
  %30 = add nsw i32 %29, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = add nsw i32 %33, %27
  %35 = add nuw nsw i32 %26, 1
  %36 = add i32 %28, 1
  %37 = icmp eq i32 %36, %16
  br i1 %37, label %38, label %25, !llvm.loop !11

38:                                               ; preds = %20, %25, %4
  %39 = phi i32 [ 0, %4 ], [ %21, %20 ], [ %34, %25 ]
  %40 = sext i32 %13 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  store i32 %39, i32 addrspace(1)* %41, align 4, !tbaa !7
  ret void

42:                                               ; preds = %42, %18
  %43 = phi i32 [ 0, %18 ], [ %101, %42 ]
  %44 = phi i32 [ 0, %18 ], [ %100, %42 ]
  %45 = phi i32 [ 0, %18 ], [ %102, %42 ]
  %46 = mul nsw i32 %43, %3
  %47 = add nsw i32 %46, %13
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = add nsw i32 %50, %44
  %52 = or i32 %43, 1
  %53 = mul nsw i32 %52, %3
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = add nsw i32 %57, %51
  %59 = or i32 %43, 2
  %60 = mul nsw i32 %59, %3
  %61 = add nsw i32 %60, %13
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = add nsw i32 %64, %58
  %66 = or i32 %43, 3
  %67 = mul nsw i32 %66, %3
  %68 = add nsw i32 %67, %13
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = add nsw i32 %71, %65
  %73 = or i32 %43, 4
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %13
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %76
  %78 = load i32, i32 addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = add nsw i32 %78, %72
  %80 = or i32 %43, 5
  %81 = mul nsw i32 %80, %3
  %82 = add nsw i32 %81, %13
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = add nsw i32 %85, %79
  %87 = or i32 %43, 6
  %88 = mul nsw i32 %87, %3
  %89 = add nsw i32 %88, %13
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = add nsw i32 %92, %86
  %94 = or i32 %43, 7
  %95 = mul nsw i32 %94, %3
  %96 = add nsw i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = add nsw i32 %99, %93
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
