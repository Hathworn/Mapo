; ModuleID = '../data/hip_kernels/7805/0/main.cu'
source_filename = "../data/hip_kernels/7805/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z12toOneChannelPhiii(i8 addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %21, %2
  %23 = icmp slt i32 %13, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %79

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %1
  %27 = add nsw i32 %26, %13
  %28 = mul nsw i32 %27, %3
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %29
  %31 = icmp sgt i32 %3, 1
  br i1 %31, label %32, label %79

32:                                               ; preds = %25
  %33 = add i32 %3, -2
  %34 = add i32 %3, -1
  %35 = and i32 %34, 7
  %36 = icmp ult i32 %33, 7
  br i1 %36, label %68, label %37

37:                                               ; preds = %32
  %38 = and i32 %34, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %65, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %66, %39 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %42
  store i8 0, i8 addrspace(1)* %43, align 1, !tbaa !7
  %44 = or i32 %40, 1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %45
  store i8 0, i8 addrspace(1)* %46, align 1, !tbaa !7
  %47 = or i32 %40, 2
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %48
  store i8 0, i8 addrspace(1)* %49, align 1, !tbaa !7
  %50 = or i32 %40, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %51
  store i8 0, i8 addrspace(1)* %52, align 1, !tbaa !7
  %53 = or i32 %40, 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %54
  store i8 0, i8 addrspace(1)* %55, align 1, !tbaa !7
  %56 = or i32 %40, 5
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %57
  store i8 0, i8 addrspace(1)* %58, align 1, !tbaa !7
  %59 = or i32 %40, 6
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %60
  store i8 0, i8 addrspace(1)* %61, align 1, !tbaa !7
  %62 = or i32 %40, 7
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %63
  store i8 0, i8 addrspace(1)* %64, align 1, !tbaa !7
  %65 = add nuw nsw i32 %40, 8
  %66 = add i32 %41, 8
  %67 = icmp eq i32 %66, %38
  br i1 %67, label %68, label %39, !llvm.loop !10

68:                                               ; preds = %39, %32
  %69 = phi i32 [ 0, %32 ], [ %65, %39 ]
  %70 = icmp eq i32 %35, 0
  br i1 %70, label %79, label %71

71:                                               ; preds = %68, %71
  %72 = phi i32 [ %76, %71 ], [ %69, %68 ]
  %73 = phi i32 [ %77, %71 ], [ 0, %68 ]
  %74 = zext i32 %72 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %74
  store i8 0, i8 addrspace(1)* %75, align 1, !tbaa !7
  %76 = add nuw nsw i32 %72, 1
  %77 = add i32 %73, 1
  %78 = icmp eq i32 %77, %35
  br i1 %78, label %79, label %71, !llvm.loop !12

79:                                               ; preds = %68, %71, %25, %4
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
