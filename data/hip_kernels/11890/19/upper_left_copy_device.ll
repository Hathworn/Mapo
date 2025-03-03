; ModuleID = '../data/hip_kernels/11890/19/main.cu'
source_filename = "../data/hip_kernels/11890/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15upper_left_copyPiS_S_iiii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %14, %15
  %17 = add i32 %16, 1
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %25 = add i32 %23, %24
  %26 = add i32 %25, 1
  %27 = icmp sgt i32 %17, %5
  %28 = icmp sgt i32 %26, %5
  %29 = select i1 %27, i1 true, i1 %28
  br i1 %29, label %64, label %30

30:                                               ; preds = %7
  %31 = sub nsw i32 %5, %26
  %32 = icmp eq i32 %16, %31
  %33 = mul nsw i32 %17, %4
  %34 = add nsw i32 %33, %26
  br i1 %32, label %35, label %56

35:                                               ; preds = %30
  %36 = sub nsw i32 %34, %4
  %37 = add nsw i32 %36, -1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = sext i32 %34 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = add nsw i32 %43, %40
  %45 = add i32 %33, %25
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = sub nsw i32 %48, %6
  %50 = sext i32 %36 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = sub nsw i32 %52, %6
  %54 = tail call i32 @llvm.smax.i32(i32 %44, i32 %49)
  %55 = tail call i32 @llvm.smax.i32(i32 %54, i32 %53)
  br label %60

56:                                               ; preds = %30
  %57 = sext i32 %34 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %60

60:                                               ; preds = %56, %35
  %61 = phi i64 [ %41, %35 ], [ %57, %56 ]
  %62 = phi i32 [ %55, %35 ], [ %59, %56 ]
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  store i32 %62, i32 addrspace(1)* %63, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %60, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
