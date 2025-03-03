; ModuleID = '../data/hip_kernels/175/26/main.cu'
source_filename = "../data/hip_kernels/175/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13integrateBinsiiiPiiS_E6pixels = internal unnamed_addr addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13integrateBinsiiiPiiS_(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture readonly %3, i32 %4, i32 addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 2, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add nsw i32 %13, %14
  %17 = icmp slt i32 %16, %0
  %18 = icmp sle i32 %15, %2
  %19 = select i1 %17, i1 %18, i1 false
  %20 = icmp sgt i32 %1, 0
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %51

22:                                               ; preds = %6
  %23 = mul nsw i32 %16, %4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %24
  %26 = zext i32 %15 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %25, i64 %26
  %28 = sext i32 %16 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %28
  %30 = icmp eq i32 %15, 0
  %31 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ13integrateBinsiiiPiiS_E6pixels, i32 0, i32 %14
  %32 = sext i32 %0 to i64
  %33 = mul nsw i32 %4, %0
  %34 = sext i32 %33 to i64
  br label %35

35:                                               ; preds = %22, %42
  %36 = phi i32 [ 0, %22 ], [ %49, %42 ]
  %37 = phi i32 [ 0, %22 ], [ %46, %42 ]
  %38 = phi i32 addrspace(1)* [ %27, %22 ], [ %48, %42 ]
  %39 = phi i32 addrspace(1)* [ %29, %22 ], [ %47, %42 ]
  br i1 %30, label %40, label %42

40:                                               ; preds = %35
  %41 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7
  store i32 %41, i32 addrspace(3)* %31, align 4, !tbaa !7
  br label %42

42:                                               ; preds = %40, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !7
  %44 = icmp eq i32 %43, %15
  %45 = zext i1 %44 to i32
  %46 = add nuw nsw i32 %37, %45
  store i32 %46, i32 addrspace(1)* %38, align 4, !tbaa !7
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %32
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %34
  %49 = add nuw nsw i32 %36, 1
  %50 = icmp eq i32 %49, %1
  br i1 %50, label %51, label %35, !llvm.loop !11

51:                                               ; preds = %42, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
