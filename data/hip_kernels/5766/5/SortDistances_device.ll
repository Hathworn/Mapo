; ModuleID = '../data/hip_kernels/5766/5/main.cu'
source_filename = "../data/hip_kernels/5766/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13SortDistancesPfPiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %98

15:                                               ; preds = %4
  %16 = mul i32 %13, %2
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = icmp sgt i32 %2, 0
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = and i32 %2, 7
  %22 = icmp ult i32 %2, 8
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = and i32 %2, -8
  br label %39

25:                                               ; preds = %39, %20
  %26 = phi i32 [ 0, %20 ], [ %65, %39 ]
  %27 = icmp eq i32 %21, 0
  br i1 %27, label %36, label %28

28:                                               ; preds = %25, %28
  %29 = phi i32 [ %33, %28 ], [ %26, %25 ]
  %30 = phi i32 [ %34, %28 ], [ 0, %25 ]
  %31 = zext i32 %29 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %31
  store i32 %29, i32 addrspace(1)* %32, align 4, !tbaa !7
  %33 = add nuw nsw i32 %29, 1
  %34 = add i32 %30, 1
  %35 = icmp eq i32 %34, %21
  br i1 %35, label %36, label %28, !llvm.loop !11

36:                                               ; preds = %25, %28, %15
  %37 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %38 = icmp sgt i32 %3, 0
  br i1 %38, label %68, label %98

39:                                               ; preds = %39, %23
  %40 = phi i32 [ 0, %23 ], [ %65, %39 ]
  %41 = phi i32 [ 0, %23 ], [ %66, %39 ]
  %42 = zext i32 %40 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %42
  store i32 %40, i32 addrspace(1)* %43, align 4, !tbaa !7
  %44 = or i32 %40, 1
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %45
  store i32 %44, i32 addrspace(1)* %46, align 4, !tbaa !7
  %47 = or i32 %40, 2
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !7
  %50 = or i32 %40, 3
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %51
  store i32 %50, i32 addrspace(1)* %52, align 4, !tbaa !7
  %53 = or i32 %40, 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %54
  store i32 %53, i32 addrspace(1)* %55, align 4, !tbaa !7
  %56 = or i32 %40, 5
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %57
  store i32 %56, i32 addrspace(1)* %58, align 4, !tbaa !7
  %59 = or i32 %40, 6
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %60
  store i32 %59, i32 addrspace(1)* %61, align 4, !tbaa !7
  %62 = or i32 %40, 7
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %63
  store i32 %62, i32 addrspace(1)* %64, align 4, !tbaa !7
  %65 = add nuw nsw i32 %40, 8
  %66 = add i32 %41, 8
  %67 = icmp eq i32 %66, %24
  br i1 %67, label %25, label %39, !llvm.loop !13

68:                                               ; preds = %36, %72
  %69 = phi i32 [ %70, %72 ], [ 0, %36 ]
  %70 = add nuw nsw i32 %69, 1
  %71 = icmp slt i32 %70, %2
  br i1 %71, label %85, label %72

72:                                               ; preds = %85, %68
  %73 = phi i32 [ %69, %68 ], [ %95, %85 ]
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %37, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !15
  %77 = zext i32 %69 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %37, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !15
  store float %79, float addrspace(1)* %75, align 4, !tbaa !15
  store float %76, float addrspace(1)* %78, align 4, !tbaa !15
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %74
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %18, i64 %77
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7
  store i32 %83, i32 addrspace(1)* %80, align 4, !tbaa !7
  store i32 %81, i32 addrspace(1)* %82, align 4, !tbaa !7
  %84 = icmp eq i32 %70, %3
  br i1 %84, label %98, label %68, !llvm.loop !17

85:                                               ; preds = %68, %85
  %86 = phi i32 [ %96, %85 ], [ %70, %68 ]
  %87 = phi i32 [ %95, %85 ], [ %69, %68 ]
  %88 = zext i32 %86 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %37, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !15
  %91 = sext i32 %87 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %37, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !15
  %94 = fcmp contract olt float %90, %93
  %95 = select i1 %94, i32 %86, i32 %87
  %96 = add nuw nsw i32 %86, 1
  %97 = icmp slt i32 %96, %2
  br i1 %97, label %85, label %72, !llvm.loop !18

98:                                               ; preds = %72, %36, %4
  ret void
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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !9, i64 0}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
