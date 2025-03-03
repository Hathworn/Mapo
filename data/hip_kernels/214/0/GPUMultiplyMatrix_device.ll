; ModuleID = '../data/hip_kernels/214/0/main.cu'
source_filename = "../data/hip_kernels/214/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17GPUMultiplyMatrixPlS_ii(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = freeze i32 %13
  %15 = icmp sgt i32 %2, 0
  br i1 %15, label %16, label %79

16:                                               ; preds = %4
  %17 = srem i32 %14, %3
  %18 = icmp sgt i32 %3, 0
  %19 = sub nsw i32 %14, %17
  %20 = sext i32 %14 to i64
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %20
  %22 = and i32 %3, 1
  %23 = icmp eq i32 %3, 1
  %24 = and i32 %3, -2
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %16, %75
  %27 = phi i32 [ %2, %16 ], [ %77, %75 ]
  br i1 %18, label %28, label %75

28:                                               ; preds = %26
  br i1 %23, label %59, label %29

29:                                               ; preds = %28, %29
  %30 = phi i32 [ %56, %29 ], [ 0, %28 ]
  %31 = phi i64 [ %55, %29 ], [ 0, %28 ]
  %32 = phi i32 [ %57, %29 ], [ 0, %28 ]
  %33 = mul nsw i32 %30, %3
  %34 = add nsw i32 %33, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %35
  %37 = load i64, i64 addrspace(1)* %36, align 8, !tbaa !7
  %38 = add nsw i32 %19, %30
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %39
  %41 = load i64, i64 addrspace(1)* %40, align 8, !tbaa !7
  %42 = mul nsw i64 %41, %37
  %43 = add nsw i64 %42, %31
  %44 = or i32 %30, 1
  %45 = mul nsw i32 %44, %3
  %46 = add nsw i32 %45, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %47
  %49 = load i64, i64 addrspace(1)* %48, align 8, !tbaa !7
  %50 = add nsw i32 %19, %44
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %51
  %53 = load i64, i64 addrspace(1)* %52, align 8, !tbaa !7
  %54 = mul nsw i64 %53, %49
  %55 = add nsw i64 %54, %43
  %56 = add nuw nsw i32 %30, 2
  %57 = add i32 %32, 2
  %58 = icmp eq i32 %57, %24
  br i1 %58, label %59, label %29, !llvm.loop !11

59:                                               ; preds = %29, %28
  %60 = phi i64 [ undef, %28 ], [ %55, %29 ]
  %61 = phi i32 [ 0, %28 ], [ %56, %29 ]
  %62 = phi i64 [ 0, %28 ], [ %55, %29 ]
  br i1 %25, label %75, label %63

63:                                               ; preds = %59
  %64 = mul nsw i32 %61, %3
  %65 = add nsw i32 %64, %17
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %66
  %68 = load i64, i64 addrspace(1)* %67, align 8, !tbaa !7
  %69 = add nsw i32 %19, %61
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %70
  %72 = load i64, i64 addrspace(1)* %71, align 8, !tbaa !7
  %73 = mul nsw i64 %72, %68
  %74 = add nsw i64 %73, %62
  br label %75

75:                                               ; preds = %63, %59, %26
  %76 = phi i64 [ 0, %26 ], [ %60, %59 ], [ %74, %63 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store i64 %76, i64 addrspace(1)* %21, align 8, !tbaa !7
  %77 = add nsw i32 %27, -1
  %78 = icmp sgt i32 %27, 1
  br i1 %78, label %26, label %79, !llvm.loop !13

79:                                               ; preds = %75, %4
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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
