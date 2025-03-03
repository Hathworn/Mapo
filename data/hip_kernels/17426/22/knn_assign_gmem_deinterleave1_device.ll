; ModuleID = '../data/hip_kernels/17426/22/main.cu'
source_filename = "../data/hip_kernels/17426/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z29knn_assign_gmem_deinterleave1jtPj(i32 %0, i16 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #1 {
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
  %18 = zext i32 %0 to i64
  %19 = icmp ult i64 %17, %18
  br i1 %19, label %20, label %64

20:                                               ; preds = %3
  %21 = load volatile i64, i64* %5, align 8, !tbaa !7
  %22 = and i64 %21, 1
  %23 = icmp eq i64 %22, 0
  %24 = zext i16 %1 to i32
  %25 = icmp eq i16 %1, 0
  br i1 %23, label %30, label %26

26:                                               ; preds = %20
  br i1 %25, label %64, label %27

27:                                               ; preds = %26
  %28 = zext i16 %1 to i64
  %29 = shl nuw nsw i64 %28, 1
  br label %34

30:                                               ; preds = %20
  br i1 %25, label %64, label %31

31:                                               ; preds = %30
  %32 = zext i16 %1 to i64
  %33 = shl nuw nsw i64 %32, 1
  br label %48

34:                                               ; preds = %27, %34
  %35 = phi i32 [ 0, %27 ], [ %46, %34 ]
  %36 = load volatile i64, i64* %5, align 8, !tbaa !7
  %37 = mul i64 %29, %36
  %38 = zext i32 %35 to i64
  %39 = add i64 %37, %38
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !11
  %42 = load volatile i64, i64* %5, align 8, !tbaa !7
  %43 = mul i64 %42, %28
  %44 = add i64 %43, %38
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %44
  store i32 %41, i32 addrspace(1)* %45, align 4, !tbaa !11
  %46 = add nuw nsw i32 %35, 1
  %47 = icmp eq i32 %46, %24
  br i1 %47, label %64, label %34, !llvm.loop !13

48:                                               ; preds = %31, %48
  %49 = phi i32 [ 0, %31 ], [ %62, %48 ]
  %50 = load volatile i64, i64* %5, align 8, !tbaa !7
  %51 = mul i64 %33, %50
  %52 = zext i32 %49 to i64
  %53 = add i64 %51, %52
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !11
  %56 = load volatile i64, i64* %5, align 8, !tbaa !7
  %57 = add i64 %56, %18
  %58 = mul i64 %57, %32
  %59 = add nuw nsw i64 %52, %32
  %60 = add i64 %59, %58
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  store i32 %55, i32 addrspace(1)* %61, align 4, !tbaa !11
  %62 = add nuw nsw i32 %49, 1
  %63 = icmp eq i32 %62, %24
  br i1 %63, label %64, label %48, !llvm.loop !15

64:                                               ; preds = %34, %48, %26, %30, %3
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
!15 = distinct !{!15, !14}
