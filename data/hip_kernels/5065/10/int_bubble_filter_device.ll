; ModuleID = '../data/hip_kernels/5065/10/main.cu'
source_filename = "../data/hip_kernels/5065/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17int_bubble_filterPiPKiS_i(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sdiv i32 %3, 2
  %15 = icmp sgt i32 %13, %14
  br i1 %15, label %65, label %16

16:                                               ; preds = %4
  %17 = shl nsw i32 %13, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %18
  store i32 %20, i32 addrspace(1)* %21, align 4, !tbaa !7
  %22 = add nuw nsw i32 %17, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %23
  store i32 %25, i32 addrspace(1)* %26, align 4, !tbaa !7
  %27 = icmp sgt i32 %3, 0
  br i1 %27, label %28, label %65

28:                                               ; preds = %16
  %29 = shl nuw i32 %3, 1
  %30 = tail call i32 @llvm.smax.i32(i32 %29, i32 1)
  br label %31

31:                                               ; preds = %28, %62
  %32 = phi i32 [ %63, %62 ], [ 0, %28 ]
  %33 = phi i32 [ %34, %62 ], [ 1, %28 ]
  %34 = xor i32 %33, 1
  %35 = add nsw i32 %34, %17
  %36 = add nsw i32 %35, 1
  %37 = icmp slt i32 %36, %3
  br i1 %37, label %38, label %62

38:                                               ; preds = %31
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = icmp eq i32 %41, 0
  %43 = sext i32 %36 to i64
  br i1 %42, label %44, label %54

44:                                               ; preds = %38
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %52, label %48

48:                                               ; preds = %44
  store i32 1, i32 addrspace(1)* %40, align 4, !tbaa !7
  store i32 0, i32 addrspace(1)* %45, align 4, !tbaa !7
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %50, i32 addrspace(1)* %51, align 4, !tbaa !7
  br label %60

52:                                               ; preds = %44
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 0, i32 addrspace(1)* %53, align 4, !tbaa !7
  br label %54

54:                                               ; preds = %38, %52
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %62

58:                                               ; preds = %54
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  br label %60

60:                                               ; preds = %58, %48
  %61 = phi i32 addrspace(1)* [ %49, %48 ], [ %59, %58 ]
  store i32 0, i32 addrspace(1)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %60, %54, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = add nuw nsw i32 %32, 1
  %64 = icmp eq i32 %63, %30
  br i1 %64, label %65, label %31, !llvm.loop !11

65:                                               ; preds = %62, %16, %4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
