; ModuleID = '../data/hip_kernels/17426/23/main.cu'
source_filename = "../data/hip_kernels/17426/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z29knn_assign_gmem_deinterleave2jtPj(i32 %0, i16 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #1 {
  %4 = alloca i64, align 8, addrspace(5)
  %5 = addrspacecast i64 addrspace(5)* %4 to i64*
  %6 = bitcast i64 addrspace(5)* %4 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %6) #3
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  store volatile i64 %16, i64* %5, align 8, !tbaa !7
  %17 = load volatile i64, i64* %5, align 8, !tbaa !7
  %18 = shl i64 %17, 1
  store volatile i64 %18, i64* %5, align 8, !tbaa !7
  %19 = load volatile i64, i64* %5, align 8, !tbaa !7
  %20 = zext i32 %0 to i64
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %43

22:                                               ; preds = %3
  %23 = zext i16 %1 to i32
  %24 = icmp eq i16 %1, 0
  br i1 %24, label %43, label %25

25:                                               ; preds = %22
  %26 = zext i16 %1 to i64
  br label %27

27:                                               ; preds = %25, %27
  %28 = phi i32 [ 0, %25 ], [ %41, %27 ]
  %29 = load volatile i64, i64* %5, align 8, !tbaa !7
  %30 = add i64 %29, %20
  %31 = mul i64 %30, %26
  %32 = zext i32 %28 to i64
  %33 = add nuw nsw i64 %32, %26
  %34 = add i64 %33, %31
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !11
  %37 = load volatile i64, i64* %5, align 8, !tbaa !7
  %38 = mul i64 %37, %26
  %39 = add i64 %38, %32
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  store i32 %36, i32 addrspace(1)* %40, align 4, !tbaa !11
  %41 = add nuw nsw i32 %28, 1
  %42 = icmp eq i32 %41, %23
  br i1 %42, label %43, label %27, !llvm.loop !13

43:                                               ; preds = %27, %22, %3
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %6) #3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { argmemonly mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
